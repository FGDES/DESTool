/** @file vditems.cpp  - Implementation */

/*
	FAU Discrete Event Systems Library (libfaudes)

	Copyright (C) 2009 Ruediger Berndt
	Copyright (C) 2009 Thomas Moor
*/


#include "wspitems.h"
#include "wspviews.h"


/**********************************************
 **********************************************
 **********************************************
 
 Implementation of WspItem

 **********************************************
 **********************************************
 **********************************************/
// statics
int WspItem::mIdCounter=0;

// constructor, (invalid item, needs at least a name and a pool)
WspItem::WspItem(QObject* parent) : 
    QObject(parent),
    mItemType(ITUndefined),
    mName(""),
    mId(mIdCounter),
    mFilename(""),
    mPersistent(true),
    mVisual(false),
    mShown(false),
    mLocked(false),
    mToolTip(""),
    mHtmlPage(""),
    mWhatsThis(""),
    mViewSatelite(false),
    mModified(false)
{
  FD_DI("WspItem::WspItem()");
  // record my name
  setProperty("Item",mName);
  // inc
  mIdCounter++;
  // configure std item
  setEditable(true);
  setEnabled(true);
}

// destruct
WspItem::~WspItem(void) {
  FD_DI("WspItem::~WspItem()");
  // signal to hide to all visuals
  ShowItem(false);
  // report
  FD_DI("WspItem::~WspItem(): done");
}

// reimplement standard item
int WspItem::type() const { return mItemType; }

// set name via pool
const QString&  WspItem::Name(const QString& rNewName) { 
  if(!Pool()) 
    DoName(rNewName);
  else 
    Pool()->ReName(mName,rNewName);
  return mName;
}

// Get core properties
WspPool* WspItem::Pool() const { return qobject_cast<WspPool*>(model()); }
const QString& WspItem::Name(void) const { return mName; }
int  WspItem::Id(void) const { return mId; }
const QString& WspItem::Filename() const { return mFilename; }
bool  WspItem::Persistent(void) const { return mPersistent; }
bool  WspItem::Visual(void) const { return mVisual; }
bool  WspItem::ViewSatelite(void) const { return mViewSatelite; }
bool  WspItem::Shown(void) const { return mShown; }
bool WspItem::Locked() const { return mLocked; }

// Get derived properties
const QString& WspItem::Title(void) const { return mName; }
bool WspItem::FileLinked(void) const { return !mFilename.isEmpty(); }

// Set core properties (virtual wrapper)
const QString& WspItem::Filename(const QString& rNewFilename) { DoFilename(rNewFilename); return mFilename; }
bool  WspItem::Persistent(bool vis) { DoPersistent(vis); return mPersistent; }
bool  WspItem::Visual(bool vis) { DoVisual(vis); return mVisual; }
bool  WspItem::Shown(bool vis) { mShown=vis; return mShown; }
bool  WspItem::Locked(bool lock) { DoLocked(lock); return mLocked; }


// read only class config
const QString& WspItem::FileTitle() const {return mFileTitle;};
const QString& WspItem::FileSuffix() const {return mFileSuffix;};
const QString& WspItem::FileFilter() const {return mFileFilter;};


// hook to sense change of pool
void WspItem::DoPool(WspPool* pPool) {
  (void) pPool;
}

// Set name, default implementation (called from the pool!!)
void WspItem::DoName(const QString& rNewName) { 
  if(mName==rNewName) return;
  FD_DI("WspItem::DoName " << VioStyle::StrFromQStr(mName) << " -> " 
    << VioStyle::StrFromQStr(rNewName));
  mName=rNewName;
  // record my name
  setProperty("Item",mName);
  setText(mName);
  // emit standard item
  emitDataChanged();
  // record modified
  Modified(true);
  // signal 
  emit NotifyProperties();
};

// Set filename, default
void WspItem::DoFilename(const QString& filename) {
  mFilename=filename;
  if(mFilename.isEmpty()) return;
  if(QFileInfo(filename).isRelative()) 
  if(Pool())
  if(Pool()->BaseDir()!="")
    mFilename = Pool()->BaseDir() + QDir::separator() + mFilename;
  mFilename=QFileInfo(mFilename).absoluteFilePath();
}

// Set persistence, default
void WspItem::DoPersistent(bool vis) { 
  mPersistent=vis;
}

// Set visual, default
void WspItem::DoVisual(bool vis) { 
  // bail out on trivial
  if(mVisual==vis) return;
  // record
  mVisual=vis;
  // notify
  if(!mVisual) {
    ShowItem(false);
  }
  // record modified
  Modified(true);
  // notify
  emit NotifyProperties();
}

// Set oersistenz, default
void WspItem::DoLocked(bool vis) { 
  mLocked=vis;
}


// reimplement standarditem data access to mName
QVariant WspItem::data(int role) const {
  switch(role) {
  case Qt::DisplayRole: return mName; break;
  case Qt::EditRole:    return mName; break;
  default: break;
  }
  return QStandardItem::data(role);
}

// reimplement standarditem data access to mName
void WspItem::setData(const QVariant& value, int role) {
  if((role==Qt::EditRole) || (role==Qt::DisplayRole)) {
    QString newname= value.toString();
    FD_DI("WspItem::setData(): for \"" << VioStyle::StrFromQStr(mName) << "\" to \"" <<
	  VioStyle::StrFromQStr(newname) << "\"");
    if(newname.isEmpty()) return;
    if(newname==mName) return;
    Name(newname); // incl emit data changed and ask pool
    return;
  } 
  QStandardItem::setData(value,role);
}


// helper: convert filename to be relative to given basedir
QString WspItem::RelativeFilename(const QString& rBaseDir, const QString& rFilename) {
  QString filename=rFilename;
  QFileInfo fileinfo(filename);
  QString filedir=fileinfo.absolutePath();
  // case a) directories match anyway
  if(filedir==rBaseDir) {
    filename=fileinfo.fileName();
    FD_DS("WspItem::RelativeFilename(): (a) " << VioStyle::StrFromQStr(filename));
    return filename;
  }
  // case b) make relative by qt
  QDir dbasedir(rBaseDir);
  filename = dbasedir.relativeFilePath(fileinfo.absoluteFilePath());
  FD_DS("WspItem::RelativeFilename(): (b) " << VioStyle::StrFromQStr(filename));
  return filename;
}

// helper: convert internal filename to be relative to given basedir
QString WspItem::RelativeFilename(const QString& rBaseDir) const {
  // default to the pool's base dir
  QString basedir=rBaseDir;
  if(basedir.isEmpty()) if(Pool()) basedir=Pool()->BaseDir();
  QString filename = Filename();
  return RelativeFilename(basedir,filename);
}

// Common interface for file IO
void WspItem::Write(faudes::TokenWriter& rTw, const QString& rLabel) {
  DoWrite(rTw,rLabel); 
}

// Common interface for file IO
void WspItem::Write(const QString& rFilename, const QString& rLabel) {
  faudes::TokenWriter tw(VioStyle::LfnFromQStr(rFilename));
  Write(tw,rLabel);
  Modified(false);
}

// Common interface for file IO
void WspItem::Read(faudes::TokenReader& rTr, const QString& rLabel) {
  DoRead(rTr,rLabel); }

// Common interface for file IO
void WspItem::Read(const QString& rFilename, const QString& rLabel) {
  faudes::TokenReader tr(VioStyle::LfnFromQStr(rFilename));
  Read(tr,rLabel);
  Modified(false);
}

// Common interface for file IO
void WspItem::ExternalWrite(const QString& rFilename, const QString& rLabel) const {
  DoExternalWrite(rFilename,rLabel);
}

// Common interface for file IO
void WspItem::ExternalRead(const QString& rFilename, const QString& rLabel) {
  DoExternalRead(rFilename,rLabel); 
  Modified(false);
}

// Flush()
void WspItem::Flush() {
}

// Save
int WspItem::Save() {
  Flush();
  if(!FileLinked()) return 1;
  QString filename=mFilename;
  FD_DI("WspItem::Save(): " << Name() << " to file " << filename);
  int err=0;
  try {
    ExternalWrite(filename);
    Modified(false); // note: properties have not been saved, but they are still flagged modified in the item pool
  }
  catch(faudes::Exception&) {
    err=1;
  }
  return err;
}

// Load
int WspItem::Load() {
  if(!FileLinked()) return 1;
  QString filename=mFilename;
  FD_DI("WspItem::Load(): " << Name() << " from file " << filename);
  int err=0;
  try {
    ExternalRead(filename);
  }
  catch(faudes::Exception&) {
    err=1;
  }
  FD_DI("WspItem::Load(): done with " << err);
  return err;
}


// Dummy defaults
const QString& WspItem::ToolTip(void) { return mToolTip; }
const QString& WspItem::HtmlPage(void) { return mHtmlPage; }
const QString& WspItem::WhatsThis(void) { return mWhatsThis; }
void WspItem::ToolTip(const QString& rText) {
  mToolTip=rText;
  mWhatsThis= mToolTip + "<a href=\"" + mHtmlPage + "\">[Help]</a>";
  setToolTip(mToolTip);
  setWhatsThis(mWhatsThis);
}
void WspItem::HtmlPage(const QString& rText) {
  mHtmlPage=rText;
  mWhatsThis= mToolTip + "<a href=\"" + mHtmlPage + "\">[Help]</a>";
  setToolTip(mToolTip);
  setWhatsThis(mWhatsThis);
}


// Modified: query changes (dont emit signal)
bool WspItem::Modified(void) const { 
  return mModified;
};

// Modified: collect and pass on modifications of childs
void WspItem::ChildModified(bool changed) { 
  // ignre netagtives
  if(!changed) return;
  // report
  FD_DI("WspItem::ChildModified(1): model modified " << mModified);
  Modified(true);
};

// Modified: record changes and emit signal
void WspItem::Modified(bool ch) { 
  // set
  if(!mModified && ch) {
    FD_DI("WspItem::Modified(" << VioStyle::StrFromQStr(mName) << 
      "): emit postive modified notification");
    mModified=true;
    emit NotifyModified(mModified);
  }
  // clr
  if(mModified && !ch) {
    mModified=false;
    FD_DI("WspItem::Modified(" <<  VioStyle::StrFromQStr(mName) << 
      "): emit negative modified notification");
    emit NotifyModified(mModified);
  }
}


// Support alphabetical order of items (item-pool)
bool WspItem::operator< (const WspItem& rOther) const {
  int i = QString::localeAwareCompare(mName, rOther.Name());
  return(i <= 0 ? true : false);
}


// set filename dialog
int WspItem::FileDialog() { 
  FD_DI("WspItem::Filedialog(): " << VioStyle::StrFromQStr(mName) << "   "  << VioStyle::StrFromQStr(mFilename));
  // get defaults from myself
  QString filename=Filename();
  QString dir=QFileInfo(filename).absolutePath();
  QString basename = QFileInfo(filename).fileName();
  FD_DI("WspItem::Filedialog(): " << VioStyle::StrFromQStr(dir) << " : " << VioStyle::StrFromQStr(basename));
  // overwrite dir by pool 
  if(Pool()) 
  if(Pool()->BaseDir()!="")
  if(filename=="") dir=Pool()->BaseDir();
  // set up dialog (default: save)
  QFileDialog* fdiag = new QFileDialog();
  QSettings settings;
  fdiag->restoreState(settings.value("stateFileDialog").toByteArray());
  fdiag->setDirectory(dir);
  fdiag->selectFile(basename);
  fdiag->setNameFilter(mFileFilter);
  fdiag->setFileMode(QFileDialog::AnyFile);
  fdiag->setWindowTitle(QString(mFileTitle).arg(mName));
  fdiag->setAcceptMode(QFileDialog::AcceptSave);
  fdiag->setLabelText(QFileDialog::Accept,"Accept");
  fdiag->setOption(QFileDialog::DontConfirmOverwrite,true);
  fdiag->setDefaultSuffix(mFileSuffix);
  // run dialog
  filename="";
  if(fdiag->exec()) {
    if(fdiag->selectedFiles().size()==1) 
      filename=fdiag->selectedFiles().at(0);
  }
  settings.setValue("stateFileDialog", fdiag->saveState());
  // clean up
  delete fdiag;
  int res = (filename == Filename() ? 0 : 1);
  Filename(filename);
  FD_DI("WspItem::Filedialog(): done (a): " << filename);
  FD_DI("WspItem::Filedialog(): done (b): " << Filename());
  return res;
};


// user to load from file
int WspItem::UserLoad(void) { 
  FD_DI("WspItem::UserLoad()");
  // confirm
  if(Modified()) {
    int ret = QMessageBox::warning(0, tr("DESTool"),
	 tr("Discard changes in \"%1\" ?").arg(Name()),
         QMessageBox::Yes | QMessageBox::No, QMessageBox::No);
    if(ret==QMessageBox::No) return 1;  
  }
  // set up dialog
  QFileDialog* fdiag = new QFileDialog();
  QSettings settings;
  fdiag->restoreState(settings.value("stateFileDialog").toByteArray());
  fdiag->setNameFilter(mFileFilter);
  fdiag->setFileMode(QFileDialog::ExistingFile);
  fdiag->setWindowTitle(QString("Load \"%1\" from file").arg(mName));
  fdiag->setAcceptMode(QFileDialog::AcceptOpen);
  fdiag->setDefaultSuffix(mFileSuffix);
  // fill in defaults from external link
  if(FileLinked()) {
    QString filename=Filename();
    QString dir=QFileInfo(filename).absolutePath();
    QString basename = QFileInfo(filename).fileName();
    fdiag->setDirectory(dir);
    fdiag->selectFile(basename);
  }
  // run dialog
  QString filename="";
  if(fdiag->exec()) {
    if(fdiag->selectedFiles().size()==1) 
      filename=fdiag->selectedFiles().at(0);
  }
  settings.setValue("stateFileDialog", fdiag->saveState());
  delete fdiag;
  if(filename=="") return 1;
  // do the load
  try {
    ExternalRead(filename);
    if(filename == Filename()) Modified(false);
  }
  catch(faudes::Exception& exception) {
    QMessageBox mb(QMessageBox::Warning,tr("DESTool"),
	 tr("Cannot read file %1").arg(filename),QMessageBox::Ok);
    QString errmsg=VioStyle::QStrFromStr(exception.What());
    if(errmsg=="") errmsg="token mismatch";
    mb.setInformativeText("libFAUDES Error: "+errmsg);
    mb.exec();
    return 1;
  }
  return 0;
}

// user to save to file
int WspItem::UserSave(void) { 
  FD_DI("WspItem::UserSave()");
  // set up dialog
  QFileDialog* fdiag = new QFileDialog();
  QSettings settings;
  fdiag->restoreState(settings.value("stateFileDialog").toByteArray());
  fdiag->setNameFilter(mFileFilter);
  fdiag->setFileMode(QFileDialog::AnyFile);
  fdiag->setWindowTitle(QString("Save \"%1\" to file").arg(mName));
  fdiag->setAcceptMode(QFileDialog::AcceptSave);
  fdiag->setDefaultSuffix(mFileSuffix);
  // fill in defaults from external link
  if(FileLinked()) {
    QString filename=Filename();
    QString dir=QFileInfo(filename).absolutePath();
    QString basename = QFileInfo(filename).fileName();
    fdiag->setDirectory(dir);
    fdiag->selectFile(basename);
  }
  // run dialog
  QString filename="";
  if(fdiag->exec()) {
    if(fdiag->selectedFiles().size()==1) 
      filename=fdiag->selectedFiles().at(0);
  }
  settings.setValue("stateFileDialog", fdiag->saveState());
  delete fdiag;
  if(filename=="") return 1;
  // do the save
  try {
    ExternalWrite(filename);
    if(filename == Filename()) Modified(false);
  }
  catch(faudes::Exception& exception) {
    QMessageBox mb(QMessageBox::Warning,tr("DESTool"),
	 tr("Cannot write file %1").arg(filename),QMessageBox::Ok);
    QString errmsg=VioStyle::QStrFromStr(exception.What());
    if(errmsg=="") errmsg="token mismatch";
    mb.setInformativeText("libFAUDES Error: "+errmsg);
    mb.exec();
    return 1;
  }
  return 0;
}


// user runs help
void WspItem::Help(void) { 
  DesStyle::ShowDocumentation(HtmlPage());
}


// user to link with file
void WspItem::UserFile(bool link) { 
  FD_DI("WspItem::UserFile(" << link <<")");
  // unlink
  if(!link) {
    Filename("");
    // record modified
    Modified(true);
    emit NotifyProperties();
    return;
  }
  // link
  if(link) { 
    if(Filename()=="" && mVisual) {
      Filename(Name()+".vio");
      if(Pool()) 
      if(Pool()->BaseDir()!="")
	Filename(Pool()->BaseDir() + "/" + Name()+".vio");
    }
    if(Filename()=="" && !mVisual) { // todo
    }
    FileDialog();
    if(!QFileInfo(Filename()).exists())   Save();
    // link implies non persistent (allow item to reject/insist)
    if(FileLinked()) DoPersistent(false);
    // record modified
    Modified(true);
    // notify
    emit NotifyProperties();
  }
}


// user to change persistent status
void WspItem::UserPersistent(bool pers) { 
  FD_DI("WspItem::UserPersistent(" << pers <<")");
  // bail out on trivial
  if(pers==mPersistent) return;
  // make persistent 
  DoPersistent(pers);
  // persistence implies unlink (note: allow "DoPersistent" to reject/insist)
  if(Persistent())
    Filename("");
  // record modified
  Modified(true);
  // notify
  emit NotifyProperties();
}  


// default context menu
QMenu* WspItem::NewContextMenu(void) {
  FD_DS("WspItem::NewContextMenu()");

  // set up menu
  QMenu* menu= new QMenu();
  QAction *action;
  menu->setTitle(Name());
 
  // add button: show
  action= menu->addAction("Show \"" + Name() + "\"");
  action->setEnabled(Visual());
  QObject::connect(action,SIGNAL(triggered(void)),this,SLOT(ShowItem(void)));
  menu->addSeparator();

  // add button: show
  action= menu->addAction("Online Help");
  action->setEnabled(true);
  QObject::connect(action,SIGNAL(triggered(void)),this,SLOT(Help(void)));
  menu->addSeparator();

  // load file
  action = menu->addAction("Load from File");
  action->setEnabled(Visual() && FileLinked());
  connect(action,SIGNAL(triggered(void)),this,SLOT(UserLoad(void)));

  // save file
  action = menu->addAction("Save to File");
  action->setEnabled(Visual() && FileLinked());
  connect(action,SIGNAL(triggered(void)),this,SLOT(UserSave(void))); 

  // construct and add item property widget
  QWidget* propwidget = NewPropertyWidget();
  if(propwidget) {
    QWidgetAction* propaction = new QWidgetAction(menu);
    propaction->setDefaultWidget(propwidget);
    menu->addAction(propaction);
  }

  // done
  return menu;
}


// request show
void WspItem::ShowItem(bool show) { 
  if(!Visual()) return;
  FD_DI("WspItem::ShowItem("<<show<<"): for " << VioStyle::StrFromQStr(mName) );
  mShown=show;
  emit ShowItemRequest(mName,show);
}


// emit status message
void WspItem::EmitStatusMessage(const QString& message) {
  FD_DI("WspItem::EmitStatusMessage(): " << VioStyle::StrFromQStr(message));
  emit StatusMessage(message);
}

// view fcatory
WspItemView* WspItem::NewView(void) {
  return new WspItemView();
}



/*
 ************************************************
 ************************************************
 ************************************************
 ************************************************

 implementation of  WspPool 

 ************************************************
 ************************************************
 ************************************************
 ************************************************
 */


// construct
WspPool::WspPool(int itype, QObject* parent) : QStandardItemModel(parent) {
  // record my item cleaa
  mItemType=itype;
  // default base dir: no such
  mBaseDir="";
  // configure
  setColumnCount(1);
  setHorizontalHeaderLabels(QStringList() << mHeader);
  // all clear
  mItemMapValid =true;
  mItemListValid =true;
  mModified = false;

  // my selection model
  mSelectionModel = new QItemSelectionModel(this, this);
  mActiveItem="";
  connect(mSelectionModel,SIGNAL(currentChanged(const QModelIndex&, const QModelIndex&)),
    this,SLOT(EmitNotifySelection()));
  connect(mSelectionModel,SIGNAL(selectionChanged(const QItemSelection&, const QItemSelection&)),
    this,SLOT(EmitNotifySelection()));
}

// destruct
WspPool::~WspPool(void) {
  foreach(WspItem* item, ItemList()) 
    item->ShowItem(false);
};

// clear all
// ??? do we need to block signals and do a model reset?
void WspPool::Clear(void) {
  FD_DI("WspPool::Clear()");
  foreach(WspItem* item, ItemList()) 
    item->ShowItem(false);
  FD_DI("WspPool::Clear(): A");
  clear();
  mItemMap.clear();
  mItemMapValid =true;
  mItemList.clear();
  mItemListValid =true;
  FD_DI("WspPool::Clear(): B");
  // configure
  setColumnCount(1);
  setHorizontalHeaderLabels(QStringList() << mHeader);
  // default base dir: no such
  mBaseDir="";
  FD_DI("WspPool::Clear(): C");
  // reset modified
  Modified(false);
  // clear my active item
  mActiveItem="";
  // notify
  FD_DI("WspPool::Clear(): notify");
  emit NotifyProperties();
  FD_DI("WspPool::Clear(): done");
};


// query properties: size
int WspPool::Size(void) const {
  return rowCount();
}

// factory (reimplement in derived classes)
WspItem* WspPool::NewItem(void) {
  return 0;
}

// test type (reimplement in derived classes)
WspItem* WspPool::TestItem(WspItem* item) {
  return qobject_cast<WspItem*>(item);
}


// fix internal data
const QMap<QString,int>& WspPool::ItemMap(void) {
  //FD_DI("WspPool::ItemMap(): #" << Size());
  if(!mItemMapValid) {
    mItemMap.clear();
    for(int pos=0; pos<Size(); ++pos){
      WspItem* witem = static_cast<WspItem*>(item(pos));
      if(!witem) continue;
      mItemMap[witem->Name()]=pos;
    }
    mItemMapValid=true;
  }
  return mItemMap;
}


// list all items
const QList<WspItem*>& WspPool::ItemList(void) {
  if(!mItemListValid) {
    mItemList.clear();
    for(int pos=0; pos<Size(); ++pos){
      WspItem* witem = static_cast<WspItem*>(item(pos));
      mItemList.append(witem);
    }
    mItemListValid=true;
  }
  return mItemList;
}

// list all items
QList<QString> WspPool::NameList(void) {
  QList<QString> list;
  foreach(WspItem* item, ItemList()) 
    list.append(item->Name());
  return list;
}


// new name ok?
bool WspPool::DoValidName(const QString& newname) {
  if(!(VioStyle::ValidSymbol(newname))) return false;
  if(Exists(newname)) return false;
  return true;
}

// check existence
int WspPool::Find(const QString& name) {
  //FD_DI("WspPool::Find(): " <<VioStyle::StrFromQStr(name));
  QMap<QString,int>::const_iterator it;
  it=ItemMap().constFind(name);
  if(it==ItemMap().constEnd()) return -1;
  return it.value();
}

// access list by position
WspItem* WspPool::At(int pos) {
  if(pos<0 || pos >= Size()) return 0;
  return dynamic_cast<WspItem*>(item(pos));
}

// access list by position
const WspItem* WspPool::At(int pos) const {
  if(pos<0 || pos >= Size()) return 0;
  return dynamic_cast<WspItem*>(item(pos));
}

// access list by name
WspItem* WspPool::At(const QString& name) {
  int pos=Find(name);
  return At(pos);
}

// check existence
bool WspPool::Exists(const QString& name) {
  return ItemMap().contains(name);
}

// rename existing variable  (true<>ok)
bool WspPool::ReName(int position, const QString& newname) {
  WspItem* item = At(position);
  if(!item) return false;
  if(!DoValidName(newname)) return false;
  if(newname==item->Name()) return true;
  FD_DI("WspPool::ReName(" << VioStyle::StrFromQStr(item->Name()) << ", " << VioStyle::StrFromQStr(newname) << ")");
  item->DoName(newname); 
  mItemListValid=false;
  mItemMapValid=false;
  FD_DI("WspPool::ReName(): done");
  // record modified
  Modified(true);
  // name based selection
  // TODO: fix
  // notify 
  emit NotifyProperties();
  return true;
}

// rename existing variable  (true<>ok)
bool WspPool::ReName(const QString& oldname, const QString& newname) {
  int pos=Find(oldname);
  return ReName(pos,newname);
}


// internal version of insert (>=0 on success)
int WspPool::DoInsert(int position, WspItem* item) {
  if(!TestItem(item)) return -1;
  int pos=Find(item->Name());
  if(pos>=0) return pos;
  if(!DoValidName(item->Name())) return -1;
  FD_DI("WspPool::Insert(" << position << "," << VioStyle::StrFromQStr(item->Name()) << ")");
  // normalise
  if(position<0) position=0;
  if(position>Size()) position=Size();
  // pass to standarditemmodel, incl reparent
  insertRow(position,item);
  // invalidate map/list
  mItemListValid=false;
  mItemMapValid=false;
  // connect std signals
  connect(item,SIGNAL(ShowItemRequest(QString,bool)),this,SIGNAL(ShowItemRequest(QString,bool)));
  connect(item,SIGNAL(NotifyProperties()),this,SIGNAL(NotifyProperties()));
  connect(item,SIGNAL(NotifyModified(bool)),this,SLOT(ChildModified(bool)));
  // tell the item about its new pool
  item->DoPool(this);
  // record modified
  Modified(true);
  // advertise new variable
  emit NotifyProperties();
  // done
  return position;
}

// internal version of append (>=0 on success)
int WspPool::DoAppend(WspItem* item) {
  return DoInsert(Size(),item);
}

//insert (pos>=0 <> success)
int WspPool::Insert(int position, WspItem* item) {
  FD_DI("WspPool::Insert(" << position << "," << VioStyle::StrFromQStr(item->Name()) << ") A");
  return DoInsert(position,item);
}

//insert (pos>=0 <> success)
int WspPool::Insert(int position, const QString& name) {
  FD_DI("WspPool::Insert(" << position << "," << VioStyle::StrFromQStr(name) << ") A");
  QString mname(name);
  if(!DoValidName(name)) return -1;
  FD_DI("WspPool::Insert(" << position << "," << VioStyle::StrFromQStr(name) << ") B");
  WspItem* item = NewItem();
  if(!item) return -1;
  item->Name(mname);
  int res=DoInsert(position,item);
  if(res<0) delete item;
  return res;
}


// append (>=0 on success)
int WspPool::Append(const QString& name) {
  return Insert(Size(),name);
}


// extend anoymous
void WspPool::InsertAnonymous(int pos) {
  if(pos<0) pos=0;
  if(pos>Size()) pos = Size();
  Insert(pos);
}

// extend anonymous
void WspPool::AppendAnonymous(void) {
    InsertAnonymous(Size());
}

// move
bool WspPool::Move(int src, int dst) {
  FD_DI("WspPool::Move("<< src << ", " << dst << ")");
  // bail out
  if(src<0) return false;
  if(src>=Size()) return false;
  if(dst<0) return false;
  if(dst>=Size()) return false;
  if(src==dst) return false;
  // pass on to standarditemmodel
  QStandardItem* item= takeItem(src);
  removeRow(src);
  insertRow(dst,item);
  // report
  FD_DI("WspPool::Move("<< src << ", " << dst << "): done");
  // invalidate map/list
  mItemListValid=false;
  mItemMapValid=false;
  // record modified
  Modified(true);
  // advertise change
  emit NotifyProperties();
  // done
  return true;
}

// remove
bool WspPool::Erase(void) {
  FD_DI("WspPool::Erase()");
  if(!sender()) return false;
  QVariant prop = sender()->property("Item");
  if(!(prop.typeId()==QMetaType::QString)) return false;
  QString name = prop.toString();
  return Erase(name);
}

// remove
bool WspPool::Erase(const QString& name) {
  int pos=Find(name);
  return Erase(pos);
}


// remove
bool WspPool::Erase(int pos) {
  // bail out
  if(pos<0) return false;
  if(pos>=Size()) return false;
  // get item
  WspItem* witem=dynamic_cast<WspItem*>(item(pos));
  if(!witem) return false; // must not happen
  FD_DI("WspPool::Erase(): " << VioStyle::StrFromQStr(witem->Name()) << " at pos " << pos);
  // hide that item
  emit ShowItemRequest(witem->Name(),false);
  // pass on to standarditemmodel
  takeItem(pos);
  removeRow(pos);
  // invalidate map/list
  mItemListValid=false;
  mItemMapValid=false;
  // record modified
  Modified(true);
  // advertise change
  emit NotifyProperties();
  // delete
  delete witem;
  // done
  return true;
}

// new name (cheap heuristics ... )
QString WspPool::NewName(const QString& name) {
  QString res;
  // try size
  res=QString(name+"_%1").arg(Size()+1);
  if(!ItemMap().contains(res)) return res;
  // try size and count 
  for(int i=Size()+1; i< Size()+200; i++) {
    res=QString(name+"_%1").arg(i);
    if(!DoValidName(res)) continue;
  }
  // try random
  do {
    int i=std::rand();
    res=QString(name+"_%1").arg(i);
  } while(!DoValidName(res));
  return res;
}   


// query properties: basedir
QString WspPool::BaseDir(void) const {
  return mBaseDir;
}

// query properties: basedir
void WspPool::BaseDir(const QString& base) {
  mBaseDir=base;
}


// token io, write 
void WspPool::Write(faudes::TokenWriter& rTw,const QString& rLabel){
  FD_DI("WspPool::Write(): #"<<Size() << "["<<ItemList().size()<<"]");
  // set label
  QString label(rLabel);
  if(rLabel.isEmpty()) label=mTokenSection;
  // extract base dir, on change
  QString filename = VioStyle::QStrFromStr(rTw.FileName());
  mBaseDir = QFileInfo(filename).absolutePath();
  FD_DI("WspPool::Write(rTr): basedir:" << VioStyle::StrFromQStr(mBaseDir));
  // do write
  rTw.WriteBegin(VioStyle::StrFromQStr(label));
  for(int i=0; i < Size(); i++) {
    WspItem* witem = At(i);
    FD_DI("WspPool::Write(): item " << witem->Name());
    witem->Write(rTw);
  }
  rTw.WriteEnd(VioStyle::StrFromQStr(label));
}

// token io, read
void WspPool::Read(faudes::TokenReader& rTr,const QString& rLabel) {
  // set label
  QString label(rLabel);
  if(rLabel.isEmpty()) label=mTokenSection;
  beginResetModel();
  // report
  FD_DI("WspPool:Read(rTr)");
  Clear();
  // do silent insert to avoid update of every single op 
  // (note: this is only ok for insert, not for delete, since delete requires signals
  // to fix/close item windows etc)
  bool bs=blockSignals(true);
  // get base dir
  QString filename = VioStyle::QStrFromStr(rTr.FileName());
  mBaseDir=QFileInfo(filename).absolutePath();
  FD_DI("WspPool::Read(rTr): basedir:" << VioStyle::StrFromQStr(mBaseDir));
  // read the variables
  rTr.ReadBegin(VioStyle::StrFromQStr(label));
  while(!rTr.Eos(VioStyle::StrFromQStr(label))) {
    WspItem* witem= NewItem();
    // be prepared to try recover from errors
    int secl = rTr.Level();
    try{
      FD_DI("WspPool:Read(rTr): read individual item");
      witem->Read(rTr);
      FD_DI("WspPool:Read(rTr): read individual item - ok");
    } catch(faudes::Exception& ex) {
      bool res=rTr.Recover(secl);
      if(!res) throw(faudes::Exception(ex));
      FD_WARN("WspPool::Read(): ignoring invalid variable");
      delete witem;
      witem=0;
    }
    // record
    if(witem) DoAppend(witem);
  }
  rTr.ReadEnd(VioStyle::StrFromQStr(label));
  FD_DI("WspPool:Read(rTr): read items: done.");
  // unblock signals, trigger update
  blockSignals(bs);
  endResetModel();
  emit NotifyProperties(); // reset for my views aka attached windows
  // ask for display
  foreach(WspItem* witem, ItemList()) {
    if(witem->Shown()) witem->ShowItem();
  }
  FD_DI("WspPool::Read(rTr): done, #" << Size());
}

// make item emit show request 
void WspPool::ShowItem(bool show) { 
  FD_DI("WspPool::ShowItem()");
  QVariant prop = sender()->property("Item");
  if(!(prop.typeId()==QMetaType::QString)) return;
  QString name = prop.toString();
  ShowItem(name, show);
}


// make item emit show request
void WspPool::ShowItem(const QString& name, bool show) { 
  FD_DI("WspPool::ShowItem("<< VioStyle::StrFromQStr(name) << ")");
  WspItem* item = At(name);
  if(!item) return;
  FD_DI("WspPool::ShowItem("<< VioStyle::StrFromQStr(name) << "): ask item to emit show request ");
  item->ShowItem(show);
  FD_DI("WspPool::ShowItem("<< VioStyle::StrFromQStr(name) << "): emit a show request myself ");
  emit ShowItemRequest(item->Name(),true);
}

// make item emit status message
void WspPool::StatusMessage(const QString& fnctname, const QString& text) {
  FD_DI("WspPool::StatusMessage(" << VioStyle::StrFromQStr(fnctname) << ")");
  WspItem* item= At(fnctname);
  if(!item) return;
  item->EmitStatusMessage(text);
}





// connect a partner to receicve all variable signals
/*
void WspPool::Connect(QObject* partner) {
  if(!partner) return;
  foreach(WspItem* var, mVarMap)
    var->Connect(partner);
}  
*/

// disconnect all variables  from partner
/*
void WspPool::Disconnect(QObject* partner) {
  if(!partner) return;
  foreach(WspItem* var, mVarMap)
    var->Disconnect(partner);
}  
*/


// save all changes
void WspPool::SaveChanges(void) {
  FD_DI("WspPool::SaveChanges()");
  foreach(WspItem* item, ItemList()) {
    if(item->Modified())  item->Save();
  }
}

// save all 
void WspPool::SaveAll(void) {
  FD_DI("WspPool::SaveAll()");
  foreach(WspItem* item, ItemList()) {
    item->Save();
  }
}

// load all 
void WspPool::LoadAll(void) {
  FD_DI("WspPool::LoadAll()");
  foreach(WspItem* item, ItemList()) {
    item->Load();
  }
  FD_DI("WspPool::LoadAll(): done");
}


// run context menu wrapper
void WspPool::RunContextMenu(QPoint rPoint, const int pos) {
  FD_DS("WspPool::RunContextMenu(" << rPos <<")");
  // insert menu
  if(pos<0) {
    QMenu* menu= new QMenu();
    QAction* insaction= menu->addAction("Insert");
    QAction* selaction= menu->exec(rPoint);
    if(selaction==insaction) AppendAnonymous();
    delete menu;
    return;
  }
  // proper menu
  WspItem* witem=At(pos);
  // construct menu
  QMenu* menu= witem->NewContextMenu();
  // add my buttons
  menu->addSeparator();
  QAction* deleteaction= menu->addAction("Delete");
  QAction* insaction= menu->addAction("Insert");
  // run
  QAction* selaction= menu->exec(rPoint);
  // deal with my buttons
  if(selaction==deleteaction){
    Erase(pos);
  }
  if(selaction==insaction){
    InsertAnonymous(pos+1);
  }
  delete menu;
}


// run context menu wrapper
void WspPool::RunContextMenu(QPoint rPoint, const QString rName) {
  FD_DS("WspPool::RunContextMenu(" << VioStyle::StrFromQStr(rName)<<")");
  // figure position
  int pos=Find(rName);
  // doit
  RunContextMenu(rPoint,pos);
}

// run context menu wrapper
void WspPool::RunContextMenu(QPoint rPoint) {
  FD_DS("WspPool::NewContextMenu()");
  QString name;
  RunContextMenu(rPoint,name);
}


// we can do internal drag/drop (internal only)
Qt::DropActions WspPool::supportedDropActions() const {
     return Qt::MoveAction; }
Qt::DropActions WspPool::supportedDragActions() const {
     return Qt::MoveAction; }
QStringList WspPool::mimeTypes() const {
  return QStringList() << "application/vnd.text.list";} 

// retrieve drag data
QMimeData * WspPool::mimeData(const QModelIndexList & indexes) const {
  FD_DI("WspPool::mimeData(): " << indexes.size());
  QMimeData *md = new QMimeData();
  QByteArray dataarray;
  QDataStream datastream(&dataarray, QIODevice::WriteOnly);
   foreach(QModelIndex index, indexes) {
     if(!index.isValid()) continue;
     const WspItem* witem = At(index.row());
     if(!witem) continue;
     QString varname =   witem->Name();
     datastream << varname;
   }
   md->setData("application/vnd.text.list", dataarray);
   return md;
}

// receive drop data
bool WspPool::dropMimeData ( const QMimeData* md, Qt::DropAction action, int row, int column, const QModelIndex& parent) {
  (void) parent;
  FD_DI("WspPool::dropMimeData(): A");
  if(action == Qt::IgnoreAction) return true;
  if(action != Qt::MoveAction) return false;
  if(!md->hasFormat("application/vnd.text.list")) return false;
  if(column > 0) return false;  
  mSelectionModel->clear();
  FD_DI("WspPool::dropMimeData(): B to row " << row);
  int dst = Size();
  if(row!=-1) dst=row;
  else if(parent.isValid()) dst = parent.row(); 
  FD_DI("WspPool::dropMimeData(): B to dst " << dst);
  QByteArray dataarray = md->data("application/vnd.text.list");
  QDataStream datastream(&dataarray, QIODevice::ReadOnly);
  while(!datastream.atEnd()) {
    QString varname;
    datastream >> varname;
    int src= Find(varname);
    FD_DI("dropMimeData(): C moving " << VioStyle::StrFromQStr(varname) << " from src " << src);
    if(src==dst) continue;
    //if(dst>src) dst--;
    QStandardItem* witem=takeItem(src);
    if(witem) { 
      removeRow(src);
      if(dst>Size()) dst=Size();
      insertRow(dst,witem);
      mItemListValid=false;
      mItemMapValid=false;
      Modified(true);
    }
    dst++;
  }
  return true;
}

// catch re-order
void WspPool::sort(int column, Qt::SortOrder order) {
  QStandardItemModel::sort(column,order);
  mItemListValid=false;
  mItemMapValid=false;

  ActiveItem("");
}

// selected items
QList<QString> WspPool::SelectedItems(void) {
  QModelIndexList selectedindexes=mSelectionModel->selectedIndexes();
  FD_DI("WspPool::SelectedRows(): indexes #" << selectedindexes.size());
  QList<QString> selecteditems;
  foreach(const QModelIndex& index, selectedindexes) {
    if(!index.isValid()) continue;
    if(index.row()<0) continue;
    if(index.row()>= Size()) continue;
    WspItem* witem= At(index.row());
    if(!witem) continue;
    if(selecteditems.contains(witem->Name())) continue;
    selecteditems.append(witem->Name());
  }
  FD_DI("WspPool::Selecteditems(): rows #" << selecteditems.size());
  std::sort(selecteditems.begin(),selecteditems.end());
  return selecteditems;
}

// update selection
void WspPool::EmitNotifySelection(void) {
  FD_DI("WspPool::EmitNotifySelection() ");
  QString newactive="";
  int row=-1;
  QModelIndexList selectedindexes=mSelectionModel->selectedIndexes();
  if(selectedindexes.size()==1) {
    QModelIndex index = selectedindexes.at(0);
    if(index.isValid()) {
      WspItem* witem= At(index.row());
      if(witem) {
	newactive=witem->Name();
        row=index.row();
      }
    }
  }
  if(newactive!=mActiveItem) {
    FD_DI("WspPool::EmitNotifySelection(): new active item \"" 
	  << VioStyle::StrFromQStr(newactive)<< "\" at " << row);
    mActiveItem=newactive;
  }
  emit NotifySelection();
}


// this is asking for trouble (loops)
void WspPool::ActiveItem(QString newact) {
  if(newact==mActiveItem) return;
  // need to block signals?
  mSelectionModel->clear();
  int pos=Find(newact);
  QModelIndex idx = index(pos,0);
  mSelectionModel->select(idx, QItemSelectionModel::Select | QItemSelectionModel::Rows);

}



// query changes (dont emit signal)
bool WspPool::Modified(void) const { 
  return mModified;
};

// collect and pass on modifications of childs
void WspPool::ChildModified(bool changed) { 
  // ignre negagtives
  if(!changed) return;
  // report
  FD_DI("WspPool::ChildModified(1): model modified " << mModified);
  Modified(true);
};

// record changes and emit signal)
void WspPool::Modified(bool ch) { 
  // set
  if(!mModified && ch) {
    mModified=true;
    FD_DI("WspPool::Modified(" << this << "): emit positive modified notification");
    emit NotifyModified(mModified);
  }
  // clr
  if(mModified && !ch) {
    mModified=false;
    FD_DI("WspPool::Modified(" << this << "): emit negative modified notification");
    emit NotifyModified(mModified);
  }
  // pass on clear
  if(!ch) {
    foreach(WspItem* item, ItemList()) {
      item->Modified(ch);
    }
  }
}



