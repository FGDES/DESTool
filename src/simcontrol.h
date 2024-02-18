/* simcontrol.h  -  represent simulator controls   */


/*
   Simulator gui for FAU Discrete Event Systems Library (libfaudes)

   Copyright (C) 2006, 2007  Thomas Moor, Klaus Schmidt, Sebastian Perk

*/


#ifndef FAUDES_SIMCONTROL_H
#define FAUDES_SIMCONTROL_H

#include "libviodes.h"
#include "wspvariables.h"
#include "simtrace.h"
#include "simstatistics.h"
#include "simeventwidget.h"
#include "simdevicewidget.h"

/*
 ************************************************
 ************************************************

 A SimWidget is a widget to represent a faudes
 simulator incl controls, It holds (and owns) 
 a simulator, that in turn keeps copies of 
 a variable pool generators. 


 ************************************************
 ************************************************
 */


// class definition
class SimWidget : public QWidget  {

  Q_OBJECT

public:

  // allow thread to manipulate interna
  friend class SimRunThread;

  // construct/destruct
  SimWidget(QWidget* parent=0);
  virtual ~SimWidget(void);

  // token io
  void Write(faudes::TokenWriter& rTw);
  void Read(faudes::TokenReader& rTr);

  // set/get logging ("" for off)
  void  LogFile(QString filename);
  QString LogFile(void) { return mLogFile; };

  // set/get device  ("" for off)
  void  DevFile(QString filename);
  QString DevFile(void) { return mDevFile; };

  // access sim config
  bool SimSupervisor(void) {return mActSupervisor->isChecked() &&  (!mActPlant->isChecked());}; 
  bool SimPlant(void) {return mActPlant->isChecked() && (!mActSupervisor->isChecked());};
  bool SimAll(void) {return (!mActSupervisor->isChecked()) && (!mActPlant->isChecked());};
  bool SimClosedloop(void) {return (mActSupervisor->isChecked()) && (mActPlant->isChecked());};

  // provide access to completers based on my models
  //QCompleter* StateCompleter(void); ... by variable name? id?
  QCompleter* EventCompleter(void) { return mEventCompleter;} ;
  QCompleter* ConditionCompleter(void) { return mConditionCompleter;} ;

  // access to my executor
  const faudes::ProposingExecutor* Executor(void) const { return &mExecutor;};

  // access to my add ons
  SimTrace* Trace(void) { return mTrace;};
  SimStatistics* Statistics(void) { return mStatistics;};

  // tell whether sim is running
  bool Running(void) { return mRunning;};

  // action/menu interface
  QAction* mActReset;
  QAction* mActStep;
  QAction* mActBack;
  QAction* mActQuit;
  QAction* mActRun;
  QAction* mActSupervisor;
  QAction* mActPlant;
  QAction* mActLogFile;
  QAction* mActDevFile;
  QAction* mActDevStartStop;
  QMenu* Menu(void) {return mMenu;};

signals:

  void ShowTraceRequest(bool show);
  void ShowStatisticsRequest(bool show);

public slots:

  // user set logfile
  void  UserLogFile(bool on=true);

  // user set devfile
  void  UserDevFile(bool on=true);

  // get/set model, aka varpool (0 to unset)
  void VariablePool(WspVariablePool* pVarPool=0);

  // clear (clear all my data to default);
  void Clear(void);

  // reset simulation (incl re-connect)
  void Reset(void);

  // steps or run in simulation
  void Back(int steps=-1);
  void Step(int steps=1);
  void Run(faudes::Time::Type duration=0, int steps=0);

  // quit simulator (incl disconnect)
  void Quit(void);

  // execute event (incl record)
  void ExecuteEvent(const faudes::Transition& ftrans, bool silent=false);
  void ExecuteEvent(faudes::Idx fevent, bool silent=false);
  void ExecuteEvent(const std::string& evname, bool silent=false);

  // execute time (incl record)
  void ExecuteTime(faudes::Time::Type duration, bool silent=false);

  // record (excl execute)
  void RecordEvent(faudes::Idx fevent);
  void RecordTime(faudes::Time::Type duration);

  // set/get event properties
  const faudes::sEventSet& Alphabet(void) const { return mEventSet; };
  void EventAttribute(const std::string& ev, const faudes::SimEventAttribute& sattr);
  faudes::SimEventAttribute EventAttribute(const std::string& ev);

  // get events and components
  const QList<QString>& EventNames(void) const { return mEventNames; };
  const QList<QString>& ComponentNames(void) const { return mComponentNames; };
  const QString& ComponentName(int i) const;
  const faudes::Generator* ComponentGenerator(int i) const;
  const faudes::EventSet* ComponentAlphabet(int i) const;

  // set/get conditions incl attributes (should use vio version?)
  faudes::SimConditionSet* Conditions(void) { return &mConditions; };
  void Conditions(const faudes::SimConditionSet& conditions) { mConditions=conditions; };

  // record/query user changes 
  bool Modified(void) const;
  virtual void Modified(bool ch);

  // receive user interaction on varpool
  void ReceiveMouseClick(const QString& varname, const VioElement& elem);
  void ReceiveMouseDoubleClick(const QString& varname, const VioElement& elem);


  // collect modified signals form childs (no such)
  void ChildModified(bool changed);


signals:

  // notify application of changes
  void NotifyModified(bool changed);

protected:
  
  // my executor/varpool/state
  WspVariablePool* pVarPool;
  faudes::DeviceExecutor mExecutor;
  QMap<int,QString> mExecutorVariable;
  int mRunSteps;
  faudes::Time::Type mRunTime;
  bool mNeedReset;
  bool mRunning;
  bool mSynchronous;
  QString mLogFile;
  bool mLogFileEmpty;
  VioSymbolCompleter* mEventCompleter;
  VioSymbolCompleter* mConditionCompleter;

  // changes
  bool mChanged;
 
  // my core items
  QVBoxLayout* mVbox;
  QLineEdit* mEditTime;
  QLineEdit* mEditRunSteps; 
  QLineEdit* mEditRunTime; 
  QComboBox* mButtonTime; 
  QPushButton* mButtonRun; 
  QPushButton* mButtonReset; 
  QTableWidget* mState;
  QTableWidget* mEnabledEvents;
  QTableWidget* mDisabledEvents;
  QLineEdit* mEditProposal;
  QPushButton* mButtonProposal;
  QPushButton* mButtonStep;
  QPushButton* mButtonRevert;
  QPushButton* mButtonConfigure;

  // run behaviour
  bool mRunBySteps;

  // add on items
  SimTrace* mTrace;
  SimStatistics* mStatistics; 
 
  // event attributes 
  faudes::sEventSet mEventSet;

  // have conditions independant from executor
  faudes::SimConditionSet mConditions;

  // io-device
  QString mDevFile;
  faudes::vDevice* mDevice;
  SimDeviceWidget* mDeviceWidget;
  QWidget* mDeviceWidgetSeparator;

  // events and components by name
  QList<QString> mEventNames;
  QList<QString> mComponentNames;


  // menu
  QMenu* mMenu;

  // update state to widgets
  void UpdateTime(void);
  void UpdateTime(faudes::Idx fstep, const faudes::Time::Type& ftime);
  void UpdateState(void);
  void UpdateState(const faudes::ParallelExecutor::ParallelState& fpstate);
  void UpdateState(faudes::Idx fev);
  void UpdateEvents(void);
  void UpdateEvents(const faudes::EventSet& enabledev, const faudes::EventSet& disabledev); 
  void UpdateEvents(const faudes::Executor* fexec);
  void UpdateProposal(void);
  void UpdateProposal(const faudes::TimedEvent& fprop);
  void HighliteState(void);
  void HighliteState(const faudes::ParallelExecutor::ParallelState& fpstate, const faudes::EventSet& enablesevents, bool merge=false);

  // record user changes
  bool mModified;

signals:
  void ExecuteNotify(void);
  void TextMessage(const QString&,int);

protected slots:

  // receive widget signals
  void StateClicked(const QModelIndex& index);
  void EventActivated(const QModelIndex& index);
  void EventClicked(const QModelIndex& index);
  void EventClicked(faudes::Idx fev);
 
  // require reset
  void NeedReset(void) { mNeedReset=true;};

  // run update to all widgets
  void Update(void);

  // update controls from widgets
  void UpdateCtrls(void);

  // update device status (polling)
  void UpdateDeviceStatus(void);

  // execute context menu on states/event (aka variables/attributes)
  void StateContextMenu(const QPoint& pod);
  void EventContextMenu(const QPoint& pod);



};




/*
 ************************************************
 ************************************************

 SimRunThread: Helper class to eun an executor as a 
 background thread while asynchronuosly updating 
 SimWidget's widgets

 ************************************************
 ************************************************
 */

class SimRunThread : private QThread  {

  Q_OBJECT

public:
  // construct/destruct
  SimRunThread(SimWidget* simwidget);
  virtual ~SimRunThread(void);
  // api: run simulation incl progress and gui updates
  void Run(faudes::Time::Type duration=-1, int steps=-1);

signals:
  // progress reports
  void ExecuteNotify(void);
  void TextMessage(const QString&,int);

protected slots:
  // doit slot: connected to start() signal 
  void RunBackground(void);

protected:
  // reimplement run
  void run(void);

  // my executor/simwidget refernces
  SimWidget* pSimWidget;
  faudes::DeviceExecutor* pExecutor;

  // api/thread shared parameters
  int mStopStep;
  faudes::Time::Type mStopTime;

  // all-in-one mutex 
  QMutex mAMutex;
  QMutex mBMutex;



};



#endif
