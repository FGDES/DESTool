/* scroperation.cpp  -  operations on scrvariables  */


/*
   Visual skripting for FAU Discrete Event Systems Library (libfaudes)

   Copyright (C) 2006, 2007  Thomas Moor, Klaus Schmidt, Sebastian Perk

*/


#include "scroperation.h"
#include "scrprogram.h"
#include "desstyle.h"


/*
 ********************************
 ********************************
 ********************************

 implementation of ScrOperation

 ********************************
 ********************************
 ********************************
 */


// construct default
ScrOperation::ScrOperation(QObject* parent) :
  WspItem(parent),
  pFnctnDefinition(0)
{
  FD_DS("ScrOperation::ScrOperation(" << parent << "): default");
  // set to void
  mpFnctnObject = 0;
  mFnctnVariant=-1;
}  

// deconstruct
ScrOperation::~ScrOperation(void) {
  FD_DS("ScrOperation::~ScrOperation(): " << VioStyle::StrFromQStr(Name()));
  if(mpFnctnObject) delete mpFnctnObject;
}



// set a function 
int ScrOperation::FunctionDefinition(QString fname) {
  // set default
  if(fname=="") fname=mOperationDescr;
  // bail out on invalid
  if(!Program()) return 1;
  // look up in function pool
  const faudes::FunctionDefinition* fdef = FunctionPool()->Definition(fname);
  // fail
  if(!fdef) {
    return 1;
  }
  // sense new faudes definition
  if(fdef!=pFnctnDefinition) {
    FD_DS("ScrOperation::Function(): new fdef" << fdef->Name());
    // connect/disconnect for editable functions (lua scripts)
    WspFunction* wfnct = FunctionPool()->At(mOperationDescr);  
    if(wfnct) {
      FD_DS("ScrOperation::Function(): disconnect " <<
         VioStyle::StrFromQStr(wfnct->Name()) << " at " << wfnct);
      disconnect(wfnct,0,this,0);
    }
    wfnct = FunctionPool()->At(fname);  
    if(wfnct) {
      FD_DS("ScrOperation::Function(): connect " <<
         VioStyle::StrFromQStr(wfnct->Name()) << " at " << wfnct);
      connect(wfnct,SIGNAL(NotifySignatureChange()),this,SLOT(ReconfigureSignatures()));
      connect(wfnct,SIGNAL(NotifyProperties()),this,SLOT(ReconfigureSignatures()));
    }
    // record
    pFnctnDefinition=fdef;
  }
  // go configure
  ReconfigureSignatures();
  // success
  return 0;
}

// become member of a pool aka program
void ScrOperation::DoPool(WspPool* pPool) {
  ScrProgram* program= qobject_cast<ScrProgram*>(pPool);
  if(!program) return; // error: invalid pool
  // call base
  WspItem::DoPool(pPool);
}

// get program (ie my pool)
ScrProgram* ScrOperation::Program(void) {
  return qobject_cast<ScrProgram*>(Pool());
}

// get variablepool
WspVariablePool* ScrOperation::VariablePool(void) {
  if(!Program()) return 0;
  return Program()->VariablePool();
}

// get fnctpool
WspFunctionPool* ScrOperation::FunctionPool(void) {
  if(!Program()) return 0;
  return Program()->FunctionPool();
}


// changes in signatures
int ScrOperation::ReconfigureSignatures(void) {
  if(!pFnctnDefinition) return 1;
  FD_DS("ScrOperation::ReconfigureSignatures()");
  // recreate prototype
  if(mpFnctnObject) delete mpFnctnObject;
  mpFnctnObject = pFnctnDefinition->NewFunction();
  mOperationDescr= VioStyle::QStrFromStr(pFnctnDefinition->Name());
  // configure global properties
  ToolTip( VioStyle::QStrFromStr(pFnctnDefinition->TextDoc()));
  HtmlPage("reference/"+ VioStyle::QStrFromStr(pFnctnDefinition->HtmlDoc()));
  // invalidate behavioural state
  mState=Error;
  // configure variant
  Variant(mFnctnVariant);
  // init state
  Initialize();
  // tell
  emit NotifySignatureChange();
  FD_DS("ScrOperation::ReconfigureSignatures(): done");
  return 0;
}
 
// query id
QString ScrOperation::Function(void) const {return mOperationDescr;};
int ScrOperation::Variant(void) const {return mFnctnVariant;};


// set variant by name
int ScrOperation::Variant(QString name) {
  // retrieve new signature index by name
  FD_DS("ScrOperation::Variant(): " << VioStyle::StrFromQStr(name));
  if(!pFnctnDefinition) return mFnctnVariant;
  int newvariant = pFnctnDefinition->VariantIndex(VioStyle::StrFromQStr(name));
  if(newvariant<0) return mFnctnVariant;
  return Variant(newvariant);
}

// set signature
int ScrOperation::Variant(int n) {
  FD_DS("ScrOperation::Variant(): A1 " << n);
  if(!pFnctnDefinition) return mFnctnVariant;
  FD_DS("ScrOperation::Variant(): A2 " << n);
  if(n<0) n=0;
  if(n>=pFnctnDefinition->VariantsSize()) n=-1;
  FD_DS("ScrOperation::Variant(): A3 " << n);
  mFnctnVariant=n;
  // keep copy of old for nice defaults
  QList<QStringList> oldvars=mParameterVars;
  QList<QStringList> olddescr=mParameterDescr;
  QStringList oldvdescr=mVectorDescr;
  // clear all
  mParameterDescr.clear();
  mParameterTypes.clear();
  mParameterVars.clear();
  mParameterAttr.clear();
  mOptionDescr.clear();
  mOptionVals.clear();
  mVectorDescr.clear();
  mVectorTypes.clear();
  foreach(faudes::Type* fvect,mFaudesVectors) if(fvect) delete fvect;
  mFaudesVectors.clear();

  // if we have no variants thats it
  if(n==-1) {
    emit VariantChanged();
    return mFnctnVariant;
  }


  // iterate parameters
  const faudes::Signature& fsig=pFnctnDefinition->Variant(mFnctnVariant);
  for(int pit=0; pit < fsig.Size(); pit++) {
    const faudes::Parameter& par = fsig.At(pit);
    FD_DS("ScrOperation::Variant(): " << par.Name() << " with type " << par.Type());
    // is it unknown ?
    if(!faudes::TypeRegistry::G()->Exists(par.Type())) {
	// ignore
    } else {
    // is this a vector?
    const faudes::vBaseVector*  fvect = 
      dynamic_cast<const faudes::vBaseVector*>( faudes::TypeRegistry::G()->Definition(par.Type()).Prototype());
    if(fvect) {
      FD_DS("ScrOperation::Variant(): sensed vector")  
      // vector, figure element type
      const faudes::Type* velem = fvect->Elementp();
      std::string vtype=faudes::TypeRegistry::G()->TypeName(*velem);
      FD_DS("ScrOperation::Variant(): vector elements " << vtype); 
      // vector, default dim is 0
      mVectorDescr.append(VioStyle::QStrFromStr(par.Name()));
      mVectorTypes.append(VioStyle::QStrFromStr(par.Type()));
      mParameterAttr.append(VioStyle::QStrFromStr(faudes::Parameter::AStr(par.Attribute())));
      mFaudesVectors.append(dynamic_cast<faudes::vBaseVector*>(fvect->New()));
      mParameterTypes.append(VioStyle::QStrFromStr(vtype));
      mParameterDescr.append(QStringList());
      QStringList vars= QStringList() << "" << "";
      if(pit<oldvars.size()) 
      if(oldvdescr.at(pit)==mVectorDescr.at(pit))
        vars= oldvars.at(pit);
      mParameterVars.append(vars);
      VectorCount(pit,vars.size());
    } else {
      FD_DS("ScrOperation::Variant(): std parameter")  
      // no vector
      mParameterAttr.append(VioStyle::QStrFromStr(faudes::Parameter::AStr(par.Attribute())));
      mVectorDescr.append("");
      mVectorTypes.append("");
      mFaudesVectors.append(0);
      mParameterTypes.append(VioStyle::QStrFromStr(par.Type()));
      mParameterDescr.append(QStringList() << VioStyle::QStrFromStr(par.Name()));
      QString vars = "";
      if(pit<oldvars.size()) 
      if(oldvars.at(pit).size()>=1) 
      if(olddescr.at(pit)==mParameterDescr.at(pit))
          vars= oldvars.at(pit).at(0);
      mParameterVars.append(QStringList() << vars);
    }} // double ifelse
  }
  // set in faudes function
  if(mpFnctnObject) {
    try {
      mpFnctnObject->Variant(mFnctnVariant);
    } catch(faudes::Exception& exception) {
    }
  } 
  // figure if we have generators for std options
  bool hasgen=false;
  bool hasinp=false;
  for(int i=0; i<ParameterCount(); i++) {
    if(mParameterAttr.at(i)=="In") {hasinp=true; continue;}
    std::string ftype = VioStyle::StrFromQStr(ParameterType(i));
    const faudes::Type* fproto = faudes::TypeRegistry::G()->Prototype(ftype);
    if(! dynamic_cast<const faudes::vGenerator*>(fproto) ) continue;
    hasgen=true;
  }
  if(hasinp) {
    OptionAddClearOperands();
  }
  if(hasgen) {
    OptionAddMinRealisation();
    OptionAddClearNames();
  }
  // done
  emit VariantChanged();
  return mFnctnVariant;
} 

// set vector dimension
int ScrOperation::VectorCount(int n, int m) {
  FD_DS("ScrOperation::VectorCount(" << n <<","<<m<<")");  
  // error
  if(n<0 || n>= mParameterDescr.size()) return -1;
  // no change
  if(mParameterDescr.at(n).size()==m) return m;
  // do set size shrink
  while(mParameterDescr.at(n).size()>m) mParameterDescr[n].pop_back();
  while(mParameterVars.at(n).size()>m) mParameterVars[n].pop_back();
  // do set size expand
  while(mParameterDescr.at(n).size()<m) 
    mParameterDescr[n].push_back(QString("%1_%2").arg(
      mVectorDescr[n]).arg(mParameterDescr.at(n).size()+1));
  while(mParameterVars.at(n).size()<m) mParameterVars[n].append("");
  // done
  emit VectorChanged(n);
  FD_DS("ScrOperation::VectorCount(" << n <<","<<m<<"): done");  
  return m;
}


// add std options
void ScrOperation::OptionAddMinRealisation(void) {
  mOptionDescr.append("Minimal Realisation");
  mOptionToolTip.append("Compute minimal realisation for generator-typed results");
  mOptionWhatsThis.append("Compute minimal realisation for generator-typed results");
  mOptionVals.append(false);
};
void ScrOperation::OptionAddClearOperands(void) {
  mOptionDescr.append("Clear Arguments");
  mOptionToolTip.append("Clear argument variables after execution (only for not persistent / no visual representation variables)");
  mOptionWhatsThis.append("Clear argument variables after execution (only for not persistent / no visual representation variables)");
  mOptionVals.append(false);
};
void ScrOperation::OptionAddClearNames(void) {
  mOptionDescr.append("Clear State Names");
  mOptionWhatsThis.append("Clear state names for generator-typed results");
  mOptionToolTip.append("Clear state names for generator-typed results");
  mOptionVals.append(false);
};

// query dimensions
int ScrOperation::VariantCount(void) const {
  if(!pFnctnDefinition) return 0;
  return pFnctnDefinition->VariantsSize();
}
int ScrOperation::OptionCount(void) const {return mOptionDescr.size();};
int ScrOperation::ParameterCount(void) const {return mParameterDescr.size();};
int ScrOperation::VectorCount(int n) const {
  if(n<0 || n>=mParameterDescr.size()) return -1;
  return mParameterDescr.at(n).size();
}

// query variables by index
QString ScrOperation::ParameterVar(int n, int m) const {
  if(n<0) return ""; return mParameterVars.at(n).at(m);};
bool ScrOperation::OptionVal(int n) const {
  if(n<0 || n>= mOptionVals.size()) return false; 
  return mOptionVals.at(n);};



// query types by index
QString ScrOperation::ParameterType(int n) const {
  if(n<0) return ""; return mParameterTypes.at(n);};

// query parameter attribute (In/Out/InOut)
QString ScrOperation::ParameterAttr(int n) const {
  if(n<0) return ""; return mParameterAttr.at(n);};

// query description by index
QString ScrOperation::VariantDescr(int n) const {
  if(n<0) return ""; 
  return QString(VioStyle::QStrFromStr(pFnctnDefinition->Variant(n).Name()));};
QString ScrOperation::VectorDescr(int n) const {
  if(n<0) return ""; return mVectorDescr.at(n);}
QString ScrOperation::ParameterDescr(int n, int m) const {
  if(n<0) return ""; return mParameterDescr.at(n).at(m);};
QString ScrOperation::OptionDescr(int n) const {
  if(n<0) return ""; return mOptionDescr.at(n);};
QString ScrOperation::OptionToolTip(int n) const {
  if(n<0) return ""; return mOptionToolTip.at(n);};
QString ScrOperation::OptionWhatsThis(int n) const {
  if(n<0) return ""; return mOptionWhatsThis.at(n);};

// set operands variables
void ScrOperation::ParameterVar(QString varname, int n, int m ) {  
  // auto extend vector
  if(mParameterVars.at(n).size()<=m) VectorCount(n,m+1);
  // set name
  mParameterVars[n][m]=varname;
  // ensure pool existence
  if(VariablePool()) {
    if(!VariablePool()->Exists(varname)) {
      VariablePool()->Append(varname);
      VariablePool()->ReType(varname,ParameterType(n));
    }
  }
};

// set options values
void ScrOperation::OptionVal(bool opt,int pos) {
  if(pos<0 || pos>= mOptionVals.size()) return; 
  mOptionVals[pos]=opt;
};


// typecheck a variable 
bool ScrOperation::TypeCheck(faudes::Type* fvar, int n, int m) {
  if(!fvar) return false;
  FD_DS("ScrOperation::TypeCheck(" << n <<","<<m<<"): by var with ftype " << 
    faudes::FaudesTypeName(*fvar));  
  // insist in function object
  if(!mpFnctnObject) return false;
  // no vector: test in faudes function
  if(m==0 && mVectorDescr.at(n).isEmpty()) {
    FD_DS("ScrOperation::TypeCheck(" << n <<","<<m<<"): std var");  
    bool tc=false;
    try {
      mpFnctnObject->ParamValue(n,fvar);
      tc=mpFnctnObject->TypeCheck(n);
      mpFnctnObject->ParamValue(n,0);
    } catch(faudes::Exception& exception) {
    } 
    return tc;
  }
  // no vector but positive m index ... internal error
  if(m!=0 && !mFaudesVectors.at(n))
    return false;
  // vector: test in faudes vector
  FD_DS("ScrOperation::TypeCheck(" << n <<","<<m<<"): std vect " << mFaudesVectors.at(n));  
  bool res=mFaudesVectors.at(n)->ElementTry(*fvar);
  return res;
}



// typecheck a variable 
bool ScrOperation::TypeCheck(const QString& varname, int n, int m) {
  FD_DS("ScrOperation::TypeCheck(" << n <<","<<m<<"): by name " <<
	VioStyle::StrFromQStr(varname));  
  // bail out if the variable is not known
  if(!VariablePool()) return false;
  WspVariable* var=VariablePool()->At(varname);
  if(!var) return false;          
  // retrieve faudes value ref
  const faudes::Type* cfvar = var->FaudesValue(); 
  faudes::Type* fvar = const_cast<faudes::Type*>(cfvar);
  if(!fvar) return false;
  // run on fvar
  return TypeCheck(fvar,n,m);
}


// initialize variables 
ScrOperation::OperationState ScrOperation::Initialize(void) {
  // bail out if there are no pools
  if(!VariablePool()) return setState(Error);
  FD_DS("ScrOperation::Initialize(): " << VioStyle::StrFromQStr(Name()));
  // check for variant
  if(!mpFnctnObject)
    return setState(Error,"invalid function", "cannot instantiate function object");
  try {
    mpFnctnObject->Variant(mFnctnVariant);
  } catch(faudes::Exception& exception) {
    return setState(Error,"invalid variant", "cannot set variant");
  } 
  // interpret std options: get options
  mMakeMin = false;
  mClearOps = false;
  mClearNames = false;
  for(int i=0; i<OptionCount(); i++) {
    if(OptionDescr(i)=="Minimal Realisation") mMakeMin=OptionVal(i);
    if(OptionDescr(i)=="Clear Operands") mClearOps=OptionVal(i);
    if(OptionDescr(i)=="Clear State Names") mClearNames=OptionVal(i);
  }
  // operands: enforce existence, test type
  for(int i=0; i<ParameterCount(); i++) {
  for(int j=0; j<VectorCount(i); j++) {
    // allocate variable
    if(!VariablePool()->Exists(ParameterVar(i,j))) {
      VariablePool()->Append(ParameterVar(i,j));
      VariablePool()->ReType(ParameterVar(i,j),ParameterType(i));
    }
    if(!VariablePool()->Exists(ParameterVar(i,j))) {
      FD_DS("ScrOperation::Initialize(): cannot allocate operand #" << i << " " << VioStyle::StrFromQStr(ParameterVar(i,j)));
      return setState(Error, "cannot allocate "+ParameterDescr(i,j));
    }
    // retrieve variable
    WspVariable* var=VariablePool()->At(ParameterVar(i,j));
    if(!var) return setState(Error);          
    // retrieve faudes value
    const faudes::Type* cfvar = var->FaudesValue(); 
    faudes::Type* fvar = const_cast<faudes::Type*>(cfvar);
    if(!fvar) return setState(Error, "cannot access "+ParameterVar(i,j));
    // typecheck in faudes function
    if(!TypeCheck(fvar,i,j)) return setState(Error,"type mismatch "+ParameterVar(i,j));
    // set source to op result and invalidate results
    if(ParameterAttr(i)=="Out") {
      var->Source(WspVariable::OperationResult);
      var->Valid(false);
    }
  }}
  //setState(Waiting, "initialized");
  mState=Initialized; // silent 
  FD_DS("ScrOperation::Initialize(): ok");
  return mState;
};


// update state
ScrOperation::OperationState ScrOperation::State(void) {
  // bail out if there is no varpool
  if(!VariablePool()) return mState=Error;
  // only update waiting and initialize*sd
  if(mState!=Waiting && mState!=Initialized) return mState;
  // check operands
  FD_DS("ScrOperation::State(): " << VioStyle::StrFromQStr(Name()));
  for(int i=0; i<ParameterCount(); i++) {
    if(ParameterAttr(i)=="Out") continue;
    for(int j=0; j<VectorCount(i); j++) {
      WspVariable* var=VariablePool()->At(ParameterVar(i,j));
      if(!var) return setState(Error);
      if(var->Source()==WspVariable::Unknown) return setState(Error, "unknown source "+var->Name());
      if(var->Source()==WspVariable::OperationResult && var->Valid()) continue;
      if(var->Source()==WspVariable::ReadFile) continue;
      if(var->Source()==WspVariable::WorkSpace) continue;
      if(var->Source()==WspVariable::Constant) continue;
      FD_DS("ScrOperation::State(): " << VioStyle::StrFromQStr(Name()) << " waiting for " << VioStyle::StrFromQStr(var->Name()));
      return setState(Waiting, "waiting for "+var->Name());
    }
  }
  FD_DS("ScrOperation::State(): " << VioStyle::StrFromQStr(Name()) << " ready");
  return setState(Ready);
}


// state
QString ScrOperation::StateInfo(void) { return mStateInfo;};
QString ScrOperation::StateExtraInfo(void) { return mStateExtraInfo;};

// set state
ScrOperation::OperationState ScrOperation::setState(ScrOperation::OperationState state, QString info, QString extrainfo) {
  FD_DS("ScrOperation:setState()");
  if(state==mState && info==mStateInfo) return mState;
  if(info=="") {
    switch(state) {
    case Error:       info="error"; break;
    case Initialized: info="initialized"; break;
    case Ready:       info="ready"; break;
    case Running:     info="running"; break;
    case Waiting:     info="waiting"; break;
    case Done:        info="done"; break;
    default: break;
    }
  }
  mState=state;
  mStateInfo=info;
  mStateExtraInfo=extrainfo;
  emit StateChanged(state);
  return mState;
}

// set state error
ScrOperation::OperationState ScrOperation::setState(const faudes::Exception& exception){
  // report
  FD_DS("ScrOperation::setState(except) " << exception.What());
  // emit show request (show lua scipt)
  FunctionPool()->ShowItem(mOperationDescr,true);
  // emit highlite request(in lua script)
  QString err=VioStyle::QStrFromStr(exception.What());
  if(err.startsWith("error in Lua script:")) {
    int c1 = err.indexOf(": line ");
    if(c1<0) c1=0;
    else c1+=QString(": line").length();     
    int c2 = err.indexOf(':',c1+1);
    if(c2<0) c2=1;
    int line = err.mid(c1+1,c2-c1-1).toInt();  
    if(c2>1) {
      FD_DS("ScrOperation:setState(): err in line " << line);
      err=QString("line %1: %2").arg(line).arg(err.mid(c2+2));
      emit HighliteRequest(mOperationDescr, VioElement::FromLine(line), true);
    }
  }
  // emit message request
  emit StatusMessageRequest(mOperationDescr, err);
  // done
  return setState(Error,"faudes exec error", exception.What());
}

// execute operation: load operands with visual rep
ScrOperation::OperationState ScrOperation::ExecutePreA(void) {
  // overwrite state
  if(mState==Done)    Initialize();
  if(mState==Error)   Initialize();
  if(mState==Waiting) Initialize();
  if(mState==Initialized) mState=Ready;
  if(mState!=Ready) return mState;
  // ok
  FD_DS("ScrOperation::ExecutePreA(): " << VioStyle::StrFromQStr(Name()));
  setState(Running);
  // flush views for editable functions (lua scripts)
  WspFunction* wfnct = FunctionPool()->At(mOperationDescr);  
  if(wfnct) {
    FD_DS("ScrOperation::ExecutePreA(): flush wsp function " <<
      VioStyle::StrFromQStr(wfnct->Name()) << " at " << wfnct);
    wfnct->Flush();
  }
  // read files with visual reppresentation
  for(int i=0; i<ParameterCount(); i++) {
    if(ParameterAttr(i)=="Out") continue;
    for(int j=0; j<VectorCount(i); j++) {
      WspVariable* var=VariablePool()->At(ParameterVar(i,j));
      if(!var) continue; // error
      if(!var->Visual()) continue; // deal with those later 
      if(!var->Valid() && var->Source()==WspVariable::ReadFile)
        if(var->Load()==0) var->Valid(true);
      if(!var->Valid()) 
        return setState(Error,"cannot read "+ParameterVar(i,j));
    }
  }
  return mState;
}

// execute operation: load non visual operands and preprocess
ScrOperation::OperationState ScrOperation::ExecutePreB(void) {
  if(mState!=Running)  return mState;
  FD_DS("ScrOperation::ExecutePreB(): " << VioStyle::StrFromQStr(Name()));
  // read all files here, assume visual vars have been dealt with
  for(int i=0; i<ParameterCount(); i++) {
    if(ParameterAttr(i)=="Out") continue;
    for(int j=0; j<VectorCount(i); j++) {
      WspVariable* var=VariablePool()->At(ParameterVar(i,j));
      if(!var) continue; // error
      if(!var->Valid() && var->Source()==WspVariable::ReadFile && !var->Visual())
        if(var->Load()==0) var->Valid(true);
      if(!var->Valid()) 
        return setState(Error,"cannot read "+ParameterVar(i,j));
    }
  }

  // disable statenames for results (NOTE: we should reorganize this and care about statenames
  // AFTER we made a copy !!!) (THIS includes visaul vars and is a cheat)!
  for(int i=0; i<ParameterCount(); i++) {
    if(ParameterAttr(i)=="In") continue;
    for(int j=0; j<VectorCount(i); j++) {
      WspVariable* var=VariablePool()->At(ParameterVar(i,j));
      if(!var) continue; // error
      // retrieve const ref, viovar remains owner
      const faudes::Type* cfvar = var->FaudesValue(); 
      if(!cfvar) continue; // error
      // process generators ?
      const faudes::vGenerator* cgen= dynamic_cast<const faudes::Generator*>(cfvar);
      if(!cgen) continue;
      // cheat by const cast ( ... copy is taken below anyway )
      faudes::vGenerator* gen= const_cast<faudes::Generator*>(cgen);
      if(mClearNames) {
        FD_DS("ScrOperation::ExecutePreA(): clear names " << VioStyle::StrFromQStr(var->Name()) << 
            " #states " << gen->Size());
        gen->ClearStateNames();
        gen->StateNamesEnabled(false);
      } else {
        gen->StateNamesEnabled(true);
      }
    }
  }


  // o actual preprocessing so far
  return mState;
}

// execute operation: call faudes 
ScrOperation::OperationState ScrOperation::ExecuteFaudes(void) {
  // TODO: track copies of fobjects and delete on exceptions
  if(mState!=Running)  return mState;
  FD_DS("ScrOperation::ExecuteFaudes(): " << VioStyle::StrFromQStr(Name()));
  // test function object
  if(!mpFnctnObject)
    return setState(Error,"faudes exec error", "cannot instantiate function object");
  // set variant
  try {
    mpFnctnObject->Variant(mFnctnVariant);
  } catch(faudes::Exception& exception) {
    return setState(Error,"faudes exec error", "cannot set variant");
  } 
  // set operands
  for(int i=0; i< mParameterVars.size(); i++) {
    // prepare
    faudes::Type* fvar=0;
    faudes::vBaseVector* fvect = mFaudesVectors.at(i);
    // its a plain variable
    if(!fvect) {
      FD_DS("ScrOperation::ExecuteFaudes(): set var " << VioStyle::StrFromQStr(ParameterVar(i)));
      // retrieve const ref to faudes object (viovar remains owner)
      WspVariable* var=VariablePool()->At(ParameterVar(i));
      if(!var) return setState(Error, "cannot retrieve "+ParameterVar(i));
      const faudes::Type* cfvar = var->FaudesValue(); 
      if(!cfvar) return setState(Error, "cannot access "+ParameterVar(i));
      // for non-In attribute, have a copy; else use a const cast
      fvar = const_cast<faudes::Type*>(cfvar);
      if(ParameterAttr(i)!="In") fvar=fvar->Copy();
    }
    // its a vector
    if(fvect) {
      FD_DS("ScrOperation::ExecuteFaudes(): set vect " << VioStyle::StrFromQStr(VectorDescr(i)));
      fvect->Clear(); // vect does not own anyway)
      for(int j=0; j<VectorCount(i); j++) {
        FD_DS("ScrOperation::ExecuteFaudes(): set vect " << VioStyle::StrFromQStr(ParameterVar(i,j)));
        // retrieve const ref to faudes object (viovar remains owner)
	WspVariable* var=VariablePool()->At(ParameterVar(i,j));
        if(!var) return setState(Error, "cannot retrieve "+ParameterVar(i,j));
        const faudes::Type* cfvarj = var->FaudesValue(); 
        if(!cfvarj) return setState(Error, "cannot access "+ParameterVar(i,j));
        // for non-In attribute, have a copy; else use a const cast
        faudes::Type* fvarj = const_cast<faudes::Type*>(cfvarj);
        if(ParameterAttr(i)!="In") fvarj=fvarj->Copy();
        // append reference to vector (vect does not take ownership)
        fvect->Append(fvarj);
      } 
      // pass on vector
      fvar=fvect;
    }
    // set operand in faudes function
    try {
      mpFnctnObject->ParamValue(i,fvar);
      mpFnctnObject->TypeCheck(i);
    } catch(faudes::Exception& exception) {
      return setState(Error,"type mismatch "+ParameterVar(i));
    }   
  }
  // run: std case
  if(mFnctnVariant>=0) {
    try {
      FD_DS("ScrOperation::ExecuteFaudes(): call faudes " << VioStyle::StrFromQStr(Name()));
      mpFnctnObject->Execute();
    } catch(faudes::Exception& exception) {
      FD_DS("ScrOperation::ExecuteFaudes(): faudes error in " << VioStyle::StrFromQStr(Name()));
      // dispose f var! TODO
      return setState(exception);
    } 
  }
  // run: plain script
  if(mFnctnVariant==-1)
  if(faudes::LuaFunction* lfnct = dynamic_cast<faudes::LuaFunction*>(mpFnctnObject)) {
    try {
      FD_DS("ScrOperation::ExecuteFaudes(): evaluate lua script " << VioStyle::StrFromQStr(Name()));
      lfnct->Evaluate();
    } catch(faudes::Exception& exception) {
      FD_DS("ScrOperation::ExecuteFaudes(): faudes error in " << VioStyle::StrFromQStr(Name()));
      // dispose f var! TODO
      return setState(exception);
    } 
  }
  // place results
  for(int i=0; i< mParameterVars.size(); i++) {
    // for nothing to do for In attributes 
    if(ParameterAttr(i)=="In") continue;  // (owner: viovar still owns, no copy)
    // get result
    faudes::Type* fvar = mpFnctnObject->ParamValue(i);
    faudes::vBaseVector* fvect = mFaudesVectors.at(i);
    // its a plain variable
    if(!fvect) {
      // get wsp variable
      WspVariable* var=VariablePool()->At(ParameterVar(i));
      // fix name and set the value
      fvar->Name(VioStyle::StrFromQStr(ParameterVar(i)));
      var->FaudesValue(fvar); // (owner: viovar will delete original value and take ownership of the nwq value)
      FD_DS("ScrExecute::Operate(): set result "<< VioStyle::StrFromQStr(var->Name()));
    }
    // its a vector
    if(fvect) {
      fvect = dynamic_cast<faudes::vBaseVector*>(fvar);
      for(int j=0; ((unsigned int)j<fvect->Size()) && (j < VectorCount(i)); j++) {
	// retrieve entry
        faudes::Type* fvarj = &fvect->At(j);
        // get wsp variable
        WspVariable* var=VariablePool()->At(ParameterVar(i,j));
        // fix name and set the value
        fvar->Name(VioStyle::StrFromQStr(ParameterVar(i,j)));
        var->FaudesValue(fvarj); 
      }
    }
  }
  // done
  return setState(Done);
}

// execute operation: postprocess results
ScrOperation::OperationState ScrOperation::ExecutePostA(void) {
  if(mState!=Running && mState!=Done)  return mState;
  FD_DS("ScrOperation::ExecutePostB(): " << VioStyle::StrFromQStr(Name()));
  // interpret std options: loop over result
  for(int i=0; i<ParameterCount(); i++) {
  for(int j=0; j<VectorCount(i); j++) {
    if(ParameterAttr(i)=="In") continue;
    WspVariable* res=VariablePool()->At(ParameterVar(i,j));
    if(!res) continue; // error
    // process generators ?
    const faudes::vGenerator* orggen= dynamic_cast<const faudes::Generator*>(res->FaudesValue());
    const faudes::vGenerator* curgen = orggen;
    // process generator !
    if(orggen) {
      // 1. mute names
      if(mClearNames) {
      FD_DS("ScrOperation::ExecutePostA(): clear names " << VioStyle::StrFromQStr(res->Name()) << 
            " #states " << curgen->Size());
        faudes::vGenerator* newgen = curgen->Copy();
        newgen->ClearStateNames();
        newgen->StateNamesEnabled(false);
        if(curgen!=orggen) delete curgen;
        curgen=newgen;
      }
      // 2. minimal
      if(mMakeMin) {
        FD_DS("ScrOperation::ExecutePostA(): make minreal " << VioStyle::StrFromQStr(res->Name()));
        faudes::vGenerator* newgen = curgen->New();
        if(mClearNames) newgen->ClearStateNames();
        try {
          faudes::StateMin(*curgen,*newgen); 
          if(curgen!=orggen) delete curgen;
          curgen=newgen;
        } catch(faudes::Exception& exception) {
          FD_WARN("ScrOperation::ExecutePostA(): failed statemin");
          delete newgen;
        }
      }
      // set final
      if(curgen!=orggen) {
        FD_DS("ScrOperation::ExecutePostA(): set result " << VioStyle::StrFromQStr(res->Name()) << 
          " #states " << curgen->Size());
        res->FaudesValue(const_cast<fGenerator*>(curgen)); // cast: is my generator
      }
    }
    /*
    // process alphabets
    if(res->getAlphabet()) {
      const fAlphabet* orgalph = res->getAlphabet();
      fAlphabet* curalph = NULL;
      // 0. attributes
      if(mClearAttributes) {
        FD_DS("ScrOperation::ExecutePostA(): clear attributes " << VioStyle::StrFromQStr(res->Name()));
        if(!curalph) {
          curalph = new fAlphabet();
          *curalph = *orgalph;
	}
        curalph->ClearAttributes();
      }
      // 1. controllable
      if(mAllControllable) {
        FD_DS("ScrOperation::ExecutePostA(): all controllable " << VioStyle::StrFromQStr(res->Name()));
        if(!curalph) {
          curalph = new fAlphabet();
          *curalph = *orgalph;
	}
        for(fAlphabet::Iterator eit= curalph->SetControllable(*orgalph);
      }
      // 2. cobservable
      if(mAllObservable) {
        FD_DS("ScrOperation::ExecutePostA(): all observable " << VioStyle::StrFromQStr(res->Name()));
        if(!curalph) {
          curalph = new fAlphabet();
          *curalph = *orgalph;
	}
        curalph->SetObservable(*orgalph);
      }
      // set final
      if(curalph!=NULL) 
        res->setAlphabet(curalph); 
    }
    */
  }}
  // validate result
  for(int i=0; i<ParameterCount(); i++) {
  for(int j=0; j<VectorCount(i); j++) {
    if(ParameterAttr(i)=="In") continue;
    WspVariable* var=VariablePool()->At(ParameterVar(i,j));
    if(!var) continue; // error
    if(var->Visual()) continue; // skip visual    
    var->Valid(mState==Done);
    if(var->FileLinked())
      if(var->Save()) 
        return setState(Error, "cannot write "+ParameterVar(i,j));
  }}
  // done
  return mState;
};


// execute operation: update visual rep
ScrOperation::OperationState ScrOperation::ExecutePostB(void) {
  if(mState!=Running && mState!=Done)  return mState;
  FD_DS("ScrOperation::ExecutePostB(): " << VioStyle::StrFromQStr(Name()));
  // interpret std options: loop over operands
  for(int i=0; i<ParameterCount(); i++) {
  for(int j=0; j<VectorCount(i); j++) {
    WspVariable* var=VariablePool()->At(ParameterVar(i));
    if(!var) continue; // error
    // 0. clear ops
    if(mClearOps &&  (ParameterAttr(i)=="In"))
    if(!var->Visual())
    if(!var->Persistent()) {
      FD_DS("ScrOperation::ExecutePostB(): clear operand " << VioStyle::StrFromQStr(var->Name()));
      var->FaudesClear();
    }
  }}
  // update visual representation, incl variable name
  for(int i=0; i<ParameterCount(); i++) {
  for(int j=0; j<VectorCount(i); j++) {
    if(ParameterAttr(i)=="In") continue;
    WspVariable* var=VariablePool()->At(ParameterVar(i,j));
    if(!var) continue; // error
    var->UpdateVisual(); // incl tooltip for non visuals
    if(!var->Visual()) continue; // skip non visual 
    var->Valid(mState==Done);
    if(var->FileLinked())
      if(var->Save())
	return setState(Error, "cannot write "+ParameterVar(i,j));
  }}
  if(mState==Done)
    { FD_DS("ScrOperation::ExecutePostB(): " << VioStyle::StrFromQStr(Name()) <<": done"); };
  return mState;
};



// excute: convenience function
ScrOperation::OperationState ScrOperation::Execute(void) {
  // doit
  ExecutePreA();
  ExecutePreB();
  ExecuteFaudes();
  ExecutePostA();
  ExecutePostB();
  return mState;
}



// token io, write
void ScrOperation::DoWrite(faudes::TokenWriter& rTw, const QString& rLabel) const {
  // ignore label
  (void) rLabel;
  // my tag/name
  rTw.WriteBegin(VioStyle::StrFromQStr(mOperationDescr));
  rTw << VioStyle::StrFromQStr(mName);
  if(mFnctnVariant>=0) rTw.WriteInteger(mFnctnVariant);
  if(mFnctnVariant<0) rTw.WriteInteger(0);
  // operands  TODO vctor
  rTw.WriteBegin("Parameters");
  for(int i=0; i < ParameterCount(); i++) {
    // plain variable
    if(!mFaudesVectors.at(i)) {
      rTw << VioStyle::StrFromQStr(ParameterVar(i));
      continue;
    }
    // vector
    rTw.WriteBegin("Vector");
    for(int j=0; j < VectorCount(i); j++) 
      rTw << VioStyle::StrFromQStr(ParameterVar(i,j));
    rTw.WriteEnd("Vector");
  }
  rTw.WriteEnd("Parameters");
  // options
  rTw.WriteBegin("Options");
  for(int i=0; i < OptionCount(); i++) {
    rTw.WriteString(VioStyle::StrFromQStr(OptionDescr(i)));
    rTw.WriteInteger(OptionVal(i));
  }
  rTw.WriteEnd("Options");
  // done
  rTw.WriteEnd(VioStyle::StrFromQStr(mOperationDescr));
};

// token io, read
void ScrOperation::DoRead(faudes::TokenReader& rTr, const QString& rLabel) {
  // ignore label
  (void) rLabel;
  // todo: insist in VarPool and FnctPool
  if(!VariablePool()) return;
  if(!FunctionPool()) return;
  // get (as oposed to peek: need at least one token for reover to work)
  faudes::Token token;
  rTr.Get(token);
  // figure description
  if(!token.IsBegin()) {
    std::stringstream errstr;
    errstr << "Operation expected " << rTr.FileLine();
    throw faudes::Exception("ScrProgram::Read", errstr.str(), 50);
  }
  FD_DS("ScrOperation::Read(): operation A " << token.StringValue());
  // name operation
  QString  fdescr=VioStyle::QStrFromStr(token.StringValue());
  // compatibility libFAUDES 2.22o ...
  QString  descr= fdescr;
  if(descr == "SupCon") descr= "SupConClosed";
  if(descr == "SupConNorm") descr= "SupConNormClosed";
  if(descr == "SupConNormCmpl") descr= "SupConNormCmplClosed";
  if(descr == "SupConCmpl") descr= "SupConCmplClosed";
  if(descr == "SupConComplete") descr= "SupConCmplClosed";
  // ... end of compatibility.
  if(FunctionDefinition(descr)!=0) {
    std::stringstream errstr;
    errstr << "Unknown operation " << token.StringValue() << rTr.FileLine();
    throw faudes::Exception("ScrProgram::Read", errstr.str(), 50);
  };
  // read tokens
  mName = VioStyle::QStrFromStr(rTr.ReadString());
  int variant = rTr.ReadInteger();
  FD_DS("ScrOperation::Read() " << VioStyle::StrFromQStr(mOperationDescr));
  FD_DS("ScrOperation::Read() " << VioStyle::StrFromQStr(mName));
  Variant(variant);
  // operands (variable: read by name)
  rTr.ReadBegin("Parameters");
  int pit=0;
  while(!rTr.Eos("Parameters")) {
    // bail out when done
    if(pit >= ParameterCount()) break;
    // figure parameter
    faudes::Token token;
    rTr.Peek(token);
    // plain parameter
    if(token.Type()==faudes::Token::String) {
      ParameterVar(VioStyle::QStrFromStr(rTr.ReadString()),pit);
      pit++;
      continue;
    }
    // vector
    if(token.Type()==faudes::Token::Begin && token.StringValue()=="Vector") {
      rTr.ReadBegin("Vector");
      int j=0;
      while(!rTr.Eos("Vector")) {
        ParameterVar(VioStyle::QStrFromStr(rTr.ReadString()),pit,j);
        j++;
      }
      rTr.ReadEnd("Vector");
      VectorCount(pit,j);
      pit++;
      continue;
    }
    // ignore
    FD_DS("ScrOperation::Read(): ignore token " << token.StringValue());
    rTr.Get(token);
  }    
  rTr.ReadEnd("Parameters");
  FD_DS("ScrOperation::Read(): parameters #" << pit);
  // options (const: read by value, record name)
  rTr.ReadBegin("Options");
  while(!rTr.Eos("Options")) { 
    faudes::Token token; 
    rTr.Peek(token); 
    // bail out on non-string (error)
    if(token.Type()!=faudes::Token::String) break;
    QString optdescr=VioStyle::QStrFromStr(rTr.ReadString());
    FD_DS("ScrOperation::Read() " << VioStyle::StrFromQStr(optdescr));
    // find corresponding option variable
    int i;
    for(i=0; i<OptionCount(); i++) 
      if(mOptionDescr[i]==optdescr) break;
    // bail out on no-such-option (error)
    if(i>= OptionCount()) { break;}
    // read value
    int optval = rTr.ReadInteger();
    OptionVal(optval,i);
  }
  rTr.ReadEnd("Options");
  // done
  rTr.ReadEnd(VioStyle::StrFromQStr(fdescr));
  FD_DS("ScrOperation::Read(): done");
  // initialise
  Initialize();
};


// get context menu
QMenu* ScrOperation::NewContextMenu(void) {
  QMenu* menu = new QMenu;
  QAction *action;
  menu->setTitle("Op Context" + mName);
  FD_DI("ScrOperation::NewContextMenu(): retrieve " << VioStyle::StrFromQStr(mOperationDescr));
  // have a luafunction
  WspFunction* lfnct=FunctionPool()->At(mOperationDescr);
  if(lfnct) {
    FD_DI("ScrOperation::NewContextMenu(): found lua extention");
    // add button: show
    action= menu->addAction("Show \"" + mOperationDescr + "\"");
    action->setEnabled(true);
    QObject::connect(action,SIGNAL(triggered(void)),lfnct,SLOT(ShowItem(void)));
    // sep
    menu->addSeparator();
    // construct and add item property widget
    QWidget* propwidget = lfnct->NewPropertyWidget();
    QWidgetAction* propaction = new QWidgetAction(menu);
    propaction->setDefaultWidget(propwidget);
    menu->addAction(propaction);
    // sep
    menu->addSeparator();
    // file io
    action = menu->addAction("Load from File ...");
    connect(action,SIGNAL(triggered(void)),lfnct,SLOT(UserLoad(void)));
    action = menu->addAction("Save to File ...");
    connect(action,SIGNAL(triggered(void)),lfnct,SLOT(UserSave(void))); 
    // add button: delete here
    action= menu->addAction("Delete from Script");
    action->setEnabled(true);
    action->setProperty("Item",mOperationDescr);
    QObject::connect(action,SIGNAL(triggered(void)),Program(),SLOT(EraseFunctionFromProgram(void)));
    // add button: delete everywhere
    action= menu->addAction("Delete from Project");
    action->setEnabled(true);
    action->setProperty("Item",mOperationDescr);
    QObject::connect(action,SIGNAL(triggered(void)),Program(),SLOT(EraseFunctionFromProject(void)));
  }
  // have a c function
  const faudes::FunctionDefinition* ffnct = VioFunctionRegistry::Definition(mOperationDescr);
  if(ffnct && !lfnct) {
    FD_DI("WspFunctionPool::NewContextMenu(): found C++ function");
    action= menu->addAction(QString("Help on %1").arg(mOperationDescr));
    action->setEnabled(true);
    action->setProperty("Item",mOperationDescr);
    QObject::connect(action,SIGNAL(triggered(void)),FunctionPool(),SLOT(Help(void)));
  }
  // report my menu
  return menu;
}  


 

/*
 ************************************************
 ************************************************

 implementation of ScrExecute 

 ************************************************
 ************************************************
 */


// construct/destruct
ScrExecute::ScrExecute(ScrOperation* op) : QThread(op) {
  pOp=op;
  // connect to work slot for version 1
  //QObject::connect(this,SIGNAL(started(void)),this,SLOT(Operate(void)));
};

// destruct  
ScrExecute::~ScrExecute(void) {
};


// doit slot: run on start() via signal 
void ScrExecute::Operate(void) {
  pOp->ExecutePreB();
  pOp->ExecuteFaudes();
  pOp->ExecutePostA();
  exit(0);
}

// run (this is the thread itself, called by start()
void ScrExecute::run(void) {
  // verion 1: run via eventloop: send variable state signals at end
  /*
  // take scroperation object
  QObject* pOpParent = pOp->QObject::parent();
  pOp->setParent(0);
  QThread* pOpThread = pOp->thread();
  pOp->moveToThread(thread());
  // run via eventloop: send variable state signals at end
  exec();
  // return object
  pOp->moveToThread(pOpThread);
  pOp->setParent(pOpParent);
  */
  // variant 2: run directly (no signals)
  pOp->ExecutePreB();
  pOp->ExecuteFaudes();
  pOp->ExecutePostA();
};


// api: this is callers thread
ScrExecute::OperationState ScrExecute::Execute(void) {
  // doit
  // prepare visual, incl all implied ui events
  pOp->ExecutePreA();
  QApplication::sendPostedEvents();;
  QApplication::processEvents();
  // have a progress dialog
  QProgressDialog progress("Executing: "+pOp->Function(), "Cancel", 0, 0, 0); 
  progress.setWindowModality(Qt::ApplicationModal);
  progress.setValue(0);
  QApplication::processEvents(QEventLoop::ExcludeUserInputEvents);
  QApplication::sendPostedEvents();;
  // clear global break flag
  VioStyle::FaudesBreakClr(); 
  // run extra thread
  start();
  // process applicationevent loop while running
  FD_DS("WspExecute():: thread started");
  long int i=100; 
  while(isRunning() && (--i)>0) {
    QApplication::processEvents(QEventLoop::ExcludeUserInputEvents,10);
    QApplication::sendPostedEvents();;
    wait(10);
  }
  FD_DS("WspExecute():: progress on");
  bool canceled=false;
  while(isRunning()) {
    QApplication::processEvents(QEventLoop::AllEvents,10);
    QApplication::sendPostedEvents();;
    if(progress.wasCanceled() && !canceled) {
       VioStyle::FaudesBreakSet(); 
       FD_DS("WspExecute():: canceled");
       canceled=true;
    }
    progress.setValue(1); 
    wait(10);
  }
  // clear global break flag
  VioStyle::FaudesBreakClr(); 
  // postprocess visual
  pOp->ExecutePostB();
  progress.reset();
  // done
  return pOp->State();
}

