/** @file wspviews.h - Common basis for views on workspace items. */

/*
  FAU Discrete Event Systems Library (libfaudes)

  Copyright (C) 2009 Ruediger Berndt
  Copyright (C) 2009 Thomas Moor
*/


#ifndef FAUDES_WSPVIEWS_H
#define FAUDES_WSPVIEWS_H


#include "libfaudes.h"
#include "libviodes.h"
#include "desstyle.h"
#include "wspitems.h"

// forward
class DesProjectBrowser;


/**
 * WspItemView
 *
 * Abstract base class for all views concerning workspace-items.
 * This class porvide an interfaces for suggesting entries to menues
 * e.g. Cut/Paste Undo/Redo. Optionally, it may follow show requests
 * form an item pool.
 */

class WspItemView : public QWidget {

  Q_OBJECT

public:
  // constructor, prepare visual elements (e.g. MainLayout)
  WspItemView(WspPool* pool=0, QWidget* parent = 0);
  virtual ~WspItemView();

  // get/set model
  virtual const WspItem* Model() const;
  virtual void Model(WspItem* pModel);

  // get/set content widget
  void Content(QWidget* widget);
  QWidget* Content(void);

  // get/set satelite widget
  void Satelite(QWidget* widget);
  QWidget* Satelite(void);

  // Returns view actions
  virtual QList<QAction*> EditActions() { return QList<QAction*>(); };
  virtual QList<QAction*> ViewActions() { return QList<QAction*>(); };
  virtual QList<QAction*> FileActions() { return QList<QAction*>(); };

  // configure behaviour (default: false)
  bool FollowPool(void) const { return mFollowPool; };
  void FollowPool(bool on) { mFollowPool=on; };

public slots:

  // select an item from pool
  void ShowItem(QString itemname="", bool show=true);
  

signals:

  // notify new content
  void NotifyContent(void);

protected:

  // my pool
  WspPool* pPool;
  // my model
  WspItem* pItem;
  // my content
  QWidget* mContent;
  QWidget* mSatelite;

  // layout
  QVBoxLayout* mVbox;
  QVBoxLayout* mLbox;
  QVBoxLayout* mRbox;
  QSplitter* mSplitter;

  // behaviour config
  bool mFollowPool;


}; // WspItemView



/**
 * WspItemWindow
 *
 * A WspItemWindow is the window-version of a WspItemView. It uses the proposed
 * menu entries from the view and implements std user interaction. It refers
 * to the main browser window
 */

class WspItemWindow : public QMainWindow {
    Q_OBJECT

public:

  // construct
  WspItemWindow(WspItem* item, DesProjectBrowser* browser=0);
  virtual ~WspItemWindow(void);

  // access appearence
  const QString& Title(void) const;

  // access item 
  const QString& Name(void) const;
  int Id(void) const;
  const WspItem* Item(void) const;

  // view actions
  virtual QList<QAction*> EditActions() { return mView->EditActions(); };
  virtual QList<QAction*> ViewActions() { return mView->ViewActions(); };
  virtual QList<QAction*> FileActions() { return mView->FileActions(); };

public slots:

  // destruct myself on hide (needs redesign)
  void Show(bool show); 
  void Show(const QString& name, bool on);

  // update on item change
  void Update(void); 

  /*
  // user interaction
  void LoadItem(const QString &fileName);
  int  SaveItem(const QString &fileName);
  */

  void StatusBarMessage(const QString &message, int time=0);

signals:

  // notify activation
  void NotifyWindowActivate(int id);


protected:

  // reimplement to track events
  void closeEvent (QCloseEvent* event);
  bool event(QEvent* ev);

private:

  // main variables
  DesProjectBrowser* pBrowser;
  WspItem *pItem;
  WspItemView* mView;

 

};



/* 
 ******************************************
 ******************************************
 ******************************************

 A WspPropertiesView is a widget to edit
 item properties. It follows the selected
 items from a pool and is used by the 
 context menu of the pool view.

 ******************************************
 ******************************************
 ******************************************
 */

class WspPropertiesView : public QWidget {

Q_OBJECT

public:
   WspPropertiesView(WspPool* pool, QWidget *parent = 0);

public slots:

   // commit changes from view to item
   void Commit(void);

   // update view from item
   void Update(void);

protected slots:

   // change of name
   void ReName(void);

private:

   // ref to my pool
   WspPool* pPool;

   // gui items
   QVBoxLayout* mVbox;
   QLineEdit* mEditName;
   QCheckBox* mCheckPersistent;
   QCheckBox* mCheckFile;
   QCheckBox* mCheckVisual;
};


/**
 * WspPoolView
 *
 * View pools as listings by item names (e.g. browse variables)
 *
 */

class WspPoolView : public QTableView {

Q_OBJECT


 public:

  // constructor/destructor
  WspPoolView(QWidget* parent = 0);
  virtual ~WspPoolView();

  // access model
  virtual WspPool* Model(void);
  virtual void Model(WspPool* pool);
  
public slots:

  // user selection
  void UserSelect(const QString& iname, bool on);
  void UserSelectionClear(void);
  void UserDelSelection(void);
  void UserInsert(void);

  // contextmenu
  virtual void ContextMenuAtPoint(QPoint pos);
  virtual void ContextMenu(QPoint pos, const QModelIndex& index);

  // receive click (makes item issue a show request)
  void ShowItem(const QModelIndex &index);
  void RaiseItem(const QModelIndex &index);

signals:

  // pass on show request
  void RaiseItemRequest(const QString& name);

protected slots:

  // track current
  void currentChanged(const QModelIndex& current, const QModelIndex& previous);

protected:

  // sense keys
  void keyPressEvent(QKeyEvent *event);


  // edit state
  bool mInsertMode;
  bool mEditing;

  // re-implement qwidget to figure tool-tip events
  virtual bool event( QEvent * event );
};


#endif
