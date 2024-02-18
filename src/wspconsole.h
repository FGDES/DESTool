/* wspconsole.h  -  wsp version of faudes console   */


/*
   Gui for FAU Discrete Event Systems Library (libfaudes)

   Copyright (C) 2010  Thomas Moor

*/


#ifndef FAUDES_WSPCONSOLE_H
#define FAUDES_WSPCONSOLE_H

#include "libviodes.h"
#include "wspitems.h"
#include "wspviews.h"


/*
 ************************************************
 ************************************************

 A WspConsole is a wsp-item to represent
 the libFAUDES console by an VioConsole widget.

 There can only be one console and we cheat the
 model/view paradigm in that the WspConsole actually
 hosts the view widget.

 ************************************************
 ************************************************
 */


// class definition
class WspConsole : public WspItem  {

  Q_OBJECT

public:

  // construct/destruct
  WspConsole(QObject* parent);
  virtual ~WspConsole(void);

  // access 
  VioConsoleWidget* Console(void) { return mConsole;};

  // overload wsp item: produce widgets
  QWidget* NewMainWidget(void);

  // overload wsp item: produc view
  WspItemView* NewView(void);   

public slots:
  // reset lua state
  void LuaReset(void);

signals:

  // notify reset
  void NotifyLuaReset(void);



private:

  // use a vio console widget for logging
  // cheat: our model hosts its view
  VioConsoleWidget* mConsole; 

};



/*
 ************************************************
 ************************************************

 A WspConsoleMainWidget is a widget to view 
 the console log

 ************************************************
 ************************************************
 */


// class definition
class WspConsoleMainWidget : public QWidget   {

  Q_OBJECT


public:

  // construct/destruct
  WspConsoleMainWidget(QWidget* parent);
  virtual ~WspConsoleMainWidget(void);

  // get/set model
  WspConsole* Model(void);
  void Model(WspConsole* model);


protected:

  // model
  WspConsole* pConsole;

  // my layout
  QVBoxLayout* mVbox;

};



/**
 * WspConsoleView
 *
 * A WspConsoleView is a specialized view for wsp console
 * items. It holds the provided main widget by inheritance
 * plus reimplements edit actions for search and clear.
 *
 */

class WspConsoleView : public WspItemView {

  Q_OBJECT

public:

  // constructor/destructor
  WspConsoleView(WspPool* pool=0, QWidget* parent = 0);
  virtual ~WspConsoleView();

  // get/set model 
  virtual const WspConsole* Model(void) const;
  virtual void Model(WspItem* pModel);

  // Overwrite edit action
  virtual QList<QAction*> EditActions(void);

public slots:

  // reset lus interpreter
  void Reset(void);

signals:

  // notify reset
  void NotifyLuaReset(void);


protected:

  // typed reference to model
  WspConsole* pConsole;

  // dummy action to build action lists
  QAction* mSeparator1;
  QAction* mSeparator2;
  QAction* mSeparator3;

  // my actions
  QAction* mUndoAct;
  QAction* mRedoAct;
  QAction* mCutAct;
  QAction* mCopyAct;
  QAction* mPasteAct;
  QAction* mClearAct;
  QAction* mResetAct;
  QAction* mFindAct;
  QAction* mFindAgainAct;

}; // WspConsoleView




#endif
