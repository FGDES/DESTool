/* scroperation.h  -  operations on scrvariables  */


/*
   Visual skripting for FAU Discrete Event Systems Library (libfaudes)

   Copyright (C) 2006, 2007  Thomas Moor, Klaus Schmidt, Sebastian Perk

*/


#ifndef SCROPERATION_H
#define SCROPERATION_H

#include "libviodes.h"
#include "wspvariables.h"
#include "wspfunctions.h"


/*
 ************************************************
 ************************************************

 A ScrOperation can perform a libfaudes function from a WspFunctionPool
 on variables from a WspVariablePool. Technically, it uses the 
 WspFunctionPool to create the actual function object and retrieves the faudes 
 objects from the WspVarialePool.

 The operation itself is an WspItem that is intendend to participate in a
 ScrProgram (currently not a pool, but should become one in a future cleanup)

 This is a lazy implementation in that the context (pools, function) are fixed.
 You must (1) use the default constructor (2) insert the operation to a program,
 and (3) set the function definition. In this order. You cannot move pools
 or change the function definition later.

 ScrOperations can be
   Waiting - operands not ready yet
   Ready   - could execute
   Running - performs faudes operation
   Done    - has been executed since initialisation
   Error   - Variables doesnt exist, execution triggered exception 

 ************************************************
 ************************************************
 */


// forward
class ScrProgram;

// class definition
class ScrOperation : public WspItem  {

Q_OBJECT

public:

  // construct: default, not functional
  ScrOperation(QObject* parent=0);

  // construct/destruct
  virtual ~ScrOperation(void);
  
  // access basic configuration 
  ScrProgram*      Program(void);
  WspVariablePool* VariablePool(void);
  WspFunctionPool* FunctionPool(void);

  // query dynamic configuration
  QString Function(void) const;   // function id within the WspFunctionPool
  int Variant(void) const;     // current variant (-1 for invalid)

  // query dimensions
  int VariantCount(void) const;
  int ParameterCount(void) const;
  int VectorCount(int n) const;
  int OptionCount(void) const;

  // query titles by index
  QString VariantDescr(int n) const;
  QString ParameterDescr(int n, int m=0) const;
  QString VectorDescr(int n) const;
  QString OptionDescr(int n) const;
  QString OptionToolTip(int n) const;
  QString OptionWhatsThis(int n) const;
 
  // query required types by index
  QString ParameterType(int n) const;
  QString ParameterAttr(int n) const;

  // query variables by positional index
  bool OptionVal(int n) const;
  QString ParameterVar(int n, int m=0) const;


  // typecheck variable for position
  bool TypeCheck(const QString& varname, int n, int m=0);
  bool TypeCheck(faudes::Type* fvar, int n, int m=0);
 
  // state
  typedef enum { Initialized, Waiting, Ready, Running, Done, Error } OperationState;
  OperationState State(void);
  QString StateInfo(void);
  QString StateExtraInfo(void);

  // context menu
  QMenu* NewContextMenu(void);


public slots:

  // configure (0<>OK)
  int FunctionDefinition(QString functname="");

  // changes in signatures
  int ReconfigureSignatures(void);

  // set variant/vector
  int Variant(QString name);
  int Variant(int n);
  int VectorCount(int n, int m);

  // set parameters/options variables
  void ParameterVar(QString varname, int n, int m=0);
  void OptionVal(bool opt, int n);

  // prepare variables, test operands
  OperationState Initialize(void);

  // execute operation 
  virtual OperationState ExecutePreA(void);
  virtual OperationState ExecutePreB(void);
  virtual OperationState ExecuteFaudes(void);
  virtual OperationState ExecutePostA(void);
  virtual OperationState ExecutePostB(void);
  virtual OperationState Execute(void);

signals:

  // notify user changes
  void StateChanged(ScrOperation::OperationState state);
  void VariantChanged(void);
  void VectorChanged(int n);
  void NotifySignatureChange(void);

  // issue highlite requests (e.g. on lua error)
  void HighliteRequest(const QString& name, const VioElement& elem, bool show=true);
  void StatusMessageRequest(const QString& name, const QString& text);


protected:

  // reimplement wspitem
  virtual void DoPool(WspPool* pPool);
  virtual void DoWrite(faudes::TokenWriter& rTw,  const QString& rLabel="") const;
  virtual void DoRead(faudes::TokenReader& rTr,  const QString& rLabel="");

  // id
  QString mOperationDescr; // aka faudes function name

  // rti function
  faudes::Function* mpFnctnObject;
  int mFnctnVariant;

  // operands/options/results
  QList<QStringList> mParameterDescr;
  QList<QStringList> mParameterVars;
  QList<QString> mParameterTypes;
  QList<QString> mVectorDescr;
  QList<QString> mVectorTypes;
  QList<faudes::vBaseVector*> mFaudesVectors;
  QList<QString> mParameterAttr;
  QList<bool> mOptionVals;
  QList<QString> mOptionDescr;
  QList<QString> mOptionToolTip;
  QList<QString> mOptionWhatsThis;

  // std options
  bool mMakeDet;
  bool mMakeMin;
  bool mClearOps;
  bool mClearNames;
  bool mClearAttributes;
  bool mAllObservable;
  bool mAllControllable;


  // my state
  OperationState mState;
  QString mStateInfo;
  QString mStateExtraInfo;

  // my config
  const faudes::FunctionDefinition* pFnctnDefinition;

  // set state and emit signal
  OperationState setState(OperationState state, QString info="", QString extrainfo="");
  OperationState setState(const faudes::Exception& exception);

  // add std options (use in constructor of derived classes)
  void OptionAddMinRealisation(void);
  void OptionAddClearOperands(void);
  void OptionAddClearNames(void); 
  /*
  void OptionAddDeterministic(void);
  void OptionAddClearAttributes(void); 
  void OptionAddAllControllable(void); 
  void OptionAddAllObservable(void); 
  */

};

/*
 ************************************************
 ************************************************

 The ScrExecute class provides execution of a
 ScrOperation in a thread to keep the main event
 loop alive. It is constructed with a ScrOperation 
 refernce.

 ************************************************
 ************************************************
 */


// class definition
class ScrExecute : public QThread  {

  Q_OBJECT

public:
  // import type
  typedef ScrOperation::OperationState OperationState;

  // construct/destruct
  ScrExecute(ScrOperation* op);
  ~ScrExecute(void);


public slots:
  // execute, call from application
  OperationState Execute(void);


private slots:

  // execute, call from this thread
  void Operate(void);
  
private:
  // start() thread calls run
  void run(void);

  // operation reference
  ScrOperation* pOp;  

};

#endif
