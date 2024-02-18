/* simwidget.cpp  -  represent simulator controls   */


/*
   Simulator gui for FAU Discrete Event Systems Library (libfaudes)

   Copyright (C) 2006, 2007  Thomas Moor, Klaus Schmidt, Sebastian Perk

*/


#include "simcontrol.h"
#include "desstyle.h"




/*
 ********************************
 ********************************
 ********************************

 implementation of Simwidegt

 ********************************
 ********************************
 ********************************
 */


// construct
SimWidget::SimWidget(QWidget* parent)
  : QWidget(parent)  {
  FD_DX("SimWidget::SimWidget(" << parent << ")");

  // invalidate pointers
  pVarPool=0;
  mTrace=0;
  mStatistics=0;
  mDevice=0;

  // have completers
  mEventCompleter= new VioSymbolCompleter(this);
  mConditionCompleter= new VioSymbolCompleter(this);
  
  // behavioural defaults
  mRunTime=100;
  mRunSteps=100;
  mRunBySteps=true;
 
  // init changes reporter
  mModified=false;

  // have actions: reset
  mActReset = new QAction(tr("&Init"), this);
  mActReset->setShortcut(tr("Ctrl+I"));
  mActReset->setStatusTip(tr("reset to initial states"));
  connect(mActReset,SIGNAL(triggered()),this,SLOT(Reset()));

  // have actions: step
  mActStep = new QAction(tr("&Step"), this);
  mActStep->setShortcut(tr("Ctrl+N"));
  mActStep->setStatusTip(tr("execute transitions"));
  connect(mActStep,SIGNAL(triggered()),this,SLOT(Step()));

  // have actions: step back
  mActBack = new QAction(tr("&Revert"), this);
  mActBack->setShortcut(tr("Ctrl+Shift+N"));
  mActBack->setStatusTip(tr("revert last transitions"));
  connect(mActBack,SIGNAL(triggered()),this,SLOT(Back()));

  // have actions: run
  mActRun = new QAction(tr("Run"), this);
  mActRun->setShortcut(tr("Ctrl+R"));
  mActRun->setStatusTip(tr("run animation"));
  connect(mActRun,SIGNAL(triggered()),this,SLOT(Run()));


  // have actions: quit
  mActQuit = new QAction(tr("Stop"), this);
  mActQuit->setStatusTip(tr("stop animation"));
  connect(mActQuit,SIGNAL(triggered()),this,SLOT(Quit()));

  // have actions: models
  mActSupervisor = new QAction(tr("Animate Supervisor"), this);
  mActSupervisor->setStatusTip(tr("animate supervisor models"));
  mActSupervisor->setCheckable(true);
  mActSupervisor->setChecked(false);
  connect(mActSupervisor,SIGNAL(triggered()),this,SLOT(Reset()));

  // have actions: models
  mActPlant = new QAction(tr("Animate Plant"), this);
  mActPlant->setStatusTip(tr("animate plant models"));
  mActPlant->setCheckable(true);
  mActPlant->setChecked(false);
  connect(mActPlant,SIGNAL(triggered()),this,SLOT(Reset()));

  // have actions: log file
  mActLogFile = new QAction(tr("Log File..."), this);
  mActLogFile->setStatusTip(tr("set file for logging"));
  mActLogFile->setCheckable(true);
  mActLogFile->setChecked(mLogFile!="");
  connect(mActLogFile,SIGNAL(triggered(bool)),this,SLOT(UserLogFile(bool)));

  // have actions: dev file
  mActDevFile = new QAction(tr("IO Device ..."), this);
  mActDevFile->setStatusTip(tr("configure device from file"));
  mActDevFile->setCheckable(true);
  mActDevFile->setChecked(mDevFile!="");
  mActDevFile->setEnabled(typeid(void)!=typeid(faudes::vDevice));
  connect(mActDevFile,SIGNAL(triggered(bool)),this,SLOT(UserDevFile(bool)));

  // have a configure menu
  mMenu = new QMenu(tr("Configure"));
  mMenu->addAction(mActPlant);
  mMenu->addAction(mActSupervisor);
  mMenu->addSeparator();
  mMenu->addAction(mActLogFile);
  mMenu->addAction(mActDevFile);


  // overall layout
  mVbox= new QVBoxLayout(this);
  mVbox->setSpacing(0); 
  mVbox->setContentsMargins(2,2,2,2); 

  // current state ... two blocks
  QGroupBox* gbox1=new QGroupBox();
  gbox1->setTitle("System State");
  QVBoxLayout* vbox1= new QVBoxLayout(gbox1);
  vbox1->setContentsMargins(2,2,2,2);
  vbox1->setSpacing(2);

  // discrete state
  mState = new QTableWidget(gbox1);
  vbox1->addWidget(mState);

  // current time
  mButtonTime = new QComboBox();
  mButtonTime->addItem("Step No.");
  mButtonTime->addItem("Time Units");
  mButtonTime->setCurrentIndex( mRunBySteps ? 0 : 1 ); // hard codes index ... bad style
  connect(mButtonTime,SIGNAL(activated(int)),this,SLOT(UpdateCtrls()));
  mEditTime = new QLineEdit();
  mEditTime->setText("0");
  mEditTime->setReadOnly(true);
  mEditTime->setAlignment(Qt::AlignRight);
  QHBoxLayout* hbox1b= new QHBoxLayout();
  hbox1b->setSpacing(0);
  hbox1b->addWidget(mButtonTime);
  hbox1b->setSpacing(10);
  hbox1b->addWidget(mEditTime);
  vbox1->addSpacing(5);
  vbox1->addLayout(hbox1b);

  // add current state block to main layout
  mVbox->addWidget(gbox1);


  // execute Transition ... 3 blocks
  QGroupBox* gbox2=new QGroupBox();
  gbox2->setTitle("Execute Transition/Time");
  QVBoxLayout* vbox2= new QVBoxLayout(gbox2);
  vbox2->setContentsMargins(2,2,2,2);
  vbox2->setSpacing(2);

  // event views
  mEnabledEvents = new QTableWidget();
  mDisabledEvents = new QTableWidget();
  QHBoxLayout* hbox2a= new QHBoxLayout();
  hbox2a->setContentsMargins(0,0,0,0);
  hbox2a->setSpacing(0);
  hbox2a->addWidget(mEnabledEvents);
  hbox2a->addWidget(mDisabledEvents);
  vbox2->addLayout(hbox2a);
  
  // run time 
  mButtonRun = new QPushButton();
  mButtonRun->setText(mRunBySteps ? "Exec. Steps" : "Exec. Time");
  connect(mButtonRun,SIGNAL(pressed()),this,SLOT(Run()));
  mEditRunSteps = new QLineEdit();
  mEditRunSteps->setVisible(mRunBySteps);
  mEditRunSteps->setText(QString("%1").arg(mRunSteps));
  mEditRunSteps->setAlignment(Qt::AlignRight);
  QValidator* tpvalidator = new QIntValidator(0, 1000000, this);
  mEditRunSteps->setValidator(tpvalidator);
  connect(mEditRunSteps,SIGNAL(textEdited(const QString&)),this,SLOT(UpdateCtrls()));
  connect(mEditRunSteps,SIGNAL(returnPressed()),this,SLOT(Run()));
  mEditRunTime = new QLineEdit();
  mEditRunTime->setVisible(!mRunBySteps);
  mEditRunTime->setText(QString("%1").arg(mRunTime));
  mEditRunTime->setAlignment(Qt::AlignRight);
  QValidator* trvalidator = new QDoubleValidator(0.0, 1000000.0, 2, this);
  mEditRunTime->setValidator(trvalidator);
  connect(mEditRunTime,SIGNAL(textEdited(const QString&)),this,SLOT(UpdateCtrls()));
  connect(mEditRunTime,SIGNAL(returnPressed()),this,SLOT(Run()));
  QHBoxLayout* hbox2c= new QHBoxLayout();
  hbox2c->setSpacing(0);
  hbox2c->addWidget(mButtonRun);
  hbox2c->addSpacing(10);
  hbox2c->addWidget(mEditRunTime);
  hbox2c->addWidget(mEditRunSteps);
  vbox2->addSpacing(5);
  vbox2->addLayout(hbox2c);

  // proposal
  mButtonProposal = new QPushButton();
  mButtonProposal->setText("Exec. Prop.");
  connect(mButtonProposal,SIGNAL(pressed()),this,SLOT(Step()));
  mEditProposal = new QLineEdit();
  mEditProposal->setText("");
  mEditProposal->setAlignment(Qt::AlignRight);
  mEditProposal->setReadOnly(true);
  QHBoxLayout* hbox2d= new QHBoxLayout();
  hbox2d->setSpacing(0);
  hbox2d->addWidget(mButtonProposal);
  hbox2d->addSpacing(10);
  hbox2d->addWidget(mEditProposal);
  vbox2->addSpacing(5);
  vbox2->addLayout(hbox2d);

  // add to main layout
  mVbox->addSpacing(10);
  mVbox->addWidget(gbox2);

  // device status
  mDeviceWidgetSeparator = new QWidget();
  QVBoxLayout* vbox3=new QVBoxLayout(mDeviceWidgetSeparator);
  vbox3->setContentsMargins(5,5,5,5);
  vbox3->setSpacing(0);
  mDeviceWidgetSeparator->hide();
  mDeviceWidget=new SimDeviceWidget(this);
  connect(mDeviceWidget,SIGNAL(TextMessage(const QString&, int)),this,SIGNAL(TextMessage(const QString&, int)));
  mDeviceWidget->hide();

  // add to main layout
  mVbox->addWidget(mDeviceWidgetSeparator);
  mVbox->addWidget(mDeviceWidget);

  // controls
  mButtonReset = new QPushButton();
  mButtonReset->setText("Init.");
  connect(mButtonReset,SIGNAL(pressed()),mActReset,SLOT(trigger()));
  mButtonStep = new QPushButton();
  mButtonStep->setText("Step");
  connect(mButtonStep,SIGNAL(pressed()),mActStep,SLOT(trigger()));
  mButtonRevert = new QPushButton();
  mButtonRevert->setText("Revert");
  connect(mButtonRevert,SIGNAL(pressed()),mActBack,SLOT(trigger()));
  mButtonConfigure = new QPushButton();
  mButtonConfigure->setText("Configure");
  mButtonConfigure->setMenu(mMenu);
  QHBoxLayout* hbox4 = new QHBoxLayout();
  hbox4->setContentsMargins(0,0,0,0);
  hbox4->setSpacing(10);
  hbox4->addWidget(mButtonReset);
  hbox4->addWidget(mButtonStep);
  hbox4->addWidget(mButtonRevert);
  hbox4->addStretch(10);
  hbox4->addWidget(mButtonConfigure);
  QVBoxLayout* vbox4= new QVBoxLayout();
  vbox4->setContentsMargins(2,2,2,2);
  vbox4->setSpacing(2);
  vbox4->addLayout(hbox4);
  QGroupBox* gbox4=new QGroupBox();
  gbox4->setTitle("Controls");
  gbox4->setLayout(vbox4);

  // add to main layout
  mVbox->addSpacing(10);
  mVbox->addWidget(gbox4);


  // have context menu on states aka variables
  mState->setContextMenuPolicy(Qt::CustomContextMenu);
  connect(mState,SIGNAL(customContextMenuRequested(const QPoint&)), 
    this, SLOT(StateContextMenu(const QPoint&)));

  // have context menu on events
  mDisabledEvents->setContextMenuPolicy(Qt::CustomContextMenu);
  connect(mDisabledEvents,SIGNAL(customContextMenuRequested(const QPoint&)), 
    this, SLOT(EventContextMenu(const QPoint&)));
  mEnabledEvents->setContextMenuPolicy(Qt::CustomContextMenu);
  connect(mEnabledEvents,SIGNAL(customContextMenuRequested(const QPoint&)), 
    this, SLOT(EventContextMenu(const QPoint&)));

  // connect to no pool
  VariablePool(0);

  // have secondary models
  mTrace= new SimTrace(this);
  mStatistics= new SimStatistics(this);
  mStatistics->Reset();

  // have no device, no log
  DevFile("");
  LogFile("");

  // fix apearance
  setMinimumWidth(200);
  setSizePolicy(QSizePolicy::Minimum, QSizePolicy::MinimumExpanding);

  // dynamic state
  mRunning=false;
  mSynchronous=false;
  mNeedReset=true;

  // overwrite size policy
  setSizePolicy(QSizePolicy::Expanding,QSizePolicy::Preferred);

  FD_DX("SimWidget::SimWidget(" << parent << "): done");
}

// destruct
SimWidget::~SimWidget(void) {
  FD_DX("SimWidget::~SimWidget()");
  DevFile("");
}


// clear (clear all my data to default);
void SimWidget::Clear(void) {
  mActSupervisor->setChecked(true);
  mActPlant->setChecked(true);
  Quit();
  DevFile("");
  mEventSet.Clear();
  mConditions.Clear();
}

// token io, write
void SimWidget::Write(faudes::TokenWriter& rTw){
  // bail out
  if(!pVarPool) return;
  // simulatpr
  rTw.WriteBegin("Simulator");
  rTw << "\n";
  // options
  if(mActSupervisor->isChecked()) rTw.WriteOption("Supervisor");
  if(mActPlant->isChecked()) rTw.WriteOption("Plant");
  // write device file
  rTw.WriteBegin("DevFile");
  QString vdirname  = QFileInfo(VioStyle::QStrFromStr(rTw.FileName())).absolutePath(); 
  QString rfilename = WspItem::RelativeFilename(vdirname,mDevFile);
  rTw.WriteString(VioStyle::StrFromQStr(rfilename));
  rTw.WriteEnd("DevFile");
  // write eventset
  mEventSet.Write(rTw,"SimEvents");
  // write conditions
  mConditions.Write(rTw,"Conditions");
  // done
  rTw.WriteEnd("Simulator");
  Modified(false);
};  


// token io, read
void SimWidget::Read(faudes::TokenReader& rTr){
  FD_DX("SimWidget::Read()");
  Quit();
  // clear
  mActSupervisor->setChecked(false);
  mActPlant->setChecked(false);
  mConditions.Clear();
  mEventSet.Clear();
  // my tag
  rTr.ReadBegin("Simulator");
  while(!rTr.Eos("Simulator")) {
    faudes::Token token;
    rTr.Peek(token);
    // options: skip unkown
    if(token.Type()==faudes::Token::Option) {
      rTr.Get(token);
      if(token.StringValue()=="Supervisor") mActSupervisor->setChecked(true);
      if(token.StringValue()=="Plant") mActPlant->setChecked(true);
      continue;
    }
    // dev file
    if(token.IsBegin("DevFile")) {
      rTr.ReadBegin("DevFile");
      rTr.Peek(token);
      if(token.IsString()) {
        QString filename = VioStyle::QStrFromStr(token.StringValue());
        QString vdirname  = QFileInfo(VioStyle::QStrFromStr(rTr.FileName())).absolutePath(); 
        QDir vdir(vdirname);
        mDevFile = vdir.absoluteFilePath(filename);
      }
      rTr.ReadEnd("DevFile");
      continue;
    }
    // simulatiomn events
    if(token.IsBegin("SimEvents")) {
      mEventSet.Read(rTr,"SimEvents");
      continue;
    }
    // simulatiomn conditions
    if(token.IsBegin("Conditions")) {
      mConditions.Read(rTr,"Conditions");
      continue;
    }
    // skip other sections
    if(token.Type()==faudes::Token::Begin) {
      std::string label = token.StringValue();
      rTr.ReadBegin(label);
      rTr.ReadEnd(label);
      continue;
    }
    // ignore error
    rTr.Get(token);
  }
  // done
  rTr.ReadEnd("Simulator");
  Modified(false);
  FD_DX("SimWidget::Read(): done");
  // reset ??  
  DevFile(mDevFile);
}


// set model
void SimWidget::VariablePool(WspVariablePool* varpool) {
  FD_DX("SimWidget::VariablePool()");
  // disconnect
  if(pVarPool) Quit();
  // record
  pVarPool=varpool;
  if(pVarPool) {
    connect(pVarPool,SIGNAL(NotifyProperties()),this,SLOT(NeedReset()),Qt::QueuedConnection);
    connect(pVarPool,SIGNAL(MouseClick(const QString&, const VioElement&)),
	  this, SLOT(ReceiveMouseClick(const QString&, const VioElement&)));
    connect(pVarPool,SIGNAL(MouseDoubleClick(const QString&, const VioElement&)),
	  this, SLOT(ReceiveMouseDoubleClick(const QString&, const VioElement&)));
  }
  // initialze incl connect
  Reset();
  // set changed
  //setChanged(true);
}

// query changes (dont emit signal)
bool SimWidget::Modified(void) const { 
  return mModified;
};


// Modified: collect and pass on modifications of childs
void SimWidget::ChildModified(bool changed) { 
  // ignre netagtives
  if(!changed) return;
  // report
  FD_DX("SimWidget::ChildModified(1): model modified " << mModified);
  Modified(true);
};

// Modified: record changes and emit signal
void SimWidget::Modified(bool ch) { 
  // require reset
  NeedReset();
  // set
  if(!mModified && ch) {
    FD_DX("SimWidget::Modified(): emit postive modified notification");
    mModified=true;
    emit NotifyModified(mModified);
  }
  // clr
  if(mModified && !ch) {
    mModified=false;
    FD_DX("SimWidget::Modified(): emit negative modified notification");
    emit NotifyModified(mModified);
  }
}


// reset
void SimWidget::Reset(void) {
  FD_DX("SimWidget::Reset()");
  // clear and disconnect
  Quit();
  mNeedReset=false;
  mRunning=false;
  // bail out on no model
  if(!pVarPool) return;
  // set up executor
  foreach(WspItem* item, pVarPool->ItemList()) {;
    WspVariable* var = qobject_cast<WspVariable*>(item);
    if(!var) continue;
    if(SimSupervisor() && (!var->Supervisor())) continue;
    if(SimPlant() && (!var->Plant())) continue;
    if(SimClosedloop() && (!var->Plant()) && (!var->Supervisor())) continue;
    FD_DX("SimWidget::Reset(): type check for  " << var->Name());
    const faudes::Generator* fgen = dynamic_cast<const faudes::Generator*>(var->FaudesValue());
    if(!fgen) continue;
    try { 
      FD_DX("SimWidget::Reset(): inserting " << var->Name());
      mExecutor.Insert(*fgen);
      mComponentNames.push_back(var->Name());
    } catch(faudes::Exception& exception) {
      FD_DX("SimWidget::Reset(): faudes error, perhaps non-deterministic generator " <<  fgen->Name());
    } 
  }
  // lock all sets to prevent iterator tracling (not reentrant!)
  for(faudes::Idx i=0; i< mExecutor.Size(); ++i) {
    mExecutor.At(i).Generator().Alphabet().Lock();
    mExecutor.At(i).Generator().States().Lock();
    mExecutor.At(i).Generator().TransRel().Lock();
  }
  // configure
  mExecutor.Reset();
  mExecutor.TraceClear(1000); // config this
  // events by name
  mEventNames.clear();
  VioStyle::EventsQStrList(mEventNames,&mExecutor.Alphabet());
  // set executor sim event attributes
  mExecutor.Alphabet(mEventSet);
  if(mSynchronous && mDevice) {
    faudes::SimPriorityEventAttribute neverpa;
    neverpa.mPriority=-9999; // todo: have a never-priority
    faudes::SimEventAttribute never;
    never.Priority(neverpa);
    faudes::EventSet::Iterator eit=mDevice->Inputs().Begin();
    for(;eit!=mDevice->Inputs().End(); eit++) {
      if(!mExecutor.Alphabet().Exists(*eit)) continue;
      mExecutor.EventAttribute(*eit,never);
    }
  }  
  mExecutor.Reset();
  // set sim properties 
  mEventSet.InsertSet(mExecutor.Alphabet()); 
  // set executor conditions
  mExecutor.Conditions(mConditions);
  mExecutor.Reset();
  // connect vis reps user interaction
  if(pVarPool) 
    pVarPool->Connect(this);
  // connect other
  if(pVarPool) {
    connect(mEnabledEvents,SIGNAL(activated(const QModelIndex &)),this,SLOT(EventActivated(const QModelIndex&))); 
    connect(mEnabledEvents,SIGNAL(clicked(const QModelIndex &)),this,SLOT(EventClicked(const QModelIndex&))) ; 
    connect(mDisabledEvents,SIGNAL(clicked(const QModelIndex &)),this,SLOT(EventClicked(const QModelIndex&))) ; 
    connect(mState,SIGNAL(clicked(const QModelIndex &)),this,SLOT(StateClicked(const QModelIndex&)));
    connect(this,SIGNAL(ExecuteNotify(void)),this,SLOT(Update(void)),Qt::QueuedConnection);
  }
  // update my widgets
  UpdateState();
  UpdateEvents();
  UpdateProposal();
  HighliteState();
  // set up my completers events
  mEventCompleter->setSymbolWorld(mEventSet);
  mConditionCompleter->setSymbolWorld(mConditions);
  // reset trace
  if(mTrace) mTrace->Reset();
  // reset stats
  if(mStatistics) mStatistics->Reset();
  // all update
  Update();
  // done
  FD_DX("SimWidget::Reset(): done");
} 


// stop
void SimWidget::Quit(void) {
  FD_DX("SimWidget::Quit()");
  mRunning=false;
  // give a chance to complete log
  mExecutor.Reset();
  // disconnect
  disconnect(mEnabledEvents,SIGNAL(activated(const QModelIndex &)),this,SLOT(EventActivated(const QModelIndex&))); 
  disconnect(mEnabledEvents,SIGNAL(clicked(const QModelIndex &)),this,SLOT(EventClicked(const QModelIndex&))) ; 
  disconnect(mDisabledEvents,SIGNAL(clicked(const QModelIndex &)),this,SLOT(EventClicked(const QModelIndex&))) ; 
  disconnect(mState,SIGNAL(clicked(const QModelIndex &)),this,SLOT(StateClicked(const QModelIndex&)));
  disconnect(this,SIGNAL(ExecuteNotify(void)),this,SLOT(Update(void)));
  if(pVarPool) {
    pVarPool->Disconnect(this);
    /*
    for(int i=0; i<pVarPool->Size(); i++) {
      DesVariable* var= pVarPool->At(i);
      if(var->Type()!="Generator") continue;
      if(!var->MainWidget()) continue;
      VioGenerator* viogen = qobject_cast<VioGenerator*>(var->MainWidget());
      if(!viogen) continue;
      FD_DX("SimWidget::VariablePool(): disconnect " << var->Name());
      disconnect(viogen,0,this,0);
      viogen->HighliteClear();
    }
    */
  }
  // clear data
  mExecutor.Clear();
  mExecutor.Reset();
  mEventNames.clear();
  mComponentNames.clear();
  // update my widgets
  UpdateState();
  UpdateEvents();
  UpdateProposal();
  FD_DX("SimWidget::Quit(): done");
}

// some steps
void SimWidget::Step(int steps) {
  // report
  emit TextMessage("Simulation ...",0);
  // autoreset
  if(mNeedReset) Reset();
  for(int i=0; i<steps; i++) {
  FD_DX("SimWidget::Step(): " << i);
    faudes::TimedEvent tev=mExecutor.ProposeNextTransition();
    ExecuteTime(tev.mTime,true);
    ExecuteEvent(tev.mEvent,true);
  }
  emit ExecuteNotify();
  emit TextMessage("Simulation: done",5000);
}
 
// access compoents
const QString& SimWidget::ComponentName(int i) const {
  static QString empty;
  if(i<0) return empty;
  if(i>=mComponentNames.size()) return empty;
  return mComponentNames.at(i);
}


// access compoents
const faudes::Generator* SimWidget::ComponentGenerator(int i) const {
  if(i<0) return 0;
  if(i>= (int) mExecutor.Size()) return 0;
  return &mExecutor.At(i).Generator();
}

// access compoents
const faudes::EventSet* SimWidget::ComponentAlphabet(int i) const {
  if(i<0) return 0;
  if(i>= (int) mExecutor.Size()) return 0;
  return & mExecutor.At(i).Generator().Alphabet();
}


// some steps back (default -1)
void SimWidget::Back(int step) {
  // autoreset
  if(mNeedReset) { Reset(); return;}
  // figure step
  int laststate = step;
  if(step<0) laststate = mExecutor.CurrentStep()+step;
  FD_DX("SimWidget::Back(): to last step " << laststate);
  if(!mExecutor.RevertToStep(laststate)) return;
  mTrace->UpdateTruncate();
  // done
  emit ExecuteNotify();
}
 

// some time
void SimWidget::Run(faudes::Time::Type duration, int steps) {
  FD_DX("SimWidget::Run(): duration " << duration << " steps " << steps);
  // report 
  emit TextMessage("Simulation ...",0);
  QApplication::processEvents(QEventLoop::ExcludeUserInputEvents);
  // figure mode
  mSynchronous=false;
#ifdef FAUDES_PLUGIN_IODEVICE
  if(mDevice) 
  if(mDevice->Status()==faudes::vDevice::Up) {
    mSynchronous=true;
    mNeedReset=true;
  }
#endif
  // autoreset
  if(mNeedReset) Reset();
  // autodefault time/steps
  if(duration==0 && steps==0) {
    if(mRunBySteps) { duration = -1; steps = mRunSteps;} 
    else { duration=mRunTime;  steps = -1;};
  }
  // call thread
  mRunning=true;
  SimRunThread rthread(this);
  rthread.Run(duration,steps);
  mRunning=false;
  // copy trace
  mTrace->UpdateExtend();
  // reset sync
  if(mSynchronous) {
    mSynchronous=false;
    mNeedReset=true;
  }
  // done
  emit TextMessage("Simulation: done",5000);
  emit ExecuteNotify();
}
 

// re-construct state table incl view
void SimWidget::UpdateState(const faudes::ParallelExecutor::ParallelState& fpstate) {
  FD_DX("SimWidget::UpdateState(): #" << fpstate.size());
  // prepare table
  while(mState->rowCount()>0) mState->removeRow(0);
  mState->setRowCount(fpstate.size());
  mState->setColumnCount(2);
  mState->setShowGrid(false);         
  mState->setHorizontalScrollBarPolicy(Qt::ScrollBarAlwaysOff);
  mState->setSelectionBehavior(QAbstractItemView::SelectRows);
  mState->setSelectionMode(QAbstractItemView::SingleSelection);
  mState->horizontalHeader()->setStretchLastSection(true);
  mState->verticalHeader()->hide();
  mState->setHorizontalHeaderLabels(QStringList() << "Generator" << "State");
  mState->setSortingEnabled(false);

  // bail out on no model
  if(!pVarPool) return;

  // copy data -- todo need mutex to access generator (!)
  for(unsigned int i=0; i< fpstate.size(); i++) {
    if(i>=mExecutor.Size()) break;
    const fGenerator* fgen= &mExecutor.At(i).Generator();
    faudes::Idx fstate=fpstate.at(i);
    QTableWidgetItem *genitem = new QTableWidgetItem(ComponentName(i));
    genitem->setFlags(Qt::ItemIsSelectable | Qt::ItemIsDragEnabled | Qt::ItemIsDropEnabled | Qt::ItemIsEnabled );
    genitem->setData(Qt::UserRole,QVariant(i));
    QTableWidgetItem *stateitem = new QTableWidgetItem(VioStyle::DispStateName(fgen,fstate));
    stateitem->setFlags(Qt::ItemIsSelectable | Qt::ItemIsDragEnabled  | Qt::ItemIsDropEnabled | Qt::ItemIsEnabled);
    stateitem->setData(Qt::UserRole,QVariant((unsigned int) fstate));
    mState->setItem(i,0,genitem);
    mState->setItem(i,1,stateitem);
  }

  // enable sort after insert (see qt docu for tablewidget)
  mState->setSortingEnabled(true);
}

// re-construct state table incl view w.r.t. current state
void SimWidget::UpdateState(void) {
  UpdateState(mExecutor.CurrentParallelState());
}

// color state table wrt event
void SimWidget::UpdateState(faudes::Idx fev) {
  // bail out on no model
  if(!pVarPool) return;
  FD_DX("SimWidget::UpdateState(): event" << fev);
  // deselect
  mState->selectionModel()->clearSelection();
  // loop through state table
  for(int row=0; row<mState->rowCount(); row++) {
    QTableWidgetItem*  genitem = mState->item(row,0);
    QTableWidgetItem*  stateitem = mState->item(row,1);
    if(!genitem || !stateitem) continue;
    int execidx=genitem->data(Qt::UserRole).toInt();
    if(execidx<0 || execidx>= (int) mExecutor.Size()) continue;
    const faudes::Executor* fexec=&mExecutor.At(execidx);
    const fGenerator* fgen= &fexec->Generator();
    // default color
    QColor color=VioStyle::Color(VioYellow);
    // event exists and is disabled
    if(fgen->ExistsEvent(fev) && fexec->DisabledEvents().Exists(fev)) 
      color=VioStyle::Color(VioRed);
    // event exists and is enabled
    if(fgen->ExistsEvent(fev) && fexec->EnabledEvents().Exists(fev)) 
      color=VioStyle::Color(VioGreen);
    // set role
    QPalette palette;
    QColor bcolor= VioStyle::ColorTaint(palette.color(QPalette::Window), color, 0.6);
    QColor fcolor= VioStyle::ColorTaint(palette.color(QPalette::WindowText), color, 0.4);
    genitem->setData(Qt::BackgroundRole,QBrush(bcolor));
    stateitem->setData(Qt::BackgroundRole,QBrush(bcolor));
    genitem->setData(Qt::ForegroundRole,QBrush(fcolor));
    stateitem->setData(Qt::ForegroundRole,QBrush(fcolor));
  } 
  // clear event color
  for(int row=0; row<mEnabledEvents->rowCount(); row++) {
    QTableWidgetItem* eventitem = mEnabledEvents->item(row,0);
    if(!eventitem) continue;
    eventitem->setData(Qt::BackgroundRole,QBrush(Qt::white));
    eventitem->setData(Qt::ForegroundRole,QBrush(Qt::black));
  }
  for(int row=0; row<mDisabledEvents->rowCount(); row++) {
    QTableWidgetItem* eventitem = mDisabledEvents->item(row,0);
    if(!eventitem) continue;
    eventitem->setData(Qt::BackgroundRole,QBrush(Qt::white));
    eventitem->setData(Qt::ForegroundRole,QBrush(Qt::black));
  }
}


// re-construct event tables incl views
void SimWidget::UpdateEvents(
  const faudes::EventSet& enabledevents,
  const faudes::EventSet& disabledevents) 
{
  FD_DX("SimWidget::UpdateEvents()");   

  // prepare table
  while(mDisabledEvents->rowCount()>0) mDisabledEvents->removeRow(0);
  mDisabledEvents->setRowCount(disabledevents.Size());
  mDisabledEvents->setColumnCount(1);
  mDisabledEvents->setShowGrid(false);         
  mDisabledEvents->setHorizontalScrollBarPolicy(Qt::ScrollBarAlwaysOff);
  mDisabledEvents->setSelectionBehavior(QAbstractItemView::SelectRows);
  mDisabledEvents->setSelectionMode(QAbstractItemView::SingleSelection);
  mDisabledEvents->horizontalHeader()->setStretchLastSection(true);
  mDisabledEvents->verticalHeader()->hide();
  mDisabledEvents->setHorizontalHeaderLabels(QStringList() << "Disabled");
  mDisabledEvents->setSortingEnabled(false);

  // prepare table
  while(mEnabledEvents->rowCount()>0) mEnabledEvents->removeRow(0);
  mEnabledEvents->setRowCount(enabledevents.Size());
  mEnabledEvents->setColumnCount(1);
  mEnabledEvents->setShowGrid(false);         
  mEnabledEvents->setHorizontalScrollBarPolicy(Qt::ScrollBarAlwaysOff);
  mEnabledEvents->setSelectionBehavior(QAbstractItemView::SelectRows);
  mEnabledEvents->setSelectionMode(QAbstractItemView::SingleSelection);
  mEnabledEvents->horizontalHeader()->setStretchLastSection(true);
  mEnabledEvents->verticalHeader()->hide();
  mEnabledEvents->setHorizontalHeaderLabels(QStringList() << "Enabled");
  mEnabledEvents->setSortingEnabled(false);

  // bail out on no model
  if(!pVarPool) return;

  // copy data
  faudes::EventSet::Iterator eit=enabledevents.Begin();
  for(int i=0; eit != enabledevents.End(); eit++, i++ ) {
    QTableWidgetItem *evitem = new QTableWidgetItem(VioStyle::DispEventName(&enabledevents, *eit));
    evitem->setData(Qt::UserRole,QVariant((unsigned int) *eit));
    evitem->setFlags(Qt::ItemIsSelectable | Qt::ItemIsDragEnabled  | Qt::ItemIsDropEnabled | Qt::ItemIsEnabled);
    mEnabledEvents->setItem(i,0,evitem);
  }

  // copy data
  eit=disabledevents.Begin();
  for(int i=0; eit != disabledevents.End(); eit++, i++ ) {
    QTableWidgetItem *evitem = new QTableWidgetItem(VioStyle::DispEventName(&enabledevents, *eit));
    evitem->setData(Qt::UserRole,QVariant((unsigned int) *eit));
    evitem->setFlags(Qt::ItemIsSelectable | Qt::ItemIsDragEnabled  | Qt::ItemIsDropEnabled | Qt::ItemIsEnabled);
    mDisabledEvents->setItem(i,0,evitem);
  }


  // enable sort after insert (see qt docu for tablewidget)
  mEnabledEvents->setSortingEnabled(true);
  mDisabledEvents->setSortingEnabled(true);

  FD_DX("SimWidget::UpdateEvents(): done");
}


// re-construct event tables incl views
void SimWidget::UpdateEvents(void) {
  // prepare evensets
  const faudes::EventSet& enabledevents = mExecutor.EnabledEvents();
  const faudes::EventSet& disabledevents = mExecutor.DisabledEvents();
  // doit
  UpdateEvents(enabledevents,disabledevents);
}


// color events table wrt genartor
void SimWidget::UpdateEvents(const faudes::Executor* fexec) {
  // bail out on no model
  if(!pVarPool) return;
  FD_DX("SimWidget::UpdateEvents(): executor " << fexec->Name());
  // deselect
  mEnabledEvents->selectionModel()->clearSelection();
  mDisabledEvents->selectionModel()->clearSelection();
  // loop through table
  for(int row=0; row<mEnabledEvents->rowCount(); row++) {
    QTableWidgetItem*  eventitem = mEnabledEvents->item(row,0);
    if(!eventitem) continue;
    faudes::Idx fev=eventitem->data(Qt::UserRole).toLongLong();
    // default color
    QColor color=VioStyle::Color(VioYellow);
    // event is disabled
    if(fexec->DisabledEvents().Exists(fev)) 
      color=VioStyle::Color(VioRed);
    // event is enabled
    if(fexec->EnabledEvents().Exists(fev)) 
      color=VioStyle::Color(VioGreen);
    // set role
    QPalette palette;
    QColor bcolor= VioStyle::ColorTaint(palette.color(QPalette::Window), color, 0.6);
    QColor fcolor= VioStyle::ColorTaint(palette.color(QPalette::WindowText), color, 0.4);
    eventitem->setData(Qt::BackgroundRole,QBrush(bcolor));
    eventitem->setData(Qt::ForegroundRole,QBrush(fcolor));
  } 
  // loop through table
  for(int row=0; row<mDisabledEvents->rowCount(); row++) {
    QTableWidgetItem*  eventitem = mDisabledEvents->item(row,0);
    if(!eventitem) continue;
    faudes::Idx fev=eventitem->data(Qt::UserRole).toLongLong();
    // default color
    QColor color=VioStyle::Color(VioYellow);
    // event is disabled
    if(fexec->DisabledEvents().Exists(fev)) 
      color=VioStyle::Color(VioRed);
    // event is enabled
    if(fexec->EnabledEvents().Exists(fev)) 
      color=VioStyle::Color(VioGreen);
    // set role
    QPalette palette;
    QColor bcolor= VioStyle::ColorTaint(palette.color(QPalette::Window), color, 0.6);
    QColor fcolor= VioStyle::ColorTaint(palette.color(QPalette::WindowText), color, 0.4);
    eventitem->setData(Qt::BackgroundRole,QBrush(bcolor));
    eventitem->setData(Qt::ForegroundRole,QBrush(fcolor));
  } 
  // clear state color
  for(int row=0; row<mState->rowCount(); row++) {
    QTableWidgetItem* stateitem = mState->item(row,0);
    if(!stateitem) continue;
    stateitem->setData(Qt::BackgroundRole,QBrush(Qt::white));
    stateitem->setData(Qt::ForegroundRole,QBrush(Qt::black));
  }
  for(int row=0; row<mState->rowCount(); row++) {
    QTableWidgetItem* stateitem = mState->item(row,1);
    if(!stateitem) continue;
    stateitem->setData(Qt::BackgroundRole,QBrush(Qt::white));
    stateitem->setData(Qt::ForegroundRole,QBrush(Qt::black));
  }
}

// update current time widget
void SimWidget::UpdateTime(faudes::Idx fstep, const faudes::Time::Type& ftime) {
  FD_DX("SimWidget::UpdateTime(): " << ftime);
  // prepare table
  if(mRunBySteps) mEditTime->setText(QString("%1").arg(fstep));
  else mEditTime->setText(QString("%1").arg(ftime));
  FD_DX("SimWidget::UpdateTime(): done");
}

// update current time widget
void SimWidget::UpdateTime(void) {
  UpdateTime(mExecutor.CurrentStep(),mExecutor.CurrentTime());
}

// update current proposal
void SimWidget::UpdateProposal(const faudes::TimedEvent& fprop) {
  FD_DX("SimWidget::UpdateProposal(): " << mExecutor.EStr(fprop.mEvent) << " at " << fprop.mTime);
  // compose text
  QString text="blocking";
  QString event=VioStyle::DispEventName(&mExecutor.Alphabet(), fprop.mEvent);
  // QString abstime=VioStyle::QStrFromStr(faudes::Time::Str(fprop.mTime+mExecutor.CurrentTime()));
  QString reltime=VioStyle::QStrFromStr(faudes::Time::Str(fprop.mTime));
  if(fprop.mEvent!=0 && fprop.mTime>0) {
    //text=QString("%1 at %2").arg(event).arg(abstime);
    text=QString("%1 in %2").arg(event).arg(reltime);
  }
  if(fprop.mEvent!=0 && fprop.mTime==0) {
    text=QString("%1").arg(event);
  }
  if(fprop.mEvent==0 && fprop.mTime>=0 && fprop.mTime < faudes::Time::Max()) {
    text=QString("pass %1").arg(reltime);
  }
  if(fprop.mEvent==0 && fprop.mTime==faudes::Time::Max()) {
    text=QString("wait forever");
  }
  mEditProposal->setText(text);
}

// update current time proposal 
void SimWidget::UpdateProposal(void) {
  UpdateProposal(mExecutor.ProposeNextTransition());
}


// highlite state in vio views (optional accumulate)
void SimWidget::HighliteState(const faudes::ParallelExecutor::ParallelState& fpstate, const faudes::EventSet& enabledevents, bool merge) {
  // bail out on no model
  if(!pVarPool) return;
  FD_DX("SimWidget::HighliteState(): #" << fpstate.size());
  // iterate states
  for(unsigned int i=0; i< fpstate.size(); i++) {
    faudes::Idx fstate=fpstate.at(i);
    WspVariable* var= pVarPool->At(ComponentName(i));
    if(!var) continue;
    FD_DX("SimWidget::HighliteState(): " << var->Name());
    if(!merge) pVarPool->HighliteClear(var->Name());
    pVarPool->Highlite(var->Name(),VioElement::FromState(fstate),true);
    faudes::EventSet::Iterator eit=enabledevents.Begin();
    for(; eit != enabledevents.End(); eit++) {
      faudes::TransSet::Iterator tit=mExecutor.At(i).Generator().TransRelBegin(fstate,*eit);
      faudes::TransSet::Iterator titend=mExecutor.At(i).Generator().TransRelEnd(fstate,*eit);
      for(; tit != titend; tit++) 
        pVarPool->Highlite(var->Name(),VioElement::FromTrans(*tit),true);
    }
  }
  FD_DX("SimWidget::HighliteState(): ok");
}

// highlite state in vio views 
void SimWidget::HighliteState(void) {
  HighliteState(mExecutor.CurrentParallelState(),mExecutor.EnabledEvents());
}

// update all my widgets
void SimWidget::Update(void) {
  UpdateState();
  UpdateEvents();
  UpdateTime();
  UpdateProposal();
  HighliteState();
  mStatistics->Update();
}

// update from controls
void SimWidget::UpdateCtrls(void) {
  FD_DX("SimWidget::UpdateCtrls(): update from ctrls");
  mRunSteps=(faudes::Time::Type) mEditRunSteps->text().toInt();
  mRunTime= (faudes::Time::Type) mEditRunTime->text().toDouble();
  if(qobject_cast<QComboBox*>(sender())==mButtonTime) {
    mRunBySteps = (mButtonTime->currentIndex()==0);
    mButtonTime->setCurrentIndex( mRunBySteps ? 0 : 1 ); // hard coded index ... bad style
    mButtonRun->setText(mRunBySteps ? "Exec. Steps" : "Exec. Time");
    mEditRunTime->setVisible(!mRunBySteps);
    mEditRunSteps->setVisible(mRunBySteps);
    UpdateTime();
  }
}

// event activated
void SimWidget::EventActivated(const QModelIndex& index) {
  if(!index.isValid()) return;
  if(index.model() == mEnabledEvents->model()) {
    FD_DX("SimWidget::EventActivated(): enabled event: by row " << index.row());
    QTableWidgetItem* eventitem = mEnabledEvents->item(index.row(),index.column());
    if(!eventitem) return;
    FD_DX("SimWidget::EventActivated(): enabled event: by name " << eventitem->text());
    ExecuteTime(0);
    ExecuteEvent(VioStyle::StrFromQStr(eventitem->text()));
  }
  if(index.model() == mDisabledEvents->model()) {
    FD_DX("SimWidget::EventActivated(): disabled event " << index.row());
  }
}


// event clicked
void SimWidget::EventClicked(faudes::Idx fev) {
  if(mExecutor.DisabledEvents().Exists(fev)) { 
    mEnabledEvents->selectionModel()->clearSelection();
    mState->selectionModel()->clearSelection();
  }
  if(mExecutor.EnabledEvents().Exists(fev)) { 
    mDisabledEvents->selectionModel()->clearSelection();
    mState->selectionModel()->clearSelection();
  }
  // color states
  UpdateState(fev);
}

// event clicked
void SimWidget::EventClicked(const QModelIndex& index) {
  if(!index.isValid()) return;
  faudes::Idx fev=0;
  if(index.model() == mEnabledEvents->model()) {
    FD_DX("SimWidget::EventClicked(): enabled event: by row " << index.row());
    QTableWidgetItem* eventitem = mEnabledEvents->item(index.row(),index.column());
    if(!eventitem) return;
    FD_DX("SimWidget::EventClicked(): enabled event: by name " << eventitem->text());
    fev = mExecutor.EventIndex(VioStyle::StrFromQStr(eventitem->text()));
    FD_DX("SimWidget::EventClicked(): enabled event: by index " << fev);
    EventClicked(fev);
  }
  if(index.model() == mDisabledEvents->model()) {
    FD_DX("SimWidget::EventClicked(): dirabled event: by row " << index.row());
    QTableWidgetItem* eventitem = mDisabledEvents->item(index.row(),index.column());
    if(!eventitem) return;
    FD_DX("SimWidget::EventClicked(): disabled event: by name " << eventitem->text());
    fev = mExecutor.EventIndex(VioStyle::StrFromQStr(eventitem->text()));
    FD_DX("SimWidget::EventClicked(): disabled event: by index " << fev);
    EventClicked(fev);
  }
}

// state clicked
void SimWidget::StateClicked(const QModelIndex& index) {
  if(!index.isValid()) return;
  if(index.model() != mState->model()) return;
  FD_DX("SimWidget::StateClicked(): by row " << index.row());
  QTableWidgetItem* varitem = mState->item(index.row(),0);
  QTableWidgetItem* stateitem = mState->item(index.row(),1);
  if(!stateitem || !varitem) return;
  if(index.column()!=0 && index.column()!=1) return;
  FD_DX("SimWidget::StateClicked(): by variable name " << varitem->text());
  //pVarPool->ShowVariable(varitem->text(),true);
  FD_DX("SimWidget::StateClicked(): by state name " << stateitem->text()); 
  faudes::Idx fstate=stateitem->data(Qt::UserRole).toLongLong();
  FD_DX("SimWidget::StateClicked(): by faudes index " << fstate);
  int execidx=varitem->data(Qt::UserRole).toInt();
  if(execidx<0 || execidx>= (int) mExecutor.Size()) return;
  const faudes::Executor* fexec=&mExecutor.At(execidx);
  FD_DX("SimWidget::StateClicked(): pass on update events");
  UpdateEvents(fexec);
  mEnabledEvents->selectionModel()->clearSelection();
  mDisabledEvents->selectionModel()->clearSelection();
  FD_DX("SimWidget::StateClicked(): done ");
}


// state context meu
void SimWidget::StateContextMenu(const QPoint& pos) {
  FD_DX("SimWidget::StateContextMenu() at pos: " << pos.x() << " " << pos.y());
  QModelIndex index = mState->indexAt(pos);
  FD_DX("SimWidget::StateContextMenu() at index: " << index.row() << " " << index.column());
  QTableWidgetItem* varitem = mState->item(index.row(),0);
  QTableWidgetItem* stateitem = mState->item(index.row(),1);
  if(!stateitem || !varitem) return;
  if(index.column()!=0 && index.column()!=1) return;
  FD_DX("SimWidget::StateClicked(): by variable name " << varitem->text());
  WspVariable* var=pVarPool->At(varitem->text());
  if(!var) return;
  QMenu* contextmenu= var->NewContextMenu();
  QPoint gpos = mState->viewport()->mapToGlobal(pos);
  contextmenu->exec(gpos);
  delete contextmenu;
}


// event context meu
void SimWidget::EventContextMenu(const QPoint& pos) {
  FD_DX("SimWidget::EventContextMenu() at pos: " << pos.x() << " " << pos.y());
  QTableWidget* table = qobject_cast<QTableWidget*>(sender());
  if(!table) return;
  if((table != mEnabledEvents) && (table != mDisabledEvents)) return;
  QModelIndex index = table->indexAt(pos);
  FD_DX("SimWidget::EventContextMenu() at index: " << index.row() << " " << index.column());
  QTableWidgetItem* evitem = table->item(index.row(),0);
  if(!evitem) return;
  FD_DX("SimWidget::EventContextMenu(): by name " << evitem->text());
  QMenu* contextmenu= new QMenu();
  SimEventAttributeWidget* propwidget = new SimEventAttributeWidget(this);
  propwidget->Name(evitem->text());
  QWidgetAction* propaction = new QWidgetAction(contextmenu);
  propaction->setDefaultWidget(propwidget);
  contextmenu->addAction(propaction);
  QPoint gpos = mEnabledEvents->viewport()->mapToGlobal(pos);
  contextmenu->exec(gpos);
  delete contextmenu;
}



// execute transition
void SimWidget::ExecuteEvent(const faudes::Transition& ftrans, bool silent) {
  ExecuteEvent(ftrans.Ev,silent);
}

// execute transition
void SimWidget::ExecuteEvent(const std::string& evname, bool silent) {
  ExecuteEvent(mExecutor.EventIndex(evname),silent);
}

// execute transition
void SimWidget::ExecuteEvent(faudes::Idx fevent, bool silent) {
  FD_DX("SimWidget::ExecuteEvent(" << mExecutor.EventName(fevent) <<")");
  if(!mExecutor.EnabledEvents().Exists(fevent)) return; 
  mExecutor.ExecuteEvent(fevent);
  RecordEvent(fevent);
  if(!silent) emit ExecuteNotify();
  FD_DX("SimWidget::ExecuteEvent(" << fevent <<"): done");
}

// execute transition
void SimWidget::ExecuteTime(faudes::Time::Type duration, bool silent) {
  if(!mExecutor.EnabledTime().In(duration)) return; // relax
  mExecutor.ExecuteTime(duration);
  RecordTime(duration);
  if(!silent) emit ExecuteNotify();
}




// report execution
void SimWidget::RecordEvent(faudes::Idx fevent) {
  FD_DX("SimWidget::RecordEvent(" << mExecutor.EventName(fevent) <<")");
  (void) fevent;
  mTrace->UpdateExtend();
  mStatistics->Update();
}

// recordtransition
void SimWidget::RecordTime(faudes::Time::Type duration) {
  FD_DX("SimWidget::RecordTime(" << duration <<")");
  (void) duration;
  mTrace->UpdateExtend();
  mStatistics->Update();
}

// set event attributes (refuse to add events)
void SimWidget::EventAttribute(const std::string& ev, const faudes::SimEventAttribute& sattr) {
  FD_DX("SimWidget::EventAttributes("<< ev <<", attr): set");
  faudes::Idx fevent=mEventSet.Index(ev);
  if(fevent) {
    mEventSet.Attribute(fevent,sattr);
    Modified(true); // to do
  }
}


// get event attributes
faudes::SimEventAttribute SimWidget::EventAttribute(const std::string& ev) {
  faudes::SimEventAttribute sattr;
  FD_DX("SimWidget::EventAttributes("<< ev <<"): get");
  faudes::Idx fevent=mEventSet.Index(ev);
  if(fevent) sattr=mEventSet.Attribute(fevent);
  return sattr;
}
  

// turn on/off logging
void SimWidget::LogFile(QString filename) {
  FD_DX("SimWidget::LogFile("<< filename <<")");
  mExecutor.LogClose();
  mLogFile=filename;
  mLogFileEmpty=true;
  mActLogFile->setChecked(mLogFile!="");

  // where to put ??
  if(mLogFile!="" && mLogFileEmpty) {
    mLogFileEmpty=false; 
    int mode=faudes::LoggingExecutor::LogTime | faudes::LoggingExecutor::LogEvents;
    mode|=faudes::LoggingExecutor::LogStatistics;
    mode|=faudes::LoggingExecutor::LogStates;
    mExecutor.LogOpen(VioStyle::LfnFromQStr(mLogFile),mode);
  }

  NeedReset();
}

// turn on/off logging
void SimWidget::UserLogFile(bool on) {
  FD_DX("SimWidget::UserLogFile(" << on << ")");
  QString oldfile=mLogFile;
  LogFile("");
  if(!on) {
    // close
    return;
  }
  QString filename=oldfile;
  QString dir=QFileInfo(filename).absolutePath();
  QString basename = QFileInfo(filename).fileName();
  FD_DX("SimWidget::UserLogFile(): " << dir << " : " << basename);
  // set up dialog (save)
  QFileDialog* fdiag = new QFileDialog();
  QSettings settings;
  fdiag->restoreState(settings.value("logFileDialog").toByteArray());
  if(oldfile!="") {
    fdiag->setDirectory(dir);
    fdiag->selectFile(basename);
  }
  fdiag->setNameFilter("Faudes Logfiles (*.log);;Any File (*.*)");
  fdiag->setFileMode(QFileDialog::AnyFile);
  fdiag->setWindowTitle(QString("Choose Logfile"));
  fdiag->setAcceptMode(QFileDialog::AcceptSave);
  fdiag->setLabelText(QFileDialog::Accept,"Accept");
  fdiag->setOption(QFileDialog::DontConfirmOverwrite,true);
  fdiag->setDefaultSuffix("log");
  // run dialog
  filename="";
  if(fdiag->exec()) {
    if(fdiag->selectedFiles().size()==1) 
      filename=fdiag->selectedFiles().at(0);
  }
  settings.setValue("logFileDialog", fdiag->saveState());
  // clean up
  delete fdiag;
  LogFile(filename);
}

// turn on/off device
void SimWidget::DevFile(QString filename) {
  FD_DX("SimWidget::DevFile("<< filename <<")");
#ifdef FAUDES_PLUGIN_IODEVICE
  // shut down device if any
  if(mDevice) {
    mExecutor.Devicep(0);
    mDeviceWidget->Device(0);
    mDevice->Stop();
    delete mDevice; // may hang !!
    mDevice=0;
  }
  // have new file
  mDevFile=filename;
  // install new device
  if(mDevFile!="") {
    try { 
      FD_DX("SimWidget::DefFile(): try to read file");
      mDevice=faudes::vDevice::FromFile(VioStyle::LfnFromQStr(filename) );
      FD_DX("SimWidget::DefFile(): try to set device");
      mExecutor.Devicep(mDevice);
      mDeviceWidget->Device(mDevice);
    } catch(faudes::Exception& exception) {
      FD_DX("SimWidget::DevFile(): error starting device " << filename);
      mDevice=0;
    } 
  }
  // record in menu
  mActDevFile->setChecked(mDevice);
  mDeviceWidgetSeparator->setVisible(mDevice);
  mDeviceWidget->setVisible(mDevice);
  // done
  NeedReset();
#endif
}

// turn on/off device
void SimWidget::UserDevFile(bool on) {
  FD_DX("SimWidget::UserDevFile(" << on << ")");
  QString oldfile=mDevFile;
  DevFile("");
  if(!on) return;
  QString filename=oldfile;
  QString dir=QFileInfo(filename).absolutePath();
  QString basename = QFileInfo(filename).fileName();
  FD_DX("SimWidget::UserDevFile(): " << dir << " : " << basename);
  // set up dialog (load)
  QFileDialog* fdiag = new QFileDialog();
  QSettings settings;
  fdiag->restoreState(settings.value("devFileDialog").toByteArray());
  if(oldfile!="") {
    fdiag->setDirectory(dir);
    fdiag->selectFile(basename);
  }
  QString filter= 
    "Faudes Device Files (*.dev);;"
    "Other Faudes Files (*.ftx);;"
    "Any File (*.*)";
  fdiag->setNameFilter(filter);
  fdiag->setFileMode(QFileDialog::ExistingFile);
  fdiag->setWindowTitle(QString("Choose Device Configuration File"));
  fdiag->setAcceptMode(QFileDialog::AcceptOpen);
  fdiag->setLabelText(QFileDialog::Accept,"Accept");
  fdiag->setOption(QFileDialog::DontConfirmOverwrite,true);
  fdiag->setDefaultSuffix("dev");
  // run dialog
  filename="";
  if(fdiag->exec()) {
    if(fdiag->selectedFiles().size()==1) 
      filename=fdiag->selectedFiles().at(0);
  }
  settings.setValue("devFileDialog", fdiag->saveState());
  // clean up
  delete fdiag;
  DevFile(filename);
}


// poll device status  (disabled/inactive)
void SimWidget::UpdateDeviceStatus(void) {
#ifdef FAUDES_PLUGIN_IODEVICE
  // prepare
  QString message;
  // just the status
  static faudes::vDevice::DeviceState recent=faudes::vDevice::Down;
  faudes::vDevice::DeviceState current=faudes::vDevice::Down;
  if(mDevice) current=mDevice->Status();
  if(recent!=current) {
    message= "Device Status: no device configured";
    if(mDevice) message="Device Status: "+VioStyle::QStrFromStr(mDevice->StatusString());
  }
  recent=current;
  // report sensor events
  if(mDevice && !mRunning) if(mDevice->InputReady()) {
    faudes::Idx sevent = mDevice->ReadInput();
    message= "Device Input Event: ";
    message+= VioStyle::QStrFromStr(mExecutor.EStr(sevent));
  }
  // send
  if(message!="") emit TextMessage(message,4000);
#endif
};


// get user interaction with varpool
void SimWidget::ReceiveMouseClick(const QString& varname, const VioElement& elem){
  FD_DX("SimWidget::ReceiveMouseClick(" << varname << " " << elem.Str() << ")");
  // switch type ...
  switch(elem.Type()) {
  // ... extract event
  case VioElement::ETrans: {
    EventClicked(elem.Trans().Ev);
    break;
  }
  // ... extract event
  case VioElement::EEvent: {
    EventClicked(elem.Event());
    break;
  }
  default: break;
  }
}


// get user interaction with varpool
void SimWidget::ReceiveMouseDoubleClick(const QString& varname, const VioElement& elem){
  FD_DX("SimWidget::ReceiveMouseDoubleClick(" << varname << " " << elem.Str());
  // switch type ...
  switch(elem.Type()) {
  // ... execute transition
  case VioElement::ETrans: {
    //int i=0 ; // figure from var name TODO
    //const faudes::Executor* fexec=&mExecutor.At(i);
    //faudes::Idx fstate=fexec->CurrentState();
    //if(fstate!=elem.Trans().X1) break;
    ExecuteEvent(elem.Trans());
    break;
  }
  default: break;
  }
}





/*
 ********************************
 ********************************
 ********************************

 implementation of SimRunThread

 ********************************
 ********************************
 ********************************
 */


// construct
SimRunThread::SimRunThread(SimWidget* simwidget)
  : QThread(simwidget)  {
  FD_DX("SimRunThread::SimRunThread(" << simwidget << ")");

  // set convenience pointers
  pSimWidget=simwidget;
  pExecutor= &simwidget->mExecutor;

  // start via event loop
  //QObject::connect(this,SIGNAL(started(void)),this,SLOT(RunBackground(void)));
}

// destruct
SimRunThread::~SimRunThread(void) {
  FD_DX("SimRunThread::~SimRunThread()");
}

// api: start, run, stop background thread
void SimRunThread::Run(faudes::Time::Type duration, int steps) {
  FD_DX("SimRunThread::Run(): duration " << duration << " steps " << steps);
  // report
  emit TextMessage("Simulation ...",0);
  // time
  faudes::Time::Type starttime = pExecutor->CurrentTime();
  mStopTime = -1;
  if(duration>=0) mStopTime = starttime + duration;
  // steps
  int startstep  = pExecutor->CurrentStep();
  mStopStep  = -1;
  if(steps>=0) mStopStep  = startstep + steps;
  // progress (by time overrules step ... todo)
  int progmin=starttime;
  int progmax=mStopTime;
  if(mStopTime==-1) {
    progmin=startstep;
    progmax=mStopStep;
  }
  QProgressDialog progress("Running Simulation", "Cancel", progmin, progmax, pSimWidget);
  //progress.setWindowModality(Qt::WindowModal);
  progress.setWindowModality(Qt::ApplicationModal);
  progress.setValue(progmin);
  progress.setMinimumDuration(2000);
  // update gui event loop
  QApplication::processEvents(QEventLoop::ExcludeUserInputEvents);
  faudes::Time::Type displaytime=pExecutor->CurrentTime();
  int displaystep=pExecutor->CurrentStep();
  // device performance
  if(pSimWidget->mSynchronous && pSimWidget->mDevice) {
    pSimWidget->mDevice->ResetPerformance();
  }
  // run execution in background thread
  start(); // start(QThread::TimeCriticalPriority);
  // process application event loop while running
  int i=0; 
  bool hzstat=false;
  while(isRunning()) {
    // application events 
    QApplication::processEvents();
    QApplication::sendPostedEvents();
    // events only
    wait(50); 
    i++;
    if(i%20==0) hzstat=true;
    if(i%4!=0) continue;
    // report 
    FD_DX("SimRunThread::Run(): application event loop " << i);
    // lock
    mAMutex.lock();
    mBMutex.lock();
    mAMutex.unlock();
    // report 
    FD_DX("SimRunThread::Run(): application event loop: lock");
    // update progress (need mutex)
    if(mStopTime>0) progress.setValue(pExecutor->CurrentTime());
    else progress.setValue(pExecutor->CurrentStep());
    if(progress.wasCanceled()) {
      // report (cannot use consoleout in more than one thread)
      FD_DX("SimRunThread::Run(): cancel request");
      mStopStep=0;
    }
    // read relevant state
    bool fsync=pSimWidget->mSynchronous;
    int fstep = pExecutor->CurrentStep();
    faudes::Time::Type ftime = pExecutor->CurrentTime();
    faudes::ParallelExecutor::ParallelState fpstate =pExecutor->CurrentParallelState();
    faudes::EventSet feevents = pExecutor->EnabledEvents();
    faudes::EventSet fdevents = pExecutor->DisabledEvents();
    feevents.Lock();
    fdevents.Lock();
    faudes::TimedEvent fprop= pExecutor->ProposeNextTransition();
    std::deque<faudes::LoggingExecutor::TraceSample> rftrace;
    // copy relevant trace
    if(fsync) 
    if((displaystep!=fstep) || (displaytime!=ftime)) {
      for(int k=displaystep; k<= fstep+1; k++) {
  	const faudes::LoggingExecutor::TraceSample* fsample=pExecutor->TraceAtStep(k);
        if(!fsample) break;
	rftrace.push_back(*fsample);
      }
    }
    // do the stats here  (TODO: need mutex free version)
    if(hzstat)
    if(fstep != displaystep) {
      hzstat=false;     
      pSimWidget->Statistics()->Update(); 
    }
    // unlock
    mBMutex.unlock();
    // report 
    FD_DX("SimRunThread::Run(): application event loop: unlock");
    // do the updates
    if(fsync)
    if((fstep != displaystep) || (ftime != displaytime)) 
      pSimWidget->Trace()->UpdateExtend(rftrace);
    if(fsync)
    if(fstep != displaystep) 
      pSimWidget->UpdateProposal(fprop);
    if((fstep != displaystep) || ftime != displaytime) 
      pSimWidget->UpdateTime(fstep, ftime);
    if(fsync)
    if(fstep != displaystep) 
       pSimWidget->UpdateState(fpstate);
    if(fsync)
    if((fstep != displaystep) || (ftime != displaytime)) 
      pSimWidget->UpdateEvents(feevents,fdevents);
    if(fsync)
    if(fstep != displaystep) 
      pSimWidget->HighliteState(fpstate,feevents,false);
    if(!fsync)
    if(fstep != displaystep)
      pSimWidget->HighliteState(fpstate,feevents,true);
    displaystep=fstep;
    displaytime=ftime;
    // report 
    FD_DX("SimRunThread::Run(): application event loop: again ");
  }
  FD_DX("SimRunThread::Run(): thread finished");
  // device performance
#ifdef FAUDES_DEBUG_SIMULATOR
  if(pSimWidget->mSynchronous && pSimWidget->mDevice) {
    pSimWidget->mDevice->WritePerformance();
  }
#endif 
  // done
  progress.reset();
  emit ExecuteNotify();
  emit TextMessage("Simulation: done",5000);
}
 

// doit slot: the background thread
void SimRunThread::RunBackground(void) {
  FD_DX("SimRunThread::RunBackground(): stoptime " << mStopTime << " stopstep " << mStopStep);

  // quiet execution loop (no qobjects or signals!)
  bool done=false;
  bool fsync=pSimWidget->mSynchronous;
  while(!done) {
    // lock: double mutex: get A to lock B 
    // gives application chance to get B at all
    mAMutex.lock();
    mBMutex.lock();
    mAMutex.unlock();

    FAUDES_WRITE_DIRECT("SimBackgound");

    // general note:
    // while we're in our lock, we must not write to vioconsole (no debugging
    // output that's not filtered) since vioconsole uses queued blocking connection, and
    // our lock prevents the application's event loop

    // step executor: simulation only
    if(!fsync) {
      faudes::TimedEvent tev= pExecutor->ProposeNextTransition();
      //FD_DX("SimRunThread::RunBackground(): " << pExecutor->EventName(tev.mEvent) << " with " < < faudes::Time::Str(tev.mTime) );
      // no more time than requested
      if(mStopTime>=0 && tev.mTime+ pExecutor->CurrentTime()> mStopTime) {
        tev.mTime = mStopTime - pExecutor->CurrentTime();
        tev.mEvent=0;
      } 
      // dont go to infty (for plot)
      if(tev.mTime<faudes::Time::Max()) {
        pExecutor->ExecuteTime(tev.mTime);
        pExecutor->ExecuteEvent(tev.mEvent);
      }
      // quit
      if(tev.mTime==faudes::Time::Max()) done=true;
    } 
    // step executor: with device
    faudes::Idx wpev=0;
    if(fsync) {
      pExecutor->SyncTime();
      wpev = pExecutor->SyncEvents();
      // !! make sure, the proposal is updated ... while still in the mutex
      // !! this is because otherwise the below waitsync will not be read only
      faudes::TimedEvent tev= pExecutor->ProposeNextTransition();
    }
    // break on time
    if(mStopStep>=0 && pExecutor->CurrentStep()>=mStopStep) done=true;
    if(mStopTime>=0 && pExecutor->CurrentTime()>=mStopTime) done=true;
    // break on condition
    if(pExecutor->BreakCondition()) done=true;
    // break on syncerror
    if(!pExecutor->IsSynchronous()) done=true;
    // break on device down
#ifdef FAUDES_PLUGIN_IODEVICE
    if(fsync)
    if(pSimWidget->mDevice) 
    if(pSimWidget->mDevice->Status()!=faudes::vDevice::Up) {
      FD_DX("SimRunThread::RunBackgroundThread(): device down");
      done=true;
    }
#endif
    // unlock
    mBMutex.unlock();
    // message to console 
    if(wpev!=0) {
      FD_QP("Execute Event: " << pExecutor->EventName(wpev));
    }
    // wait (make qt feel free to run its eventloop?? we dont want this!!)
    if(pSimWidget->mDevice){
      msleep(1); // ms
    }
    // wait (make qt feel free to run its eventloop?? we dont want this!!)
    if(!pSimWidget->mDevice){
      msleep(1); // ms
    }
    // wait (outside lock, does indeed not write to executor)
    if(pSimWidget->mDevice){
      pExecutor->SyncWaitMs(1); 
    }
  }

  // exit thread
  FD_DX("SimRunThread::RunBackground(): exit");
  //exit(0); // when running via event loop
}

// run: reimplement base: this is the thread
void SimRunThread::run(void) {
  RunBackground();  // start directly
  //exec();           // start via event loop
};




