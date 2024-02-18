/** @file wspitems.h - Common basis for the maintenance of workspace items. */

/*
  FAU Discrete Event Systems Library (libfaudes)

  Copyright (C) 2009 Ruediger Berndt
  Copyright (C) 2009 Thomas Moor
*/


#ifndef FAUDES_WSPITEMS_H
#define FAUDES_WSPITEMS_H


#include "libfaudes.h"
#include "libviodes.h"
#include "desstyle.h"




// forward
class WspPool;
class WspItemView;
class WspItemWindow;


/**
 * WspItem
 *
 * Abstract base class for all items in the workspace, e.g. Variables, Programms.
 *
 * An WspItem may be owned by a owned a WspPool and within the pool indentified
 * by a unique name. 
 *
 * Items may be persistent in that they provide file io, either in a separate file or
 * included in the itempool file. Items may provide serveral views for user interaction
 * an maintain a modified flag vio signa/slot communication.
 *
 */

class WspItem : public QObject, public QStandardItem {

Q_OBJECT

 public:

  // make pool friend to call DoName
  friend class WspPool;


  // constructor, (invalid item, needs at least a name and a pool)
  WspItem(QObject* parent = 0);

  // destructor
  virtual ~WspItem(void);

  // Derived classes rtti (extend standarditem)
  typedef enum { 
    ITUndefined=QStandardItem::UserType+1, 
    ITVariable=QStandardItem::UserType+2, 
    ITFunction=QStandardItem::UserType+3, 
    ITProgram=QStandardItem::UserType+4,
    ITSimTrace=QStandardItem::UserType+5, 
    ITSimStatistics=QStandardItem::UserType+6, 
    ITConsole=QStandardItem::UserType+7, 
    ITExtension=QStandardItem::UserType+8, 
    ITExtensionManager=QStandardItem::UserType+9 
  } Type; 

  // Get class (reimplement standarditem)
  int type(void) const;

  // Get core properties
  WspPool* Pool(void) const;
  Type ItemType(void) const;
  int  Id(void) const;

  // Get properties
  const QString& Name(void) const;
  const QString& Filename() const;
  bool Persistent(void) const;
  bool Visual(void) const;
  bool ViewSatelite(void) const;
  bool Shown(void) const;
  bool Locked(void) const;

  // Get derived properties
  const QString& Title(void) const;
  bool FileLinked(void) const;

  // helper for filename/path conversion
  QString RelativeFilename(const QString& rBaseDir="") const;
  static QString RelativeFilename(const QString& rBaseDir, const QString& rFilename);

  // Common interface for file IO
  void Write(faudes::TokenWriter& rTw, const QString& rLabel="");
  void Write(const QString& rFilename, const QString& rLabel="");
  void Read(faudes::TokenReader& rTr, const QString& rLabel="");
  void Read(const QString& rFilename, const QString& rLabel="");

  // Common interface for file IO (additional data, e.g. visual rep model details)
  void ExternalWrite(const QString& rFilename, const QString& rLabel="") const;
  void ExternalRead(const QString& rFilename, const QString& rLabel="");

  // Obtain widgets (connected to this item)
  virtual QWidget* NewMainWidget(void) { return 0;};
  virtual QWidget* NewSateliteWidget(void) { return 0;};
  virtual QWidget* NewPropertyWidget(void) { return 0;};

  // Obtain view 
  virtual WspItemView* NewView(void);      // (factory only, may follow pool)

  // Obtain contextmenu to edit core properties 
  virtual QMenu* NewContextMenu(void);

  // Run file dialog to link file
  int FileDialog(void); 

  // Other UI properties access
  virtual const QString& ToolTip();
  virtual const QString& HtmlPage();
  virtual const QString& WhatsThis();
  virtual void ToolTip(const QString& rText);
  virtual void HtmlPage(const QString& rText);

  // read only class config
  const QString& FileTitle() const;
  const QString& FileSuffix() const;
  const QString& FileFilter() const;


  // record/query user changes 
  bool Modified(void) const;
  virtual void Modified(bool ch);

  // reimplement standarditem data access to mName
  QVariant data(int role = Qt::UserRole+1) const;
  void setData(const QVariant& value, int role = Qt::UserRole+1);

  // Support alphabetical order of items (item-pool)
  bool operator< (const WspItem& rOther) const;

public slots:

  // set properties
  const QString&  Name(const QString& rNewName);
  const QString& Filename(const QString& rNewFilename);
  bool  Persistent(bool vis);
  bool  Visual(bool vis);
  bool  Shown(bool shown);
  bool  Locked(bool lock);

public slots:

  // emit show request signal (pass on to pool)
  void ShowItem(bool show=true); 

  // make item emit statusmessage signal
  void EmitStatusMessage(const QString& message);

  // Method to load/save model-data to file-system
  virtual int Save(void);
  virtual int Load(void);

  // Flush() pending data from visuals (gets called by save/write)
  virtual void Flush(void);

  // run assistent
  virtual void Help(void);

  // User version for file i/o
  virtual void UserFile(bool link); 
  virtual void UserPersistent(bool pers); 
  virtual int UserLoad();  // 0<> load took place
  virtual int UserSave();  // 0<> save took place

  // Receive configuration changes from child (by user)
  void ChildModified(bool);

signals:

  // forward show slot invokation 
  void ShowItemRequest(const QString& name, bool show=true);

  // Configuration changed (by user)
  void NotifyModified(bool);

  // Blocking state changed (programmatic)
  void NotifyBlocked(bool);

  // New Name
  void NotifyRename(void);

  // Any properties except data
  void NotifyProperties(void);

  // Cause redraw of any view
  void NotifyMainData(void);

  // Notify application on status and errors
  void StatusMessage(const QString& message);
  void ErrorMessage(const QString& message);


protected:

  // Token io, implementation 
  virtual void DoWrite(faudes::TokenWriter& rTw,  const QString& rLabel="") const {(void) rTw; (void) rLabel;};
  virtual void DoRead(faudes::TokenReader& rTr,  const QString& rLabel="") {(void) rTr; (void) rLabel;};
  virtual void DoExternalWrite(const QString& rFilename,  const QString& rLabel="") const {(void) rFilename; (void) rLabel;};
  virtual void DoExternalRead(const QString& rFilename,  const QString& rLabel="") {(void) rFilename; (void) rLabel;};

  // Set properties implementation
  virtual void DoPool(WspPool* pPool);
  virtual void DoFilename(const QString& rFName);
  virtual void DoName(const QString& rNewName);
  virtual void DoPersistent(bool vis);
  virtual void DoVisual(bool vis);
  virtual void DoLocked(bool vis);

  // Id count
  static int mIdCounter;

  // Core properties
  Type mItemType;
  QString mName;
  int mId;
  QString mFilename;
  bool mPersistent;
  bool mVisual;
  bool mShown;
  bool mLocked;

  // Ui data
  QString mToolTip;
  QString mHtmlPage;
  QString mWhatsThis;

  // Configure behavour
  QString mFileTitle;
  QString mFileSuffix;
  QString mFileFilter;
  bool mViewSatelite;

  // Record modified state
  bool mModified;
  
  // Property-actions
  QAction* mpActRename;


}; // WspItem







/**
 * WspPool
 *
 * Abstract base class for pools of items of one kind, 
 * e.g. Variables, Programms. It is internally organized as a list and
 * maintains also maps for eficient access.
 *
 */

class WspPool : public QStandardItemModel {

Q_OBJECT


 public:

  // constructor/destructor
  WspPool(int itype, QObject* parent = 0);
  virtual ~WspPool();

  // clear all (invalidates references)
  virtual void Clear(void);

  // query properties
  int Size(void) const;
  QString BaseDir(void) const;
  void BaseDir(const QString& base);

  // access
  int Find(const QString& name);
  WspItem* At(int position);
  const WspItem* At(int position) const;
  WspItem* At(const QString& name);
  bool Exists(const QString& name);
  const QList<WspItem*>& ItemList(void);
  const QMap<QString,int>& ItemMap(void);
  QList<QString> NameList(void);

  // edit list
  int Insert(int position, WspItem* item);   // return valid position for success
  int Insert(int position, const QString& name="");   // return valid position for success
  int Append(const QString& name="");   // return valid position for success
  bool Move(int src, int dst); // return true if move was performed
  bool Erase(int position);            //return true if did exists
  bool Erase(const QString& name);                           // return true if did exist
  bool ReName(int position, const QString& newname); // return true if did exist and newname ok
  bool ReName(const QString& oldname, const QString& newname); // return true if did exist and newname ok

  // anonymous insert (completely configured, cant fail)
  virtual void  InsertAnonymous(int position);
  virtual void AppendAnonymous(void);  

  // create a new unique name
  QString NewName(const QString& name);

  // sort by name
  void SortByName(void);

  // token io
  virtual void Read(faudes::TokenReader& rTr, const QString& rLabel="");
  virtual void Write(faudes::TokenWriter& rTw, const QString& rLabel="");

  // set up connections with all variables (pass on changes and user interaction)
  void Connect(QObject* partner) { (void) partner;};
  void Disconnect(QObject* partner) { (void) partner;};

  // record/query user changes 
  bool Modified(void) const;
  virtual void Modified(bool ch);

  // we can do internal drag/drop
  Qt::DropActions supportedDropActions() const;
  Qt::DropActions supportedDragActions() const;
  QStringList mimeTypes(void) const;
  QMimeData* mimeData(const QModelIndexList & indexes) const;
  bool dropMimeData(const QMimeData* data, Qt::DropAction action, int row, int column, const QModelIndex & parent );

  // access selection model
  QItemSelectionModel* SelectionModel(void) const { return mSelectionModel; };
  QList<QString> SelectedItems(void);
  QString ActiveItem(void) { return mActiveItem; };
  void ActiveItem(QString newact);

  // re-implement to invalidate selection
  void sort( int column, Qt::SortOrder order = Qt::AscendingOrder );

public slots:  

  // erase by sender property "Item"
  bool Erase(void);                           

  // save all changed items that are linked to files
  void SaveChanges(void);

  // load/save all items that are linked to files
  void SaveAll(void);
  void LoadAll(void);

  // user interaction (emit a signal, ask item to emit a signal)
  void ShowItem(const QString& itemname, bool show=true);
  void ShowItem(bool show=true);
  void StatusMessage(const QString& itemname, const QString& text);

  // run contextmenu
  virtual void RunContextMenu(QPoint rPoint, const QString rName);
  virtual void RunContextMenu(QPoint rPoint, const int pos);
  virtual void RunContextMenu(QPoint rPoint);

  // collect and pass on modifications of childs
  virtual void ChildModified(bool ch);

  // update current selection and emit signal
  void EmitNotifySelection(void);

signals:

  // forward request
  void ShowItemRequest(const QString& name, bool show);

  // notification of changes in properties (incl adding/removing items ...  anything that may invalidate references)
  void NotifyProperties(void); 

  // notify application on changees
  void NotifyModified(bool ch);

  // notify application on selection changes
  void NotifySelection(void);

protected:

  // my  data: list plus symbol table
  QList<WspItem*> mItemList;
  QMap<QString,int> mItemMap;
  bool mItemListValid;
  bool mItemMapValid;

  // maintain a model-global selection 
  QItemSelectionModel* mSelectionModel;
  QString mActiveItem;

  // my token io section
  QString mTokenSection;

  // factory
  virtual WspItem* NewItem(void);
  virtual WspItem* TestItem(WspItem* item);

  // my item class
  int mItemType;
  QString mHeader;

  // my base dir during (!) file io
  QString mBaseDir;

  // internal version of insert
  virtual int DoInsert(int postion, WspItem* item);
  virtual int DoAppend(WspItem* item);

  // test whether a name is good for a new item
  virtual bool DoValidName(const QString& newname);

  // record user changes
  bool mModified;



};





#endif




