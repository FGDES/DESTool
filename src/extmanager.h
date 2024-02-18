/* extmanager.h  -  manage luaextensions   */


/*
   Extensionmanager for FAU Discrete Event Systems Library (libfaudes)

   Copyright (C) 2011 Thomas Moor

*/


#ifndef FAUDES_EXTMANAGER_H
#define FAUDES_EXTMANAGER_H

#include "libviodes.h"
#include "wspitems.h"
#include "wspviews.h"

// forward
class ExtensionMainWidget; 
class ExtensionPool; 


/*
 ************************************************
 ************************************************

 An Extension a wsp-item to model a Lua extension.
 It basically consists of a filename.

 ************************************************
 ************************************************
 */

// class definition
class Extension : public WspItem  {

  Q_OBJECT

public:

  // construct/destruct
  Extension(QObject* parent=0);
  virtual ~Extension(void);

  // overload wsp item: widgets
  QWidget* NewMainWidget(void);
  QWidget* NewSateliteWidget(void);
  QWidget* NewPropertyWidget(void);
  QMenu* NewContextMenu(void);

  // reimplement standarditem data access to mName
  QVariant data(int role = Qt::UserRole+1) const;

public slots:

  // update widget
  /*
  void Update(void);
  */

  // extension specific: flag
  bool Valid(void) const;
  bool Enabled(void) const;
  void Enabled(bool flag);

  // extension specific: set file returns false on error
  const QString& ExtensionFile(void) const;
  bool ExtensionFile(const QString& extfile);


signals:

  // update dependants
  void NotifyUpdate(void);

  // talk to user
  void TextMessage(const QString&,int);


private:

  // my data
  bool mEnabled;
  bool mValid;

};





/*
 ************************************************
 ************************************************

 A ExtensionMainWidget is a view to go with
 the Extension item. It shows the extension by some
 statistical information.

 ************************************************
 ************************************************
 */

// class definition
class ExtensionMainWidget : public QWidget  {

  Q_OBJECT

public:

  // construct/destruct
  ExtensionMainWidget(QWidget* parent);
  virtual ~ExtensionMainWidget(void);

  // get/set model
  Extension* Model(void);
  void Model(Extension* model);


public slots:

  // update from model
  void Update(void);


signals:

  // notify user interaction
  //void MousePressExtension(const QString& extfile);

private:

  // typed reference
  Extension* pExtension;

  // layout
  TableLayout* mVbox;  
  QScrollArea* mScrollArea;
  QWidget* mContent;

};


/* 
 ******************************************
 ******************************************
 ******************************************

 A ExtensionProperties is a widget to edit
 properties of a Extension

 ******************************************
 ******************************************
 ******************************************
 */

class ExtensionProperties : public QWidget {

Q_OBJECT

public:
   ExtensionProperties(WspPool* extpool, QWidget *parent = 0);

public slots:

   // connect to particular extension ("" for disconnect)
   void Connect(QString extension);

   // commit changes
   void Commit(void);

   // update from extension
   void Update(void);


private:

   // ref to my extpool
   ExtensionPool* pExtPool;

   // extension ("" for disconnected)
   QString mExtension;

   // gui items
   QLabel* mFileName;
   VioCheckBox* mCheckEnabled;
};



/**
 * ExtensionPool
 *
 */

class ExtensionPool : public WspPool {

Q_OBJECT


 public:

  // make variables friend to call FixMap
  friend class Extension;

  // constructor/destructor
  ExtensionPool(QObject* parent = 0);
  virtual ~ExtensionPool();

  // overload
  Extension* At(int position);
  const Extension* At(int position) const;
  Extension* At(const QString& name);
  /*
  void InsertAnonymous(int pos);
  void InsertAnonymous(int pos, const QString& ftype);
  */


public slots:  

  // initialise from DESTool extension directory
  void Initialize(const QString& extdir="");

  // apply changes to DESTool extension directory
  void Install(void);

  // Append an extension file
  int AppendFile(const QString& extfile);

  // run contextmenu
  void RunContextMenu(QPoint rPoint, const QString rName);
  void RunContextMenu(QPoint rPoint);

signals:


protected:

  // factory
  virtual Extension* NewItem(void);

  // overload
  int DoInsert(int postion, WspItem* item);


};




/**
 * ExtensionPoolBrowser
 *
 * Comfort version of pool view, with property widget and integrated itemview
 *
 */

class ExtensionPoolBrowser : public QWidget {

Q_OBJECT


 public:

  // constructor/destructor
  ExtensionPoolBrowser(ExtensionPool* pool, QWidget* parent = 0);
  virtual ~ExtensionPoolBrowser();

  // my menu
  QMenu* Menu(void);

 public slots:

  // track selection/click to update properties
  void Select(QString varname, bool show=true);
  
  // have state adapted menu
  void UpdateMenu(void);

  // pass on poolview slots
  void UserInsert(void) { mPoolView->UserInsert();};

  // cancel ---  quit
  void Cancel(void);


 signals:

  void RaiseVariableRequest(const QString& name);

 protected:

  // my widgets
  ExtensionPool* pExtPool;
  WspPoolView* mPoolView;
  WspItemView* mItemView;
  ExtensionProperties* mProperties;

  // my state
  QString mActiveExtension;
  QMenu* mMenu; 

  // other gui elements
  QAction* mNewAction;
  QAction* mSaveAllAction;
  QAction* mLoadAllAction;
  QAction* mInstallAction;
  QPushButton* mInstallButton;
  QPushButton* mInitializeButton;
  QPushButton* mCancelButton;

};




/*
 ************************************************
 ************************************************

 A WspExtensionManager is a wsp-item to
 represent the EtensionPoolBrowser. There can
 only be one such item and we cheat on the
 model-view paradigm in that the item
 hosts its view.

 ************************************************
 ************************************************
 */


// class definition
class WspExtensionManager : public WspItem  {

  Q_OBJECT

public:

  // construct/destruct
  WspExtensionManager(QObject* parent);
  virtual ~WspExtensionManager(void);

  // overload wsp item: produce widgets
  QWidget* NewMainWidget(void);


private:

  // the extension pool is wrapped as an item
  ExtensionPool* mExtPool;

};






#endif
