/** @file wspvariables.cpp - workspace variables. */

/*
  FAU Discrete Event Systems Library (libfaudes)

  Copyright (C) 2009 Ruediger Berndt
  Copyright (C) 2009 Thomas Moor
*/

#include "wspvariables.h"
//#include <unistd.h>


/***************************************************************
****************************************************************
****************************************************************

implementation: wsp variables

****************************************************************
****************************************************************
****************************************************************/

// Constructor, (invalid variable, needs at least a name and a pool)
WspVariable::WspVariable(QObject* parent) : 
  WspItem(parent),
  pVarPool(0),
  mFaudesType(""),
  mPlant(false),
  mSupervisor(false),
  mSource(Unknown),
  mValid(false),
  mFaudesObject(0),
  mVioModel(0),
  pFaudesObject(0) 
{
  FD_DI("WspVariable::WspVariable()");
  mItemType=WspItem::ITVariable;
  mPersistent=true;
  mSource=WorkSpace;
  mVisual=true;
}


// Destructor
WspVariable::~WspVariable(void) {
  FD_DI("WspVariable::~WspVariable():" << mName);
  ShowItem(false);
  // delete all objects: todo: signal views
  if(mVioModel) delete mVioModel;
  if(mFaudesObject) delete mFaudesObject;
  FD_DI("WspVariable::~WspVariable(): done: " << mName);
}

// Overload wsp item functins: get typed pool
WspVariablePool* WspVariable::Pool(void) { 
  return qobject_cast<WspVariablePool* >(model());
}

// Set name, (called from the pool!!)
void WspVariable::DoName(const QString& rNewName) { 
  if(mName==rNewName) return;
  // base does the job (incl signal)
  WspItem::DoName(rNewName);
  // fix faudes name
  if(mFaudesObject) mFaudesObject->Name(VioStyle::StrFromQStr(mName));
  if(mVioModel) mVioModel->FaudesName(mName);
}

// initialize variable content: clear value/source
void WspVariable::Clear(void) {
  FD_DS("WspVariable::Clear(): " << mName);
  // clear data
  if(mVioModel) delete mVioModel;
  if(mFaudesObject) delete mFaudesObject;
  mVioModel=0;
  mFaudesObject=0;
  pFaudesObject=0;
  // set source
  mSource=Unknown;
  mValid=false;
  // reset modified
  Modified(false);
}

// get Type
const QString& WspVariable::FaudesType(void) const {
  return mFaudesType;
}

// set Type, invalidates refs (!)
const QString& WspVariable::FaudesType(const QString& ftype) {
  // bail out on trivial
  if(mFaudesType==ftype) return mFaudesType;
  // do set the type
  FD_DI("WspVariable::FaudesType(): " << ftype);
  mFaudesType=ftype;
  if(ElementaryType()) Persistent(true);
  Visual(mVisual && !ElementaryType()); 
  // allocate new value
  Allocate();
  // Adjust appearance (todo: be type sensitive)
  mFileTitle = QString("Link DESTool Variable \"%1\" to File");
  mFileSuffix = QString("vio");
  mFileFilter = "Vio Generators/Alphabets (*.vio);;Any File (*.*)";
  // configure help
  HtmlPage("reference/"+VioTypeRegistry::DocumentationHtml(mFaudesType));
  ToolTip(mFaudesType + ": "+ VioTypeRegistry::DocumentationPlain(mFaudesType));
  // fix dynamic tool tip
  ToolTip();
  // allocate clears mod, we set it back
  Modified(true);
  // done
  return mFaudesType;
}

// allocate actual memroy (emits properties changed)
void WspVariable::Allocate(void) {
  FD_DS("WspVariable::Allocate(): " << mName << " visual=" << mVisual);
  // test type validity
  if(!VioTypeRegistry::Exists(mFaudesType)) {
     FD_WARN("WspVariable::Allocate(): invalid type \"" << mFaudesType << "\"");
     return;
  }
  // keep old data
  VioModel* ovmodel = mVioModel;
  faudes::Type* ofobject = mFaudesObject;
  const faudes::Type* pofobject = pFaudesObject;
  mVioModel=0;
  mFaudesObject=0;
  pFaudesObject=0;
  // allocate data: viomodel
  if(mVisual) {
    mVioModel=VioTypeRegistry::NewModel(mFaudesType);
    connect(mVioModel,SIGNAL(MouseClick(const VioElement&)),this,SLOT(MouseClick(const VioElement&)));
    connect(mVioModel,SIGNAL(MouseDoubleClick(const VioElement&)),this,SLOT(MouseDoubleClick(const VioElement&)));

    connect(mVioModel,SIGNAL(NotifyModified(bool)),this,SLOT(ChildModified(bool)));
    connect(mVioModel,SIGNAL(StatusMessage(const QString&)), this, SIGNAL(StatusMessage(const QString&)));
    connect(mVioModel,SIGNAL(ErrorMessage(const QString&)), this, SIGNAL(ErrorMessage(const QString&)));
    //connect(mVioModel,SIGNAL(NotifyAnyChange(void)),this,  SLOT(ToolTip(void)), Qt::QueuedConnection);
    if(ovmodel) mVioModel->Assign(*ovmodel); 
    pFaudesObject=mVioModel->FaudesObject(); 
  }
  // allocate data: faudes
  if(!mVisual) {
    mFaudesObject=faudes::NewFaudesObject(VioStyle::StrFromQStr(mFaudesType));
    pFaudesObject=mFaudesObject;
    if(pofobject) mFaudesObject->Assign(*pofobject);
  }
  // not changed yet
  Modified(false);
  // report invalid refs
  emit NotifyProperties();
  // delete old objects  
  if(ovmodel) delete ovmodel;
  if(ofobject)  delete ofobject;
  FD_DS("WspVariable::Allocate(): done");
}


// assign (incl cast as necessary)
void WspVariable::Assign(const WspVariable* pSrc) {
  FD_DI("WspVariable::Assign(): dst " << Name() << " src " << pSrc->Name());
  // assign with/without visual
  if(mVioModel && pSrc->mVioModel) {
    FD_DI("WspVariable::Assign(): both visual, dst lock " << mVioModel->FaudesLocked());
    mVioModel->Assign(*pSrc->VisualModel()); 
    emit NotifyProperties();
  } 
  if(mVioModel && !pSrc->mVioModel) {
    FD_DI("WspVariable::Assign(): only dst visual");
    FaudesValue(pSrc->FaudesValue()->Copy());
    UpdateVisual();
  } 
  if(!mVioModel) {
    FD_DI("WspVariable::Assign(): faudes only");
    if(mFaudesObject) mFaudesObject->Assign(*pSrc->FaudesValue());
  }
  // fix dynamic tool tip
  ToolTip();
  // report invalid refs / any change
  FD_DI("WspVariable::Assign(): done");
}

// turn on/off visual
void WspVariable::DoVisual(bool vio) {
  // nothing todo
  if(mVisual==vio) return;
  // refuse elementary
  if(vio && ElementaryType()) return;
  // set
  FD_DS("WspVariable::DoVisual(" << vio << "): " << Name());
  // turn on 
  if(vio) {
    // allocate visual
    if(mVioModel) {
      FD_DS("WspVariable::DoVisual(" << vio << "): delete visual model (?)"); 
      delete mVioModel; 
    }
    mVioModel=VioTypeRegistry::NewModel(mFaudesType);
    // move object
    if(mFaudesObject) {
      FD_DS("WspVariable::DoVisual(" << vio << "): move faudes object"); 
      mVioModel->InsertFaudesObject(mFaudesObject); // viomodel takes ownership
      mFaudesObject=NULL;
    }
    // FIXME: move all connectors from Allocate to here?
    // update const ref
    pFaudesObject=mVioModel->FaudesObject(); 
  }
  // turn visual off
  if(!vio) {
    // hide my rep
    ShowItem(false);
    // free any previous faudes object
    if(mFaudesObject) {
      FD_DS("WspVariable::DoVisual(" << vio << "): delete faudes object (?)");
      delete mFaudesObject;
      mFaudesObject=NULL;
    }
    // take, incl ownership
    if(mVioModel) {
      FD_DS("WspVariable::DoVisual(" << vio << "): delete visual");
      mFaudesObject=mVioModel->TakeFaudesObject(); 
      delete mVioModel;
      mVioModel=NULL;
    }
    // update const ref
    pFaudesObject=mFaudesObject;
  }
  FD_DS("WspVariable::DoVisual(" << vio << "): done");
  // record
  mVisual=vio;
  // record modified
  Modified(true);
  // indicate invalid refs
  emit NotifyProperties();
}

// Set persistence, default
void WspVariable::DoPersistent(bool vis) { 
  if(ElementaryType()) vis=true;
  mPersistent=vis;
}

// get value: const ref
const faudes::Type*  WspVariable::FaudesValue(void) const { 
  if(mVioModel) mVioModel->FlushViews();
  return pFaudesObject; 
};

// set value: (dont emit signals in exec thread, call updateVisual later))
void WspVariable::FaudesValue(faudes::Type* fobject) { 
  if(mFaudesObject) delete mFaudesObject;
  mFaudesObject=fobject;
  pFaudesObject=fobject;
};

// clear value
void WspVariable::FaudesClear(void) {
  // bail out
  if(!pFaudesObject) return;
  // doit
  faudes::Type* newval =  pFaudesObject->New();
  newval->Name(pFaudesObject->Name());
  FaudesValue(newval);
  UpdateVisual();
};

// set/get convenience
bool WspVariable::BooleanValue(void) const {
  const faudes::Boolean* bval = dynamic_cast<const faudes::Boolean*>(pFaudesObject);
  if(!bval) return false;
  return *bval;
}

// set/get convenience
void WspVariable::BooleanValue(bool val) {
  // not my type
  if(FaudesType()!="Boolean") return;
  // have a new faudes object
  faudes::Boolean* bval= new faudes::Boolean(val);
  // set and update
  FaudesValue(bval);
  UpdateVisual();
};


// set/get convenience
int WspVariable::IntegerValue(void) const {
  const faudes::Integer* ival = dynamic_cast<const faudes::Integer*>(pFaudesObject);
  if(!ival) return 0;
  return *ival;
}

// set/get convenience
void WspVariable::IntegerValue(int val) {
  // not my type
  if(FaudesType()!="Integer") return;
  // have a new faudes object
  faudes::Integer* ival= new faudes::Integer(val);
  // set and update
  FaudesValue(ival);
  UpdateVisual();
};


// set/get convenience
QString WspVariable::StringValue(void) const {
  const faudes::String* sval = dynamic_cast<const faudes::String*>(pFaudesObject);
  if(!sval) return QString();
  return VioStyle::QStrFromStr(*sval);
}

// set/get convenience
void WspVariable::StringValue(const QString& val) {
  // not my type
  if(FaudesType()!="String") return;
  // have a new faudes object
  faudes::String* sval= new faudes::String(VioStyle::StrFromQStr(val));
  // set and update
  FaudesValue(sval);
  UpdateVisual();
};

// is elementary type?
bool WspVariable::ElementaryType() const {
  if(mFaudesType=="Boolean") return true;
  if(mFaudesType=="Integer") return true;
  if(mFaudesType=="String") return true;
  return false;
}

// extract elementary type from string
bool WspVariable::ElementaryFromString(const QString& strval) {
  if(mFaudesType=="Integer") {
    int val=strval.toInt();
    IntegerValue(val);
    return true;
  }  
  if(mFaudesType=="Boolean") {
    if(strval.toLower()=="true") BooleanValue(true); 
    if(strval.toLower()=="false") BooleanValue(false); 
    return true;
  }  
  if(mFaudesType=="String") {
    StringValue(strval);
    return true;
  }  
  return false;
}

// convert elementary type to string
bool WspVariable::ElementaryToString(QString& str) const {
 if(mFaudesType=="Boolean") {
   if(BooleanValue()) str="True";
   else str="False";
   return true;
 }
 if(mFaudesType=="Integer") {
   str= QString("%1").arg(IntegerValue());
   return true;
 }
 if(mFaudesType=="String") {
   str=StringValue();
   return false;
 }
 str="";
 return false;
}


// optional name with value
QString WspVariable::LongName(void) const {
  QString strval;
  if(ElementaryToString(strval)) 
    return QString("%1    [=%2]").arg(mName).arg(strval);
  return mName;
}


// update Visual rep (after setting the value)
void WspVariable::UpdateVisual() { 
  FD_DI("WspVariable::UpdateVisual()");
  if(mVisual && mFaudesObject) {
    FD_DI("WspVariable::UpdateVisual(): set in viomodel");
    pFaudesObject=mFaudesObject;
    mVioModel->InsertFaudesObject(mFaudesObject); 
    mFaudesObject=NULL;
    FD_DI("WspVariable::UpdateVisual(): in vio " << mVioModel->FaudesObject() << " ref " << pFaudesObject);
  }
  // fix dynamic tool tip
  ToolTip();
  // update signal
  Modified(true);
}

// reimplement standarditem data access to mName
QVariant WspVariable::data(int role) const {
  // fix elemtary display
  if((role==Qt::DisplayRole) || (role==Qt::EditRole)) return LongName();
  // pass on to base
  return WspItem::data(role);
}


// reimplement standarditem data access to mName
void WspVariable::setData(const QVariant& value, int role) {
  // if its not our roles, let base handle (e.g. tool tips, role 3)
  if((role!=Qt::EditRole) && (role!=Qt::DisplayRole)) return WspItem::setData(value,role);
  FD_DI("WspVariable::setData(): val  " << value.toString() << " role " << role); 
  // seperate string in name and value for elementary type
  QString newname= value.toString();
  QString newval;
  newname=newname.simplified();
  int sep = newname.indexOf(" ");
  if(sep>0) {
    newval=newname.mid(sep+1).simplified();
    newname=newname.left(sep);
    if(newval.left(2) != "[=") newval="";
    if(!newval.isEmpty()) if(newval.at(newval.length()-1)!=']') newval="";
    if(!newval.isEmpty()) newval=newval.mid(2,newval.length()-3);
  }
  FD_DI("WspVariable::setData(): split arg " << newname << " " << newval); 
  // if there is no new value, let base handle anyway (e.g. non-elementary, name change)
  if(newval.isEmpty()) return WspItem::setData(value,role);
  // try to handle the  value
  ElementaryFromString(newval);
  // base cares about name
  WspItem::setData(newname,role);
}




// get ref to visual model
const VioModel* WspVariable::VisualModel(void) const {
  return mVioModel;
}

// Modified: query changes (dont emit signal)
bool WspVariable::Modified(void) const { 
  return mModified;
};


// Modified: intercept to update elementary values
void WspVariable::ChildModified(bool changed) { 
  // call base
  WspItem::ChildModified(changed);
  // ignore netagtives
  if(!changed) return;
  // update tooltip for elementary
  ToolTip();
};


// Modified: record changes and emit signal
void WspVariable::Modified(bool ch) { 
  // clear childs
  if(mModified && !ch) {
    if(mVioModel) mVioModel->Modified(false);
  }
  // let base manage
  WspItem::Modified(ch);
}

// Overload wsp item functins: widgets
QWidget* WspVariable::NewMainWidget(void) {
  if(!mVioModel) return 0;
  VioView* mview=  mVioModel->NewView();
  if(!mview) return 0;
  mview->Model(mVioModel);
  return mview;
}

// Overload wsp item functins: widgets
QWidget* WspVariable::NewSateliteWidget(void) {
  return 0;
}

// Overload wsp item functins: widgets
QWidget* WspVariable::NewPropertyWidget(void) {
  WspVariableProperties* pwidget = new WspVariableProperties(Pool(),0);
  return pwidget;
}


// better context menu
QMenu* WspVariable::NewContextMenu(void) {
  FD_DS("WspVariable::NewContextMenu()");

  // set up menu
  QMenu* menu= new QMenu();
  QAction *action;
  menu->setTitle(Name());
 
  // add button: show
  action= menu->addAction("Show \"" + Name() + "\"");
  action->setEnabled(Visual());
  QObject::connect(action,SIGNAL(triggered(void)),this,SLOT(ShowItem(void)));
 
  // fix elementary types
  if(ElementaryType()) {
    action->setText(LongName());
    QObject::disconnect(action,SIGNAL(triggered(void)),this,SLOT(ShowItem(void)));
  }

  // add button: statistics
  action= menu->addAction("Show Statistics");
  action->setEnabled(!ElementaryType());
  QObject::connect(action,SIGNAL(triggered(void)),this,SLOT(ShowStatistics(void)));
  menu->addSeparator();

  // add button: help
  action= menu->addAction(QString("Help on %1").arg(FaudesType()));
  action->setEnabled(true);
  QObject::connect(action,SIGNAL(triggered(void)),this,SLOT(Help(void)));
  menu->addSeparator();

  // load file
  action = menu->addAction("Load from File ...");
  action->setEnabled(Visual() && FileLinked());
  connect(action,SIGNAL(triggered(void)),this,SLOT(UserLoad(void)));

  // save file
  action = menu->addAction("Save to File ...");
  action->setEnabled(Visual() && FileLinked());
  connect(action,SIGNAL(triggered(void)),this,SLOT(UserSave(void))); 

  // import plain faudes
  action = menu->addAction("Import FAUDES File ...");
  action->setEnabled(Visual());
  connect(action,SIGNAL(triggered(void)),this,SLOT(UserImport(void)));

  // export plain faudes
  action = menu->addAction("Export FAUDES File ...");
  action->setEnabled(Visual());
  connect(action,SIGNAL(triggered(void)),this,SLOT(UserExport(void)));
  menu->addSeparator();

  // construct and add item property widget
  WspVariableProperties* propwidget = qobject_cast<WspVariableProperties*>(NewPropertyWidget());
  propwidget->Connect(Name()); // lock, dont follow pool or selcetion
  QWidgetAction* propaction = new QWidgetAction(menu);
  propaction->setDefaultWidget(propwidget);
  menu->addAction(propaction);

  // done
  return menu;
}


// set/get variable source
WspVariable::VariableSource WspVariable::Source(void) const {return mSource;};
void WspVariable::Source(VariableSource source) {
  FD_DS("WspVariable::Source(" << source << ") : " << mName);
  mSource=source;
  if(mSource==Constant) Persistent(true);
};

// indicate that this variable is valid
bool WspVariable::Valid(void) const {return mValid;};
void WspVariable::Valid(bool valid) {mValid=valid;};

// indicate that this variable belongs to the plant 
bool WspVariable::Plant(void) const {return mPlant;};
void WspVariable::Plant(bool plant) {
  mPlant=plant;
  Modified(true);
  emit NotifyProperties();
};

// indicate that this variable belongs to the supervisor 
bool WspVariable::Supervisor(void) const {return mSupervisor;};
void WspVariable::Supervisor(bool sup) {
  mSupervisor=sup;
  Modified(true);
  emit NotifyProperties();
};



// user interaction (move to wsp item or wspview)
int WspVariable::UserImport(void) {
  if(!mVisual) return 0;
  FD_DS("WspVariable::UserImport()");
  int err=0;
  try {
    // have dialog
    QFileDialog* fdiag = new QFileDialog();
    QSettings settings;
    fdiag->restoreState(settings.value("importFileDialog").toByteArray());
    QString filter = 
      "FAUDES Generators (*.gen);;"
      "FAUDES Alphabets (*.alph);;"
      "FAUDES XML format (*.ftx);;"
      "Text Files (*.txt);;"
      "Any File (*.*)";
    fdiag->setNameFilter(filter);
    fdiag->setFileMode(QFileDialog::ExistingFile);
    fdiag->setAcceptMode(QFileDialog::AcceptOpen);
    fdiag->setDefaultSuffix("gen");
    fdiag->setWindowTitle(QString("Import Faudes File as %1").arg(mFaudesType));
    // run dialog
    QString fileName="";
    if(fdiag->exec()) 
      if(fdiag->selectedFiles().size()==1) 
        fileName=fdiag->selectedFiles().at(0);
    // maintain settings
    settings.setValue("importFileDialog", fdiag->saveState());
    // do the import
    mVioModel->ImportFaudesFile(fileName);
  } catch(faudes::Exception& exception) {
    err=+1;
  } 
  // set validity
  if(Source()==ReadFile && err==0) Valid(true);
  Modified(false);
  return err;
}


// user interaction (move to wsp item or wspview)
int WspVariable::UserExport(void) {
  if(!mVisual) return 0;
  FD_DS("WspVariable::UserExport()");
  int err=0;
  try {
    // have dialog
    QFileDialog* fdiag = new QFileDialog();
    QSettings settings;
    fdiag->restoreState(settings.value("importFileDialog").toByteArray());
    QString filter =
      "Faudes Generators (*.gen);;"
      "Faudes Alphabets (*.alph);;"
      "Faudes XML format (*.ftx);;"
      "Text Files (*.txt);;"
      "Any File (*.*)";
    fdiag->setNameFilter(filter);
    fdiag->setFileMode(QFileDialog::AnyFile);
    fdiag->setAcceptMode(QFileDialog::AcceptSave);
    fdiag->setDefaultSuffix("gen");
    fdiag->setWindowTitle(QString("Import Faudes File as %1").arg(mFaudesType));
    // run dialog
    QString fileName="";
    if(fdiag->exec()) 
      if(fdiag->selectedFiles().size()==1) 
        fileName=fdiag->selectedFiles().at(0);
    // maintain settings
    settings.setValue("importFileDialog", fdiag->saveState());
    // do the export
    mVioModel->ExportFaudesFile(fileName);
  } catch(faudes::Exception& exception) {
    err=+1;
  } 
  return err;
}



// import faudes file
int WspVariable::Import(const QString& filename) {
  int err=0;
  try {
    if(mVisual) {
      mVioModel->ImportFaudesFile(filename);
    } else {
      mFaudesObject->Read(VioStyle::LfnFromQStr(filename));
    }
  } catch(faudes::Exception& exception) {
    err=1;
  } 
  // set validity
  if(Source()==ReadFile && err==0) Valid(true);
  // fix dyn tooltip
  ToolTip();
  // track modifications
  Modified(false);
  return err;
}

// export faudes file
int WspVariable::Export(const QString& filename) const {
  int err=0;
  try {
    if(mVisual) {
      mVioModel->ExportFaudesFile(filename);
    } else {
      mFaudesObject->Write(VioStyle::LfnFromQStr(filename));
    }
  } catch(faudes::Exception& exception) {
    err=1;
  } 
  // done
  return err;
}


// token io, write
void WspVariable::DoWrite(faudes::TokenWriter& rTw,  const QString& rLabel) const {
  // default
  QString label(rLabel);
  if(label=="") label="Variable";
  // start writing
  rTw.WriteBegin(VioStyle::StrFromQStr(label));
  rTw << VioStyle::StrFromQStr(mName);
  rTw << VioStyle::StrFromQStr(mFaudesType);
  // write properties
  if(mVisual)
    rTw.WriteOption("Visual");
  if(mShown)
    rTw.WriteOption("Shown");
  if(mPlant)
    rTw.WriteOption("Plant");
  if(mSupervisor)
    rTw.WriteOption("Supervisor");
  // write to external file 
  if(FileLinked()) {
    // figure file name relative
    QString vfilename = QFileInfo(VioStyle::QStrFromStr(rTw.FileName())).absoluteFilePath(); 
    QString vdirname  = QFileInfo(VioStyle::QStrFromStr(rTw.FileName())).absolutePath(); 
    QString rfilename = RelativeFilename(vdirname);
    // write file ref
    rTw.WriteBegin("File");
    rTw << VioStyle::StrFromQStr(rfilename);
    rTw.WriteEnd("File");
    // write value file
    ExternalWrite(QFileInfo(Filename()).absoluteFilePath());
  }
  // write value section
  if(Persistent()) {
    rTw.WriteBegin("Value");
    if(mVioModel) { 
      mVioModel->Write(rTw); 
    } else {
      if(mFaudesObject) 
         mFaudesObject->Write(rTw);
    }
    rTw.WriteEnd("Value");
  }
  // done
  rTw.WriteEnd(VioStyle::StrFromQStr(label));
}

// token io, read
void WspVariable::DoRead(faudes::TokenReader& rTr, const QString& rLabel) {
  FD_DI("WspVariable::DoRead()");
  // default
  QString label(rLabel);
  if(label=="") label="Variable";
  // clear
  setProperty("Variable",mName);
  mFaudesType="";
  mFilename="";
  mPlant=false;
  mSupervisor=false;
  mVisual=false;
  mShown=false;
  mPersistent=false;
  Clear();
  // read
  rTr.ReadBegin(VioStyle::StrFromQStr(label));
  // var name/type
  QString tname = VioStyle::QStrFromStr(rTr.ReadString());
  QString ttype = VioStyle::QStrFromStr(rTr.ReadString());
  // try to set 
  FD_DI("WspVariable::DoRead(): set name and type");
  Name(tname);
  FaudesType(ttype);
  // check and report
#ifdef FAUDES_DEBUG_ITEMS
  if(FaudesType()!=ttype)
    FD_DI("WspVariable::Read(): type mismatch" << ttype);
  if(Name()!=tname)
    FD_DI("WspVariable::Read(): name mismatch" << tname);
#endif
  // get other content
  FD_DI("WspVariable::DoRead(): read tokens");
  while(!rTr.Eos("Variable")) {
    faudes::Token token;
    rTr.Peek(token);
    // options
    if(token.Type()==faudes::Token::Option)
    if(token.StringValue()=="Plant") 
      mPlant=true;    
    if(token.Type()==faudes::Token::Option)
    if(token.StringValue()=="Supervisor") 
      mSupervisor=true;
    if(token.Type()==faudes::Token::Option)
    if(token.StringValue()=="Visual") {
      mVisual=true;
      Allocate();
    }
    if(token.Type()==faudes::Token::Option)
    if(token.StringValue()=="Shown") 
      mShown=true;
    // done with options
    if(token.Type()==faudes::Token::Option) {
      rTr.Get(token);
      continue;
    }
    // file section
    if(token.Type()==faudes::Token::Begin && token.StringValue()=="File") {
      rTr.ReadBegin("File");
      QString filename = VioStyle::QStrFromStr(rTr.ReadString());
      rTr.ReadEnd("File");
      // convert to absolute via basedir
      QString vdirname  = QFileInfo(VioStyle::QStrFromStr(rTr.FileName())).absolutePath(); 
      filename = vdirname + QDir::separator() + filename;
      Filename(filename);
      FD_DS("WspVariable::Read(rTr): absolute file:" << mFilename);
      // read value file
      // ... leave this to LoadAllVariables() explicit call
      /* 
      try {
        ExternalRead(mFilename);
      } catch(faudes::Exception& exception) {
        // TODO: report
      } 
      */
      continue;
    }
    // value section
    if(token.Type()==faudes::Token::Begin && token.StringValue()=="Value") {
      rTr.ReadBegin("Value");
      if(mVioModel) {
         mVioModel->Read(rTr); 
      } else if(mFaudesObject) {
        mFaudesObject->Read(rTr);
      }
      rTr.ReadEnd("Value");
      mPersistent=true;
      continue;
    }
    // ignore unkown tokens
  }
  rTr.ReadEnd(VioStyle::StrFromQStr(label));
  FD_DI("WspVariable::DoRead(): tokens read - ok");
  // fix dynamic tool tip
  ToolTip();
  // update property widgets
  emit NotifyProperties();
}

// data write
void WspVariable::DoExternalWrite(const QString& rFilename, const QString& rLabel) const {
  faudes::TokenWriter  tw(VioStyle::LfnFromQStr(rFilename));
  (void) rLabel;
  if(mVioModel) { 
    mVioModel->Write(tw); 
  } else {
    if(mFaudesObject) 
       mFaudesObject->Write(tw);
  }
}

// data read
void WspVariable::DoExternalRead(const QString& rFilename, const QString& rLabel) {
  (void) rLabel;
  faudes::TokenReader  tr(VioStyle::LfnFromQStr(rFilename));
  if(mVioModel) {
    FD_DI("WspVariable::DoExternalRead(): file " << tr.FileName());
    FD_DI("WspVariable::DoExternalRead(): to " << Name() << " at " << mVioModel->FaudesObject());
    mVioModel->Read(tr); 
    FD_DI("WspVariable::DoExternalRead(): (vio) done");
  } else if(mFaudesObject) {
    mFaudesObject->Read(tr);
  }
  // fix dynamic tool tip
  ToolTip();
}

// view fcatory
WspItemView* WspVariable::NewView(void) {
  return new WspVariableView();
}


// highlite requests
void WspVariable::Highlite(const VioElement& elem, bool on) {
  if(mVioModel) {
    FD_DI("WspVariable::Highlite(): " << Name() << " " << elem.Str());
     mVioModel->Highlite(elem,on);
    FD_DI("WspVariable::Highlite(): ok");
  }
}

// highlite requests
void WspVariable::HighliteClear(void) {
  if(mVioModel) {
    FD_DI("WspVariable::HighliteClear(): " << Name());
    mVioModel->HighliteClear();
  }
}

// pass on user interaction
void WspVariable::MouseClick(const VioElement& elem) {
  FD_DI("WspVariable::MouseClick(): " << Name());
  emit MouseClick(mName,elem);
}

// pass on user interaction
void WspVariable::MouseDoubleClick(const VioElement& elem) {
  FD_DI("WspVariable::MouseDoubleClick(): " << Name());
  emit MouseDoubleClick(mName,elem);
}

// immediate user intercation
void WspVariable::ShowStatistics(void) {
  FD_DI("WspVariable::ShowStatistics(): " << Name());
  // try to figure location
  QWidget* swidget=0;
  QAction* saction = qobject_cast<QAction*>(sender());
  if(saction) swidget = qobject_cast<QWidget*>(saction->parent());
  if(swidget) {
    ShowStatistics(swidget);
  }
  // fallback (? todo)
  ShowStatistics(0);
}

// immediate user intercation
void WspVariable::ShowStatistics(QWidget* widget) {
  FD_DI("WspVariable::ShowStatistics(): " << Name());
  //enforce update
  ToolTip();
  // doit
  DesShowTip::Static.Show(this,widget);
}

// dynamic tooltip
const QString& WspVariable::ToolTip(void) {
  FD_DI("WspVariable::ToolTip()");
  // std
  QString text= "<p>" + mFaudesType + ": "+ VioTypeRegistry::DocumentationPlain(mFaudesType) + "</p>";
  // plus stats
  if(pFaudesObject) text += "<p>" + 
		      Qt::convertFromPlainText(VioStyle::QStrFromStr(pFaudesObject->ToSText()).replace("%"," "),Qt::WhiteSpaceNormal) + "</p>";
  // fix elementary
  if(mFaudesType=="Boolean") {
    if(BooleanValue()) text=QString("Boolean [=True]");
     else text=QString("Boolean [=False]");
  }
  if(mFaudesType=="Integer") {
    text=QString("Integer [=%1]").arg(IntegerValue());
  }
  if(mFaudesType=="String") {
    text=QString("String [=%1]").arg(StringValue());
  }
  // set
  ToolTip(text);
  // done
  return WspItem::ToolTip();
}
// dynamic tooltip
void WspVariable::ToolTip(const QString& rText) {
  WspItem::ToolTip(rText);
}

/***************************************************************
****************************************************************
****************************************************************

implementation: wsp variable view

****************************************************************
****************************************************************
****************************************************************/

// construct
WspVariableView::WspVariableView(WspPool* pool, QWidget* parent) :
  WspItemView(pool,parent),
  pVariable(0)
{
  FD_DI("WspVariableView::WspVariableView()");
  mSeparator1 = new QAction(this);
  mSeparator1->setSeparator(true);
  mSeparator2 = new QAction(this);
  mSeparator2->setSeparator(true);
  mLoadAct = new QAction(this);
  mSaveAct = new QAction(this);
}

// destruct
WspVariableView::~WspVariableView() {
  FD_DI("WspVariableView::~WspVariableView()");
}

// get model
const WspVariable* WspVariableView::Model(void) const {
  return pVariable;
};

// set model: filter out elementary types
void WspVariableView::Model(WspItem* item) {
  WspVariable* var = qobject_cast<WspVariable*>(item);
  // baol out on simple types
  if(var) if(var->ElementaryType()) return;
  // report
  FD_DI("WspVariableView::Model(): set");
  // call base
  WspItemView::Model(var);
  pVariable = qobject_cast<WspVariable*>(pItem);
  // my disconnect
  disconnect(mLoadAct);
  disconnect(mSaveAct);
  // my connect
  connect(mLoadAct,SIGNAL(triggered(void)),pVariable,SLOT(UserLoad(void)));
  connect(mSaveAct,SIGNAL(triggered(void)),pVariable,SLOT(UserSave(void)));
};


// my edit actions
QList<QAction*> WspVariableView::EditActions() {
  QList<QAction*> actions;
  const VioModel* vmodel=  Model()->VisualModel();
  const VioView* vview=  qobject_cast<VioView*>(mContent);
  if(!vmodel || !vview) return actions;
  actions.append(vview->UndoAction());
  actions.append(vview->RedoAction());
  actions.append(mSeparator1);
  actions.append(vview->CutAction());
  actions.append(vview->CopyAction());
  actions.append(vview->PasteAction());
  const QList<QAction*>& extra = vview->EditActions();
  if(extra.size()>0) {
    actions.append(mSeparator2);
    for(int i=0; i<extra.size(); ++i) 
      actions.append(extra.at(i));
  }
  FD_DI("WspVariable::EditActions() : #" << actions.size());
  return actions;
}

// my view actions
QList<QAction*> WspVariableView::ViewActions() {
  QList<QAction*> actions;
  const VioModel* vmodel=  Model()->VisualModel();
  const VioView* vview=  qobject_cast<VioView*>(mContent);
  if(!vmodel || !vview) return actions;
  const QList<QAction*>& extra = vview->ViewActions();
  for(int i=0; i<extra.size(); ++i) 
    actions.append(extra.at(i));
  FD_DI("WspVariable::ViewActions() : #" << actions.size());
  return actions;
}

// my file actions
QList<QAction*> WspVariableView::FileActions() {
  QList<QAction*> actions;
  const VioModel* vmodel=  Model()->VisualModel();
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
  FD_DI("WspVariable::FileActions() : #" << actions.size());
  return actions;
}


/* 
 ******************************************
 ******************************************
 ******************************************

 variable properties widget

 ******************************************
 ******************************************
 ******************************************
 */


WspVariableProperties::WspVariableProperties(WspVariablePool* varpool, QWidget *parent) 
  : QWidget(parent) 
{
  FD_DI("WspVariableProperties::WspVariableProperties()");

  // keep ref to varpool an variable
  pVarPool = varpool;
  mVariable="";
  mLock=false;

  // overall layout
  QVBoxLayout* vbox0= new QVBoxLayout(this);
  vbox0->setContentsMargins(2,2,2,2);
  vbox0->setSpacing(2);
  vbox0->addStretch(1);

  // edit name
  mEditName=new QLineEdit(this);  
  mEditName->setText("< no item >");
  mEditName->setReadOnly(true);
  mEditName->setValidator(new VioSymbolValidator(mEditName));

  // edit label
  QLabel* edla = new QLabel(this);
  edla->setText("Name:");
  edla->setBuddy(mEditName);

  // edit hbox
  QHBoxLayout* hbox1= new QHBoxLayout();
  hbox1->addWidget(edla);
  hbox1->addStretch(10);
  hbox1->addWidget(mEditName);
  vbox0->addLayout(hbox1);
  vbox0->addSpacing(10);

  // combobox: type
  mComboType = new QComboBox();
  mComboType->addItems(VioTypeRegistry::UserTypes());

  // combobox: add elementary types
  mComboType->addItem("Boolean"); 
  mComboType->addItem("Integer");
  mComboType->addItem("String");

  // combobox: sort
  mComboType->model()->sort(0);

  // type label
  QLabel* tyla = new QLabel(this);
  tyla->setText("Type:");
  tyla->setBuddy(mComboType);

  // type hbox
  QHBoxLayout* hbox2= new QHBoxLayout();
  hbox2->addWidget(tyla);
  hbox2->addStretch(10);
  hbox2->addWidget(mComboType);
  vbox0->addLayout(hbox2);

  // checkboxes: persistent
  mCheckPersistent = new VioCheckBox();
  mCheckPersistent->setText("Persistent");
  mCheckPersistent->setCheckable(true);
  vbox0->addWidget(mCheckPersistent);

  // checkboxes: link to file
  mCheckFile = new VioCheckBox();
  mCheckFile->setText("External File");
  mCheckFile->setCheckable(true);
  vbox0->addWidget(mCheckFile);

  // checkboxes: visual
  mCheckVisual = new VioCheckBox();
  mCheckVisual->setText("Visual Representation");
  mCheckVisual->setCheckable(true);
  vbox0->addWidget(mCheckVisual);

  // checkboxes: plant
  mCheckPlant = new VioCheckBox();
  mCheckPlant->setText("Plant Model");
  mCheckPlant->setCheckable(true);
  vbox0->addWidget(mCheckPlant);

  // checkboxes: supervisor
  mCheckSuper = new VioCheckBox();
  mCheckSuper->setText("Supervisor Model");
  mCheckSuper->setCheckable(true);
  vbox0->addWidget(mCheckSuper);

  // update once, then and follow pool selection
  Update();
  QObject::connect(pVarPool,SIGNAL(NotifySelection()),this,SLOT(Update(void)));

  // connect checkboxes (we writing to the variable)
  QObject::connect(mCheckFile,SIGNAL(clicked(bool)),this,SLOT(Commit()));
  QObject::connect(mCheckPersistent,SIGNAL(clicked(bool)),this,SLOT(Commit()));
  QObject::connect(mCheckVisual,SIGNAL(clicked(bool)),this,SLOT(Commit()));
  QObject::connect(mCheckSuper,SIGNAL(clicked(bool)),this,SLOT(Commit()));
  QObject::connect(mCheckPlant,SIGNAL(clicked(bool)),this,SLOT(Commit()));

  // connect edits (we writing to the variable, should use commit)
  QObject::connect(mEditName,SIGNAL(editingFinished()),this,SLOT(ReName()));
  QObject::connect(mComboType,SIGNAL(activated(int)),this,SLOT(ReType(void)));

  // connect variable (other writing to the variable, incl delete, incl myself committing)
  QObject::connect(pVarPool,SIGNAL(NotifyProperties(void)),this,SLOT(Update(void)),
    Qt::QueuedConnection);

};

// connect 
void WspVariableProperties::Connect(QString variable) {
  mVariable=variable;
  mLock = (mVariable!="");
  Update();
}

// commit changes (boxe only)
void WspVariableProperties::Commit(void) {
  FD_DI("WspVariableProperties::Commit(): A");
  // single variable, active or locked
  if(!mLock) mVariable =  pVarPool->ActiveItem();
  WspVariable* var = pVarPool->At(mVariable);
  if(var) {
    FD_DI("WspVariableProperties::Commit(): B"<< var->Name());  
    if(sender()==mCheckPersistent) 
       var->UserPersistent(mCheckPersistent->isChecked());
    if(sender()==mCheckVisual) 
      var->Visual(mCheckVisual->isChecked());
    if(sender()==mCheckSuper) 
      var->Supervisor(mCheckSuper->isChecked());
    if(sender()==mCheckPlant)   
      var->Plant(mCheckPlant->isChecked());
    if(sender()==mCheckFile) 
       var->UserFile(mCheckFile->isChecked());
    return;
  }
  // lock not found
  if(mLock) return;
  // figure selection
  QStringList selitems=pVarPool->SelectedItems();
  foreach(QString item, selitems) {
    WspVariable* var = pVarPool->At(item);
    if(!var) continue;   
    if(sender()==mCheckPersistent) 
    if(mCheckPersistent->checkState() != Qt::PartiallyChecked)
       var->UserPersistent(mCheckPersistent->isChecked());
    if(sender()==mCheckFile) 
    if(mCheckFile->checkState() != Qt::PartiallyChecked)
       var->UserFile(mCheckFile->isChecked());
    if(sender()==mCheckVisual) 
    if(mCheckVisual->checkState() != Qt::PartiallyChecked)
      var->Visual(mCheckVisual->isChecked());
    if(sender()==mCheckPlant)   
    if(mCheckPlant->checkState() != Qt::PartiallyChecked)
        var->Plant(mCheckPlant->isChecked());
    if(sender()==mCheckSuper) 
    if(mCheckSuper->checkState() != Qt::PartiallyChecked)
      var->Supervisor(mCheckSuper->isChecked());
  }
  // enforce update 
  // (trick: in almost all cases update is trigglered automatically ..
  // .. however: in selcetion-edit with rejecting participants we need to force)
  Update();
} 

// change of name
void WspVariableProperties::ReName(void) {
  // bail out on no sender
  if(!sender()) return;
  // figure name
  QString newname=mEditName->text();
  // bail out on nop
  if(mVariable==newname) return;
  FD_DI("WspVariableProperties::ReName("<< mVariable  << ", " << newname << ")");
  // ask for rename
  if(pVarPool->ReName(mVariable,newname)) 
    pVarPool->ActiveItem(newname);
} 


// change of type
void WspVariableProperties::ReType(void) {
  FD_DI("WspVariableProperties::ReType(): for "<< mVariable);
  // bail out on no sender/no var
  if(!sender()) return;
  WspVariable* var = pVarPool->At(mVariable);
  if(!var) return;
  // figure type
  QString newtype = mComboType->currentText();
  // bail out on nop
  if(var->FaudesType()==newtype) return;
  FD_DI("WspVariableProperties::ReType("<< mVariable  << ", " << newtype << ")");
  pVarPool->ReType(mVariable,newtype);
  FD_DI("WspVariableProperties::ReType("<< mVariable  << ", " << var->FaudesType() << "): done");
} 


// update from variable
void WspVariableProperties::Update(void) {
  // get current active (if not locked)
  if(!mLock) mVariable =  pVarPool->ActiveItem();
  // single select
  WspVariable* var = pVarPool->At(mVariable);
  if(var) {
    FD_DI("WspVariableProperties::Update(): for active var "<< mVariable);
    // get name
    mEditName->setText(var->Name());
    mEditName->setReadOnly(false);
    mEditName->setEnabled(true);
    // get type
    mComboType->setCurrentIndex(mComboType->findText(var->FaudesType()));
    mComboType->setEnabled(true);
    // get checkboxes
    mCheckPersistent->setChecked(var->Persistent());
    mCheckFile->setChecked(var->FileLinked());
    mCheckVisual->setChecked(var->Visual());
    mCheckSuper->setChecked(var->Supervisor());
    mCheckPlant->setChecked(var->Plant());
    // enable (incl adjust for elementary types)
    mCheckPersistent->setEnabled(!var->ElementaryType());
    mCheckFile->setEnabled(!var->ElementaryType());
    mCheckVisual->setEnabled(!var->ElementaryType());
    mCheckSuper->setEnabled(true);
    mCheckPlant->setEnabled(true);
    // disable file linkage when base dir is unknown
    mCheckFile->setEnabled(pVarPool->BaseDir()!="");
    // done for single variable
    return;
  } 
  // set invalid/disabled
  mEditName->setText("< no item >");
  mEditName->setReadOnly(true);
  mEditName->setEnabled(false);
  mComboType->setEnabled(false);
  mCheckPersistent->ResetCheckState();
  mCheckFile->ResetCheckState();
  mCheckVisual->ResetCheckState();
  mCheckSuper->ResetCheckState();
  mCheckPlant->ResetCheckState();
  // no selectio  when locked
  if(mLock) return;
  // merge selection
  QStringList selitems=pVarPool->SelectedItems();
  foreach(QString item, selitems) {
    WspVariable* var = pVarPool->At(item);
    if(!var) continue;   
    mEditName->setText("< selection >");
    mCheckPersistent->MergeCheckState(var->Persistent());
    mCheckFile->MergeCheckState(var->FileLinked());
    mCheckVisual->MergeCheckState(var->Visual());
    mCheckSuper->MergeCheckState(var->Supervisor());
    mCheckPlant->MergeCheckState(var->Plant());
  }
  mCheckFile->setEnabled(false); // dont allow to set filelink for selection
} 





/*
 ************************************************
 ************************************************
 ************************************************
 ************************************************

 helper class: external save dialog for variable pool

 ************************************************
 ************************************************
 ************************************************
 ************************************************
 */


// construct
WspExternalSaveDialog::WspExternalSaveDialog(WspVariablePool* pool,QWidget* parent) : 
  QDialog(parent)
{
  FD_DI("WspExternalSaveDialog::WspExternalSaveDialog()");
  setWindowModality(Qt::ApplicationModal);
  pPool=pool;
  QVBoxLayout* vbox = new QVBoxLayout(this);

  // unsaved/unlinked external files: text
  QLabel* ltxt = new QLabel(
    "<p>Tick the below variables to save them in the proposed external files.</p>");
  ltxt->setWordWrap(true);
  // extra text
  mTbox = new QLabel();
  mTbox->setWordWrap(true);
  mTbox->hide();
  // unsaved/unlinked external files: files
  mTodoVariables = new QListWidget();
  for(int i=0; i< pool->Size(); i++) {
    WspVariable* var=pool->At(i);
    if(!var) continue;
    if(var->FileLinked() && !var->Modified()) continue;
    if(var->Persistent()) continue;
    QListWidgetItem* vitem = new QListWidgetItem();
    QString rfname=var->RelativeFilename();
    if(rfname=="") rfname = QString("%1.vio").arg(var->Name());
    vitem->setData(Qt::DisplayRole,
      QString("%1 \t(file \"%2\")").arg(var->Name()).arg(rfname));
    vitem->setData(Qt::UserRole,var->Name());
    vitem->setCheckState(Qt::Unchecked);
    if(var->FileLinked() && var->Modified()) 
      vitem->setCheckState(Qt::Checked);
    vitem->setFlags(Qt::ItemIsUserCheckable | Qt::ItemIsEnabled);
    mTodoVariables->addItem(vitem);
  }
  // add to layout
  vbox->addWidget(mTbox);
  vbox->addSpacing(5);
  vbox->addWidget(ltxt);
  vbox->addSpacing(5);
  vbox->addWidget(mTodoVariables);
  // bottom line
  mBbox = new QDialogButtonBox(
      QDialogButtonBox::Cancel | QDialogButtonBox::Save);
  connect(mBbox->button(QDialogButtonBox::Save), SIGNAL(clicked()), 
    this, SLOT(Save()));
  connect(mBbox->button(QDialogButtonBox::Cancel), SIGNAL(clicked()), 
    this, SLOT(Cancel()));
  mBbox->button(QDialogButtonBox::Save)->setDefault(true);
  // add to layout
  vbox->addSpacing(5);
  vbox->addWidget(mBbox);
  FD_DI("WspExternalSaveDialog::WspExternalSaveDialog(): done");
}

// destruct
WspExternalSaveDialog::~WspExternalSaveDialog() {}

// option discard
void WspExternalSaveDialog::setHasDiscard(bool show) {
  FD_DI("WspExternalSaveDialog::setHasDiscard()");
  if(show & !mBbox->button(QDialogButtonBox::Discard)) {
    mBbox->addButton(QDialogButtonBox::Discard);
    connect(mBbox->button(QDialogButtonBox::Discard), SIGNAL(clicked()), 
      this, SLOT(Discard()));
    mBbox->button(QDialogButtonBox::Discard)->setAutoDefault(false);
    mBbox->button(QDialogButtonBox::Cancel)->setAutoDefault(false);
    mBbox->button(QDialogButtonBox::Save)->setDefault(true);
  }
  FD_DI("WspExternalSaveDialog::setHasDiscard(): done");
}  

// option text
void WspExternalSaveDialog::setText(const QString& text) {
  FD_DI("WspExternalSaveDialog::setText()");
  mTbox->setText(text);
  mTbox->setVisible(text!="");
  FD_DI("WspExternalSaveDialog::setText(): done");
}  

// cancel
void WspExternalSaveDialog::Cancel(void) {
  FD_DI("WspExternalSaveDialog::Cancel()");
  reject();
}

// discard
void WspExternalSaveDialog::Discard(void) {
  FD_DI("WspExternalSaveDialog::Discard()");
  for(int i=0; i<mTodoVariables->count(); i++) {
    QListWidgetItem* witem = mTodoVariables->item(i);
    if(witem->data(Qt::UserRole).typeId()!=QMetaType::QString) continue;
    QString varname = witem->data(Qt::UserRole).toString();
    WspItem* item = pPool->At(varname);
    if(!item) continue;
    item->Modified(false);
  }
  accept();
}

// save
void WspExternalSaveDialog::Save(void) {
  FD_DI("WspExternalSaveDialog::Save()");
  // busy cursor
  QApplication::setOverrideCursor(Qt::WaitCursor);
  // link unlinked
  for(int i=0; i<mTodoVariables->count(); i++) {
    QListWidgetItem* witem = mTodoVariables->item(i);
    if(witem->checkState()!=Qt::Checked) continue;
    if(witem->data(Qt::UserRole).typeId()!=QMetaType::QString) continue;
    QString varname = witem->data(Qt::UserRole).toString();
    if(pPool->At(varname)->FileLinked()) continue;
    FD_DI("WspExternalSaveDialog::Save(): link " << varname);
    pPool->At(varname)->Filename(pPool->BaseDir()+"/"+varname+".vio"); // TODO: name.gen?
  } 
  // save ticked
  bool err=false;
  for(int i=0; i<mTodoVariables->count(); i++) {
    QListWidgetItem* witem = mTodoVariables->item(i);
    if(witem->checkState()!=Qt::Checked) continue;
    if(witem->data(Qt::UserRole).typeId()!=QMetaType::QString) continue;
    QString varname = witem->data(Qt::UserRole).toString();
    FD_DI("WspExternalSaveDialog::Save(): save " << varname);
    WspVariable* var = pPool->At(varname);
    if(!var) continue;
    err |= (var->Save() != 0);
  }
  // get cursor back 
  QApplication::restoreOverrideCursor();
  // done
  if(!err) accept();
  else reject();
}


// exec
int WspExternalSaveDialog::exec(void) {
  FD_DI("WspExternalSaveDialog::exec()");
  if(mTodoVariables->count()==0) return QDialog::Accepted; // all fine anyway
  // turn to model
  return QDialog::exec();
} 
  




/***************************************************************
****************************************************************
****************************************************************

implementation: wsp variable pool

****************************************************************
****************************************************************
****************************************************************/


// construct
WspVariablePool::WspVariablePool(QObject* parent) : 
  WspPool(WspItem::ITVariable,parent) {
  // configure
  mHeader="Variables";
  setHorizontalHeaderLabels(QStringList() << mHeader);
  mTokenSection=QString("VariablePool");
  // connect
  connect(this,SIGNAL(NotifyProperties(void)),this,SLOT(LuaInstall(void))); 
  // doit once
  LuaInstall();
}

// destruct
WspVariablePool::~WspVariablePool(void) {
}

// factory
WspVariable* WspVariablePool::NewItem(void) {
  return new WspVariable();
}

// test type 
WspItem* WspVariablePool::TestItem(WspItem* item) {
  return qobject_cast<WspVariable*>(item);
}

// overload
int WspVariablePool::DoInsert(int position, WspItem* item) {
  // type check
  WspVariable* var = qobject_cast<WspVariable*>(item);
  if(!var) return -1;
  // call base
  int pos = WspPool::DoInsert(position,item);
  if(pos<0) return pos;
  // have my connections (todo: aboid doublets)
  connect(var,SIGNAL(MouseDoubleClick(const QString&, const VioElement&)),this,SIGNAL(MouseDoubleClick(const QString&, const VioElement&)));
  connect(var,SIGNAL(MouseClick(const QString&, const VioElement&)),this,SIGNAL(MouseClick(const QString&, const VioElement&)));
  return pos;
}


// extend anonymous
void WspVariablePool::InsertAnonymous(int pos) {
  if(pos<0) pos=0;
  if(pos>Size()) pos = Size();
  WspVariable* witem=NewItem();
  witem->Name(NewName("System"));
  witem->FaudesType("System");
  DoInsert(pos,witem);
}

// extend anonymous
void WspVariablePool::InsertAnonymous(int pos, const QString& ftype) {
  if(pos<0) pos=0;
  if(pos>Size()) pos = Size();
  WspVariable* witem=NewItem();
  witem->Name(NewName(ftype));
  witem->FaudesType(ftype);
  DoInsert(pos,witem);
}


// overload
WspVariable* WspVariablePool::At(int position) {
  return qobject_cast<WspVariable*>(WspPool::At(position));
}

// overload
const WspVariable* WspVariablePool::At(int position) const {
  return qobject_cast<const WspVariable*>(WspPool::At(position));
}

// overload
WspVariable* WspVariablePool::At(const QString& name) {
  return qobject_cast<WspVariable*>(WspPool::At(name));
}

// extra edit/access functions
bool WspVariablePool::ReType(const QString& name, const QString &newtype) {
  FD_DI("WspVariablePool::ReType(" << name << ", " << newtype << "): ?");
  WspVariable* var = At(name);
  if(!var) return false;
  if(var->FaudesType()==newtype) return true;
  FD_DI("WspVariablePool::ReType(" << name << ", " << newtype << "): !");
  var->FaudesType(newtype);
  return true;
}

// test existence and type
bool WspVariablePool::ExistsByType(const QString& name, const QString &ftype) {
  WspVariable* var = At(name);
  if(!var) return false;
  if(var->FaudesType()==ftype) return false;
  return true;
}

// extract filtered lists
QList<QString> WspVariablePool::NameListByType(const QString& ftype) {
  QList<QString> list;
  foreach(WspItem* item, ItemList()) {
    WspVariable* var= qobject_cast<WspVariable*>(item);
    if(var->FaudesType()!=ftype) continue;
    list.append(var->Name());
  }
  return list;
}

// extract filtered lists
QList<QString> WspVariablePool::NameListByType(faudes::Type* fobject) {
  QList<QString> list;
  foreach(WspItem* vitem, ItemList()) {
    WspVariable* var= qobject_cast<WspVariable*>(vitem);
    if(! fobject->Cast(var->FaudesValue())) continue;
    list.append(var->Name());
  }
  return list;
}

// invalidate values
void WspVariablePool::Invalidate(void) {
  FD_DI("WspVariablePool::Invalidate(): #" << Size() << "[" << ItemList().size() <<"]");
  foreach(WspItem* vitem, ItemList()) {
    WspVariable* var= qobject_cast<WspVariable*>(vitem);
    if(!var) continue;
    FD_DI("WspVariablePool::Invalidate(): " << var->Name());
    if(var->Source()==WspVariable::Constant) {
      var->Valid(true);
      continue;
    }
    if(var->Persistent()) {
      var->Source(WspVariable::WorkSpace);
      var->Valid(true);
      continue;
    }
    if(var->FileLinked()) { 
      var->Source(WspVariable::ReadFile);
      var->Valid(false);
      continue;
    }
    if(var->Shown()) {
      var->Source(WspVariable::WorkSpace);
      var->Valid(true);
      continue;
    }
    var->Valid(false);
    var->Source(WspVariable::Unknown);
  }
  FD_DI("WspVariablePool::Invalidate(): done");
}

// erase unknown
int  WspVariablePool::EraseUnknown(void) {
  FD_DI("WspVariablePool::EraseUnknown()");
  int count=0;
  foreach(WspItem* item, ItemList()) {
    WspVariable* var= qobject_cast<WspVariable*>(item);
    if(var->Source()!=WspVariable::Unknown) continue;
    Erase(var->Name());
    count++;
  }
  // advertise change
  emit NotifyProperties();
  return count;
}

// highlite requests
void WspVariablePool::Highlite(const QString& varname, const VioElement& elem, bool on) {
  // do one
  WspVariable* var= At(varname);
  if(var)   
  if(var->Visual()) 
    var->Highlite(elem,on);
}

// highlite requests
void WspVariablePool::HighliteClear(const QString& varname) {
  FD_DI("WspVariablePool::HighliteClear(" << varname << ")");
  // do all
  if(varname=="") {
    foreach(WspItem* item, ItemList()) {
      WspVariable* var= qobject_cast<WspVariable*>(item);
      if(!var->Visual()) continue;
      var->HighliteClear();
    }
    return;
  }
  // do one
  WspVariable* var= At(varname);
  if(var)   
  if(var->Visual()) 
    var->HighliteClear();
}

// highlite requests
void WspVariablePool::Show(const QString& varname, const VioElement& elem) {
  (void) varname;
  (void) elem;
}


// exex user save
int WspVariablePool::UserExternalSave(void) {
  WspExternalSaveDialog* xdiag = new WspExternalSaveDialog(this);
  return xdiag->exec();
}


// run context menu wrapper
void WspVariablePool::RunContextMenu(QPoint rPoint, const QString rName) {
  FD_DS("WspVariablePool::RunContextMenu(" << rName <<")");
  // have a menu
  QMenu* menu= 0;
  // figure my item
  int pos=Find(rName);
  WspVariable* witem=At(pos);
  if(!witem) pos=Size();
  // select singleton or notrhing 
  if(witem) ActiveItem(witem->Name());
  else ActiveItem("");
  // construct menu
  if(witem) menu= witem->NewContextMenu();
  else menu = new QMenu("Variable Menu");
  // separator
  if(witem) menu->addSeparator();
  // have an insert menu
  QSet<QString> instypes(VioTypeRegistry::UserTypes().begin(),VioTypeRegistry::UserTypes().end());
  instypes.insert("Boolean");
  instypes.insert("String");
  instypes.insert("Integer");
  QMenu* imenu= new QMenu("Insert Variable"); 
  QSet<QString>::const_iterator tit;
  for(tit=instypes.begin(); tit!=instypes.end(); ++tit) {
    imenu->addAction(*tit);
  }
  menu->addMenu(imenu);
  QAction* dupaction= menu->addAction("Duplicate Variable");
  dupaction->setEnabled(witem!=0);
  QAction* delaction= menu->addAction("Delete Variable");
  delaction->setEnabled(witem!=0);
  // run
  QAction* selaction= menu->exec(rPoint);
  // deal with my buttons
  if(selaction==delaction){
    Erase(rName);
  }
  if(selaction)
  if(instypes.contains(selaction->text())){
    InsertAnonymous(pos,selaction->text());
  }
  if(selaction==dupaction) 
  if(witem) {
    InsertAnonymous(pos+1,witem->FaudesType());
    WspVariable* dup=At(pos+1);
    if(dup) {
      dup->Visual(witem->Visual());
      dup->Assign(witem);
    }
  }
  delete menu;
  delete imenu;
}

// run context menu wrapper
void WspVariablePool::RunContextMenu(QPoint rPoint) {
  WspPool::RunContextMenu(rPoint);
}



// get a copy of a variable 
static int WspGetValue(lua_State* L) {
  int n = lua_gettop(L);    /* number of arguments must be 2  */
  if(n!=2) {
    lua_pushstring(L, "WspGetValue: two arguments required");
    lua_error(L);
  } 
  if(!lua_isuserdata(L,1)) {
    lua_pushstring(L, "WspGetValue: first arg must specify vbariable pool");
    lua_error(L);
  }
  if(!lua_isstring(L,2)) {
    lua_pushstring(L, "WspGetValue: scond arg must specify variable");
    lua_error(L);
  }
  WspVariablePool* vpool= (WspVariablePool*) lua_touserdata(L,1);
  QString vname= lua_tostring(L,2);
  FD_DS("WspGetValue(): pool at " << vpool << ",  variable " << vname );
  WspVariable* vdata=vpool->At(vname);
  const faudes::Type* fdata = 0;
  if(vdata) fdata=vdata->FaudesValue();
  if(!fdata) {
    lua_pushstring(L, "WspGetValue: failed to retrieve variable");
    lua_error(L);
  }
  try {
    faudes::LuaState::Push(L,fdata);
  } catch(faudes::Exception ex) {
    lua_pushstring(L, "WspGetValue: failed to push variable");
    lua_error(L);
  }
  return 1;
}

// set a variable  
static int WspSetValue(lua_State* L) {
  int n = lua_gettop(L);    /* number of arguments must be 3  */
  if(n!=3) {
    lua_pushstring(L, "WspSetValue: three arguments required");
    lua_error(L);
  } 
  if(!lua_isuserdata(L,1)) {
    lua_pushstring(L, "WspSetValue: first arg must specify variable pool");
    lua_error(L);
  }
  if(!lua_isstring(L,2)) {
    lua_pushstring(L, "WspSetValue: scond arg must specify the variable");
    lua_error(L);
  }
  /* 
  // allow for elementary types
  if(!lua_isuserdata(L,3)) {
    lua_pushstring(L, "WspSetValue: third arg must specify the value");
    lua_error(L);
  }
  */
  WspVariablePool* vpool= (WspVariablePool*) lua_touserdata(L,1);
  QString vname= lua_tostring(L,2);
  FD_DS("WspSetValue(): pool at " << vpool << ",  variable " << vname );
  WspVariable* vdata=vpool->At(vname);
  if(!vdata) {
    lua_pushstring(L, "WspSetValue: failed to locate variable");
    lua_error(L);
  }
  faudes::Type* fdata = 0;
  try {
    fdata=faudes::LuaState::Pop(L);
  } catch(faudes::Exception ex) {
    fdata=0;
  }
  FD_DS("WspSetValue(): found data at " << fdata);
  if(!fdata) {
    lua_pushstring(L, "WspSetValue: failed to retrieve value");
    lua_error(L);
  }
  FD_DS("WspSetValue(): found ftype " << faudes::FaudesTypeName(*fdata));
  if(faudes::FaudesTypeName(*fdata) != VioStyle::StrFromQStr(vdata->FaudesType())) {
    lua_pushstring(L, "WspSetValue: faudes type mismatch");
    lua_error(L);
  }
  vdata->FaudesValue(fdata);
  vdata->UpdateVisual(); 
  return 0;
}


// install on  lua
void WspVariablePool::LuaInstall(void) {
  // use global state
  lua_State* L=faudes::LuaState::G()->LL();
  int top = lua_gettop(L);
  // have empty wsp table
  lua_pushstring(L,"workspace");         // stack: "wsp"
  lua_newtable(L);                       // stack: "wsp",table  
  lua_settable(L, LUA_GLOBALSINDEX);     // stack:
  lua_pushstring(L,"workspace");         // stack: "wsp"
  lua_gettable(L, LUA_GLOBALSINDEX);     // stack: table
  // register my push function with Lua   
  lua_pushstring(L, ".get_value");
  lua_pushcfunction(L, WspGetValue);
  lua_settable(L, -3);                   // stack: table
  // register my pop function with Lua   
  lua_pushstring(L, ".set_value");
  lua_pushcfunction(L, WspSetValue);
  lua_settable(L, -3);                   // stack: table
  // register my pool function with Lua   
  lua_pushstring(L, ".pool");
  lua_pushlightuserdata(L, (void*) this);
  lua_settable(L, -3);                   // stack: table
  // iterate over variables
  for(int pos=0; pos<Size(); pos++) {
    // set up wrapper frunction
    std::stringstream lf;
    std::string lfname=VioStyle::StrFromQStr(At(pos)->Name());
    lf << "function workspace." << lfname << "(...)" << std::endl;
    lf << "if arg['n']==0 then" << std::endl;
    lf << "  return workspace['.get_value'](workspace['.pool'],'" << lfname <<"')" << std::endl;
    lf << "else if arg['n']==1 then" << std::endl;
    lf << "  workspace['.set_value'](workspace['.pool'],'" << lfname <<"',arg[1])" << std::endl;
    lf << "end" << std::endl;
    lf << "end" << std::endl;
    lf << "end" << std::endl;
    // install (aka run) the wrapper function
    int errexec=luaL_dostring(L,lf.str().c_str());	
    if(errexec!=0) {
      FD_WARN("Workspace: could not install access functions");
      break;
    }
  }
  // fix stack
  lua_settop(L,top);
}




/*
 ************************************************
 ************************************************
 ************************************************
 ************************************************

 implementation  WspVariablePoolBrowser

 ************************************************
 ************************************************
 ************************************************
 ************************************************
 */

// Constructor 
WspVariablePoolBrowser::WspVariablePoolBrowser(WspVariablePool* pool,QWidget* parent) :
  QWidget(parent),
  pVarPool(pool)
{
  // have my pool view and my property view
  mPoolView = new WspPoolView();
  mPoolView->setSizePolicy(QSizePolicy::Expanding,QSizePolicy::Preferred);
  mPoolView->Model(pVarPool);
  mProperties = new WspVariableProperties(pVarPool);

  // pass on view signals
  connect(mPoolView,SIGNAL(RaiseItemRequest(const QString&)),this,
	  SIGNAL(RaiseVariableRequest(const QString&)));


  // have variable pool group
  QGroupBox* gbox1 = new QGroupBox();
  gbox1->setTitle("Variables");
  QVBoxLayout* vbox1= new QVBoxLayout(gbox1);
  vbox1->setContentsMargins(0,0,0,0);
  vbox1->setSpacing(0);
  vbox1->addWidget(mPoolView);
  gbox1->setSizePolicy(QSizePolicy::Expanding,QSizePolicy::Preferred);

  // have variable properties group
  QGroupBox* gbox2 = new QGroupBox();
  gbox2->setTitle("Properties");
  QVBoxLayout* vbox2= new QVBoxLayout(gbox2);
  vbox2->setContentsMargins(0,0,0,0);
  vbox2->setSpacing(0);
  vbox2->addWidget(mProperties);
  gbox2->setSizePolicy(QSizePolicy::Expanding,QSizePolicy::Fixed);

  // construct overall column
  QVBoxLayout* vbox= new QVBoxLayout(this);
  vbox->setContentsMargins(0,0,0,0);
  vbox->setSpacing(0);
  vbox->addWidget(gbox1);
  vbox->addSpacing(10);
  vbox->addWidget(gbox2);
  setSizePolicy(QSizePolicy::Expanding,QSizePolicy::Preferred);


  // my actions
  mNewAction = new QAction("New Variable", this);
  mNewAction->setToolTip("Introduce new variable");
  QObject::connect(mNewAction, SIGNAL(triggered()), mPoolView, SLOT(UserInsert()));
  mLoadAllAction = new QAction("Load All Variables", this);
  mLoadAllAction->setToolTip("Revert all variables from external file if linked");
  QObject::connect(mLoadAllAction, SIGNAL(triggered()), pVarPool, SLOT(LoadAll()));
  mSaveAllAction = new QAction("Save All Variables", this);
  mSaveAllAction->setToolTip("Save all variables to external file if linked");
  QObject::connect(mSaveAllAction, SIGNAL(triggered()), pVarPool, SLOT(SaveAll()));
  mRemoveUnusedAction = new QAction("Remove unused variables", this);
  mRemoveUnusedAction->setToolTip("Garbadge collection w.r.t. current script");
  QObject::connect(mRemoveUnusedAction, SIGNAL(triggered()), pVarPool, SLOT(RemoveUnused()));

  // my menu
  mMenu = new QMenu(this);
  UpdateMenu();
  connect(mMenu, SIGNAL(aboutToShow()), this, SLOT(UpdateMenu()));


  // overwrite
  setSizePolicy(QSizePolicy::Expanding,QSizePolicy::Preferred);
}

// destructor
WspVariablePoolBrowser::~WspVariablePoolBrowser(void) {
}

// tell aboot my menu
QMenu* WspVariablePoolBrowser::Menu(void) {
  return mMenu;
}



// update variable menu
void WspVariablePoolBrowser::UpdateMenu(void) {

  FD_DI("WspVariablePool::UpdateMenu(): for " << mActiveVariable);

  // reset
  mMenu->clear();
  mMenu->setTitle("Variables");

  // new and remove
  mMenu->addAction(mNewAction);
  mMenu->addAction(mRemoveUnusedAction);

  // load and save
  WspVariable* topvar = pVarPool->At(mActiveVariable);
  if(topvar)
  if(topvar->Visual()) {
    mMenu->addSeparator();
    QString text;
    if(topvar->FileLinked())
       text = tr("%1 - %2").arg(topvar->Name(), topvar->RelativeFilename());
    else
       text = tr("%1 - no file").arg(topvar->Name());
    QAction* loadvar = new QAction(mMenu);
    loadvar->setText(QString("Load %1").arg(text));
    loadvar->setEnabled(topvar->FileLinked());
    mMenu->addAction(loadvar);
    connect(loadvar,SIGNAL(triggered(void)),topvar,SLOT(UserLoad(void)));
    QAction* savevar = new QAction(mMenu);
    savevar->setText(QString("Save %1").arg(text));
    savevar->setEnabled(topvar->FileLinked());
    mMenu->addAction(savevar); 
    connect(savevar,SIGNAL(triggered(void)),topvar,SLOT(UserSave(void)));
    QAction* importvar = new QAction(mMenu);
    importvar->setText(QString("Import %1 ... ").arg(topvar->Name()));
    importvar->setEnabled(topvar->FaudesType()=="Generator");
    mMenu->addAction(importvar);
    connect(importvar,SIGNAL(triggered(void)),topvar,SLOT(UserImport(void)));
  }

  // std io
  mMenu->addSeparator();
  mMenu->addAction(mSaveAllAction);
  mMenu->addAction(mLoadAllAction);
 

  // other
  //mMenu->addSeparator();
  //mMenu->addAction(mRemoveUnusedAction);
  //mMenu->addAction(mCopyToProjectAction);
}



// pass on to pool
void WspVariablePoolBrowser::ActiveItem(QString varname) {
  pVarPool->ActiveItem(varname); }
QString WspVariablePoolBrowser::ActiveItem(void) {
  return pVarPool->ActiveItem(); }
