/* desbrowser.cpp  -  project browser for destool */


/*
   Gui frontend for FAU Discrete Event Systems Library (libfaudes)

   Copyright (C) 2006, 2007  Thomas Moor, Klaus Schmidt, Sebastian Perk
   Copyright (C) 2024  Thomas Moor

*/



#include <QApplication>
#include <QtGui>

#include "desbrowser.h"
#include "destool.h"


/*
*******************************************************
*******************************************************
*******************************************************

implementation: deswindow

*******************************************************
*******************************************************
*******************************************************
*/


// construct
DesProjectBrowser::DesProjectBrowser() : QMainWindow() {

  // configure
  setAttribute(Qt::WA_DeleteOnClose);

  // console
  mConsole = new WspConsole(this);  
  connect(mConsole,SIGNAL(NotifyLuaReset()),this,SLOT(LuaReset()));

  // extension manager
  mExtensionManager = new WspExtensionManager(this);

  // variable and function pools 
  FD_DP("DesProjectBrowser::DesProjectBrowser(): variable pool");
  mVariables = new WspVariablePool(this); 
  connect(mVariables,SIGNAL(NotifyModified(bool)),this,SLOT(ChildModified(bool)));
  FD_DP("DesProjectBrowser::DesProjectBrowser(): function pool");
  mFunctions = new WspFunctionPool(this); 
  connect(mFunctions,SIGNAL(NotifyModified(bool)),this,SLOT(ChildModified(bool)));


  // variable browser  
  FD_DP("DesProjectBrowser::DesProjectBrowser(): variable browser");
  QWidget* mVariablesTab = new QWidget(); 
  QHBoxLayout* hbox0=new QHBoxLayout(mVariablesTab);
  hbox0->setSpacing(0);
  hbox0->setContentsMargins(0,0,0,0);
  hbox0->addSpacing(5);
  mVariableBrowser=new WspVariablePoolBrowser(mVariables);
  connect(mVariableBrowser,SIGNAL(RaiseVariableRequest(const QString&)),this,SLOT(RaiseVariable(const QString&)));
  hbox0->addWidget(mVariableBrowser);
  hbox0->addSpacing(5);


  // script 
  FD_DP("DesProjectBrowser::DesProjectBrowser(): script widget ");
  QWidget* mScriptTab = new QWidget(); 
  QHBoxLayout* hbox1=new QHBoxLayout(mScriptTab);
  hbox1->setSpacing(0);
  hbox1->setContentsMargins(0,0,0,0);
  hbox1->addSpacing(5);
  mScript  = new ScrProgBrowser(mVariables,mFunctions);
  hbox1->addWidget(mScript);
  hbox1->addSpacing(5);
  connect(mScript,SIGNAL(NotifyModified(bool)),this,SLOT(ChildModified(bool)));


  // simulator controls
  FD_DP("DesProjectBrowser::DesProjectBrowser(): simulator controls");
  QWidget* mSimulatorTab = new QWidget(); 
  QHBoxLayout* hbox2=new QHBoxLayout(mSimulatorTab);
  hbox2->setSpacing(0);
  hbox2->setContentsMargins(0,0,0,0);
  hbox2->addSpacing(5);
  mSimulator  = new SimWidget();
  mSimulator->VariablePool(mVariables);
  hbox2->addWidget(mSimulator);
  hbox2->addSpacing(5);
  connect(mSimulator,SIGNAL(NotifyModified(bool)),this,SLOT(ChildModified(bool)));
  connect(mSimulator,SIGNAL(ShowTraceRequest(bool)), this, SLOT(ShowTrace(bool)));
  connect(mSimulator,SIGNAL(ShowStatisticsRequest(bool)), this, SLOT(ShowStatistics(bool)));

  // add to tab
  mTabs = new QTabWidget(this);
  mTabs->addTab(mVariablesTab,"Variables");
  mTabs->addTab(mScriptTab,"Script");
  mTabs->addTab(mSimulatorTab,"Animation");

  // make myself main widget
  setCentralWidget(mTabs);

  // other data
  setCurrentFile("");
  setWindowTitle(tr("DESTool[*]"));
  connect(this, SIGNAL(NotifyModified(bool)),this,SLOT(setWindowModified(bool)));

  // have menus and friends
  CreateActions();
  InstallMenus();

  // pass on pool show requests 
  connect(mVariables,SIGNAL(ShowItemRequest(const QString&,bool)),this,SLOT(ShowVariable(const QString&,bool)));
  connect(mFunctions,SIGNAL(ShowItemRequest(const QString&,bool)),this,SLOT(ShowFunction(const QString&,bool)));

  // have statusbar
  statusBar();
  connect(mScript, SIGNAL(TextMessage(const QString&,int)), 
    this, SLOT(StatusBarMessage(const QString&, int)));
  connect(mSimulator, SIGNAL(TextMessage(const QString&,int)), 
    this, SLOT(StatusBarMessage(const QString&, int)));


  // begin non-empty
  /*
  mVariables->InsertAnonymous(0);
  ShowVariables();
  ShowVariable(mVariables->At(0)->Name());
  */

  // have a reasonable default?
  setSizePolicy(QSizePolicy::Preferred, QSizePolicy::Preferred );
  adjustSize();

  // restore geometry (why is this not functional?)
  QSettings settings;
  restoreGeometry(settings.value("geometry:browser:"+strippedName(curFile)).toByteArray());

  // clear modified state
  Modified(false);

  // done
  FD_DP("DesProjectBrowser::DesProjectBrowser(): done");
}

// destruct
DesProjectBrowser::~DesProjectBrowser(void) {
  FD_DP("DesProjectBrowser::~DesProjectBrowser(): A");
  // kill all extra views that may depend on other vars
  ShowTrace(false);
  ShowStatistics(false);
  ShowConsole(false);
  // explicit destruction to maintain dependencies (swgfaults on mac osx)
  FD_DP("DesProjectBrowser::~DesProjectBrowser(): B");
  delete mSimulator; 
  delete mScript; 
  delete mFunctions;
  delete mVariableBrowser;
  delete mVariables;
  delete mExtensionManager;
  delete mConsole;
  FD_DP("DesProjectBrowser::~DesProjectBrowser(): done");
}



// default size
QSize DesProjectBrowser::sizeHint(void) const {
  FD_DP("DesProjectBrowser::sizeHint()");
  QSize sz(200,800);
  return sz;
}

// query changes (dont emit signal)
bool DesProjectBrowser::Modified(void) const { 
  return mModified;
};

// collect and pass on modifications of childs
void DesProjectBrowser::ChildModified(bool changed) { 
  // ignore negagtives
  if(!changed) return;
  // report
  FD_DI("DesProjectBrowser::ChildModified(1): model modified " << mModified);
  Modified(true);
};

// record changes and emit signal)
void DesProjectBrowser::Modified(bool ch) { 
  // set
  if(!mModified && ch) {
    mModified=true;
    FD_DI("DesProjectBrowser::Modified(" << this << "): emit positive modified notification");
    emit NotifyModified(mModified);
  }
  // clr
  if(mModified && !ch) {
    mModified=false;
    FD_DI("DesProjectBrowser::Modified(" << this << "): emit negative modified notification");
    emit NotifyModified(mModified);
  }
  // pass on clear
  if(!ch) {
    mVariables->Modified(ch);
    mFunctions->Modified(ch);
    mScript->Modified(ch);
    //mSimulator->Modified(ch);
  }
}


// new file project
void DesProjectBrowser::New() {
   if(Modified()) {
      int ret = QMessageBox::warning(this, tr("DESTool"),
  	          tr("Do you want to save the current project \"%1\"?").arg(strippedName(curFile)),
                QMessageBox::Save | QMessageBox::Discard | QMessageBox::Cancel, QMessageBox::Save);
        if (ret == QMessageBox::Save) if(Save()==2) return;  
        if (ret == QMessageBox::Cancel) return;
   }
   mScript->Clear();
   mSimulator->Clear();
   mVariables->Clear();
   mFunctions->Clear();
   setCurrentFile("");


   // start non-empty
   mVariables->InsertAnonymous(0);
   Modified(false);
   ShowVariables();
   ShowVariable(mVariables->At(0)->Name());
}


// helper: save changes
// return accepted if saved or explicitely discarded
// return reject on error or user cancel
int DesProjectBrowser::SaveModified(void) {

  FD_DP("DesBrowser::SaveModified()");

  QMessageBox modbox;
  modbox.setText(QString(
    "<p><b>The document has been modified.</b></p> "));
  if(curFile=="")
    modbox.setInformativeText(QString(
       "<p>Do you want to save your changes?</p>"));
  else
    modbox.setInformativeText(QString(
      "<p>Do you want to save your changes to \"%1\"?</p>").arg(curFile));
  modbox.setWindowTitle("DESTool"),
  modbox.setIcon(QMessageBox::Information);
  modbox.setStandardButtons(QMessageBox::Cancel | QMessageBox::Save
        | QMessageBox::Discard);
  int res=modbox.exec();
  if(res == QMessageBox::Cancel) return QDialog::Rejected;
  if(res == QMessageBox::Save) 
    if(Save()==2) return QDialog::Rejected;  
  if(res == QMessageBox::Discard) 
    Modified(false);
  return QDialog::Accepted;
}



// open slot
void DesProjectBrowser::Open(void) {

  FD_DP("DesBrowser::Open()");

  // check on chanegs 
  if(Modified()) 
  if(SaveModified()==QDialog::Rejected) return;

  // set up dialog, incl settings
  QFileDialog* fdiag = new QFileDialog();
  QSettings settings;
  fdiag->restoreState(settings.value("stateFileDialog").toByteArray());
  fdiag->setNameFilter("DESTool-Project-Files (*.pro);;Any File (*.*)");
  fdiag->setFileMode(QFileDialog::ExistingFile);
  fdiag->setAcceptMode(QFileDialog::AcceptOpen);
  fdiag->setDefaultSuffix("pro");
  fdiag->setWindowTitle("Open Project");
  if(!fdiag->directory().isReadable()) {
    FD_DP("DesBrowser::Open(): fixing directory");
    fdiag->setDirectory(QDir::home());
  }
  // run dialog
  QString fileName="";
/*
#ifdef Q_WS_MAC
  FD_DP("DesBrowser::Open(): run dialog (mac)");
  fileName = QFileDialog::getOpenFileName(this);
#else
*/
  FD_DP("DesBrowser::Open(): run dialog");
  if(fdiag->exec()) 
    if(fdiag->selectedFiles().size()==1) 
      fileName=fdiag->selectedFiles().at(0);
  FD_DP("DesBrowser::Open(): run dialog: done");

  // maintain settings
  settings.setValue("stateFileDialog", fdiag->saveState());
  delete fdiag;

  // doit 
  if (fileName.isEmpty()) return;
  LoadProject(fileName);
}


// save slot
int DesProjectBrowser::Save() {
    if(curFile.isEmpty()) return SaveAs();
    return SaveProject(curFile);
}

// save as slot
int DesProjectBrowser::SaveAs() {

  // set up dialog, incl settings
  QFileDialog* fdiag = new QFileDialog();
  QSettings settings;
  fdiag->restoreState(settings.value("stateFileDialog").toByteArray());
  fdiag->setNameFilter("DESTool-Project-Files (*.pro);;Any File (*.*)");
  fdiag->setFileMode(QFileDialog::AnyFile);
  fdiag->setAcceptMode(QFileDialog::AcceptSave);
  fdiag->setWindowTitle("Save Project");
  fdiag->setDefaultSuffix("pro");

  // run dialog
  FD_DP("DesBrowser::SaveAs(): file dialog");
  QString fileName="";
  if(fdiag->exec()) 
    if(fdiag->selectedFiles().size()==1) 
      fileName=fdiag->selectedFiles().at(0);
  FD_DP("DesBrowser::SaveAs(): file dialog: done");

  // maintain settings
  settings.setValue("stateFileDialog", fdiag->saveState());

  delete fdiag;

  // doit 
  if(fileName.isEmpty()) return 1;
  return SaveProject(fileName);
}


// open recent slot
void DesProjectBrowser::OpenRecentFile()
{
  // figure file
  QAction *action = qobject_cast<QAction *>(sender());
  if(!action) return;

  // check on chanegs 
  if(Modified()) 
  if(SaveModified()==QDialog::Rejected) return;

  // load
  LoadProject(action->data().toString());
}


// exit application
void DesProjectBrowser::Exit(void) {

  FD_DP("DesBrowser::Exit()");

  // save window state
  QSettings settings;
  settings.setValue("geometry:browser:"+strippedName(curFile), saveGeometry());

  // check on chanegs 
  if(Modified()) 
  if(SaveModified()==QDialog::Rejected) return;

  // close most windows
  CloseAllWindows();

  // close all, incl this window
  qApp->closeAllWindows();

}



// close --- exit
void DesProjectBrowser::closeEvent ( QCloseEvent * event ) {

  FD_DP("DesProjectBrowser::closeEvent()");;

  // save window state
  QSettings settings;
  settings.setValue("geometry:browser:"+strippedName(curFile), saveGeometry());
 
  // check on chanegs 
  if(Modified()) 
  if(SaveModified()==QDialog::Rejected) { event->ignore(); return;}

  // close all other windows
  CloseAllWindows();

  // thats all to it
  QMainWindow::closeEvent(event);

  // this should be delaed?
  FD_DP("DesProjectBrowser::closeEvent(): done");
}


// faudes import: dialog
void DesProjectBrowser::FaudesImport(void) {
  WspFaudesImportDialog* xdiag = new WspFaudesImportDialog(this);
  xdiag->exec();
}

// faudes import: doit
void DesProjectBrowser::FaudesImport(const QStringList& files, 
  bool vis, bool pers, bool over)
{
  FD_DP("DesBrowser::FaudesImport");
  QStringList errlist;
  // busy cursor
  QApplication::setOverrideCursor(Qt::WaitCursor);
  // iterate files
  foreach(QString file, files) {
    FD_DP("DesBrowser::FaudesImport(): file " << VioStyle::StrFromQStr(file));
    QFileInfo info =QFileInfo(file);
    QString fext=info.suffix();
    // retrieve sense info
    QString ftag;
    QString ftype;
    QString fname;
    try {
      faudes::Token btag;
      faudes::TokenReader* tr = new faudes::TokenReader(VioStyle::StrFromQStr(file));
      tr->Peek(btag);
      if(btag.IsBegin()) 
        ftag=VioStyle::QStrFromStr(btag.StringValue());
      if(btag.ExistsAttributeString("ftype")) 
        ftype=VioStyle::QStrFromStr(btag.AttributeStringValue("ftype"));
      if(btag.ExistsAttributeString("name")) 
        fname=VioStyle::QStrFromStr(btag.AttributeStringValue("name"));
      delete tr;
    } catch(faudes::Exception& exception) {
      errlist << QString("%1: error reading/opening file").arg(info.fileName());
      continue;
    }
    // special case: rti
    if(fext=="rti") {
      if(fname.contains("::")) fname=fname.remove(0,fname.lastIndexOf("::")+2);
      int pos=-1;
      WspFunction* fnct=mFunctions->At(fname);
      if(!fnct || !over) {
        pos=mFunctions->Size();
        mFunctions->InsertAnonymous(pos);
        fnct=mFunctions->At(pos);
      }
      if(!fnct) {
        errlist << QString("%1: failed to allocate function").arg(info.fileName());
	continue;
      }
      int err=fnct->Import(file);
      if(err==2) {
        errlist << QString("%1: function %2 allready exists").arg(info.fileName()).arg(fname);
	if(pos>=0) mFunctions->Erase(pos);
        continue;
      }
      if(err!=0) {
        errlist << QString("%1: error importing file").arg(info.fileName());
	if(pos>=0) mFunctions->Erase(pos);
        continue;
      }
      // done with *.rti
      continue;
    }
    // special case: lua
    if(fext=="lua") {
      fname=info.baseName();
      int pos=-1;
      WspFunction* fnct=mFunctions->At(fname);
      if(fnct && !over) {
        errlist << QString("%1: script alreay exists").arg(info.fileName());
	continue;
      }
      if(!fnct) {
        pos=mFunctions->Size();
        mFunctions->Insert(pos,fname);
        fnct=mFunctions->At(pos);
      }
      if(!fnct) {
        errlist << QString("%1: failed to allocate function").arg(info.fileName());
	continue;
      }
      // doit
      fnct->PlainScript();
      int err=fnct->Import(file);
      if(err!=0) {
        errlist << QString("%1: error importing file").arg(info.fileName());
	if(pos>=0) mFunctions->Erase(pos);
        continue;
      }
      continue;
      // done with *.lua
    }
    // fallback/overwrite to suffix
    if(ftype=="" && fext=="ftx")  ftype=ftag;
    if(ftype=="" && fext=="gen")  ftype="System";
    if(ftype=="" && fext=="alph") ftype="Alphabet";
    // cant help
    if(ftype=="") {
      errlist << QString("%1: failed to figure type").arg(info.fileName());
      continue;
    }
    // have a name 
    // if(fname=="" && fext=="ftx")  fname=ftag; // << correct, but dont like it for import, particularly for elementary types
    if(fname=="") fname = info.completeBaseName();
    // report and insert
    FD_DP("DesBrowser::FaudesImport(): name/type " << 
	  VioStyle::StrFromQStr(fname) << " / " << VioStyle::StrFromQStr(ftype));
    int pos=mVariables->Size();
    mVariables->InsertAnonymous(pos,ftype);
    WspVariable* var=mVariables->At(pos);
    if(!var) {
        errlist << QString("%1: failed to allocate variable").arg(info.fileName());
	continue;
    }
    var->Persistent(pers);
    var->Visual(vis);
    if(mVariables->Exists(fname)) fname = mVariables->NewName(fname);
    mVariables->ReName(pos,fname);
    int err=var->Import(file);
    if(err!=0) {
      errlist << QString("%1: error reading file").arg(info.fileName());
      continue;
    }
    /*
    if(!fname) 
    if(var->FaudesValue()->Name()!="") {
	var->Name(VioStyle::QStrFromStr(var->FaudesValue()->Name())); 
    }
    */
  }
  // get cursor back 
  QApplication::restoreOverrideCursor();
  // error box
  if(errlist.size()>0) {
    QString errmsg;
    foreach(QString err,errlist) errmsg+=err+"\n";
    QMessageBox mb(QMessageBox::Warning,tr("DESTool"),
		   tr("Import Errors"),QMessageBox::Ok);

    mb.setInformativeText(errmsg);
    mb.exec();
  }
}


// faudes export: dialog
void DesProjectBrowser::FaudesExport(void) {
  WspFaudesExportDialog* xdiag = new WspFaudesExportDialog(this);
  xdiag->exec();
}

// faudes export: perform
void  DesProjectBrowser::FaudesExport(const QStringList& vars, const QStringList& fncts, const QStringList& sims, const QString& destdir) {
  FD_DP("DesBrowser::FaudesExport");
  QStringList errlist;
  // busy cursor
  QApplication::setOverrideCursor(Qt::WaitCursor);
  // iterate variables
  foreach(QString varname, vars) {
    FD_DP("DesBrowser::FaudesExport(): var " << VioStyle::StrFromQStr(varname));
    WspVariable* var=mVariables->At(varname);
    if(!var) continue;
    QString dstfile=destdir + "/" + QString("%1.ftx").arg(varname);
    if(dynamic_cast<const faudes::Generator*>(var->FaudesValue()))
      dstfile=destdir + "/" + QString("%1.gen").arg(varname);
    if(dynamic_cast<const faudes::EventSet*>(var->FaudesValue()))
      dstfile=destdir + "/" + QString("%1.alph").arg(varname);
    FD_DP("DesBrowser::FaudesExport(): var " << VioStyle::StrFromQStr(varname) 
	    << " file " << VioStyle::StrFromQStr(dstfile));
    var->Export(dstfile);
  }
  // iterate functions/scripts
  foreach(QString fnctname, fncts) {
    FD_DP("DesBrowser::FaudesExport(): fnct " << VioStyle::StrFromQStr(fnctname));
    WspFunction* fnct=mFunctions->At(fnctname);
    if(!fnct) continue;
    QString dstfile=destdir + "/" + QString("%1.rti").arg(fnctname);
    if(fnct->IsPlainScript())
      dstfile=destdir + "/" + QString("%1.lua").arg(fnctname);
    FD_DP("DesBrowser::FaudesExport(): fnct " << VioStyle::StrFromQStr(fnctname) 
	    << " file " << VioStyle::StrFromQStr(dstfile));
    fnct->Export(dstfile);
  }
  // iterate sims (there is only one)
  foreach(QString sfile, sims) {
    mSimulator->Reset();
    QString dstfile = destdir + "/" + sfile;
    FD_DP("DesBrowser::FaudesExport(): sim file " << VioStyle::StrFromQStr(dstfile));
    mSimulator->Executor()->Write(VioStyle::StrFromQStr(dstfile));
  }
  // get cursor back 
  QApplication::restoreOverrideCursor();
}


// about box
void DesProjectBrowser::About(void) {
  QMessageBox aboutbox;
  aboutbox.setText(QString(
    "<p><b>DESTool - a Discrete Event Systems Tool</b></p>")); 
  aboutbox.setInformativeText(QString(
    "<p><b>Version:</b> DESTool " VIODES_VERSION " using %1 with %2 plug-ins</p> " 
    "<p><b>Configuration:</b> %3</p> " 
    "<p><b>VioPlugIns:</b> %4</p> " 
    "<p><b>Credits:</b> %5</p> " 
    "<p><b>(c) 2008-2024 Thomas Moor</b></p> "
    ).arg(
      faudes::VersionString().c_str(),
      faudes::PluginsString().c_str(),
      VioStyle::ConfigName(),
      VioStyle::PluginsString(),
      faudes::ContributorsString().c_str()));
    aboutbox.setWindowTitle("About DESTool"),
    aboutbox.setIcon(QMessageBox::Information);
    aboutbox.addButton(QMessageBox::Ok);
    aboutbox.exec();
}


// show doc    
void DesProjectBrowser::ShowDocumentation(const QString &page) {
  DesStyle::ShowDocumentation(page);
}

// whats this
void DesProjectBrowser::EnterWhatsThis(void) {
  QWhatsThis::enterWhatsThisMode();
}


// handle whats this links
bool DesProjectBrowser::event(QEvent* ev) {
  // handle my events
  if(ev->type() == QEvent::WhatsThisClicked) {
    if(QWhatsThisClickedEvent* wev = 
      dynamic_cast<QWhatsThisClickedEvent*>(ev)) {
     DesStyle::ShowDocumentation(wev->href());
    }
  }
  // call base		
  return QMainWindow::event(ev);
}


// set up all static actions
void DesProjectBrowser::CreateActions() {
    newAct = new QAction(tr("&New Project"), this);
    newAct->setStatusTip(tr("Create a new project"));
    connect(newAct, SIGNAL(triggered()), this, SLOT(New()),Qt::QueuedConnection);

    openAct = new QAction(tr("&Open..."), this);
    openAct->setShortcut(tr("Ctrl+O"));
    openAct->setStatusTip(tr("Open an existing project"));
    connect(openAct, SIGNAL(triggered()), this, SLOT(Open()),Qt::QueuedConnection);

    saveAct = new QAction(tr("&Save"), this);
    saveAct->setShortcut(tr("Ctrl+S"));
    saveAct->setStatusTip(tr("Save the current project to disk"));
    connect(saveAct, SIGNAL(triggered()), this, SLOT(Save()));

    saveAsAct = new QAction(tr("Save &As..."), this);
    saveAsAct->setStatusTip(tr("Save the current project by a new name"));
    connect(saveAsAct, SIGNAL(triggered()), this, SLOT(SaveAs()));

    for (int i = 0; i < MaxRecentFiles; ++i) {
        recentFileActs[i] = new QAction(this);
        recentFileActs[i]->setVisible(false);
        connect(recentFileActs[i], SIGNAL(triggered()),
                this, SLOT(OpenRecentFile()),Qt::QueuedConnection);
    }

    exitAct = new QAction(tr("Exit"), this);
    exitAct->setShortcut(tr("Ctrl+Q"));
    exitAct->setStatusTip(tr("Exit the DESTool"));
    connect(exitAct, SIGNAL(triggered()), this, SLOT(Exit(void)));

    newvarAct = new QAction(tr("New Variable"), this);
    newvarAct->setStatusTip(tr("Create new variable"));
    connect(newvarAct, SIGNAL(triggered()), mVariableBrowser, SLOT(UserInsert()));

    allloadAct = new QAction(tr("Load All Variables"), this);
    allloadAct->setStatusTip(tr("Load all variables from their respective files"));
    connect(allloadAct, SIGNAL(triggered()), mVariables, SLOT(LoadAll()));

    allsaveAct = new QAction(tr("Save All Variables"), this);
    allsaveAct->setStatusTip(tr("Save all variables to their respective file"));
    connect(allsaveAct, SIGNAL(triggered()), mVariables, SLOT(SaveAll()));

    fauimpAct = new QAction(tr("Import FAUDES Files ..."), this);
    fauimpAct->setStatusTip(tr("Instantiate new variables and functions from FAUDES files"));
    connect(fauimpAct, SIGNAL(triggered()), this, SLOT(FaudesImport()));

    fauexpAct = new QAction(tr("Export FAUDES Files ..."), this);
    fauexpAct->setStatusTip(tr("Write variables and function to plain FAUDES files"));
    connect(fauexpAct, SIGNAL(triggered()), this, SLOT(FaudesExport()));


    aboutAct = new QAction(tr("&About"), this);
    aboutAct->setStatusTip(tr(""));
    connect(aboutAct, SIGNAL(triggered()), this, SLOT(About()));

    helpAct = new QAction(tr("&Help Contents"), this);
    helpAct->setShortcut(tr("F1"));
    connect(helpAct, SIGNAL(triggered()), this, SLOT(ShowDocumentation()));

    undoAct = new QAction(tr("&Undo"), this);
    undoAct->setShortcut(tr("Ctrl+Z"));
    undoAct->setStatusTip(tr("Undo the last operation"));
    connect(undoAct, SIGNAL(triggered()), mScript, SLOT(Undo()));
    undoAct->setEnabled(false);

    redoAct = new QAction(tr("&Redo"), this);
    redoAct->setShortcut(tr("Ctrl+Y"));
    redoAct->setStatusTip(tr("Redo the last operation"));
    connect(redoAct, SIGNAL(triggered()), mScript, SLOT(Redo()));
    redoAct->setEnabled(false);

    runAct = new QAction(tr("&Run"), this);
    runAct->setShortcut(tr("Ctrl+B"));
    runAct->setStatusTip(tr("Run current script"));
    connect(runAct, SIGNAL(triggered()), mScript, SLOT(Run()));

    stepAct = new QAction(tr("&Step"), this);
    stepAct->setStatusTip(tr("Execute one Operation in current script"));
    connect(stepAct, SIGNAL(triggered()), mScript, SLOT(Step()));

    initAct = new QAction(tr("&Init"), this);
    initAct->setStatusTip(tr("Initialize variables for current script"));
    connect(initAct, SIGNAL(triggered()), mScript, SLOT(Initialize()));

    browserAct = new QAction(this);
    browserAct->setText("Browser");
    browserAct->setStatusTip(tr("show project browser"));
    browserAct->setEnabled(true);
    browserAct->setCheckable(false);
    connect(browserAct, SIGNAL(triggered(bool)), this, SLOT(ActivateBrowser()));  

    traceAct = new QAction(this);
    traceAct->setText("Trace");
    traceAct->setStatusTip(tr("show execution trace"));
    traceAct->setEnabled(true);
    connect(traceAct, SIGNAL(triggered(bool)), this, SLOT(ShowTrace()));  

    statAct = new QAction(this);
    statAct->setText("Statistics");
    statAct->setStatusTip(tr("show execution statistics"));
    statAct->setEnabled(true); 
    connect(statAct, SIGNAL(triggered(bool)), this, SLOT(ShowStatistics()));  

    consoleAct = new QAction(this);
    consoleAct->setText("Console");
    consoleAct->setStatusTip(tr("show error console"));
    consoleAct->setEnabled(true);
    connect(consoleAct, SIGNAL(triggered(bool)), this, SLOT(ShowConsole()));  

    extmanagerAct = new QAction(this);
    extmanagerAct->setText("Extensions");
    extmanagerAct->setStatusTip(tr("show extension manager"));
    extmanagerAct->setEnabled(true);
    connect(extmanagerAct, SIGNAL(triggered(bool)), this, SLOT(ShowExtensionManager()));  

    whatsAct = new QAction(tr("?"), this);
    whatsAct->setStatusTip(tr("Enter help mode"));
    whatsAct->setShortcut(QKeySequence::WhatsThis);
    connect(whatsAct, SIGNAL(triggered()), this, SLOT(EnterWhatsThis()));

}


// create a file menu
QMenu* DesProjectBrowser::CreateFileMenu(QWidget* parent) {
  FD_DP("DesProjectBrowser::CreateFileMenu()");
  // prep result
  QMenu* menu = new QMenu(tr("&File"), parent);
  UpdateFileMenu(menu,dynamic_cast<WspItemWindow*>(parent));
  // connect with updater
  connect(menu, SIGNAL(aboutToShow()), this, SLOT(UpdateFileMenu()));
  // done
  return menu;
}

// create an edit menu
QMenu* DesProjectBrowser::CreateEditMenu(QWidget* parent) {
  FD_DP("DesProjectBrowser::CreateEditMenu()");
  // prep result
  QMenu* menu = new QMenu(tr("Edit"), parent);
  UpdateEditMenu(menu, dynamic_cast<WspItemWindow*>(parent));
  // connect with updater
  connect(menu, SIGNAL(aboutToShow()), this, SLOT(UpdateEditMenu()));
  // done
  return menu;
}

// create a view menu
QMenu* DesProjectBrowser::CreateViewMenu(QWidget* parent) {
  FD_DP("DesProjectBrowser::CreateViewMenu()");
  // prep result
  QMenu* menu = new QMenu(tr("View"), parent);
  UpdateViewMenu(menu, dynamic_cast<WspItemWindow*>(parent));
  // connect with updater
  connect(menu, SIGNAL(aboutToShow()), this, SLOT(UpdateViewMenu()));
  // done
  return menu;
}

// create a windows menu
QMenu* DesProjectBrowser::CreateWindowsMenu(QWidget* parent) {
  FD_DP("DesProjectBrowser::CreateWindowsMenu()");
  // prep result
  QMenu* menu = new QMenu(tr("Windows"), parent);
  UpdateWindowsMenu(menu, dynamic_cast<WspItemWindow*>(parent));
  // connect with updater
  connect(menu, SIGNAL(aboutToShow()), this, SLOT(UpdateWindowsMenu()));
  // done
  return menu;
}


// create a file menu
QMenu* DesProjectBrowser::CreateHelpMenu(QWidget* parent) {
  FD_DP("DesProjectBrowser::CreateHelpMenu()");
  // prep result (extra space to suppress osx spotlight
  QMenu* menu = new QMenu(tr("&Help "), parent);
  // populate with my actions
  menu->addAction(aboutAct);
  menu->addAction(helpAct);
  menu->addAction(whatsAct);
 // done
  return menu;
}


// create all my menues
void DesProjectBrowser::InstallMenus(){

  FD_DP("DesProjectBrowser::InstallMenues()");

  // file menu (export)
  mFileMenu = CreateFileMenu(this);
  menuBar()->addMenu(mFileMenu);

  // edit menu (export)
  mEditMenu = CreateEditMenu(this);
  menuBar()->addMenu(mEditMenu);
 
  // view menu (export)
  mViewMenu = CreateViewMenu(this);
  menuBar()->addMenu(mViewMenu);
 
  // windows menu (export)
  mWindowsMenu = CreateWindowsMenu(this);
  menuBar()->addMenu(mWindowsMenu);


  //menuBar()->addSeparator();

  // help menu
  mHelpMenu = CreateHelpMenu(this);
  menuBar()->addMenu(mHelpMenu);
}

// get item window by id
WspItemWindow* DesProjectBrowser::Window(int id) {
  foreach(QWidget *widget, QApplication::topLevelWidgets()) {
    WspItemWindow* iwindow = qobject_cast<WspItemWindow*>(widget);
    if(!iwindow) continue;
    if(iwindow->Id()!=id) continue;
    return iwindow;
  }
  return 0;
}

// get top window  (0<>project browser)
WspItemWindow* DesProjectBrowser::ActiveWindow(void) {
  // old version: seek (no good: when running e.g. dot, keyboard focus is lost
  /*
  foreach(QWidget *widget, QApplication::topLevelWidgets()) {
    WspItemWindow* iwindow = qobject_cast<WspItemWindow*>(widget);
    if(!iwindow) continue;
    if(!iwindow->isActiveWindow()) continue;
    return iwindow;
  }
  */
  // new as of 201104
  WspItemWindow* iwindow=qobject_cast<WspItemWindow*>(QApplication::activeWindow());
  return iwindow;
}

// track to window
void DesProjectBrowser::TrackActiveWindow(int id) {
  FD_DP("DesProjectBrowser::TrackActiveWindow" << id);
  mTopItemId=id;
  // update variable browser
  WspItemWindow* iwin=Window(id);
  if(iwin)
    if(iwin->Item()->type()==WspItem::ITVariable)
      mVariableBrowser->ActiveItem(iwin->Name());
}


// activate project browser window
void DesProjectBrowser::ActivateBrowser(void) {
  FD_DS("DesProjectBrowser::ActivateBrowser()");
  // make sure other events have been dealt with
  QApplication::processEvents(QEventLoop::ExcludeUserInputEvents);
  this->raise();
  this->activateWindow();
}

// activate item window
void DesProjectBrowser::ActivateWindow(void) {
  FD_DS("DesProjectBrowser::ActivateWindow()");
  // figure item id from sender
  QAction* wact =qobject_cast<QAction*>(sender());
  if(!wact) return;
  QVariant prop = wact->property("ActivateId");
  if(!VIODES_QVAR_IS_INT(prop)) return;
  int id = prop.toInt();
  ActivateWindow(id);
}


// activate item window
void DesProjectBrowser::ActivateWindow(int id) {
  FD_DS("DesProjectBrowser::ActivateWindow(): id " << id);
  WspItemWindow* iwin= Window(id);
  // fallback: browser
  if(!iwin) {
    ActivateBrowser();
    return;
  }
  // activate window
  iwin->activateWindow();
  iwin->raise();
  // browser allways visible
  mVariableBrowser->raise();
  // tell browser
  mVariableBrowser->ActiveItem(iwin->Name());
}


// activate variable window
void DesProjectBrowser::ActivateVariable(const QString& vname) {
  FD_DS("DesProjectBrowser::ActivateVariable():  " << VioStyle::StrFromQStr(vname));
  WspVariable* var = mVariables->At(vname);
  if(!var) return;
  ActivateWindow(var->Id());
}


// raise all windows (browser on top)
void DesProjectBrowser::RaiseAllWindows(void) {
  foreach(QWidget *widget, QApplication::topLevelWidgets()) {
    widget->raise();
  }
  mVariableBrowser->raise();
}

// close all windows
void DesProjectBrowser::CloseAllWindows(void) {
  foreach(QWidget *widget, QApplication::topLevelWidgets()) {
    WspItemWindow* iwindow = qobject_cast<WspItemWindow*>(widget);
    if(!iwindow) continue; // incl. dont close browser, since it is no iwindow
    iwindow->close();
  }
}

// raise item window
void DesProjectBrowser::RaiseWindow(void) {
  FD_DS("DesProjectBrowser::RaiseWindow()");
  // figure item id from sender
  QAction* wact =qobject_cast<QAction*>(sender());
  if(!wact) return;
  QVariant prop = wact->property("ActivateId");
  if(!VIODES_QVAR_IS_INT(prop)) return;
  int id = prop.toInt();
  RaiseWindow(id);
}


// raise item window
void DesProjectBrowser::RaiseWindow(int id) {
  FD_DS("DesProjectBrowser::RaiseWindow(): id " << id);
  WspItemWindow* iwin= Window(id);
  // bail out on invalid id
  if(!iwin) return;
  // raise window
  iwin->raise();
  // browser allways visible
  mVariableBrowser->raise();
  // tell browser
  mVariableBrowser->ActiveItem(iwin->Name());
}


// raise variable window
void DesProjectBrowser::RaiseVariable(const QString& vname) {
  FD_DS("DesProjectBrowser::RaiseVariable():  " << VioStyle::StrFromQStr(vname));
  WspVariable* var = mVariables->At(vname);
  if(!var) return;
  RaiseWindow(var->Id());
}


// raise variable window
void DesProjectBrowser::RaiseFunction(const QString& fname) {
  FD_DS("DesProjectBrowser::RaiseFunction():  " << VioStyle::StrFromQStr(fname));
  WspFunction* fnct = mFunctions->At(fname);
  if(!fnct) return;
  RaiseWindow(fnct->Id());
}


// show variable
void DesProjectBrowser::ShowVariable(const QString& varname, bool on) {
  FD_DS("DesProjectBrowser::ShowVariable(" << VioStyle::StrFromQStr(varname) << ", " << on << ")");
  WspVariable* var = mVariables->At(varname);
  if(!var) return;
  if(!var->Visual()) return;
  WspItemWindow* window= Window(var->Id());
  FD_DS("DesProjectBrowser::ShowVariable(..): win at " << window << " for id " << var->Id());
  // hide
  if(!on) {
    if(!window) return;
    window->close();
    delete window;
    return;
  }
  // create
  if(!window) {
    window = new WspItemWindow(var,this);
    window->show();
    connect(window,SIGNAL(NotifyWindowActivate(int)),this, SLOT(TrackActiveWindow(int)));
    /*
    connect(var,SIGNAL(MouseDoubleClickTrans(const faudes::Transition&)),
      this,SIGNAL(MouseDoubleClickTrans(const faudes::Transition))); 
    connect(var,SIGNAL(MousePressEvent(faudes::Idx)),
      this,SIGNAL(MousePressEvent(faudes::Idx))); 
    */
  } 
  // bring to front / update
  //window->activateWindow();
  window->raise();
  emit ShowItemNotify(varname, on);
}


// show function
void DesProjectBrowser::ShowFunction(const QString& fname, bool on) {
  FD_DS("DesProjectBrowser::ShowFunction(" << VioStyle::StrFromQStr(fname) << ", " << on << ")");
  WspFunction* fnct = mFunctions->At(fname);
  if(!fnct) return;
  WspItemWindow* window= Window(fnct->Id());
  FD_DS("DesProjectBrowser::ShowFunctions(..): win at " << window << " for id " << fnct->Id());
  // hide
  if(!on) {
    if(!window) return;
    window->close();
    delete window;
    return;
  }
  // create
  if(!window) {
    window = new WspItemWindow(fnct,this);
    window->show();
    connect(window,SIGNAL(NotifyWindowActivate(int)),this, SLOT(TrackActiveWindow(int)));
    /*
    connect(var,SIGNAL(MouseDoubleClickTrans(const faudes::Transition&)),
      this,SIGNAL(MouseDoubleClickTrans(const faudes::Transition))); 
    connect(var,SIGNAL(MousePressEvent(faudes::Idx)),
      this,SIGNAL(MousePressEvent(faudes::Idx))); 
    */
  } 
  // bring to front / update
  //window->activateWindow();
  window->raise();
  emit ShowItemNotify(fname, on);
}


// show browser dock
void DesProjectBrowser::ShowVariables(bool on) {
  //bail out on old semantics
  if(!on) return;
  // select tab
  mTabs->setCurrentWidget(mVariablesTab);
}

// show browser dock
void DesProjectBrowser::ShowSimulator(bool on) {
  //bail out on old semantics
  if(!on) return;
  // select tab
  mTabs->setCurrentWidget(mSimulatorTab);
}

// show script
void DesProjectBrowser::ShowScript(bool on) {
  //bail out on old semantics
  if(!on) return;
  // select tab
  mTabs->setCurrentWidget(mScriptTab);
}

// show simulator trace
void DesProjectBrowser::ShowTrace(bool on) {
  FD_DP("DesProjectBrowser::ShowTrace(" << on << ")");
  WspItemWindow* tracewin = Window(mSimulator->Trace()->Id());
  if(on && tracewin) {
    tracewin->raise();
  }
  if(on && !tracewin) {
    tracewin = new WspItemWindow(mSimulator->Trace(),this);
    tracewin->show();
  }
  if(!on && tracewin) {
    delete tracewin;
  }
}

// show simulator stats
void DesProjectBrowser::ShowStatistics(bool on) {
  FD_DP("DesProjectBrowser::ShowStatistics(" << on << ")");
  WspItemWindow* statswin = Window(mSimulator->Statistics()->Id());
  if(on && statswin) {
    statswin->raise();
  }
  if(on && !statswin) {
    statswin = new WspItemWindow(mSimulator->Statistics(),this);
    statswin->show();
  }
  if(!on && statswin) {
    delete statswin;
  }


  (void) on;
  /*
  if(on) {
    mVariables->AddGuest("< Stoch >","Statistics", mSimulator->StatisticsWidget());
  } else {
    mVariables->RemoveGuest("< Stoch >");
  }
  */
}


// show console
void DesProjectBrowser::ShowConsole(bool on) {
  FD_DP("DesProjectBrowser::ShowConsole(" << on << ")");
  WspItemWindow* conwin = Window(mConsole->Id());
  if(on && conwin) {
    conwin->raise();
  }
  if(on && !conwin) {
    conwin = new WspItemWindow(mConsole,this);
    conwin->show();
  }
  if(!on && conwin) {
    delete conwin;
  }
}

// show extension manager
void DesProjectBrowser::ShowExtensionManager(bool on) {
  FD_DP("DesProjectBrowser::ShowExtensionManager(" << on << ")");
  WspItemWindow* conwin = Window(mExtensionManager->Id());
  if(on && conwin) {
    conwin->raise();
  }
  if(on && !conwin) {
    conwin = new WspItemWindow(mExtensionManager,this);
    conwin->show();
  }
  if(!on && conwin) {
    delete conwin;
  }
}

// Update file menu (by sender/active window)
void DesProjectBrowser::UpdateFileMenu(void) {
  // figure which window
  QMenu* menu = qobject_cast<QMenu*>(sender());
  if(!menu) return;
  // do we have an active item window?
  WspItemWindow* iwin = ActiveWindow();
  // pass on
  UpdateFileMenu(menu,iwin);
} 

// Update file menu (by parameters)
void DesProjectBrowser::UpdateFileMenu(QMenu* menu, WspItemWindow* iwin) {
  if(!menu) return;
  FD_DP("DesProjectBrowser::UpdateFileMenu()");
  menu->clear();
  // open recent submenu
  QSettings settings;
  QStringList files = settings.value("recentFileList").toStringList();
  int nfiles = qMin(files.size(), (int)MaxRecentFiles);
  for(int i = 0; i < nfiles; ++i) {
    QString text = tr("&%1 %2").arg(i + 1).arg(strippedName(files[i]));
    recentFileActs[i]->setText(text);
    recentFileActs[i]->setData(files[i]);
    recentFileActs[i]->setVisible(true);
  }
  for (int j = nfiles; j < MaxRecentFiles; ++j)
    recentFileActs[j]->setVisible(false);
  QMenu* recent = new QMenu(tr("Open Recent"), menu);
  for (int i = 0; i < MaxRecentFiles; ++i)
      recent->addAction(recentFileActs[i]);
  recent->setEnabled(nfiles > 0);
  // file menu
  menu->addAction(newAct);
  menu->addAction(openAct);
  menu->addMenu(recent);
  menu->addAction(saveAsAct);
  menu->addAction(saveAct);
  // only in browser
  if(!iwin) {
    // import/export
    menu->addSeparator();
    menu->addAction(fauimpAct);
    menu->addAction(fauexpAct);
    // general variable file menu
    menu->addSeparator();
    menu->addAction(newvarAct);
    menu->addAction(allloadAct);
    menu->addAction(allsaveAct);
  }
  // shall we do an item  file menu ?
  if(iwin) { FD_DP("DesProjectBrowser::UpdateFileMenu(): Update for item " << VioStyle::StrFromQStr(iwin->Item()->Name())); };
  // do for variable file menu
  if(iwin) {
    menu->addSeparator();
    menu->addActions(iwin->FileActions());
  }
  // quit
#ifndef Q_WS_MAC
  menu->addSeparator();
  menu->addAction(exitAct);
#endif
  FD_DP("DesProjectBrowser::UpdateFileMenu(): Done");
 }

// Update edit menu (by sender/active window)
void DesProjectBrowser::UpdateEditMenu(void) {
  // figure which window
  QMenu* menu = qobject_cast<QMenu*>(sender());
  if(!menu) return;
  // do we have an active item window?
  WspItemWindow* iwin = ActiveWindow();
  // pass on
  UpdateEditMenu(menu,iwin);
} 

// Update edit menu (by parameters)
void DesProjectBrowser::UpdateEditMenu(QMenu* menu, WspItemWindow* iwin) {
  if(!menu) return;
  FD_DP("DesProjectBrowser::UpdateEditMenu()");
  QAction* wact;
  // clear
  menu->clear();
  // shall we do an item view menu ?
  if(iwin) { FD_DP("DesProjectBrowser::UpdateEditMenu(): Update for item " << VioStyle::StrFromQStr(iwin->Item()->Name())); };
  // do for item view
  if(iwin) {
    menu->addActions(iwin->EditActions());
    return;
  }
  // have dummy default
  FD_DP("DesProjectBrowser::UpdateEditMenu(): Update for dummy");
  wact=menu->addAction("Undo");
  wact->setShortcut(tr("Ctrl+Z"));
  wact->setEnabled(false);
  wact=menu->addAction("Redo");
  wact->setShortcut(tr("Ctrl+Shift+Z"));
  wact->setEnabled(false);
  menu->addSeparator();
  wact= menu->addAction(tr("Cut"));
  wact->setShortcut(tr("Ctrl+X"));
  wact->setStatusTip(tr("Cut the current selection's contents to the clipboard"));
  wact->setEnabled(false);
  wact= menu->addAction(tr("Copy"));
  wact->setShortcut(tr("Ctrl+C"));
  wact->setStatusTip(tr("Copy the current selection's contents to the clipboard"));
  wact->setEnabled(false);
  wact= menu->addAction("Paste");
  wact->setShortcut(tr("Ctrl+V"));
  wact->setStatusTip(tr("Paste the clipboard's contents into the current selection"));
  wact->setEnabled(false);
}



// Update windows menu (by sender/active window)
void DesProjectBrowser::UpdateViewMenu(void) {
  // figure which window
  QMenu* menu = qobject_cast<QMenu*>(sender());
  if(!menu) return;
  // do we have an active item window?
  WspItemWindow* iwin = ActiveWindow();
  // pass on
  UpdateViewMenu(menu,iwin);
} 

// Update windows menu (by parameter)
void DesProjectBrowser::UpdateViewMenu(QMenu* menu, WspItemWindow* iwin) {
  if(!menu) return;
  FD_DP("DesProjectBrowser::UpdateViewMenu()");
  // shall we do a variables view menu ?
  if(iwin) { FD_DP("DesProjectBrowser::UpdateWindowMenu(): Update for item " << VioStyle::StrFromQStr(iwin->Item()->Name())); };
  // clear
  menu->clear();
  bool empty= true;
  // do for variable view
  if(iwin) {
    QList<QAction*> extra= iwin->ViewActions();
    if(extra.size()>0) {
      menu->addActions(extra);
      empty=false;
    }
  }
  // dummy
  if(empty){
    QAction* dummy;
    dummy = menu->addAction("Zoom In");
    dummy->setShortcut(tr("Ctrl++"));
    dummy->setEnabled(false);
    dummy = menu->addAction("Zoom Out");
    dummy->setShortcut(tr("Ctrl+-"));
    dummy->setEnabled(false);
    menu->setEnabled(false); // not operational on mac osx ?
  }
}

// Update windows menu (by sender/active window)
void DesProjectBrowser::UpdateWindowsMenu(void) {
  // figure which window
  QMenu* menu = qobject_cast<QMenu*>(sender());
  if(!menu) return;
  // do we have an active item window?
  WspItemWindow* iwin = ActiveWindow();
  // pass on
  UpdateWindowsMenu(menu,iwin);
} 

// Update windows menu (by parameter)
void DesProjectBrowser::UpdateWindowsMenu(QMenu* menu, WspItemWindow* iwin) {
  if(!menu) return;
  FD_DP("DesProjectBrowser::UpdateWindowsMenu()");
  QAction* wact;
  // shall we do a variables view menu ?
  if(iwin) { FD_DP("DesProjectBrowser::UpdateWindowMenu(): Update for item " << VioStyle::StrFromQStr(iwin->Item()->Name())); };
  // clear
  menu->clear();
  // browser
  menu->addAction(browserAct);
  menu->addAction(traceAct);
  menu->addAction(statAct);
  menu->addAction(consoleAct);
  //menu->addAction(extmanagerAct); // (currently disabled)
  // do for variable view (moved to view menu)
  /*
  if(iwin) {
    QList<QAction*> extra= iwin->ViewActions();
    if(extra.size()>0) {
      menu->addSeparator();
      menu->addActions(extra);
    }
  }
  */
  // set
  menu->addSeparator();
  // get window titles invl sort
  QMap<QString,int> wname2id;
  foreach(QWidget *widget, QApplication::topLevelWidgets()) {
    WspItemWindow* iwin = qobject_cast<WspItemWindow*>(widget);
    if(!iwin) continue;
    if(iwin->Id()==mConsole->Id()) continue;
    if(iwin->Id()==mExtensionManager->Id()) continue;
    wname2id[iwin->Title()]=iwin->Id();
  }
  // insert actions
  QMap<QString,int>::const_iterator wit;
  for(wit=wname2id.constBegin(); wit!=wname2id.constEnd();wit++) {
    WspItemWindow* iwin = Window(wit.value());
    if(!iwin) continue;
    // create action
    wact = new QAction(iwin->Title(), 0);
    wact->setProperty("ActivateId",iwin->Id());
    connect(wact, SIGNAL(triggered()), this, SLOT(ActivateWindow()));
    // record in menu
    menu->addAction(wact);
  }
  if(wname2id.size()>0) menu->addSeparator();
  // all
  wact = new QAction(tr("Bring all to front"), 0);
  connect(wact, SIGNAL(triggered()), this, SLOT(RaiseAllWindows()));
  menu->addAction(wact);
  wact = new QAction(tr("Close all"), 0);
  connect(wact, SIGNAL(triggered()), this, SLOT(CloseAllWindows()));
  menu->addAction(wact);
}




// load project
void DesProjectBrowser::LoadProject(QString fileName) {

  // make filename absolut
  fileName=QFileInfo(fileName).absoluteFilePath();

  // report 
  FD_DP("DesProjectBrowser::LoadProject(...): " << fileName);
  StatusBarMessage("Loading project ...");
  QApplication::setOverrideCursor(Qt::WaitCursor);

  // actuall reading
  int err=0;
  QString errmsg;
  try {
    faudes::TokenReader tr(VioStyle::LfnFromQStr(fileName));
    // my tag
    tr.ReadBegin("Project");
    mScript->Clear();
    mSimulator->Clear();
    mFunctions->Clear();
    mVariables->Read(tr);
    while(!tr.Eos("Project")) {
      faudes::Token token;
      tr.Peek(token);
      FD_DP("LoadProject(): peek " << token.StringValue());
      // read optional functions
      if(token.Type()==faudes::Token::Begin && token.StringValue()=="Functions") {
         mFunctions->Read(tr);
         continue;
      }
      // read optional project
      if(token.Type()==faudes::Token::Begin && token.StringValue()=="Script") {
         mScript->Read(tr);
         continue;
      }
      // read optional simulator
      if(token.Type()==faudes::Token::Begin && token.StringValue()=="Simulator") {
        mSimulator->Read(tr);
        continue;
      }
      // read optional guistates
      if(token.Type()==faudes::Token::Begin && token.StringValue()=="GuiState") {
        tr.ReadBegin("GuiState");
        while(!tr.Eos("GuiState")) {
          tr.Peek(token);
          if(token.Type()==faudes::Token::Option && token.StringValue()=="Trace") 
            ShowTrace();
          if(token.Type()==faudes::Token::Option && token.StringValue()=="Statistics") 
            ShowStatistics();
          tr.Get(token);
        }
        tr.ReadEnd("GuiState");
        continue;
      }         
      // skip other section
      if(token.Type()==faudes::Token::Begin) {
         tr.ReadBegin(token.StringValue());
         tr.ReadEnd(token.StringValue());
         continue;
      }    
      // break on error 
      break;   	
    }
    tr.ReadEnd("Project");
  } catch(faudes::Exception& exception) {  
    FD_DP("LoadProject::Read: cannot read file");
    mScript->Clear();
    mSimulator->Clear();
    mVariables->Clear();
    mFunctions->Clear();
    err=1;
    errmsg=VioStyle::QStrFromStr(exception.What());
    if(errmsg=="") errmsg="(token mismatch)";
  }

  // report
  QApplication::restoreOverrideCursor();
  if(err!=0) {
    QMessageBox mb(QMessageBox::Warning,tr("DESTool"),
	 tr("Cannot read file %1").arg(fileName),QMessageBox::Ok);
    mb.setInformativeText("libFAUDES Error: "+errmsg);
    mb.exec();
    return;
  }
  fileName=QFileInfo(fileName).canonicalFilePath();
  setCurrentFile(fileName); // absolut path is essential to get the recent file menu right

  // report 
  FD_DP("DesProjectBrowser::LoadProject(...): load variables");
  StatusBarMessage("Loading variables ...");
  mVariables->LoadAll();
  StatusBarMessage("Loading: done", 5000);
    
  // clean
  Modified(false);

  // default view (todo: store with project?)
  ShowVariables();
  ActivateBrowser();

  // restore browser geometry 
  QSettings settings;
  restoreGeometry(settings.value("geometry:browser:"+strippedName(curFile)).toByteArray());

  // hack (see also on load): track current dir (do we want this? for Lua?)
  if(mVariables->BaseDir()!="") {
    bool ok=QDir::setCurrent(mVariables->BaseDir());
    if(!ok)  FD_WARN("DesProjectBrowser::LoadProject(...): failed to set working dir");
  }

  FD_DP("DesProjectBrowser::LoadProject(...): done");
}

// save project
// return 0: all fine
// return 1: not all saved but user is happy
// return 2: not al saved but user is unhappy
int DesProjectBrowser::SaveProject(QString fileName) {

    // report
    StatusBarMessage("Saving project ...");
   
    // set basedir
    mVariables->BaseDir(QFileInfo(fileName).absolutePath());

    // record errors
    bool err=false;
  
    // doit: external files from variable pool
    WspExternalSaveDialog* xdiag = new WspExternalSaveDialog(mVariables,this);
    xdiag->setHasDiscard(true);
    xdiag->setText(QString("<b>Saving Project to file \"%1\"</b>").arg(fileName));
    int ext = xdiag->exec();
    if(ext == QDialog::Rejected) {
      StatusBarMessage("Saving project ... canceled/failed.", 5000);
      return 2;
    }


    // have cursor
    QApplication::setOverrideCursor(Qt::WaitCursor);

    // doit: my data
    try {
      faudes::TokenWriter tw(VioStyle::LfnFromQStr(fileName));
      faudes::Token stag;
      stag.SetBegin("Project");
      stag.InsAttributeString("application","DESTool");
      stag.InsAttributeString("version",VIODES_VERSION);
      tw << stag;
      tw << "\n";
      mVariables->Write(tw);
      tw << "\n";
      mFunctions->Write(tw);
      tw << "\n";
      mScript->Write(tw);
      tw << "\n";
      mSimulator->Write(tw);
      tw.WriteBegin("GuiState");
      if(Window(mSimulator->Trace()->Id())) tw.WriteOption("Trace");
      if(Window(mSimulator->Statistics()->Id())) tw.WriteOption("Statistics");
      tw.WriteEnd("GuiState");
      tw.WriteEnd("Project");
    } catch (faudes::Exception&) {  
      FD_DQ("DesWin::Write: cannot write file");
      err = true;
    }

    // get cursor back
    QApplication::restoreOverrideCursor();

    // report
    if(err) {
      StatusBarMessage("Saving project ... error in writing project file", 5000);
      QApplication::restoreOverrideCursor();
      QMessageBox::warning(this, tr("DESTool"),
        tr("Cannot write file %1").arg(fileName));
      return 2;
    }

    // save window state
    QSettings settings;
    settings.setValue("geometry:browser:"+strippedName(curFile), saveGeometry());

    // done
    setCurrentFile(fileName);
    if(!err) StatusBarMessage("Project saved", 5000);
    if(!err) Modified(false);

    // return
    if(err) return 2;

    // hack (see also on load): track current dir (do we want this? for Lua?)
    if(mVariables->BaseDir()!="") {
      bool ok=QDir::setCurrent(mVariables->BaseDir());
      if(!ok)  FD_WARN("DesProjectBrowser::SaveProject(...): failed to set worling dir");
    }
    return ext;
}




// record current name
void DesProjectBrowser::setCurrentFile(const QString &fileName) {
    curFile = fileName;
    if (curFile.isEmpty()) setWindowTitle(tr("DESTool[*]"));
    else {
        setWindowTitle(tr("%1[*] - %2").arg(strippedName(curFile))
                                    .arg(tr("DESTool")));

      QSettings settings;
      QStringList files = settings.value("recentFileList").toStringList();
      files.removeAll(fileName);
      files.prepend(fileName);
      while (files.size() > MaxRecentFiles)
          files.removeLast();

      settings.setValue("recentFileList", files);
    }

}


// reset interpreter
void DesProjectBrowser::LuaReset(void) {
  FD_DP("DesProjectBrowser::LuaReset()");
  mVariables->LuaInstall();
  mFunctions->LuaInstall();
}


// helper: get short name
QString DesProjectBrowser::strippedName(const QString &fullFileName) {
    return QFileInfo(fullFileName).fileName();
}

// helper: get title
QString DesProjectBrowser::Title(void) {
    return QFileInfo(curFile).baseName();
}

// helper: disply status
void DesProjectBrowser::StatusBarMessage(const QString& message, int time) {
    statusBar()->showMessage(message,time);
}







/*
 ************************************************
 ************************************************
 ************************************************
 ************************************************

 helper class: faudes import dialog 

 ************************************************
 ************************************************
 ************************************************
 ************************************************
 */


// construct
WspFaudesImportDialog::WspFaudesImportDialog(DesProjectBrowser* browser,QWidget* parent) : 
  QDialog(parent)
{
  FD_DI("WspFaudesImportDialog::WspFaudesImportDialog()");
  setWindowModality(Qt::ApplicationModal);
  pBrowser=browser;
  QVBoxLayout* vbox = new QVBoxLayout(this);

  // headline text
  QLabel* ltxt = new QLabel(
    "<p>Browse for libFAUDES files, set options, and click <i>Import</i>.</p>");
  vbox->addWidget(ltxt);

  // browse section
  QLabel* stxt  = new QLabel("Source Files");
  mSourceText  = new QTextEdit();
  mSourceText->setReadOnly(true);
  mSourceText->setHtml("<i>no files selected</i><br/>");
  QPushButton* bbut = new QPushButton("Browse");
  QHBoxLayout* hbox1= new QHBoxLayout();
  connect(bbut,SIGNAL(clicked()),this,SLOT(Browse()));
  hbox1->setSpacing(10);
  hbox1->setContentsMargins(0,0,0,0);
  hbox1->addWidget(stxt,0,Qt::AlignTop);
  hbox1->addWidget(mSourceText,0,Qt::AlignTop);
  hbox1->addWidget(bbut,0,Qt::AlignTop);
  vbox->addLayout(hbox1);

  // option group
  QGroupBox* gbox= new QGroupBox("Options");
  vbox->addWidget(gbox);
  mUseFileName = new QCheckBox("use filenames for variables");
  mUseFaudesName = new QCheckBox("use FAUDES names for variables");
  mMakePersistent = new QCheckBox("create persistent variables");
  mMakeVisual = new QCheckBox("create visual representations");
  mOverwrite = new QCheckBox("overwrite existing functions");
  mMakePersistent->setChecked(true);
  mMakeVisual->setChecked(true);
  mUseFileName->setChecked(true);
  mOverwrite->setChecked(true);

  QVBoxLayout* vboxo = new QVBoxLayout(gbox);
  vboxo->setSpacing(2);
  vboxo->setContentsMargins(2,2,2,2);
  //vboxo->addWidget(mUseFileName);
  //vboxo->addWidget(mUseFaudesName);
  vboxo->addWidget(mMakePersistent);
  vboxo->addWidget(mMakeVisual);
  vboxo->addWidget(mOverwrite);


  // bottom line buttons
  mBbox = new QDialogButtonBox();
  QPushButton* cbut= mBbox->addButton(QDialogButtonBox::Cancel);
  QPushButton* ibut= mBbox->addButton("Import",QDialogButtonBox::AcceptRole);
  connect(ibut, SIGNAL(clicked()), 
    this, SLOT(Import()));
  connect(cbut, SIGNAL(clicked()), 
    this, SLOT(Cancel()));
  // add to layout
  vbox->addSpacing(5);
  vbox->addWidget(mBbox);

  // delayed updater
  connect(mUseFileName,SIGNAL(clicked()),this,SLOT(Update()),Qt::QueuedConnection);
  connect(mUseFaudesName,SIGNAL(clicked()),this,SLOT(Update()),Qt::QueuedConnection);

  FD_DI("WspFaudesImportDialog::WspFaudesImportDialog(): done");
}

// destruct
WspFaudesImportDialog::~WspFaudesImportDialog() {}

// update visual
void WspFaudesImportDialog::Update(void) {
  FD_DI("WspFaudesImportDialog::Update()");
  // files
  QString srctxt;
  foreach(QString filename,mSourceList)
    srctxt = srctxt + QFileInfo(filename).fileName() + "<br/>";
  mSourceText->setHtml(srctxt);
  // fix options
  if(sender()==mUseFileName) 
    mUseFaudesName->setChecked(!mUseFileName->isChecked()); 
  if(sender()==mUseFaudesName) 
    mUseFileName->setChecked(!mUseFaudesName->isChecked()); 
}


// cancel
void WspFaudesImportDialog::Cancel(void) {
  FD_DI("WspFaudesImportDialog::Cancel()");
  reject();
}

// import
void WspFaudesImportDialog::Import(void) {
  FD_DI("WspFaudesImportDialog::Import()");
  // link unlinked
  pBrowser->FaudesImport(mSourceList,mMakePersistent->isChecked(),mMakeVisual->isChecked(),mOverwrite->isChecked());
  // done
  accept();
}

// browse
void WspFaudesImportDialog::Browse(void) {
  FD_DI("WspFaudesImportDialog::Browse()");
  // have dialog
  QFileDialog* fdiag = new QFileDialog();
  QSettings settings;
  fdiag->restoreState(settings.value("importFileDialog").toByteArray());
  fdiag->setNameFilter(
    "Any File (*.*);;FAUDES XML format (*.ftx);;FAUDES Generators (*.gen);;FAUDES Alphabets (*.alph);;FAUDES Lua Scripts (*.lua)");
  fdiag->setFileMode(QFileDialog::ExistingFiles);
  fdiag->setAcceptMode(QFileDialog::AcceptOpen);
  fdiag->setWindowTitle("Select File(s) to Import");
  // run dialog
  bool ok=fdiag->exec();
  // maintain settings
  settings.setValue("importFileDialog", fdiag->saveState());
  // exit on cancel
  if(!ok)  { delete fdiag; return; };  
  // retrieve my data
  mSourceList=fdiag->selectedFiles();
  // Update visual
  Update();
  //clean up and done
  delete fdiag;
}

/*
 ************************************************
 ************************************************
 ************************************************
 ************************************************

 helper class: faudes export dialog 

 ************************************************
 ************************************************
 ************************************************
 ************************************************
 */


// construct
WspFaudesExportDialog::WspFaudesExportDialog(DesProjectBrowser* browser,QWidget* parent) : 
  QDialog(parent)
{
  FD_DI("WspFaudesExportDialog::WspFaudesExportDialog()");
  setWindowModality(Qt::ApplicationModal);
  pBrowser=browser;
  QVBoxLayout* vbox = new QVBoxLayout(this);

  // headline text
  QLabel* ltxt = new QLabel(
    "<p>Browse for destination path, check items to export, and click <i>Export</i>.</p>");
  vbox->addWidget(ltxt);

  // browse section
  QLabel* stxt  = new QLabel("Destination Path");
  mDestText  = new QLineEdit();
  mDestText->setReadOnly(true);
  mDestText->setText("no path selected");
  QPushButton* bbut = new QPushButton("Browse");
  QHBoxLayout* hbox1= new QHBoxLayout();
  connect(bbut,SIGNAL(clicked()),this,SLOT(Browse()));
  hbox1->setSpacing(10);
  hbox1->setContentsMargins(0,0,0,0);
  hbox1->addWidget(stxt,0,Qt::AlignTop);
  hbox1->addWidget(mDestText,0,Qt::AlignTop);
  hbox1->addWidget(bbut,0,Qt::AlignTop);
  vbox->addLayout(hbox1);

  // setup list models
  mTodoVariables = new QListWidget();
  for(int i=0; i< pBrowser->mVariables->Size(); i++) {
    WspVariable* var=pBrowser->mVariables->At(i);
    if(!var) continue;
    QListWidgetItem* vitem = new QListWidgetItem();
    QString rfname=QString("%1 \t(file \"%2.ftx\")").arg(var->Name()).arg(var->Name());
    if(dynamic_cast<const faudes::Generator*>(var->FaudesValue()))
      rfname=QString("%1 \t(file \"%2.gen\")").arg(var->Name()).arg(var->Name());
    if(dynamic_cast<const faudes::EventSet*>(var->FaudesValue()))
      rfname=QString("%1 \t(file \"%2.alph\")").arg(var->Name()).arg(var->Name());
    vitem->setData(Qt::DisplayRole,rfname);
    vitem->setData(Qt::UserRole,var->Name());
    vitem->setCheckState(Qt::Checked);
    vitem->setFlags(Qt::ItemIsUserCheckable | Qt::ItemIsEnabled);
    mTodoVariables->addItem(vitem);
  }
  mTodoVariables->sizePolicy().setVerticalStretch(100); 
 

  // setup list models
  mTodoFunctions = new QListWidget();
  for(int i=0; i< pBrowser->mFunctions->Size(); i++) {
    WspFunction* fnct=pBrowser->mFunctions->At(i);
    if(!fnct) continue;
    QListWidgetItem* vitem = new QListWidgetItem();
    QString rfname=QString("%1 \t(file \"%2.rti\")").arg(fnct->Name()).arg(fnct->Name());
    if(fnct->IsPlainScript())
      rfname=QString("%1 \t(file \"%2.lua\")").arg(fnct->Name()).arg(fnct->Name());
    vitem->setData(Qt::DisplayRole,rfname);
    vitem->setData(Qt::UserRole,fnct->Name());
    vitem->setCheckState(Qt::Checked);
    vitem->setFlags(Qt::ItemIsUserCheckable | Qt::ItemIsEnabled);
    mTodoFunctions->addItem(vitem);
  }
  mTodoFunctions->sizePolicy().setVerticalStretch(100); 

  // setup list models
  mTodoSimulation = new QListWidget();
  QString tname;
  QString sfname = pBrowser->Title();
  if(sfname!="") sfname+="_";
  if(pBrowser->mSimulator->SimSupervisor()) { sfname+="supervisor"; tname="Supervisor Simulation";}
  if(pBrowser->mSimulator->SimPlant()) { sfname+="plant"; tname="Plant Simution";}
  if(pBrowser->mSimulator->SimClosedloop()) { sfname+="closedloop"; tname="Closed-Loop Simulation";}
  if(pBrowser->mSimulator->SimAll()) { sfname+="all"; tname="Simulation, all generators";}
  sfname+=".sim";
  QListWidgetItem* vitem = new QListWidgetItem();
  QString rfname=QString("%1 \t(file \"%2\")").arg(tname).arg(sfname);
  vitem->setData(Qt::DisplayRole,rfname);
  vitem->setData(Qt::UserRole,sfname);
  vitem->setCheckState(Qt::Checked);
  vitem->setFlags(Qt::ItemIsUserCheckable | Qt::ItemIsEnabled);
  mTodoSimulation->addItem(vitem);
  mTodoSimulation->setMinimumSize(QSize(100, 30));
  mTodoSimulation->setMaximumSize(QSize(10000, 30));
  mTodoSimulation->sizePolicy().setVerticalStretch(0); 

  // items group
  vbox->addWidget(new QLabel("Variables"));
  vbox->addWidget(mTodoVariables);
  if(mTodoFunctions->count()>0) {
    vbox->addWidget(new QLabel("Lua Scripts/Functions"));
    vbox->addWidget(mTodoFunctions);
  }
  vbox->addWidget(new QLabel("Simulation Configuration"));
  vbox->addWidget(mTodoSimulation);

  // bottom line text
  QLabel* btxt = new QLabel(
    "<p>Note: existing files will be overwritten</p>");
  vbox->addWidget(btxt);

  // bottom line buttons
  mBbox = new QDialogButtonBox();
  QPushButton* cbut= mBbox->addButton(QDialogButtonBox::Cancel);
  mExportButton = mBbox->addButton("Export",QDialogButtonBox::AcceptRole);
  mExportButton ->setEnabled(false);
  connect(mExportButton , SIGNAL(clicked()), 
    this, SLOT(Export()));
  connect(cbut, SIGNAL(clicked()), 
    this, SLOT(Cancel()));
  // add to layout
  vbox->addSpacing(5);
  vbox->addWidget(mBbox);

  // delayed updater

  FD_DI("WspFaudesExportDialog::WspFaudesExportDialog(): done");
}

// destruct
WspFaudesExportDialog::~WspFaudesExportDialog() {}

// cancel
void WspFaudesExportDialog::Cancel(void) {
  FD_DI("WspFaudesExportDialog::Cancel()");
  reject();
}

// import
void WspFaudesExportDialog::Export(void) {
  FD_DI("WspFaudesExportDialog::Export()");
  // extract data
  QStringList todovars;
  for(int i=0; i<mTodoVariables->count(); i++) {
    QListWidgetItem* witem = mTodoVariables->item(i);
    if(witem->checkState()!=Qt::Checked) continue;
    if(!VIODES_QVAR_IS_STR(witem->data(Qt::UserRole)))  continue;
    QString varname = witem->data(Qt::UserRole).toString();
    todovars << varname;
  }
  // extract data
  QStringList todofncts;
  for(int i=0; i<mTodoFunctions->count(); i++) {
    QListWidgetItem* witem = mTodoFunctions->item(i);
    if(witem->checkState()!=Qt::Checked) continue;
    if(!VIODES_QVAR_IS_STR(witem->data(Qt::UserRole)))  continue;
    QString fnctname = witem->data(Qt::UserRole).toString();
    todofncts << fnctname;
  }
  // extract data
  QStringList todosims;
  for(int i=0; i<mTodoSimulation->count(); i++) {
    QListWidgetItem* witem = mTodoSimulation->item(i);
    if(witem->checkState()!=Qt::Checked) continue;
    if(!VIODES_QVAR_IS_STR(witem->data(Qt::UserRole)))  continue;
    todosims << witem->data(Qt::UserRole).toString();
  }
  // doit
  pBrowser->FaudesExport(todovars,todofncts,todosims,mDestination);
  // done
  accept();
}

// browse
void WspFaudesExportDialog::Browse(void) {
  FD_DI("WspFaudesExportDialog::Browse()");
  // have dialog
  QFileDialog* fdiag = new QFileDialog();
  QSettings settings;
  fdiag->restoreState(settings.value("importFileDialog").toByteArray());
  fdiag->setFileMode(QFileDialog::Directory);
  fdiag->setAcceptMode(QFileDialog::AcceptOpen);
  fdiag->setWindowTitle("Select Destination Directory");
  // run dialog
  bool ok=fdiag->exec();
  // maintain settings
  settings.setValue("importFileDialog", fdiag->saveState());
  // exit on cancel
  if(!ok)  { delete fdiag; return; };  
  // retrieve my data ....
  if(fdiag->selectedFiles().size()==1) {
    mDestination=fdiag->selectedFiles().at(0);
    mDestText->setText(QFileInfo(mDestination).baseName());
    mExportButton->setEnabled(true);
  }
  //clean up and done
  delete fdiag;
}

