/* scrprogram.cpp - list of scroperations */


/*
   Visual skripting for FAU Discrete Event Systems Library (libfaudes)

   Copyright (C) 2006, 20024  Thomas Moor

*/


#include "scrprogram.h"
#include "desstyle.h"
/*
 ********************************
 ********************************
 ********************************

 implementation of ScrProgram

 ********************************
 ********************************
 ********************************
 */


// construct
ScrProgram::ScrProgram(
  WspVariablePool* varpool, WspFunctionPool* fnctpool, QObject* parent) 
: 
  WspPool(WspItem::ITFunction,parent),
  pVarPool(varpool),
  pFnctPool(fnctpool) 
{
  FD_DS("ScrProgram::ScrProgram()");
  // configure
  mHeader="Program";
  setHorizontalHeaderLabels(QStringList() << mHeader);
  mTokenSection=QString("Script");
  // my variables
  mState=Done;
  mInsertMenus = new WspFunctionInsertMenu(FunctionPool(),this);
}

// destruct
ScrProgram::~ScrProgram(void) {
  FD_DS("ScrProgram::~ScrProgram(): A");
  delete mInsertMenus;
  FD_DS("ScrProgram::~ScrProgram(): B");
}

// factory: 
ScrOperation* ScrProgram::NewItem(void) {
  return new ScrOperation();
}

 
// clear all
void ScrProgram::Clear(void)  {
  FD_DS("ScrProgram::Clear()");
  WspPool::Clear();
  // my members
  mState=Done;
}


// overload
ScrOperation* ScrProgram::At(int position) {
  return qobject_cast<ScrOperation*>(WspPool::At(position));
}

// overload
const ScrOperation* ScrProgram::At(int position) const {
  return qobject_cast<const ScrOperation*>(WspPool::At(position));
}

// overload
ScrOperation* ScrProgram::At(const QString& name) {
  return qobject_cast<ScrOperation*>(WspPool::At(name));
}

// extend anonymous
void ScrProgram::InsertAnonymous(int pos) {
  if(pos<0) pos=0;
  if(pos>Size()) pos = Size();
  ScrOperation* witem=NewItem();
  witem->Name(NewName("Operation"));
  DoInsert(pos,witem);
}

// extend anonymous
void ScrProgram::InsertAnonymous(int pos, const QString& descr) {
  if(pos<0) pos=0;
  if(pos>Size()) pos = Size();
  ScrOperation* witem=NewItem();
  witem->Name(NewName(descr));
  DoInsert(pos,witem);
  witem->FunctionDefinition(descr);
}



// erase functions (incl operationr)
void ScrProgram::EraseFunctionFromProgram(void) {
  FD_DS("ScrProgram::EraseFunctionFromProgram()");
  // figure descr
  if(!sender()) return;
  QVariant prop = sender()->property("Item");
  if(!VIODES_QVAR_IS_STR(prop)) return;
  QString descr = prop.toString();
  EraseFunctionFromProgram(descr);
}


// erase functions (incl operationr)
void ScrProgram::EraseFunctionFromProgram(const QString& descr) {
  FD_DS("ScrProgram::EraseFunctionFromProgram(" << VioStyle::StrFromQStr(descr)<<")");
  // do remove
  int pos=0; 
  while(pos<Size()) {
    if(At(pos)->Function()!=descr) {
      pos ++; continue;
    }
    Erase(pos);
  }
  // tell
  emit NotifyAnyChange();
}


// erase functions (incl operation)
void ScrProgram::EraseFunctionFromProject(void) {
  FD_DS("ScrProgram::EraseFunctionFromProject()");
  // figure descr
  if(!sender()) return;
  QVariant prop = sender()->property("Item");
  if(!VIODES_QVAR_IS_STR(prop)) return;
  QString descr = prop.toString();
  // first from script
  EraseFunctionFromProgram(descr);
  // then from fnct pool
  FunctionPool()->Erase(descr);
}


// run context menu wrapper
void ScrProgram::RunContextMenu(QPoint point, int pos) {
  FD_DS("ScrProgram::RunContextMenu(.., " << pos << ")");
  // have a menu
  QMenu* menu= 0;
  // figure operation
  ScrOperation* scrop=At(pos);
  if(!scrop) pos=Size();
  // construct menu
  if(scrop) menu= scrop->NewContextMenu();
  else menu = new QMenu("Operation Menu");
  // separator
  if(scrop) menu->addSeparator();
  // insert menus 
  menu->addMenu(mInsertMenus->mBuiltIn);
  menu->addMenu(mInsertMenus->mLuaAll);
  QAction* delaction= menu->addAction("Delete Operation");
  delaction->setEnabled(scrop!=0);
  // run
  QAction* selaction= menu->exec(point);
  // report
  if(selaction){
    FD_DS("ScrProgram::RunContextMenu(.., " << pos << "): " << VioStyle::StrFromQStr(selaction->text()));
  }
  // deal with my buttons: delete
  if(selaction==delaction){
    Erase(pos);
  }
  // deal with my buttons: insert built in function
  if(selaction) 
  if(VioFunctionRegistry::Functions().contains(selaction->text())){
    InsertAnonymous(pos,selaction->text());
  }
  // deal with my buttons: insert lua function
  if(selaction) 
  if(FunctionPool()->Exists(selaction->text())){
    InsertAnonymous(pos,selaction->text());
  }
  // deal with my buttons: insert new lua extension
  if(selaction) 
  if(selaction->text() == "New Lua Function") {
    FunctionPool()->AppendAnonymous();
    QString descr = FunctionPool()->At(FunctionPool()->Size()-1)->Name();
    InsertAnonymous(pos,descr);
  }
  // deal with my buttons: insert new lua script
  if(selaction) 
  if(selaction->text() == "New Lua Script") {
    FunctionPool()->AppendAnonymous();
    int apos=FunctionPool()->Size()-1;
    FunctionPool()->At(apos)->PlainScript();
    FunctionPool()->At(apos)->Name(FunctionPool()->NewName("LuaScript"));
    QString descr = FunctionPool()->At(apos)->Name();
    InsertAnonymous(pos,descr);
  }
  // load from file 
  if(selaction) 
  if(selaction->text() == "Load From File ...") {
    FD_DS("ScrProgram::RunContextMenu(): loading lua from file #" << FunctionPool()->Size());
    int fpos = FunctionPool()->UserAppendFromFile();
    if(fpos>=0) InsertAnonymous(pos,FunctionPool()->At(fpos)->Name());
  }
  delete menu;
}

// save all operands to file if changed (call after initialize)
void ScrProgram::SaveOperands(void) {
  FD_DS("ScrProgram::SaveOperands()");
  // all variables
  foreach(WspItem* item, pVarPool->ItemList()) {;
    WspVariable* var = static_cast<WspVariable*>(item);
    if(var->Source()==WspVariable::ReadFile)
    if(var->Modified())  
        var->Save();
  }
  // all luaextensions
  foreach(WspItem* item, pFnctPool->ItemList()) {;
    WspFunction* fnct = static_cast<WspFunction*>(item);
    if(fnct->Modified())  
        fnct->Save();
  }
}


// save all operands to file (call after initialize)
void ScrProgram::SaveResults(void) {
  FD_DS("ScrProgram::SaveResults()");
  // all variables
  foreach(WspItem* item, pVarPool->ItemList()) {;
    WspVariable* var = static_cast<WspVariable*>(item);
    if(var->Source()==WspVariable::OperationResult)
      var->Save();
  }
}


// initialize all variables and operations
ScrProgram::ProgramState ScrProgram::Initialize(void) {
  FD_DS("ScrProgram::Initialize()");
  mState=Ready;
  // lua functions to be installed 
  pFnctPool->LuaInstall();
  // reset variable source to unknown (except constants)
  pVarPool->Invalidate();
  // operations to insert variables and set source
  for(int i=0; i<Size(); i++) {
    At(i)->Initialize();
  }
  // operations to check state
  for(int i=0; i<Size(); i++) {
    At(i)->State();
  }
  // update program state
  State();
  FD_DS("ScrProgram::Initialize(): " << mState);
  return mState;
}


// update State
ScrProgram::ProgramState ScrProgram::State(void) {
  if(mState==Error)   return mState;
  if(mState==Done)    return mState;
  // check error
  for(int i=0; i<Size(); i++) {
    ScrOperation::OperationState opstate;
    opstate=At(i)->State();
    if(opstate==ScrOperation::Error) {
      FD_DS("ScrProgram::ScrState(): error in " << VioStyle::StrFromQStr(At(i)->Name()));
      return mState=Error;
    }
  }
  // check ready
  for(int i=0; i<Size(); i++) {
    ScrOperation::OperationState opstate;
    opstate=At(i)->State();
    if(opstate==ScrOperation::Ready) {
      FD_DS("ScrProgram::ScrState(): ready for " << VioStyle::StrFromQStr(At(i)->Name()));
      return mState=Ready;
    }
  }
  // then we are done
  FD_DS("ScrProgram::ScrState(): done");
  return mState=Done;
}

// next form pos
int ScrProgram::Next(int pos) {
  FD_DS("ScrProgram::Next(" << pos << ")");
  if(pos <0) pos = -1;
  pos++;
  // std next
  if(pos>=0 && pos < Size())
  //if(At(pos)->State()==ScrOperation::Ready) 
  {
    FD_DS("ScrProgram::Next(): " << pos);
     return pos;
  }
  return -1;
}

// execute (see also scrprogwidget version)
ScrProgram::ProgramState ScrProgram::Execute(int pos) {
  FD_DS("ScrProgram::ScrStep("<< pos << ")");
  ScrOperation* op=At(pos);
  if(op==0) return State();
  FD_QP("Executing step " << pos << "/"<< Size());
  op->Execute();         
  return State();
}


// run (see also scrprogwidget version)
ScrProgram::ProgramState ScrProgram::Run(void) {
  FD_DS("ScrProgram::ScrRun()");
  int pos=-1;
  // loop
  while(true) {
    if(mState==Error)  return mState;
    if(mState==Done)   return mState;
    pos=Next(pos);
    Execute(pos);
  }
  // check results
  FD_DS("ScrProgram::ScrRun(): quit");
  return State();
}

// token io, read (compatibility version)
void ScrProgram::Read(faudes::TokenReader& rTr,const QString& rLabel) {
  FD_DS("ScrProgram::Read()");
  // set label
  QString label(rLabel);
  if(rLabel.isEmpty()) label=mTokenSection;
  beginResetModel();
  // clear
  Clear();
  // do silent insert to avoid update of everey single op
  bool bs=blockSignals(true);
  // my tag
  rTr.ReadBegin(VioStyle::StrFromQStr(label));
  while(!rTr.Eos(VioStyle::StrFromQStr(label))) {
    faudes::Token token;
    rTr.Peek(token);
    FD_DS("ScrProgram::Read(): current " << token.StringValue());
    // swallow old file format extras
    if(token.IsBegin("Operations"))
        { rTr.ReadBegin("Operations"); continue; }
    // cannot do as in std wsppool: my items need to be within a program
    AppendAnonymous();
    ScrOperation* scrop=At(Size()-1);
    // be prepared to try recover from errors
    int secl = rTr.Level();
    try{
      scrop->Read(rTr);
    } catch(faudes::Exception& ex) {
      bool res=rTr.Recover(secl);
      if(!res) throw(faudes::Exception(ex));
      FD_WARN("ScrProgram::Read(): ignoring invalid operation");
      Erase(Size()-1);
    }
    // swallow old file format extras
    rTr.Peek(token);
    if(token.IsEnd("Operations"))
        { rTr.ReadEnd("Operations"); continue; }
  }
  rTr.ReadEnd(VioStyle::StrFromQStr(label));
  FD_DS("ScrProgram::Read(): done");
  Initialize();
  // unblock signals, trigger update
  blockSignals(bs);
  endResetModel();
  emit NotifyProperties();
};


