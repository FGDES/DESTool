/* scrprogram.h  -  list of operations  */


/*
   Visual skripting for FAU Discrete Event Systems Library (libfaudes)

   Copyright (C) 2006, 2007  Thomas Moor, Klaus Schmidt, Sebastian Perk

*/


#ifndef SCRPROGRAM_H
#define SCRPROGRAM_H

#include "libviodes.h"
#include "scroperation.h"
#include "wspvariables.h"
#include "wspfunctions.h"

/*
 ************************************************
 ************************************************

 A ScrProgram is a list of ScrOperations for
 sequential execution on a WspVariablePool.

 ScrPrograms can be in state
   Ready   - could execute one or more operations
   Done    - all operations have been executed successfully
   Locked  - waiting operations cannot been executed
   Error   - execution was unsuccessful, or variables coul not been allocated

 ************************************************
 ************************************************
 */


// class definition
class ScrProgram : public WspPool  {

  Q_OBJECT

public:
  // construct/destruct
  ScrProgram(WspVariablePool* varpool, WspFunctionPool* fnctpool, QObject* parent=0);
  ~ScrProgram(void);

  // get semantical parents 
  WspVariablePool* VariablePool(void) {return pVarPool;};
  WspFunctionPool* FunctionPool(void) {return pFnctPool;};

  // overload
  ScrOperation* At(int position);
  const ScrOperation* At(int position) const;
  ScrOperation* At(const QString& name);
  void InsertAnonymous(int pos);
  void InsertAnonymous(int pos, const QString& descr);

  // overload read 
  void Read(faudes::TokenReader& rTr, const QString& rLabel="");

  // clear all;
  void Clear();

  // execute
  typedef enum { Ready, Done, Error} ProgramState;
  ProgramState State(void);
  ProgramState Initialize(void);
  int Next(int pos);
  ProgramState Execute(int pos);
  ProgramState Run(void);

  // load/save variables
  void SaveResults(void);
  void SaveOperands(void);
 
  // context menu wrapper
  void RunContextMenu(QPoint point, int pos);


public slots:

  // edit list by slot (used by operation context menu)
  void EraseFunctionFromProgram(void);
  void EraseFunctionFromProgram(const QString& descr);
  void EraseFunctionFromProject(void);


signals:

  // only partly implemented!!
  void NotifyAnyChange(void);


protected:

  // factory
  virtual ScrOperation* NewItem(void);

  // variable pool refernce
  WspVariablePool* pVarPool;
  WspFunctionPool* pFnctPool;

  // my state
  ProgramState mState;

  // my menu
  WspFunctionInsertMenu* mInsertMenus;

};

#endif
