/** @file wspvariables.h - workspace variables. */

/*
  FAU Discrete Event Systems Library (libfaudes)

  Copyright (C) 2009 Ruediger Berndt
  Copyright (C) 2009-2025 Thomas Moor
*/


#ifndef FAUDES_WSPVARIABLES_H
#define FAUDES_WSPVARIABLES_H



#include "libfaudes.h"
#include "libviodes.h"
#include "wspitems.h"
#include "wspviews.h"




// forward
class WspVariablePool;
class WspVariableView;

/**
 * WspVariable
 *
 * An WspVariabel is owned by an WspVariablePool and within the pool indentified
 * by a unique name. 
 *
 * A WsoVariable inhertits the maintenance mechanisms from WspItem. In addition,
 * it haolds a faudes typed object, a state and a tailored contextmenue.
 *
 * The values of a WspVariables can have different sources: read from 
 * file (ReadFile), result of an operation (OperationResult), or 
 * constants (Constant). A Variable can have a valid value or not.
 *
 * As with any wsp iten, variables are constructed with parent null. You then must 
 * either set a name and type directly, or read the variable from eg tokenreader. 
 * To obtain a fully functional variable, you must append it to a variable pool. 
 * This makes the variable pool the parent of the variable. Then you may
 - retype or 
 - rename
 * the variable if you wish.
 */

class WspVariable : public WspItem {

Q_OBJECT


 public:

  // Constructor, (invalid variable, needs at least a name and a pool)
  WspVariable(QObject* parent = 0);

  // Destructor
  virtual ~WspVariable(void);

  // Overload wsp item functins
  WspVariablePool* Pool(void);
  virtual QWidget* NewMainWidget(void);
  virtual QWidget* NewSateliteWidget(void);
  virtual QWidget* NewPropertyWidget(void);
  virtual QMenu*   NewContextMenu(void);

  // clear: set all data to zero/emptyset; set source unknown/invalid 
  void Clear(void);
  
  // assign from other variable (keep type)
  void Assign(const WspVariable* pSrc);

  // clear: faudes value only 
  void FaudesClear(void);

  // get value (reference) 
  const faudes::Type*  FaudesValue(void) const;

  // set value ( wspvariable takes ownership
  void FaudesValue(faudes::Type*);

  // get visual (or 0)
  const VioModel* VisualModel(void) const;

  // set/get elementary types (ignore on type mismatch)
  bool BooleanValue(void) const;
  void BooleanValue(bool val);
  int IntegerValue(void) const;
  void IntegerValue(int val);
  QString StringValue(void) const;
  void StringValue(const QString& val);

  // elementary type string conversion (int, bool, string)
  bool ElementaryType() const;
  bool ElementaryFromString(const QString& val);
  bool ElementaryToString(QString& str) const;
  QString LongName(void) const;

  // update visual after value change
  void UpdateVisual(void);

  // import/export (0==ok)
  int Export(const QString& filename) const;
  int Import(const QString& filename);

  // set/get variable source
  typedef enum {Unknown, ReadFile, OperationResult, WorkSpace, Constant} VariableSource;
  VariableSource Source(void) const;
  void Source(VariableSource source);
  bool Valid(void) const;
  void Valid(bool valid);

  // record/query user changes 
  bool Modified(void) const;
  virtual void Modified(bool ch);

public slots:

  // Dynamic UI properties (not supported by Qt?)
  virtual const QString& ToolTip(void);
  virtual void ToolTip(const QString& rText);
 

  // set/get faudes type
  const QString& FaudesType(void) const;
  const QString& FaudesType(const QString& ftype); // invalidates refs (!)

  // set/get faudes name (need to extend viomodel)
  /*
  QString FaudesName(void) const;
  QString FaudesName(const QString& fname); 
  void FaudesClear(void);
  */

  // set/get flags
  void Plant(bool plant);
  bool Plant(void) const;
  void Supervisor(bool supo);
  bool Supervisor(void) const;

  // user interaction 
  int UserImport(void);
  int UserExport(void);

  // highlite/show request (pass on to visual models)
  void Highlite(const VioElement& elem, bool on=true);
  void HighliteClear();

signals:

  // user interaction
  void MouseClick(const QString& varname, const VioElement& elem);
  void MouseDoubleClick(const QString& varname, const VioElement& elem);


protected slots:

  // user interaction context menu
  void ShowStatistics(void);
  void ShowStatistics(QWidget* wid);

  // user interaction from vio model (passed on to signals)
  void MouseClick(const VioElement& elem);
  void MouseDoubleClick(const VioElement& elem);


protected:

  // Implement/overload wsp item methods
  virtual void DoWrite(faudes::TokenWriter& rTw,  const QString& rLabel="") const;
  virtual void DoRead(faudes::TokenReader& rTr,  const QString& rLabel="");
  virtual void DoExternalWrite(const QString& rFilename,  const QString& rLabel="") const;
  virtual void DoExternalRead(const QString& rFilename,  const QString& rLabel="");
  virtual void DoVisual(bool vis);
  virtual void DoPersistent(bool vis);
  virtual void DoName(const QString& rNewName);

  // track value changes for my own purposes 
  virtual void ChildModified(bool changed);

  // reimplement standarditem data access 
  virtual QVariant data(int role) const;
  void setData(const QVariant& value, int role);

  // factory
  virtual WspItemView* NewView(void);

  // Typed version of pool
  WspVariablePool* pVarPool;

  // Variable specific properties
  QString mFaudesType;
  bool mPlant;
  bool mSupervisor;
  VariableSource mSource;
  bool mValid;

  // my value
  faudes::Type* mFaudesObject;
  VioModel* mVioModel;
  const faudes::Type* pFaudesObject;

  // allocate: get memory, invalidates references (!)
  void Allocate(void);


}; // WspVariable



/**
 * WspVariableView
 *
 * Abstract base class for all views concerning workspace-variables.
 * This class porvides an interface for suggesting entries to menues
 * e.g. Cut/Paste Undo/Redo.
 *
 */

class WspVariableView : public WspItemView {

  Q_OBJECT

public:

  // constructor/destructor
  WspVariableView(WspPool* pool=0, QWidget* parent = 0);
  virtual ~WspVariableView();

  // get/set model 
  virtual const WspVariable* Model(void) const;
  virtual void Model(WspItem* pModel);

  // Returns edit/view/file actions (note: change on new model spontanously)
  virtual QList<QAction*> EditActions(void);
  virtual QList<QAction*> ViewActions(void);
  virtual QList<QAction*> FileActions(void);


protected:

  // typed reference to model
  WspVariable* pVariable;

  // dummy action to build action lists
  QAction* mSeparator1;
  QAction* mSeparator2;

  // load and save (should go to itemview)
  QAction* mLoadAct;
  QAction* mSaveAct;

}; // WspVariableView



/* 
 ******************************************
 ******************************************
 ******************************************

 A WspVariableProperties is a widget to edit
 properties of a WspVariable

 ******************************************
 ******************************************
 ******************************************
 */

class WspVariableProperties : public QWidget {

Q_OBJECT

public:
   WspVariableProperties(WspVariablePool* varpool, QWidget *parent = 0);

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
   void ReType(void);

private:

   // ref to my varpool
   WspVariablePool* pVarPool;

   // variable 
   QString mVariable;
   bool mLock;

   // gui items
   QLineEdit* mEditName;
   QComboBox* mComboType;
   VioCheckBox* mCheckPersistent;
   VioCheckBox* mCheckFile;
   VioCheckBox* mCheckVisual;
   VioCheckBox* mCheckPlant;
   VioCheckBox* mCheckSuper;
};



/**
 * WspVariablePool
 *
 *
 *
 *
 */

class WspVariablePool : public WspPool {

Q_OBJECT


 public:

  // make variables friend to call FixMap
  friend class WspVariable;

  // constructor/destructor
  WspVariablePool(QObject* parent = 0);
  virtual ~WspVariablePool();

  // overload
  WspVariable* At(int position);
  const WspVariable* At(int position) const;
  WspVariable* At(const QString& name);
  void InsertAnonymous(int pos);
  void InsertAnonymous(int pos, const QString& ftype);

  // extra edit/access functions
  bool ReType(const QString& name, const QString &newtype);    // return true if did exist and newtype ok
  bool ExistsByType(const QString& name, const QString &ftype);    

  // extract filtered lists
  QList<QString> NameListByType(const QString& ftype);
  QList<QString> NameListByType(faudes::Type* fobject);

  // invalidate values
  void Invalidate(void);
  int  EraseUnknown(void);

public slots:  

  // return 0 on happy, 1 on any error
  int UserExternalSave(void);

  // highlite/show request (pass on to views)
  void Highlite(const QString& varname, const VioElement& elem, bool on=true);
  void HighliteClear(const QString& varname="");
  void Show(const QString& varname, const VioElement& elem);

  // run contextmenu
  void RunContextMenu(QPoint rPoint, const QString rName);
  void RunContextMenu(QPoint rPoint);

  // install access functions
  void LuaInstall(void);

signals:

  // user interaction
  void MouseClick(const QString& varname, const VioElement& elem);
  void MouseDoubleClick(const QString& varname, const VioElement& elem);

protected:

  // factory
  virtual WspVariable* NewItem(void);
  virtual WspItem* TestItem(WspItem* item);

  // overload
  int DoInsert(int postion, WspItem* item);


};


// helper: esternal save dialog
class WspExternalSaveDialog : public QDialog {
Q_OBJECT
public:
  WspExternalSaveDialog(WspVariablePool* pool, QWidget* parent=0);
  virtual ~WspExternalSaveDialog();
  virtual int exec(void);
  void setHasDiscard(bool show);
  void setText(const QString& text);
 public slots:
  void Save(void);
  void Cancel(void);
  void Discard(void);
 protected:
  WspVariablePool* pPool;
  QListWidget* mTodoVariables;
  QDialogButtonBox* mBbox;
  QLabel* mTbox;
};
 


/**
 * WspPoolBoweser
 *
 * Comfort version of pool view, has some additional property widget
 *
 */

class WspVariablePoolBrowser : public QWidget {

Q_OBJECT


 public:

  // constructor/destructor
  WspVariablePoolBrowser(WspVariablePool* pool, QWidget* parent = 0);
  virtual ~WspVariablePoolBrowser();

  // my menu
  QMenu* Menu(void);

 public slots:

  // set/get active item (pass on to poolview)
  void ActiveItem(QString varname);
  QString ActiveItem(void);
  
  // have state adapted menu
  void UpdateMenu(void);

  // pass on poolview slots
  void UserInsert(void) { mPoolView->UserInsert();};


 signals:

  void RaiseVariableRequest(const QString& name);

 protected:

  // my widgets
  WspVariablePool* pVarPool;
  WspPoolView* mPoolView;
  WspVariableProperties* mProperties;

  // my state
  QString mActiveVariable;
  QMenu* mMenu; 

  // other gui elements
  QAction* mNewAction;
  QAction* mRemoveUnusedAction;
  QAction* mSaveAllAction;
  QAction* mLoadAllAction;

};


#endif




