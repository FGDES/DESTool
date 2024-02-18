/* simdevicewidget.cpp  -  represent faudes device  */


/*
   Simulator gui for FAU Discrete Event Systems Library (libfaudes)

   Copyright (C) 2006, 2007, 2008  Thomas Moor, Klaus Schmidt, Sebastian Perk

*/


#include "simdevicewidget.h"
#include "simcontrol.h"


// construct: my layout
SimDeviceWidget::SimDeviceWidget(SimWidget* simctrl, QWidget *par) 
  : QGroupBox(par) 
{

  FD_DS("SimDeviceWidget::SimDeviceWidget(" << par << ")");

  // clear
  mName="invalid";
  pDevice=NULL;

  // record sim control
  pSimCtrlWidget= simctrl;

  // title of this group
  setTitle("Device: "+mName);

  // overall layout
  QVBoxLayout* mVbox = new QVBoxLayout(this);
  mVbox->setContentsMargins(2,2,2,2);
  mVbox->setSpacing(2);

  // status widgets
  mEditStatus=new QLineEdit();
  mEditStatus->setReadOnly(true);
  mEditStatus->setAlignment(Qt::AlignRight);
  mEditStatus->setText("invalid");
  mLabelStatus=new QLabel();
  mLabelStatus->setText("Status:");
 
  // status layout
  QHBoxLayout* hbox1= new QHBoxLayout();
  hbox1->addWidget(mLabelStatus);
  hbox1->addSpacing(10);
  hbox1->addWidget(mEditStatus);
  mVbox->addLayout(hbox1);

  // button widgets
  mButtonStartStop = new QPushButton(this);
  mButtonStartStop->setText("Start");
  connect(mButtonStartStop,SIGNAL(clicked()),this,SLOT(StartStop()));
  mButtonReset = new QPushButton(this);
  mButtonReset->setText("Reset");
  connect(mButtonReset,SIGNAL(clicked()),this,SLOT(Reset()));

  // button layout
  QHBoxLayout* hbox2= new QHBoxLayout();
  //hbox2->addSpacing(5);
  hbox2->addWidget(mButtonStartStop);
  hbox2->addSpacing(10);
  hbox2->addWidget(mButtonReset);
  //hbox2->addSpacing(5);
  mVbox->addSpacing(5);
  mVbox->addLayout(hbox2);

  // device state polling at 1500ms
  mTimer = new QTimer(this);
  connect(mTimer, SIGNAL(timeout()), this, SLOT(Device(void)));
  mTimer->start(1500);


  FD_DS("SimDeviceWidget::SimDeviceWidget(" << par << "): done");
};


// destruct: easy, all qobjects
SimDeviceWidget::~SimDeviceWidget(void) {
};


// set device
void SimDeviceWidget::Device(faudes::vDevice* dev) {
  pDevice=dev;
  // update statics
  mName="invalid";
  setTitle("Device: "+mName);
  mEditStatus->setText("invalid");
#ifdef FAUDES_PLUGIN_IODEVICE
  if(dev) {
    mName=VioStyle::QStrFromStr(pDevice->Name());
    setTitle(QString("Device: ")+mName);
    mEditStatus->setText("invalid");
  }
#endif
  // update dynamics
  Device();
}


// get device, incl updateing widgets
faudes::vDevice*  SimDeviceWidget::Device(void) {
#ifdef FAUDES_PLUGIN_IODEVICE
  // update dynamics
  if(pDevice) {
    // plain status
    faudes::vDevice::DeviceState fstatus=pDevice->Status();
    std::string status=pDevice->StatusString();
    // event status
    if(!pSimCtrlWidget->Running()) if(pDevice->WaitInputs(0)) {
      faudes::Idx sev = pDevice->ReadInput();
      if(pDevice->Inputs().SymbolicName(sev)!="") {
        status="rec. "+ pDevice->Inputs().SymbolicName(sev);
      }
    }
    // set status text
    mEditStatus->setText(VioStyle::QStrFromStr(status));
    // set start/stop
    if(fstatus==faudes::vDevice::Down) {
      mButtonStartStop->setText("Start");
      mButtonStartStop->setEnabled(true);
    }
    if(fstatus==faudes::vDevice::Up) {
      mButtonStartStop->setText("Stop");
      mButtonStartStop->setEnabled(true);
    }
    if(fstatus==faudes::vDevice::StartUp) {
      mButtonStartStop->setText("Stop");
      mButtonStartStop->setEnabled(true);
    }
    if(fstatus==faudes::vDevice::ShutDown) {
      mButtonStartStop->setText("Stop");
      mButtonStartStop->setEnabled(false);
    }
  }
#endif
  return pDevice;
}

// update widgets
void SimDeviceWidget::Update(void) {
  Device();
}

// start
void SimDeviceWidget::Start(void) {
#ifdef FAUDES_PLUGIN_IODEVICE
  if(!pDevice) return;
  FD_DS("SimDeviceWidget::Start()");
  emit TextMessage("Start device: ...",0);
  bool err=false;
  try {
    pDevice->Start();
  } catch(faudes::Exception& exception) {
    FD_DS("SimDeviceWidget::Start(): faudes error");
    emit TextMessage("Faudes Error when starting device.",5000);
    err=true;
  } 
  if(!err)
    emit TextMessage("Start device: done.",2000);
  Update();
  FD_DS("SimDeviceWidget::Start(): done");
#endif
}

// stop
void SimDeviceWidget::Stop(void) {
#ifdef FAUDES_PLUGIN_IODEVICE
  if(!pDevice) return;
  FD_DS("SimDeviceWidget::Stop()");
  emit TextMessage("Stop device: ...",0);
  bool err=false;
  try {
    pDevice->Stop();
  } catch(faudes::Exception& exception) {
    FD_DS("SimDeviceWidget::Stop(): faudes error");
    emit TextMessage("Faudes Error when stopping device.",5000);
    err=true;
  } 
  if(!err)
    emit TextMessage("Stop device: done.",2000);
  Update();
  FD_DS("SimDeviceWidget::Stop(): done");
#endif
}

// start/stop butzton 
void SimDeviceWidget::StartStop(void) {
#ifdef FAUDES_PLUGIN_IODEVICE
  if(!pDevice) return;
  if(mButtonStartStop->text()=="Stop") Stop();
  else Start();
#endif
}


// reset
void SimDeviceWidget::Reset(void) {
#ifdef FAUDES_PLUGIN_IODEVICE
  if(!pDevice) return;
  FD_DS("SimDeviceWidget::Reset()");
  emit TextMessage("Reset device: ...",0);
  pDevice->Reset();
  emit TextMessage("Reset device: done.",2000);
#endif
}
