/** @file wspfunctions.cpp - workspace functions. */

/*
  FAU Discrete Event Systems Library (libfaudes)

  Copyright (C) 2010 Thomas Moor
*/

#include "wspfunctions.h"
//#include <unistd.h>


/***************************************************************
****************************************************************
****************************************************************

implementation: wsp functions

****************************************************************
****************************************************************
****************************************************************/

// Constructor, (invalid function, needs at least a name and a pool)
WspFunction::WspFunction(QObject* parent) : 
  WspItem(parent),
  pFnctPool(0),
  mVioLuaFunction(0)
{
  FD_DI("WspFunction::WspFunction()");
  mItemType=WspItem::ITFunction;
  mPersistent=true;
  mVisual=true;
  mFileTitle = QString("Lua Function \"%1\"");
  mFileSuffix = QString("rti");
  mFileFilter = "Lua functions (*.rti);;Any File (*.*)";
  mVioLuaFunction = VioTypeRegistry::NewModel("LuaFunctionDefinition");
  if(!mVioLuaFunction) FD_WARN("WspFunction::WspFunction():: fatal error on type lookup (!)");
  if(!mVioLuaFunction) mVisual=false;
  connect(mVioLuaFunction,SIGNAL(NotifyModified(bool)),this,SLOT(ChildModified(bool)));
  connect(mVioLuaFunction,SIGNAL(NotifySignatureChange()),this,SIGNAL(NotifySignatureChange()));
  connect(mVioLuaFunction,SIGNAL(NotifySignatureChange()),this,SLOT(ChildSignatureChange()));
  connect(mVioLuaFunction,SIGNAL(NotifyNameChange()),this,SIGNAL(NotifySignatureChange()));
  connect(mVioLuaFunction,SIGNAL(StatusMessage(const QString&)),this,SLOT(EmitStatusMessage(const QString&)));
  // not changed yet
  Modified(false);
}

// convert to plain script (only just after construction)
void WspFunction::PlainScript(void) {
  // do it
  delete mVioLuaFunction;
  mVioLuaFunction = VioTypeRegistry::NewModel("LuaPlainScript");
  mVioLuaFunction->FaudesName(mName);
  if(!mVioLuaFunction) FD_WARN("WspFunction::PlainScript():: fatal error on type lookup (!)");
  // reconfigure
  mFileTitle = QString("Lua Script \"%1\"");
  mFileSuffix = QString("lua");
  mFileFilter = "Lua scripts (*.lua);;Any File (*.*)";
  // connect
  connect(mVioLuaFunction,SIGNAL(NotifyModified(bool)),this,SLOT(ChildModified(bool)));
  connect(mVioLuaFunction,SIGNAL(NotifySignatureChange()),this,SIGNAL(NotifySignatureChange()));
  connect(mVioLuaFunction,SIGNAL(NotifySignatureChange()),this,SLOT(ChildSignatureChange()));
  connect(mVioLuaFunction,SIGNAL(NotifyNameChange()),this,SIGNAL(NotifySignatureChange()));
  connect(mVioLuaFunction,SIGNAL(StatusMessage(const QString&)),this,SLOT(EmitStatusMessage(const QString&)));
  // not changed yet
  Modified(false);
}

bool WspFunction::IsPlainScript(void) {
  if(mVioLuaFunction->FaudesType()=="LuaPlainScript") return true;
  return false;
}


// Destructor
WspFunction::~WspFunction(void) {
  FD_DI("WspFunction::~WspFunction():" << VioStyle::StrFromQStr(mName));
  ShowItem(false);
  FD_DI("WspFunction::~WspFunction(): done: " << VioStyle::StrFromQStr(mName));
}

// Overload wsp item functins: get typed pool
WspFunctionPool* WspFunction::Pool(void) { 
  return qobject_cast<WspFunctionPool* >(model());
}

// Set name, (called from the pool!!)
void WspFunction::DoName(const QString& rNewName) { 
  if(mName==rNewName) return;
  // base does the job (incl signal)
  WspItem::DoName(rNewName);
  // fix faudes name 
  if(mVioLuaFunction) mVioLuaFunction->FaudesName(mName);

}

// initialize function content: clear value/source
void WspFunction::Clear(void) {
  FD_DS("WspFunction::Clear(): " << VioStyle::StrFromQStr(mName));
  // clear data
  if(mVioLuaFunction) mVioLuaFunction->Clear();
  // reset modified
  Modified(false);
}

// get ref to visual model
const VioModel* WspFunction::VioLuaFunction(void) const {
  if(!mVioLuaFunction) return 0;
  return mVioLuaFunction;
}


// get ref to faudes lua function
const faudes::LuaFunctionDefinition*  WspFunction::FaudesLuaFunction(void) {
  if(!mVioLuaFunction) return 0;
  const faudes::Type* fobject =mVioLuaFunction->FaudesObject();
  return dynamic_cast<const faudes::LuaFunctionDefinition*>(fobject);
}

// Flush()
void WspFunction::Flush(void) {
  if(!mVioLuaFunction) return;
  mVioLuaFunction->FlushViews();
}

// Modified: query changes (dont emit signal)
bool WspFunction::Modified(void) const { 
  return mModified;
};


// Modified: intercet to update elementary values
void WspFunction::ChildModified(bool changed) { 
  // call base
  WspItem::ChildModified(changed);
  // ignore netagtives
  if(!changed) return;
};


// Modified: record changes and emit signal
void WspFunction::Modified(bool ch) { 
  // clear childs
  if(mModified && !ch) {
    FD_DS("WspFunction::Modified(0): clear childs");
    if(mVioLuaFunction) mVioLuaFunction->Modified(false);
  }
  // let base manage
  WspItem::Modified(ch);
}

// collect childs signature changes (debugging only)
void WspFunction::ChildSignatureChange(void) {
  FD_DI("WspFunction::ChildSignatureChange() at " << this);
  emit NotifySignatureChange();
}  

// Overload wsp item functins: widgets
QWidget* WspFunction::NewMainWidget(void) {
  if(!mVioLuaFunction) return 0; 
  VioView* mview=  mVioLuaFunction->NewView();
  if(!mview) return 0;
  mview->Model(mVioLuaFunction);
  return mview;
}

// Overload wsp item functins: widgets
QWidget* WspFunction::NewSateliteWidget(void) {
  return 0;
}

// Overload wsp item functins: widgets
QWidget* WspFunction::NewPropertyWidget(void) {
  WspFunctionProperties* pwidget = new WspFunctionProperties(Pool(),0);
  pwidget->Connect(Name());
  return pwidget;
}


// better context menu
QMenu* WspFunction::NewContextMenu(void) {
  FD_DS("WspFunction::NewContextMenu(): partially implemented");

  // set up menu
  QMenu* menu= new QMenu();
  QAction *action;
  menu->setTitle(Name());
 
  // add button: show
  action= menu->addAction("Show \"" + Name() + "\"");
  action->setEnabled(Visual());
  QObject::connect(action,SIGNAL(triggered(void)),this,SLOT(ShowItem(void)));
  menu->addSeparator();

  // add button: help
  /*
  action= menu->addAction(QString("Help on %1").arg(FaudesType()));
  action->setEnabled(true);
  QObject::connect(action,SIGNAL(triggered(void)),this,SLOT(Help(void)));
  menu->addSeparator();
  */

  // load file
  action = menu->addAction("Load from File ...");
  connect(action,SIGNAL(triggered(void)),this,SLOT(UserLoad(void)));

  // save file
  action = menu->addAction("Save to File ...");
  connect(action,SIGNAL(triggered(void)),this,SLOT(UserSave(void))); 

  // import plain faudes
  /*
  action = menu->addAction("Import FAUDES File ...");
  action->setEnabled(Visual());
  connect(action,SIGNAL(triggered(void)),this,SLOT(UserImport(void)));
  menu->addSeparator();
  */

  // construct and add item property widget
  /*
  QWidget* propwidget = NewPropertyWidget();
  QWidgetAction* propaction = new QWidgetAction(menu);
  propaction->setDefaultWidget(propwidget);
  menu->addAction(propaction);
  */

  // done
  return menu;
}



// user interaction (move to wsp item or wspview)
int WspFunction::UserImport(void) {
  if(!mVisual) return 0;
  FD_DS("WspFunction::UserImport()");
  int err=0;
  try {
    // have dialog
    QFileDialog* fdiag = new QFileDialog();
    QSettings settings;
    fdiag->restoreState(settings.value("importFileDialog").toByteArray());
    if(mVioLuaFunction->FaudesType()=="LuaPlainScript") {
      QString filter= 
        "Faudes RTI definitions (*.rti);;"
        "Text Files (*.txt);;"
        "Any File (*.*)";
      fdiag->setNameFilter(filter);
      fdiag->setDefaultSuffix("rti");
      fdiag->setWindowTitle(QString("Import Faudes RTI definition"));
    } else {
      QString filter= 
        "Lua code (*.lua);;"
        "Text Files (*.txt);;"
        "Any File (*.*)";
      fdiag->setNameFilter(filter);
      fdiag->setDefaultSuffix("rti");
      fdiag->setWindowTitle(QString("Import Lua Script"));
    }
    fdiag->setFileMode(QFileDialog::ExistingFile);
    fdiag->setAcceptMode(QFileDialog::AcceptOpen);
    // run dialog
    QString fileName="";
    if(fdiag->exec()) 
      if(fdiag->selectedFiles().size()==1) 
        fileName=fdiag->selectedFiles().at(0);
    // maintain settings
    settings.setValue("stateFileDialog", fdiag->saveState());
    // do the import
    mVioLuaFunction->ImportFaudesFile(fileName);
  } catch(faudes::Exception& exception) {
    err=+1;
  } 
  Modified(false);
  return err;
}


// import faudes file
int WspFunction::Import(const QString& filename) {
  if(!mVioLuaFunction) return 1;
  FD_DS("WspFunction::Import(): from " << filename);
  int err=0;
  try {
    mVioLuaFunction->ImportFaudesFile(filename);
    FD_DS("WspFunction::Import(): name " << mVioLuaFunction->FaudesName());
    Name(mVioLuaFunction->FaudesName());
    if(Name()!=mVioLuaFunction->FaudesName()) err=2;
  } catch(faudes::Exception& exception) {
    err=1;
  } 
  // set validity
  Modified(false);
  return err;
}

// install to state
void WspFunction::Install(faudes::LuaState* pL) {
  const faudes::LuaFunctionDefinition*  lfd=FaudesLuaFunction();
  if(!lfd) return;
  lfd->Install(pL);
}

// export faudes file
int WspFunction::Export(const QString& filename) const {
  if(!mVioLuaFunction) return 1;
  int err=0;
  try {
    mVioLuaFunction->ExportFaudesFile(filename);
  } catch(faudes::Exception& exception) {
    err=1;
  } 
  // done
  return err;
}

// data write (uses std faudes rti format)
void WspFunction::DoExternalWrite(const QString& rFilename, const QString& rLabel) const {
 (void) rLabel;
 if(!mVioLuaFunction) return;
 mVioLuaFunction->ExportFaudesFile(rFilename);
}

// data read (uses std faudes rti format)
void WspFunction::DoExternalRead(const QString& rFilename, const QString& rLabel) {
  (void) rLabel;
  if(!mVioLuaFunction) return;
  mVioLuaFunction->ImportFaudesFile(rFilename);
  QString nname=mVioLuaFunction->FaudesName();
  if(nname=="") nname=QFileInfo(rFilename).baseName();
  FD_DS("WspFunction::DoExternalRead(): fname " << VioStyle::StrFromQStr(nname));
  // fix wspname if we are not in a pool
  if(!Pool()) Name(nname);
  // fix faudes name if we are in a pool (so UserLoad will maintain the wsp name and UserAppend
  // can recover the faudes name)
  if(Pool()) 
    mVioLuaFunction->FaudesName(Name());   
  // clear flag
  Modified(false);
  // should this move to Import?
  emit NotifySignatureChange();
}


// token io, write
void WspFunction::DoWrite(faudes::TokenWriter& rTw,  const QString& rLabel) const {
  // default
  QString label(rLabel);
  if(label=="") label="WspLuaFunction";
  // start writing
  rTw.WriteBegin(VioStyle::StrFromQStr(label));
  rTw << VioStyle::StrFromQStr(mName);
  // write properties
  if(mShown)
    rTw.WriteOption("Shown");
  // write data
  mVioLuaFunction->Write(rTw); 
  // done
  rTw.WriteEnd(VioStyle::StrFromQStr(label));
}

// token io, read
void WspFunction::DoRead(faudes::TokenReader& rTr, const QString& rLabel) {
  FD_DI("WspFunction::DoRead()");
  // default
  QString label(rLabel);
  if(label=="") label="WspLuaFunction";
  // clear
  setProperty("LuaFunction",mName);
  mShown=false;
  mPersistent=true;
  Clear();
  // read
  rTr.ReadBegin(VioStyle::StrFromQStr(label));
  // var name/type
  QString tname = VioStyle::QStrFromStr(rTr.ReadString());
  // try to set 
  Name(tname);
  // get other content
  while(!rTr.Eos(VioStyle::StrFromQStr(label))) {
    faudes::Token token;
    rTr.Peek(token);
    // options
    if(token.Type()==faudes::Token::Option)
    if(token.StringValue()=="Shown") {
      mShown=true;
      rTr.Get(token);
      continue;
    }
    // done with options
    if(token.Type()==faudes::Token::Option) {
      rTr.Get(token);
      continue;
    }
    // value section
    if(token.Type()==faudes::Token::Begin && token.StringValue()=="VioLuaFunctionDefinition") {
      if(mVioLuaFunction) mVioLuaFunction->Read(rTr); 
      continue;
    }
    if(token.Type()==faudes::Token::Begin && token.StringValue()=="VioLuaPlainScript") {
      PlainScript();
      if(mVioLuaFunction) mVioLuaFunction->Read(rTr); 
      continue;
    }
    // ignore unkown tokens
    rTr.Get(token);
  }
  rTr.ReadEnd(VioStyle::StrFromQStr(label));
  // update property widgets
  emit NotifyProperties();
  FD_DI("WspFunction::DoRead(): done");
}


// view fcatory
WspItemView* WspFunction::NewView(void) {
  return new WspFunctionView();
}


// highlite requests (not implemented)
void WspFunction::Highlite(const VioElement& elem, bool on) {
  if(!mVioLuaFunction) return;
  FD_DI("WspFunction::Highlite(): " << VioStyle::StrFromQStr(Name()) << " " << elem.Str());
  mVioLuaFunction->Highlite(elem,on);
  mVioLuaFunction->Show(elem);
}

// highlite requests (not implemented)
void WspFunction::HighliteClear(void) {
  if(!mVioLuaFunction) return;
  FD_DI("WspFunction::HighliteClear(): " << VioStyle::StrFromQStr(Name()));
  mVioLuaFunction->HighliteClear();
}




/***************************************************************
****************************************************************
****************************************************************

implementation: wsp function view

****************************************************************
****************************************************************
****************************************************************/

// construct
WspFunctionView::WspFunctionView(WspPool* pool, QWidget* parent) :
  WspItemView(pool,parent),
  pFunction(0)
{
  mSeparator = new QAction(this);
  mSeparator->setSeparator(true);
  mLoadAct = new QAction(this);
  mSaveAct = new QAction(this);
}

// destruct
WspFunctionView::~WspFunctionView() {
}

// get model
const WspFunction* WspFunctionView::Model(void) const {
  return pFunction;
};

// set model
void WspFunctionView::Model(WspItem* item) {
  WspFunction* fnct = qobject_cast<WspFunction*>(item);
  // call base
  WspItemView::Model(fnct);
  pFunction = qobject_cast<WspFunction*>(pItem);
  // my disconnect
  disconnect(mLoadAct);
  disconnect(mSaveAct);
  // my connect
  connect(mLoadAct,SIGNAL(triggered(void)),pFunction,SLOT(UserLoad(void)));
  connect(mSaveAct,SIGNAL(triggered(void)),pFunction,SLOT(UserSave(void)));
};


// my edit actions
QList<QAction*> WspFunctionView::EditActions() {
  QList<QAction*> actions;
  const VioModel* vmodel=  Model()->VioLuaFunction();
  const VioView* vview=  qobject_cast<VioView*>(mContent);
  if(!vmodel || !vview) return actions;
  actions.append(vview->UndoAction());
  actions.append(vview->RedoAction());
  actions.append(mSeparator);
  actions.append(vview->CutAction());
  actions.append(vview->CopyAction());
  actions.append(vview->PasteAction());
  const QList<QAction*>& extra = vview->EditActions();
  if(extra.size()>0) {
    actions.append(mSeparator);
    for(int i=0; i<extra.size(); ++i) 
      actions.append(extra.at(i));
  }
  FD_DI("WspFunction::EditActions() : #" << actions.size());
  return actions;
}

// my view actions
QList<QAction*> WspFunctionView::ViewActions() {
  QList<QAction*> actions;
  const VioModel* vmodel=  Model()->VioLuaFunction();
  const VioView* vview=  qobject_cast<VioView*>(mContent);
  if(!vmodel || !vview) return actions;
  const QList<QAction*>& extra = vview->ViewActions();
  for(int i=0; i<extra.size(); ++i) 
    actions.append(extra.at(i));
  FD_DI("WspFunction::ViewActions() : #" << actions.size());
  return actions;
}

// my file actions
QList<QAction*> WspFunctionView::FileActions() {
  QList<QAction*> actions;
  const VioModel* vmodel=  Model()->VioLuaFunction();
  const VioView* vview=  qobject_cast<VioView*>(mContent);
  if(!vmodel || !vview) return actions;
  // have load and save
  actions.append(mLoadAct);
  actions.append(mSaveAct);
  // update filename
  QString text;
  text = tr("Load %1 from file ...").arg(Model()->Name());
  mLoadAct->setText(text);
  text = tr("Save %1 to file ...").arg(Model()->Name());
  mSaveAct->setText(text);
  // extra actions from vioview (e.g. import/export)
  const QList<QAction*>& extra = vview->FileActions();
  for(int i=0; i<extra.size(); ++i) 
    actions.append(extra.at(i));
  // done
  FD_DI("WspFunction::FileActions() : #" << actions.size());
  return actions;
}


/* 
 ******************************************
 ******************************************
 ******************************************

 function properties widget

 ******************************************
 ******************************************
 ******************************************
 */


WspFunctionProperties::WspFunctionProperties(WspFunctionPool* fnctpool, QWidget *parent) 
  : QWidget(parent) 
{
  FD_DI("WspFunctionProperties::WspFunctionProperties()");

  // keep ref to varpool an function
  pFnctPool = fnctpool;
  mFunction="";

  // overall layout
  QVBoxLayout* vbox0= new QVBoxLayout(this);
  vbox0->setContentsMargins(2,2,2,2);
  vbox0->setSpacing(2);
  vbox0->addStretch(1);

  // edit name
  mEditName=new QLineEdit();  
  mEditName->setText("< no item >");
  mEditName->setReadOnly(true);
  mEditName->setValidator(new VioSymbolValidator(mEditName));
  QObject::connect(mEditName,SIGNAL(editingFinished()),this,SLOT(ReName()));

  // edit label
  QLabel* edla = new QLabel();
  edla->setText("Name:");
  edla->setBuddy(mEditName);

  // edit hbox
  QHBoxLayout* hbox1= new QHBoxLayout();
  hbox1->addWidget(edla);
  hbox1->addStretch(10);
  hbox1->addWidget(mEditName);
  vbox0->addLayout(hbox1);
  vbox0->addSpacing(10);

};

// connect changes
void WspFunctionProperties::Connect(QString function) {
  FD_DI("WspFunctionProperties::Connect("<< VioStyle::StrFromQStr(function)<<")");
  // disconnect
  if(WspFunction* fnct = pFnctPool->At(mFunction)) {
    QObject::disconnect(fnct,SIGNAL(NotifyProperties(void)),this,0);
  }
  // record varname and update
  mFunction=function;
  Update();
  // connect
  if(WspFunction* fnct = pFnctPool->At(mFunction)) {  
    FD_DI("WspFunctionProperties::Connect("<< VioStyle::StrFromQStr(function)<<"): found item");
    // connect function (other writing to the function)
    QObject::connect(fnct,SIGNAL(NotifyProperties(void)),this,SLOT(Update(void)));
  }
}

// commit changes
void WspFunctionProperties::Commit(void) {
} 

// change of name
void WspFunctionProperties::ReName(void) {
  // bail out on no sender
  if(!sender()) return;
  // figure name
  QString newname=mEditName->text();
  // bail out on nop
  if(mFunction==newname) return;
  FD_DI("WspFunctionProperties::ReName("<< VioStyle::StrFromQStr(mFunction)  << ", " << VioStyle::StrFromQStr(newname) << ")");
  // ask for rename
  if(pFnctPool->ReName(mFunction,newname))
    Connect(newname);  
  else
    Connect(mFunction);  
} 


// update from function
void WspFunctionProperties::Update(void) {
  WspFunction* fnct = pFnctPool->At(mFunction);
  // if connected
  if(fnct) {
    // get name
    mEditName->setText(fnct->Name());
    mEditName->setReadOnly(false);
  } else {
    // set name
    mEditName->setText("< no item >");
    mEditName->setReadOnly(true);
  }
} 






/***************************************************************
****************************************************************
****************************************************************

implementation: wsp function pool

****************************************************************
****************************************************************
****************************************************************/


// construct
WspFunctionPool::WspFunctionPool(QObject* parent) : 
  WspPool(WspItem::ITFunction,parent) {
  FD_DI("WspFunctionPool::WspFunctionPool()");
  // configure
  mHeader="Functions";
  setHorizontalHeaderLabels(QStringList() << mHeader);
  mTokenSection=QString("Functions");
  // done
  FD_DI("WspFunctionPool::WspFunctionPool(): done" << Size());
}



// destruct
WspFunctionPool::~WspFunctionPool(void) {
  FD_DI("WspFunctionPool::~WspFunctionPool()");
}


// clear
void WspFunctionPool::Clear(void) {
  FD_DI("WspFunctionPool::Clear()");
  WspPool::Clear();
  FD_DI("WspFunctionPool::Clear(): #" << Size());
  WspPool::Clear();
  FD_DI("WspFunctionPool::Clear(): #" << Size());
}

// factory
WspFunction* WspFunctionPool::NewItem(void) {
  return new WspFunction();
}

// test type 
WspItem* WspFunctionPool::TestItem(WspItem* item) {
  return qobject_cast<WspFunction*>(item);
}


// overload
int WspFunctionPool::DoInsert(int position, WspItem* item) {
  // type check
  WspFunction* fnct = qobject_cast<WspFunction*>(item);
  if(!fnct) return -1;
  // call base
  int pos = WspPool::DoInsert(position,item);
  return pos;
}

// overload
bool WspFunctionPool::DoValidName(const QString& newname) {
  // no good for base no good for me
  if(!WspPool::DoValidName(newname)) return false;
  // extra contraint: avoid collisions with built in fnctss
  const faudes::FunctionDefinition* ffnct = VioFunctionRegistry::Definition(newname);
  if(ffnct) return false;
  // ok
  return true;
}


// extend anonymous
void WspFunctionPool::InsertAnonymous(int pos) {
  FD_DI("WspFunctionPool::InsertAnonymous()");
  if(pos<0) pos=0;
  if(pos>Size()) pos = Size();
  WspFunction* witem=NewItem();
  witem->Name(NewName("LuaFunction"));
  DoInsert(pos,witem);
  witem->Modified(false);
}


// overload
WspFunction* WspFunctionPool::At(int position) {
  return qobject_cast<WspFunction*>(WspPool::At(position));
}

// overload
const WspFunction* WspFunctionPool::At(int position) const {
  return qobject_cast<const WspFunction*>(WspPool::At(position));
}

// overload
WspFunction* WspFunctionPool::At(const QString& name) {
  FD_DI("WspFunctionPool::At(): search by name in #" << Size());
  return qobject_cast<WspFunction*>(WspPool::At(name));
}




// combined with built in functions 
const faudes::FunctionDefinition* WspFunctionPool::Definition(const QString& name) {
  FD_DI("WspFunctionPool::Definition(): retrieve " << VioStyle::StrFromQStr(name));
  // have a project luafunction
  WspFunction* lfnct=At(name);
  FD_DI("WspFunctionPool::Definition(): retrieve " << VioStyle::StrFromQStr(name));
  if(lfnct) {
    FD_DI("WspFunctionPool::Definition(): found script");
    return lfnct->FaudesLuaFunction();
  }
  // have a built in function
  const faudes::FunctionDefinition* ffnct = VioFunctionRegistry::Definition(name);
  if(ffnct) {
    FD_DI("WspFunctionPool::Definition(): found c function");
    return ffnct;
  }
  FD_DI("WspFunctionPool::Definition(): fail");
  // fail
  return 0;
}

// user append (>=0 <> success)
int WspFunctionPool::UserAppendFromFile(void) {
  FD_DI("WspFunctionPool::UserAppendFromFile()");
  // set up my own dialog, allow to choose lua or rti
  QFileDialog* fdiag = new QFileDialog();
  QSettings settings;
  fdiag->restoreState(settings.value("stateFileDialog").toByteArray());
  fdiag->setNameFilter("Lua scripts (*.lua);;Lua functions (*.rti);;Any File (*.*)");
  fdiag->setFileMode(QFileDialog::ExistingFile);
  fdiag->setWindowTitle(QString("Load Lua Code from file"));
  fdiag->setAcceptMode(QFileDialog::AcceptOpen);
  fdiag->setDefaultSuffix(".rti");
  // run dialog
  QString filename="";
  if(fdiag->exec()) {
    if(fdiag->selectedFiles().size()==1) 
      filename=fdiag->selectedFiles().at(0);
  }
  settings.setValue("stateFileDialog", fdiag->saveState());
  delete fdiag;
  if(filename=="") return -1;
  // figure
  WspFunction* wfnct= new WspFunction();
  if(QFileInfo(filename).suffix()=="rti") {}
  if(QFileInfo(filename).suffix()=="lua") {wfnct->PlainScript();}
  // do the load
  try {
    wfnct->ExternalRead(filename);
    wfnct->Modified(false);
  }
  catch(faudes::Exception& exception) {
    QMessageBox mb(QMessageBox::Warning,tr("DESTool"),
	 tr("Cannot read file %1").arg(filename),QMessageBox::Ok);
    QString errmsg=VioStyle::QStrFromStr(exception.What());
    if(errmsg=="") errmsg="token mismatch";
    mb.setInformativeText("libFAUDES Error: "+errmsg);
    mb.exec();
    delete wfnct;
    return -1;
  }
  // test whether we can append this
  if(Definition(wfnct->Name())) {
    QMessageBox mb(QMessageBox::Warning,tr("DESTool"),
      tr("Failed to load function from file"),QMessageBox::Ok);
     mb.setInformativeText(tr("Function \"%1\" already exists. To intentionally overwrite a function, use <i>Load From File</i> from the edit-menu").arg(wfnct->Name()));
     mb.exec();
    delete wfnct; 
    return -1;
  }
  // do insert
  return Insert(Size(),wfnct);
}


// user runs help
void WspFunctionPool::Help(void) { 
  // figure descr
  if(!sender()) return;
  QVariant prop = sender()->property("Item");
  if(!VIODES_QVAR_IS_STR(prop)) return;
  QString descr = prop.toString();
  Help(descr);
}

// user runs help
void WspFunctionPool::Help(const QString& name) { 
  if(!VioFunctionRegistry::Exists(name)) return;
  QString href = "reference/"+VioFunctionRegistry::DocumentationHtml(name);
  DesStyle::ShowDocumentation(href);
}


// highlite requests
void WspFunctionPool::Highlite(const QString& fnctname, const VioElement& elem, bool on) {
  FD_DI("WspFunctionPool::Highlite(" << VioStyle::StrFromQStr(fnctname) << ")");
  WspFunction* fnct= At(fnctname);
  if(fnct) fnct->Highlite(elem,on);
}

// highlite requests
void WspFunctionPool::HighliteClear(const QString& fnctname) {
  FD_DI("WspFunctionPool::HighliteClear(" << VioStyle::StrFromQStr(fnctname) << ")");
  // do all
  if(fnctname=="") {
    foreach(WspItem* item, ItemList()) {
      WspFunction* fnct= qobject_cast<WspFunction*>(item);
      fnct->HighliteClear();
    }
    return;
  }
  // do one
  WspFunction* fnct= At(fnctname);
  if(fnct) fnct->HighliteClear();
}



// install to state
void WspFunctionPool::LuaInstall(faudes::LuaState* pL) {
  try {
    for(int i=0; i< Size(); i++) {
      At(i)->Install(pL);
    }
  } catch(faudes::Exception& ex) {
  }
}



/***************************************************************
****************************************************************
****************************************************************

implementation: wsp insert menu

NOTE: currently, the destination slots are not used for insertion;
NOTE: insertion is done in "runcontextmenu" within "scprogramm"

****************************************************************
****************************************************************
****************************************************************/


// constructor
WspFunctionInsertMenu::WspFunctionInsertMenu(
  WspFunctionPool* fnctpool, QObject* parent
) :
  QObject(parent),
  pFnctPool(fnctpool)
{

  // have menus
  mBuiltIn       = new QMenu("Insert Operation");
  mLuaAll        = new QMenu("Insert Lua Code");
  mLuaFunctions  = new QMenu("Lua Functions");
  mLuaScripts    = new QMenu("Lua Scripts");


  // set up std function menues
  QStringList secs = VioTypeRegistry::Sections();
  secs.sort();
  if(secs.contains("CoreFaudes")) {
    secs.removeAll("CoreFaudes");
    secs.push_front("CoreFaudes");
  }
  for(int si=0; si<secs.size(); ++si) {
    QString sec=secs.at(si);
    FD_DS("WspFunctionInserMenu::WspFunctionInserMenu()" << VioStyle::StrFromQStr(sec));
    QMenu* menu = new QMenu;
    menu->setTitle(sec);
    const QStringList& fncts = VioFunctionRegistry::Functions(sec);
    for(int fi=0; fi<fncts.size(); ++fi) {
      QString fnct=fncts.at(fi);
      FD_DS("WspFunctionInserMenu::WspFunctionInserMenu(): fnct " << VioStyle::StrFromQStr(fnct));
      QAction* action= menu->addAction(fnct);
      action->setProperty("Function",fnct);
    }
    if(fncts.size()>0) mBuiltIn->addMenu(menu);
    if(secs.size()>1) if(si==0) mBuiltIn->addSeparator();
  }
  // prepare lua functions
  FD_DS("WspFunctionInsertMenu(): connect updater");
  QObject::connect(mLuaFunctions,SIGNAL(aboutToShow(void)),this,SLOT(UpdateExtMenu(void)));
  QObject::connect(mLuaScripts,SIGNAL(aboutToShow(void)),this,SLOT(UpdateExtMenu(void)));
  QObject::connect(mLuaAll,SIGNAL(aboutToShow(void)),this,SLOT(UpdateExtMenu(void)));
}


// destructor
WspFunctionInsertMenu::~WspFunctionInsertMenu(){
  delete mBuiltIn;
  delete mLuaFunctions;
  delete mLuaScripts;
}


// lua extensions updater
void WspFunctionInsertMenu::UpdateExtMenu(void) {
  FD_DS("WspFunctionInsertMenu::UpdateExtMenu");
  QMenu* menu = qobject_cast<QMenu*>(sender());
  if(!menu) return;
  FD_DS("WspFunctionInsertMenu::UpdateLuaMenu");
  // case a: lua all
  if(menu==mLuaAll) {
    menu->setTitle("Insert Lua Code");
    menu->clear();
    menu->addAction("New Lua Script");
    menu->addAction("New Lua Function");
    menu->addAction("Load From File ...");
    QStringList fnctlist=pFnctPool->NameList();
    fnctlist.sort();
    bool ok=false;
    for(int fi=0; fi<fnctlist.size(); ++fi) {
      QString fnct=fnctlist.at(fi);
      FD_DS("ScrRegister::UpdateLuaMenu(): fnct " << VioStyle::StrFromQStr(fnct));
      if(!ok) menu->addSeparator();
      QAction* action= menu->addAction(fnct);
      action->setProperty("Function",fnct);
      ok=true;
    }
  }
  // case b,c: todo
  FD_DS("WspFunctionInsertMenu::UpdateExtMenu: done");
}
