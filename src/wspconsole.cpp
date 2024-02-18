/* wspconsole.cpp  -  wsp version of faudes console */


/*
   GUI for FAU Discrete Event Systems Library (libfaudes)

   Copyright (C) 2010 Thomas Moor.

*/



#include "wspconsole.h"



/*
 ********************************
 ********************************
 ********************************

 implementation of WspConsole

 ********************************
 ********************************
 ********************************
 */

// construct
WspConsole::WspConsole(QObject* parent) :  WspItem(parent) {
  FD_DI("WspConsole::WspConsole()");

  // overwrite wsp item defaults
  mName="Console";
  mPersistent=false;
  mItemType=ITConsole;
  mVisual=true;
  mViewSatelite=false;

  // have a vioconsole (parent 0 is essential)
  mConsole = new VioConsoleWidget(0);
}

// destruct
WspConsole::~WspConsole(void) {
  FD_DI("WspConsole::~WspConsole() A");
  if(mConsole->parent()==0) delete mConsole;
  FD_DI("WspConsole::~WspConsole() B");
}

// Overload wsp item functins: widgets
QWidget* WspConsole::NewMainWidget(void) {
  WspConsoleMainWidget* widget = new WspConsoleMainWidget(0);
  widget->Model(this);
  return widget;
}

// Overload wsp functions: view factory
WspItemView* WspConsole::NewView(void) {
  return new WspConsoleView();
}

// my only slot
void WspConsole::LuaReset(void) {
  mConsole->Reset();
  emit NotifyLuaReset();
}


/*
 ********************************
 ********************************
 ********************************

 implementation of WspConsoleMainWidegt

 ********************************
 ********************************
 ********************************
 */

// construct
WspConsoleMainWidget::WspConsoleMainWidget(QWidget* parent) :  
  QWidget(parent), 
  pConsole(0)
{
  
  FD_DI("WspConsoleMainWidget::WspConsoleMainWidget()");

  // have a layout
  mVbox= new QVBoxLayout(this);
  mVbox->setSpacing(0);
  mVbox->setContentsMargins(0,0,0,0);

  // fix appearance
  setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Expanding);
}

// destruct
WspConsoleMainWidget::~WspConsoleMainWidget(void) {
  FD_DI("WspConsoleMainWidget::~WspConsoleMainWidget()");
  Model(0);
}


// get model
WspConsole* WspConsoleMainWidget::Model(void) {
  return pConsole;
}

// set model
void WspConsoleMainWidget::Model(WspConsole* model) {
  FD_DI("WspConsoleMainWidget::Model()");
  // disconnect
  if(pConsole) {
    // find console wodget and return it to wspconsole
    while(QLayoutItem* litem = mVbox->takeAt(0)) {
      VioConsoleWidget* cwid=qobject_cast<VioConsoleWidget*>(litem->widget());
      if(!cwid) { delete litem; continue; }
      cwid->setParent(0); 
    }
  }
  pConsole=model;
  if(pConsole) {
    // can we get the widget from the item ?
    if(pConsole->Console()->parent()==0) {
      mVbox->addWidget(pConsole->Console());
    } else {
      mVbox->addWidget( new QLabel("Failed to load console. Sorry."));
    }
  }
}
 

/*
*****************************************
*****************************************
*****************************************

implementatio view

*****************************************
*****************************************
*****************************************
*/

// construct
WspConsoleView::WspConsoleView(WspPool* pool, QWidget* parent) :
  WspItemView(pool,parent),
  pConsole(0)
{
  FD_DI("WspConsoleView::WspConsoleView()");
  mSeparator1 = new QAction(this);
  mSeparator1->setSeparator(true);
  mSeparator2 = new QAction(this);
  mSeparator2->setSeparator(true);
  mSeparator3 = new QAction(this);
  mSeparator3->setSeparator(true);
 
  // create actions
  mUndoAct = new QAction("&Undo",this);
  mUndoAct->setShortcut(tr("Ctrl+Z"));
  mUndoAct->setEnabled(false);

  mRedoAct = new QAction("&Redo",this);
  mRedoAct->setShortcut(tr("Ctrl+Y"));
  mRedoAct->setEnabled(false);

  mCutAct = new QAction("&Cut",this);
  mCutAct->setShortcut(tr("Ctrl+X"));

  mCopyAct = new QAction("&Copy",this);
  mCopyAct->setShortcut(tr("Ctrl+C"));
   
  mPasteAct = new QAction("&Paste",this);
  mPasteAct->setShortcut(tr("Ctrl+V"));
  mPasteAct->setShortcutContext(Qt::WidgetWithChildrenShortcut);

  mClearAct = new QAction("Clear",this);
  mResetAct = new QAction("Reset Inerpreter",this);

  mFindAct = new QAction("Find",this);
  mFindAct->setShortcut(tr("Ctrl+F"));

  mFindAgainAct = new QAction("Find Again",this);
  mFindAgainAct->setShortcut(tr("Ctrl+G"));
}

// destruct
WspConsoleView::~WspConsoleView() {
  FD_DI("WspConsoleView::~WspConsoleView()");
}

// get model
const WspConsole* WspConsoleView::Model(void) const {
  return pConsole;
};

// set model: filter out elementary types
void WspConsoleView::Model(WspItem* item) {
  WspConsole* con = qobject_cast<WspConsole*>(item);
  // report
  FD_DI("WspConsoleView::Model(): set");
  // call base
  WspItemView::Model(con);
  pConsole = qobject_cast<WspConsole*>(pItem);
  // my disconnect
  disconnect(mCopyAct);
  disconnect(mCutAct);
  disconnect(mPasteAct);
  disconnect(mClearAct);
  disconnect(mResetAct);
  disconnect(mFindAct);
  disconnect(mFindAgainAct);
  // my connect
  connect(mCopyAct,SIGNAL(triggered(void)),pConsole->Console(),SLOT(Copy(void)));
  connect(mCutAct,SIGNAL(triggered(void)),pConsole->Console(),SLOT(Cut(void)));
  connect(mPasteAct,SIGNAL(triggered(void)),pConsole->Console(),SLOT(Paste(void)));
  connect(mClearAct,SIGNAL(triggered(void)),pConsole->Console(),SLOT(Clear(void)));
  connect(mResetAct,SIGNAL(triggered(void)),this,SLOT(Reset(void)));
  connect(mFindAct,SIGNAL(triggered(void)),pConsole->Console(),SLOT(FindDialog(void)));
  connect(mFindAgainAct,SIGNAL(triggered(void)),pConsole->Console(),SLOT(FindAgain(void)));
};


// my edit actions
QList<QAction*> WspConsoleView::EditActions() {
  QList<QAction*> actions;
  actions.append(mUndoAct);
  actions.append(mRedoAct);
  actions.append(mSeparator1);
  actions.append(mCutAct);
  actions.append(mCopyAct);
  actions.append(mPasteAct);
  actions.append(mSeparator2);
  actions.append(mClearAct);
  actions.append(mFindAct);
  actions.append(mFindAgainAct);
  actions.append(mSeparator3);
  actions.append(mResetAct);
  FD_DI("WspConsole::EditActions() : #" << actions.size());
  return actions;
}



// my only slot
void WspConsoleView::Reset(void) {
  if(!pConsole) return;
  pConsole->LuaReset();
}




