/** @file wspvariables.h - workspace variables. */

/*
  FAU Discrete Event Systems Library (libfaudes)

  Copyright (C) 2010 Thomas Moor
*/


#ifndef FAUDES_WSPFUNCTIONS_H
#define FAUDES_WSPFUNCTIONS_H



#include "libfaudes.h"
#include "libviodes.h"
#include "wspitems.h"
#include "wspviews.h"




// forward
class WspFunctionPool;
class WspFunctionView;


/**
 * WspFunction
 *
 * An WspFunction hosts a VioLuaFunctionDefinition and is owned by an WspFunctionPool.
 * Within the pool, the WspFunction is indentified by an unique name. The 
 * name must be different to any built in rti function.
 *
 * A WspFunction inhertits the maintenance mechanisms from WspItem. In addition,
 * it halds a faudes luafunction, a state and a tailored contextmenue.
 *
 * As with any wsp iten, functions are constructed with parent null. You 
 * then must either set a name directly, or read the function from 
 * eg tokenreader. To obtain a fully functional object, you must append it 
 * to a function pool. This makes the pool the parent of the function. 
 * Then you may rename the the function if you wish.
 */

class WspFunction : public WspItem {

Q_OBJECT


 public:

  // Constructor, (invalid variable, needs at least a name and a pool)
  WspFunction(QObject* parent = 0);
 
  // Style: change to plain just after construction
  void PlainScript(void);
  bool IsPlainScript(void);

  // Destructor
  virtual ~WspFunction(void);

  // Overload wsp item functins
  WspFunctionPool* Pool(void);
  virtual QWidget* NewMainWidget(void);
  virtual QWidget* NewSateliteWidget(void);
  virtual QWidget* NewPropertyWidget(void);
  virtual QMenu*   NewContextMenu(void);

  // clear: set all data to default/empty
  void Clear(void);
  
  // flush: update item from view(s)
  void Flush(void);

  // get value (reference) 
  const faudes::LuaFunctionDefinition*  FaudesLuaFunction(void);

  // get visual 
  const VioModel* VioLuaFunction(void) const;

  // import/export (0==ok)
  int Export(const QString& filename) const;
  int Import(const QString& filename);

  // record/query user changes 
  bool Modified(void) const;
  virtual void Modified(bool ch);

  // install function to lua state (NULL for global state, exceptions on error)
  void Install(faudes::LuaState* pL=NULL);

public slots:

  // user interaction 
  int UserImport(void);

  // highlite/show request (pass on to visual models, i.e. line)
  void Highlite(const VioElement& elem, bool on=true);
  void HighliteClear();

   // collect childs signature changes (debugging only)
   void ChildSignatureChange(void);

signals:

  // signature edited by user
  void NotifySignatureChange(void);

protected slots:


protected:

  // Implement/overload wsp item methods
  virtual void DoWrite(faudes::TokenWriter& rTw,  const QString& rLabel="") const;
  virtual void DoRead(faudes::TokenReader& rTr,  const QString& rLabel="");
  virtual void DoExternalWrite(const QString& rFilename,  const QString& rLabel="") const;
  virtual void DoExternalRead(const QString& rFilename,  const QString& rLabel="");
  virtual void DoName(const QString& rNewName);

  // track value changes for my own purposes 
  virtual void ChildModified(bool changed);

  // factory
  virtual WspItemView* NewView(void);

  // Typed version of pool
  WspFunctionPool* pFnctPool;

  // my value
  VioModel* mVioLuaFunction;


}; // WspFunction



/**
 * WspFunctionView
 *
 * Abstract base class for all views concerning workspace-functions
 * This class porvides an interface for suggesting entries to menues
 * e.g. Cut/Paste Undo/Redo.
 *
 */

class WspFunctionView : public WspItemView {

  Q_OBJECT

public:

  // constructor/destructor
  WspFunctionView(WspPool* pool=0, QWidget* parent = 0);
  virtual ~WspFunctionView();

  // get/set model 
  virtual const WspFunction* Model(void) const;
  virtual void Model(WspItem* pModel);

  // Returns edit/view/file actions (note: change on new model spontanously)
  virtual QList<QAction*> EditActions(void);
  virtual QList<QAction*> ViewActions(void);
  virtual QList<QAction*> FileActions(void);


protected:

  // typed reference to model
  WspFunction* pFunction;

  // dummy action to build action lists
  QAction* mSeparator;

  // load and save (should go to itemview)
  QAction* mLoadAct;
  QAction* mSaveAct;

}; // WspFunctionView



/* 
 ******************************************
 ******************************************
 ******************************************

 A WspFunctionProperties is a widget to edit
 properties of a WspFunction

 ******************************************
 ******************************************
 ******************************************
 */

class WspFunctionProperties : public QWidget {

Q_OBJECT

public:
   WspFunctionProperties(WspFunctionPool* varpool, QWidget *parent = 0);

public slots:

   // connect to particular variable ("" for disconnect)
   void Connect(QString variable);

   // commit changes
   void Commit(void);

   // update from variable
   void Update(void);

protected slots:

   // change of name/type
   void ReName(void);

private:

   // ref to my varpool
   WspFunctionPool* pFnctPool;

   // function ("" for disconnected)
   QString mFunction;

   // gui items
   QLineEdit* mEditName;
};



/**
 * WspFunctionPool
 *
 * WspFunctionPool is a pool og WspFunctions, ie luafaudes extensions
 * embeded in VioLuaFunction objects. Strictly speaking, a WspFunctionPools
 * deal with function definitions. They can be used to create ScrOperation
 * options, that then host actual functions. 
 * 
 * The WspFunctionPool has two distinct interfaces: the std WspPool
 * interface indeed is the list of WspFunctons using At(), Insert(), Erase().
 * the alternative interface Definition() and NewFunction() merges the viodes built in
 * functions with the luafaudes extensions. 
 *
 */


// forward
class WspFunctionInsertMenu;


class WspFunctionPool : public WspPool {

Q_OBJECT

public:

  // constructor/destructor
  WspFunctionPool(QObject* parent = 0);
  virtual ~WspFunctionPool();

  // overload std pool interface to check name wrt built in fncts
  void Clear(void);
  WspFunction* At(int position);
  const WspFunction* At(int position) const;
  WspFunction* At(const QString& name);
  void InsertAnonymous(int pos);

  // combined with built in functions access
  const faudes::FunctionDefinition* Definition(const QString& name);


public slots:  

  // highlite/show request (pass on to views)
  void Highlite(const QString& fnctname, const VioElement& elem, bool on=true);
  void HighliteClear(const QString& fnctname="");

  // user runs help
  void Help(const QString& name);
  void Help(void);

  // extend by user  (>=0 on success)
  int UserAppendFromFile(void);

  // install functions to lua state (NULL for global state, no errors)
  void LuaInstall(faudes::LuaState* pL=NULL);

signals:

  // user interaction
  void MouseClick(const QString& fnctname, const VioElement& elem);
  void MouseDoubleClick(const QString& fnctname, const VioElement& elem);

protected:

  // factory overload
  virtual WspFunction* NewItem(void);
  virtual WspItem* TestItem(WspItem* item);

  // overload
  int DoInsert(int postion, WspItem* item);
  bool DoValidName(const QString& newname);


};




/**
 * WspInsertMenu
 *
 *
 */


class WspFunctionInsertMenu : public QObject {

Q_OBJECT


public:

  // constructor/destructor
  WspFunctionInsertMenu(WspFunctionPool* fnctpool, QObject* parent = 0);
  virtual ~WspFunctionInsertMenu();

  // access
  QMenu*  mBuiltIn;
  QMenu*  mLuaAll;
  QMenu*  mLuaFunctions;
  QMenu*  mLuaScripts;

protected slots:

  // my updater
  void UpdateExtMenu(void);

 protected:

  // context
  WspFunctionPool* pFnctPool;


};



#endif




