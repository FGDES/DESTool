/* extmanager.cpp  -  manage luaextensions   */


/*
   Extensionmanager for FAU Discrete Event Systems Library (libfaudes)

   Copyright (C) 2011 Thomas Moor

*/


#include "desstyle.h"
#include "extmanager.h"


/*
 ********************************
 ********************************
 ********************************

 implementation of Extension

 ********************************
 ********************************
 ********************************
 */

// construct
Extension::Extension(QObject* parent) :  WspItem(parent) {
  FD_DX("Extension::Extension(" << parent << "): " << this);

  // overwrite wsp item defaults
  mName="Extension";
  mPersistent=false;
  mItemType=ITExtension;
  mVisual=true;
  mViewSatelite=false;

  // configure std item
  setEditable(false);
  setEnabled(true);

}


// destruct
Extension::~Extension(void) {
  FD_DX("Extension::~Extension()");
}



// Overload wsp item functins: widgets
QWidget* Extension::NewMainWidget(void) {
  ExtensionMainWidget* widget = new ExtensionMainWidget(0);
  widget->Model(this);
  return widget;
}

// Overload wsp item functins: widgets
QWidget* Extension::NewSateliteWidget(void) {
  /*
  ExtensionSateliteWidget* widget = new ExtensionSateliteWidget(0);
  widget->Model(this);
  return widget;
  */
  return 0;
}

// Overload wsp item functins: widgets
QWidget* Extension::NewPropertyWidget(void) {
  ExtensionProperties* widget = new ExtensionProperties(Pool(),0);
  return widget;
}

// Overload context menu
QMenu* Extension::NewContextMenu(void) {
  FD_DS("Extension::NewContextMenu()");

  // set up menu
  QMenu* menu= new QMenu();
  menu->setTitle(Name());
 
  // construct and add item property widget
  QWidget* propwidget = NewPropertyWidget();
  QWidgetAction* propaction = new QWidgetAction(menu);
  propaction->setDefaultWidget(propwidget);
  menu->addAction(propaction);

  // done
  return menu;
}


// reimplement standarditem data access to mName
QVariant Extension::data(int role) const {
  if(role==Qt::ForegroundRole) {
    if(!Valid()) return VioStyle::Color(VioRed);
    if(!Enabled()) return VioStyle::Color(VioGrey);
  }
  return WspItem::data(role);
}

// My data
bool Extension::Enabled(void) const {
  return mEnabled;
}

// My data
bool Extension::Valid(void) const {
  return mValid;
}

// My data
void Extension::Enabled(bool flag) {
  // bail out on no changes
  if(mEnabled==flag) return;
  // set
  mEnabled=flag;
  // record modified
  Modified(true);
  // notify
  emit NotifyProperties();
}

// Link to file
const QString& Extension::ExtensionFile(void) const {
  return mFilename;
}

// Link to file (mandatory initialisation)
bool Extension::ExtensionFile(const QString& extfile) {
  // be pessimistic
  mValid=false;
  // insist in pool
  if(!Pool()) return false;
  // ensure absolute filename
  mFilename=extfile;
  if(QFileInfo(extfile).isRelative())
    mFilename=Pool()->BaseDir()+"/"+mFilename;
  // update status from filename
  mEnabled=false;
  if(QFileInfo(extfile).suffix()=="flx")
    mEnabled=true;
  // be optimistic
  mValid=true;
  // mini scan
  QString filename=mFilename;
  faudes::Token btag;
  try {
    faudes::TokenReader tr(VioStyle::LfnFromQStr(filename));
    tr.ReadBegin("LuaExtension",btag);
  } catch(faudes::Exception) {
    FD_QP("Test Extension: could not read LuaExtension tag");
    mValid=false;
  }
  // update name from file
  QString name=Name();
  if(btag.ExistsAttributeString("name"))
    name=VioStyle::QStrFromStr(btag.AttributeStringValue("name"));
  else {
    FD_QP("Test Extension: extension name not provided");
    mValid=false;
  }
  if(Pool()->Exists(name)) {
    FD_QP("Test Extension: doublet extension name");
    mValid=false;
  } else {
    Name(name);
  }
  // trigger update
  emit NotifyProperties();
  // done
  return true;
}


/*
 ********************************
 ********************************
 ********************************

 implementation of ExtensionMainWidegt

 ********************************
 ********************************
 ********************************
 */

// construct
ExtensionMainWidget::ExtensionMainWidget(QWidget* parent) :  QWidget(parent) {
  FD_DX("ExtensionMainWidget::ExtensionMainWidget(" << parent << "): " << this);

  // no model
  pExtension = 0;

  // have a layout (inner to outer)
  mVbox= new TableLayout();
  mVbox->setSpacing(0);
  mVbox->setContentsMargins(0,0,0,0);
  mContent = new QWidget(); 
  mContent->setLayout(mVbox);
  mContent->setSizePolicy(QSizePolicy::MinimumExpanding, QSizePolicy::MinimumExpanding);
  mScrollArea = new QScrollArea(this);
  mScrollArea->setVerticalScrollBarPolicy(Qt::ScrollBarAsNeeded);
  mScrollArea->setHorizontalScrollBarPolicy(Qt::ScrollBarAlwaysOff);
  mScrollArea->setWidgetResizable(true);
  mScrollArea->setWidget(mContent);
  mScrollArea->setSizePolicy(QSizePolicy::Minimum, QSizePolicy::Minimum);
  mScrollArea->setMinimumWidth(300);
  mScrollArea->setMinimumHeight(300);
  QHBoxLayout* hbox= new QHBoxLayout(this);
  hbox->setSpacing(0);
  hbox->setContentsMargins(0,0,0,0);
  hbox->addWidget(mScrollArea);
  FD_DX("ExtensionMainWidget::ExtensionMainWidget(): done");
}

// destruct
ExtensionMainWidget::~ExtensionMainWidget(void) {
  FD_DX("ExtensionMainWidget::~ExtensionMainWidget()");
  Model(0);
  FD_DX("ExtensionMainWidget::~ExtensionMainWidget(): ok");
}


// get model
Extension* ExtensionMainWidget::Model(void) {
  return pExtension;
}

// set model
void ExtensionMainWidget::Model(Extension* model) {
  // disconnect
  if(pExtension) {
    disconnect(pExtension,0,this,0);
  }
  pExtension=0;
  // connect
  pExtension=model;
  if(pExtension) {
    /*
    connect(pStatistics,SIGNAL(NotifyReset(void)),this,SLOT(Reset(void)));
    connect(pStatistics,SIGNAL(NotifyUpdate(void)),this,SLOT(Update(void)));
    Reset();
    */
  }
}
 



// update visual form extension file
void ExtensionMainWidget::Update(void) {
  FD_DX("ExtensionMainWidget::Update()");
  FD_DX("ExtensionMainWidget::Update(): done");
}


/* 
 ******************************************
 ******************************************
 ******************************************

 extension properties widget

 ******************************************
 ******************************************
 ******************************************
 */


ExtensionProperties::ExtensionProperties(WspPool* extpool, QWidget *parent) 
  : QWidget(parent) 
{
  FD_DI("ExtensionProperties::ExtensionProperties()");

  // keep ref to varpool an variable
  pExtPool = qobject_cast<ExtensionPool*>(extpool);
  mExtension="";

  // overall layout
  QVBoxLayout* vbox0= new QVBoxLayout(this);
  vbox0->setContentsMargins(2,2,2,2);
  vbox0->setSpacing(2);
  vbox0->addStretch(1);

  // edit file name
  mFileName=new QLabel(this);  
  mFileName->setText("< no item >");

  // edit label
  QLabel* edla = new QLabel(this);
  edla->setText("File:");

  // edit hbox
  QHBoxLayout* hbox1= new QHBoxLayout();
  hbox1->addWidget(edla);
  hbox1->addStretch(10);
  hbox1->addWidget(mFileName);
  vbox0->addLayout(hbox1);
  vbox0->addSpacing(10);

  // checkboxes: enabled
  mCheckEnabled = new VioCheckBox();
  mCheckEnabled->setText("Enabled");
  mCheckEnabled->setCheckable(true);
  vbox0->addWidget(mCheckEnabled);

  // update once, then and follow pool selection
  Update();
  QObject::connect(pExtPool,SIGNAL(NotifySelection()),this,SLOT(Update(void)));

  // connect checkboxes (we writing to the extension)
  QObject::connect(mCheckEnabled,SIGNAL(clicked(bool)),this,SLOT(Commit()));

  // connect variable (other writing to the extension, incl delete, incl my commit)
  QObject::connect(pExtPool,SIGNAL(NotifyProperties(void)),this,SLOT(Update(void)),
    Qt::QueuedConnection);


};

// connect changes
void ExtensionProperties::Connect(QString extension) {
  FD_DI("ExtensionProperties::Connect("<< extension <<")");
  // disconnect
  QObject::disconnect(mCheckEnabled, 0, 0, 0);
  if(Extension* ext = pExtPool->At(mExtension)) {
    QObject::disconnect(ext,SIGNAL(NotifyProperties(void)),this,0);
  }
  // record and update
  mExtension=extension;
  Update();
  // connect
  if(Extension* ext = pExtPool->At(mExtension)) {  
    FD_DI("ExtensionProperties::Connect("<< extension<<"): found item");
    // connect checkboxes (we writing to the extension)
    QObject::connect(mCheckEnabled,SIGNAL(clicked(bool)),ext,SLOT(Enabled(bool)));
    // connect variable (other writing to the extension)
    QObject::connect(pExtPool,SIGNAL(NotifyProperties(void)),this,SLOT(Update(void)));
  }
}

// commit changes
void ExtensionProperties::Commit(void) {
  // single extension
  mExtension =  pExtPool->ActiveItem();
  Extension* ext = pExtPool->At(mExtension);
  if(ext) {
    FD_DI("ExtensionProperties::Commit(): B"<< ext->Name());  
    if(sender()==mCheckEnabled) 
       ext->Enabled(mCheckEnabled->isChecked());
    return;
  }
  // selection
  QStringList selitems=pExtPool->SelectedItems();
  foreach(QString item, selitems) {
    Extension* ext = pExtPool->At(item);
    if(!ext) continue;   
    if(sender()==mCheckEnabled) 
    if(mCheckEnabled->checkState() != Qt::PartiallyChecked)
       ext->Enabled(mCheckEnabled->isChecked());
 }
} 

// update visual from extension
void ExtensionProperties::Update(void) {
  mExtension =  pExtPool->ActiveItem();
  Extension* ext = pExtPool->At(mExtension);
  // single select
  if(ext) {
    FD_DI("ExtensionProperties::Update(): for active ext "<< mExtension);
    // get name
    mFileName->setText(QFileInfo(ext->Filename()).baseName()+".flx");
    // get checkboxes
    mCheckEnabled->setChecked(ext->Enabled());
    mCheckEnabled->setEnabled(true);
    // done
    return;
  } 
  // set invalid/disabled
  mFileName->setText("< no item >");
  mCheckEnabled->ResetCheckState();
  // merge selection
  QStringList selitems=pExtPool->SelectedItems();
  foreach(QString item, selitems) {
    Extension* ext = pExtPool->At(item);
    if(!ext) continue;   
    mFileName->setText("< selection >");
    mCheckEnabled->MergeCheckState(ext->Enabled());
  }
} 




/***************************************************************
****************************************************************
****************************************************************

implementation: extension pool

****************************************************************
****************************************************************
****************************************************************/


// construct
ExtensionPool::ExtensionPool(QObject* parent) : 
  WspPool(WspItem::ITExtension,parent) {
  // configure
  mHeader="Extensions";
  setHorizontalHeaderLabels(QStringList() << mHeader);
}

// destruct
ExtensionPool::~ExtensionPool(void) {
}

// factory
Extension* ExtensionPool::NewItem(void) {
  return new Extension();
}

// overload
int ExtensionPool::DoInsert(int position, WspItem* item) {
  // type check
  Extension* ext = qobject_cast<Extension*>(item);
  if(!ext) return -1;
  // call base
  int pos = WspPool::DoInsert(position,item);
  return pos;
}


// extend anonymous
/*
void ExtensionPool::InsertAnonymous(int pos) {
  if(pos<0) pos=0;
  if(pos>Size()) pos = Size();
  Extension* witem=NewItem();
  witem->Name(NewName("System"));
  witem->FaudesType("System");
  DoInsert(pos,witem);
}
*/


// overload
Extension* ExtensionPool::At(int position) {
  return qobject_cast<Extension*>(WspPool::At(position));
}

// overload
const Extension* ExtensionPool::At(int position) const {
  return qobject_cast<const Extension*>(WspPool::At(position));
}

// overload
Extension* ExtensionPool::At(const QString& name) {
  return qobject_cast<Extension*>(WspPool::At(name));
}


// append file
int ExtensionPool::AppendFile(const QString& extfile) {
  int pos=Append(QFileInfo(extfile).baseName());
  if(pos<0) return -1;
  if(!At(pos)->ExtensionFile(extfile)) {
    Erase(pos);
    return -1;
  }
  return pos;
}

// load from directory
void ExtensionPool::Initialize(const QString& extdirname) {
  FD_QP("Scanning Extensions: ...");
  Clear();
  // figure directory
  QString dirname=extdirname;
  QDir    extdir(extdirname); 
  if(dirname=="") {
    extdir = QDir(qApp->applicationDirPath());
#ifdef Q_OS_MAC
    extdir.cdUp();  
    extdir.cd("plugins");
    extdir.cd("luaextensions");
#else
    extdir.cd("plugins");
    extdir.cd("luaextensions");
#endif
  }
  FD_DX("ExtensionPool::Initialize(): " << extdir.path());
  // scan directory
  BaseDir(extdir.canonicalPath());
  QStringList extlist=extdir.entryList(QDir::Files | QDir::Readable);
  foreach(QString extname, extlist) {
    QFileInfo extfile(extname);
    if((extfile.suffix()!="flx") && (extfile.suffix()!="flx_disabled")) continue;
    FD_QP("Found file \"" << extfile.baseName() << "\"");
    int pos=AppendFile(extfile.fileName());
    if(pos<0) FD_QP("Ignoring file \"" << extfile.baseName() << "\"");
  } 
  FD_QP("Scanning Extensions: done.");
}

// run context menu wrapper
void ExtensionPool::RunContextMenu(QPoint rPoint, const QString rName) {
  FD_DS("ExtensionPool::RunContextMenu(" << rName<<")");
  // have a menu
  QMenu* menu= 0;
  // figure my item
  int pos=Find(rName);
  Extension* witem=At(pos);
  if(!witem) pos=Size();
  // select singleton or notrhing 
  if(witem) ActiveItem(witem->Name());
  else ActiveItem("");
  // construct menu
  if(witem) menu= witem->NewContextMenu();
  else menu = new QMenu("Extension Menu");
  // separator
  if(witem) menu->addSeparator();
  // have an insert menu
  QAction* impaction= menu->addAction("Import Extension ...");
  impaction->setEnabled(true);
  QAction* delaction= menu->addAction("Delete Extension");
  delaction->setEnabled(witem!=0);
  // run
  QAction* selaction= menu->exec(rPoint);
  // deal with my buttons: delete
  if(selaction==delaction){
    Erase(rName);
  }
  // deal with my buttons: import
  if(selaction==impaction) {
    QFileDialog* fdiag = new QFileDialog();
    QSettings settings;
    fdiag->restoreState(settings.value("importFileDialog").toByteArray());
    fdiag->setNameFilter("Extensions (*.flx);;Any File (*.*)");
    fdiag->setFileMode(QFileDialog::ExistingFile);
    fdiag->setAcceptMode(QFileDialog::AcceptOpen);
    fdiag->setDefaultSuffix("flx");
    fdiag->setWindowTitle(QString("Import LuaExtension"));
    // run dialog
    QString fileName="";
    if(fdiag->exec()) 
      if(fdiag->selectedFiles().size()==1) 
        fileName=fdiag->selectedFiles().at(0);
    // maintain settings
    settings.setValue("importFileDialog", fdiag->saveState());
    // do the import
    AppendFile(fileName);
  }
  delete menu;
}

// run context menu wrapper
void ExtensionPool::RunContextMenu(QPoint rPoint) {
  WspPool::RunContextMenu(rPoint);
}

// apply changes to DESTool
void ExtensionPool::Install(void) {
  // allow user to bail out
  /*
  QMessageBox bailout;
  bailout.setText(QString(
      "<p><b>Install Extensions</b></p>"));
  bailout.setInformativeText(QString(
       "<p>Reconfiguration of extensions requires a re-start of the DESTool application. "
       "Changes to the current project may not be saved.</p>"
       "<p>Do you want to proceed?</p>"));
  bailout.setWindowTitle("DESTool");
  bailout.setIcon(QMessageBox::Information);
  QPushButton* disno = bailout.addButton(
      "No", QMessageBox::NoRole);
  QPushButton* disyes = bailout.addButton(
      "Yes", QMessageBox::YesRole);
  bailout.exec();
  if( bailout.clickedButton() == disno) return;
  */
  // go ahead
  FD_QP("Installing Extensions: ...");
  // have a progress bar
  //QProgressDialog progress("Installing Extensions", "Cancel", 0, 0, 0); 
  QProgressDialog progress("Installing Extensions", QString(), 0, 0, 0); 
  progress.setWindowTitle("DESTool");
  progress.setWindowModality(Qt::ApplicationModal);
  progress.setValue(0);
  progress.setMinimumDuration(2000); 
  // kill assistant (we quit DESTool anyway)
  // DesStyle::QuitAssistant();
  // collect all active files
  QStringList extfiles;
  // rename/copy files
  for(int pos=0; pos<Size(); pos++) {
    QFileInfo finf(At(pos)->Filename());
    // import file
    if(finf.canonicalPath()!=BaseDir()) {
      FD_QP("Installing Extensions: copy new extension \"" << finf.fileName() << "\"");
      progress.setValue(0);
      QString dstname= BaseDir() + "/" + finf.fileName();
      QFile srcfile(finf.canonicalFilePath());
      bool ok=srcfile.copy(dstname);
      if(!ok) 
        FD_QP("Installing Extensions: copy: i/o-error");
      At(pos)->Filename(dstname);
      finf=QFileInfo((At(pos)->Filename()));
    }
    // rename
    QString fname=finf.baseName();
    if(At(pos)->Enabled()) fname.append(".flx");
    else fname.append(".flx_disabled");
    if(finf.fileName()!=fname) {
      QString dstname= BaseDir() + "/" + fname;
      FD_QP("Installing Extensions: renaming \"" << finf.fileName() << "\"");
      QFile srcfile(finf.canonicalFilePath());
      bool ok=srcfile.rename(dstname);
      if(!ok) FD_QP("Installing Extensions: rename: i/o-error");
      At(pos)->Filename(dstname);
      finf=QFileInfo((At(pos)->Filename()));
    }
    // record
    extfiles << finf.fileName();
  }
  // delete files
  QDir extdir(BaseDir());
  QStringList extdirlist=extdir.entryList(QDir::Files | QDir::Readable);
  foreach(QString extname, extdirlist) {
    QFileInfo extfile(extname);
    if((extfile.suffix()!="flx") && (extfile.suffix()!="flx_disabled")) continue;
    if(extfiles.contains(extfile.fileName())) continue;
    FD_QP("Installing Extensions: deleting \"" << extname << "\"");
    QFile srcfile(BaseDir()+"/"+ extname);
    srcfile.rename(BaseDir()+"/" + extfile.baseName() + ".flx_deleted");
  }   
  // compile
  FD_QP("Installing Extensions: run dstinstall");
  // default aka linux
  QString dstinstall=qApp->applicationDirPath();
  dstinstall.append("/../bin/dstinstall");
  QStringList options;
  options
    << "-flx" << BaseDir()
    << "-dst" << "..";
#ifdef Q_WS_MAC
  dstinstall=qApp->applicationDirPath();
  dstinstall.append("/dstinstall");
  options.clear();
  options
    << "-flx" << BaseDir()
    << "-dst" << "../..";
#endif
#ifdef Q_WS_WIN32
  dstinstall=qApp->applicationDirPath();
  dstinstall.append("/dstinstall.exe");
  options.clear();
  options
    << "-flx" << QDir::toNativeSeparators(BaseDir())
    << "-dst" << ".";
#endif 
  QProcess doit;
  doit.setWorkingDirectory(qApp->applicationDirPath());
  doit.setProcessChannelMode(QProcess::MergedChannels);
  FD_DX("ExtensionPool::Install(): working dir " << VioStyle::LfnFromQStr(doit.workingDirectory()));
  doit.start(dstinstall, options);
  if(!doit.waitForStarted()) {
    FD_QP("Installing Extensions: failed to launch dstinstall at \"" << dstinstall << "\"");
  }
  while(true) {
    progress.setValue(1);
    bool stop=doit.state()!=QProcess::Running;
    //QApplication::processEvents(QEventLoop::ExcludeUserInputEvents);
    QApplication::processEvents();
    QString sret = QString::fromLocal8Bit(doit.readAllStandardOutput().constData());
    QStringList slist=sret.split("\n");
    QStringList::iterator sit;
    for(sit=slist.begin(); sit!=slist.end(); sit++) {
      if(!sit->isEmpty()) { FD_QP(VioStyle::LfnFromQStr(*sit)); };
    }
    if(stop) break;
  }
  if(doit.exitStatus()!=  QProcess::NormalExit)
    FD_QP("Installing Extensions: error during dstinstall");
  FD_QP("Installing Extensions: done.");
  progress.reset();
  // force quit application 
  /*
  QMessageBox quitdes;
  quitdes.setText(QString(
      "<p><b>Install Extensions</b></p>"));
  quitdes.setInformativeText(QString(
    "<p>You need to quit DESTool now.</p>"));
  quitdes.setWindowTitle("DESTool");
  quitdes.setIcon(QMessageBox::Information);
  QPushButton* qyes = quitdes.addButton(
      "Quit", QMessageBox::YesRole);
  quitdes.exec();
  qApp->closeAllWindows();
  QApplication::processEvents();
  QApplication::flush();
  quitdes.exec();
  qApp->quit();
  */
}


/*
 ************************************************
 ************************************************
 ************************************************
 ************************************************

 implementation  ExtensionPoolBrowser

 ************************************************
 ************************************************
 ************************************************
 ************************************************
 */

// Constructor 
ExtensionPoolBrowser::ExtensionPoolBrowser(ExtensionPool* pool,QWidget* parent) :
  QWidget(parent),
  pExtPool(pool)
{
  // have my views
  mPoolView = new WspPoolView(this);
  mPoolView->setSizePolicy(QSizePolicy::Expanding,QSizePolicy::Preferred);
  mPoolView->Model(pExtPool);
  mPoolView->horizontalHeader()->hide();
  mPoolView->setEditTriggers(QAbstractItemView::NoEditTriggers);
  mPoolView->setDragDropMode(QAbstractItemView::NoDragDrop);
  mProperties = new ExtensionProperties(pExtPool);
  mItemView = new WspItemView(pExtPool,this);

  // have gui elements
  mInstallButton = new QPushButton("Apply");
  connect(mInstallButton,SIGNAL(clicked()),pExtPool,SLOT(Install(void)));
  mInitializeButton = new QPushButton("Revert");
  connect(mInitializeButton,SIGNAL(clicked()),pExtPool,SLOT(Initialize(void)));
  mCancelButton = new QPushButton("Quit");
  // connect(mCancelButton,SIGNAL(clicked()),this,SLOT(Cancel(void)),Qt::QueuedConnection);
  connect(mCancelButton,SIGNAL(clicked()), qApp, SLOT(closeAllWindows()),Qt::QueuedConnection);

  // pass on view signals
  connect(mPoolView,SIGNAL(RaiseItemRequest(const QString&)),this,
	  SIGNAL(RaiseExtensionRequest(const QString&)));


  // sync properties/item view
  connect(mPoolView,SIGNAL(RaiseItemRequest(QString)),this,SLOT(Select(QString)));

  // have variable pool group
  QGroupBox* gbox1 = new QGroupBox();
  gbox1->setTitle("Available Extensions");
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

  // have controls properties group
  QHBoxLayout* hbox3= new QHBoxLayout();
  hbox3->setContentsMargins(2,2,2,2);
  hbox3->setSpacing(10);
  hbox3->addStretch(1);
  //hbox3->addWidget(mInitializeButton);
  hbox3->addWidget(mCancelButton);
  hbox3->addWidget(mInstallButton);
  //hbox3->addStretch(1);
  

  // construct left column
  QVBoxLayout* vboxl= new QVBoxLayout();
  vboxl->setContentsMargins(0,0,0,0);
  vboxl->setSpacing(0);
  vboxl->addWidget(gbox1);
  vboxl->addSpacing(10);
  vboxl->addWidget(gbox2);
  vboxl->addSpacing(10);
  vboxl->addLayout(hbox3);

  // construct right column
  QVBoxLayout* vboxr= new QVBoxLayout();
  vboxr->setContentsMargins(0,0,0,0);
  vboxr->setSpacing(0);
  vboxr->addWidget(mItemView);

  // overall layout
  QHBoxLayout* hbox= new QHBoxLayout(this);
  hbox->setContentsMargins(0,0,0,0);
  hbox->setSpacing(0);
  hbox->addLayout(vboxl);
  // hbox->addLayout(vboxr); // dont show main widget (not implemented)

  // my actions
  mNewAction = new QAction("New Variable", this);
  mNewAction->setToolTip("Introduce new variable");
  QObject::connect(mNewAction, SIGNAL(triggered()), mPoolView, SLOT(UserInsert()));
  mLoadAllAction = new QAction("Load All Variables", this);
  mLoadAllAction->setToolTip("Revert all variables from external file if linked");
  QObject::connect(mLoadAllAction, SIGNAL(triggered()), pExtPool, SLOT(LoadAll()));
  mSaveAllAction = new QAction("Save All Variables", this);
  mSaveAllAction->setToolTip("Save all variables to external file if linked");
  QObject::connect(mSaveAllAction, SIGNAL(triggered()), pExtPool, SLOT(SaveAll()));

  // my menu
  QString mActiveExtension="";
  mMenu = new QMenu(this);
  UpdateMenu();
  connect(mMenu, SIGNAL(aboutToShow()), this, SLOT(UpdateMenu()));


  // overwrite
  setSizePolicy(QSizePolicy::Expanding,QSizePolicy::Preferred);
}

// destructor
ExtensionPoolBrowser::~ExtensionPoolBrowser(void) {
}

// tell aboot my menu
QMenu* ExtensionPoolBrowser::Menu(void) {
  return mMenu;
}


// track pool clicks
void ExtensionPoolBrowser::Select(QString extname, bool on) {
  FD_DI("ExtensionPoolBrowser::Select(): for " << extname);
  // ignore if this variable is allready selected 
  if(on && mActiveExtension == extname) {
    FD_DI("ExtensionPoolBrowser::Select(): ignore");
    return;
  }
  // make variable active/deactive
  if(on) {
    mProperties->Connect(extname);
    mActiveExtension=extname;
  } else {
    mProperties->Connect("");
    mActiveExtension="";
  }
  // update selection model
  mPoolView->UserSelectionClear();
  mPoolView->UserSelect(extname,on);
  // done
  FD_DI("ExtensionPoolBrowser::Select(): done");
}


// update extension menu
void ExtensionPoolBrowser::UpdateMenu(void) {

  FD_DI("ExtensionPool::UpdateMenu(): for " << mActiveExtension);

  /*

  // reset
  mMenu->clear();
  mMenu->setTitle("Variables");

  // new and remove
  mMenu->addAction(mNewAction);
  mMenu->addAction(mRemoveUnusedAction);

  // load and save
  Extension* topvar = pVarPool->At(mActiveVariable);
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
  */

}

// user cancel
void ExtensionPoolBrowser::Cancel(void) {
  window()->close();
}


/*
 ********************************
 ********************************
 ********************************

 implementation of WspExtensionManager

 ********************************
 ********************************
 ********************************
 */

// construct
WspExtensionManager::WspExtensionManager(QObject* parent) :  WspItem(parent) {
  FD_DI("WspExtensionManager()");

  // overwrite wsp item defaults
  mName="Extension Manager";
  mPersistent=false;
  mItemType=ITExtensionManager;
  mVisual=true;
  mViewSatelite=false;

  // have an extension manager
  mExtPool = new ExtensionPool(this);

}

// destruct
WspExtensionManager::~WspExtensionManager(void) {
  FD_DI("WspExtensionManager::~WspExtensionManager()");
  //if(!mConsole->parent()) delete mConsole;
}

// Overload wsp item functins: widgets
QWidget* WspExtensionManager::NewMainWidget(void) {
  mExtPool->Initialize();
  QWidget* widget= new ExtensionPoolBrowser(mExtPool,0);
  return widget;
}







