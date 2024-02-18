/* simdevicewidget.h  -  represent faudes device   */


/*
   Simulator gui for FAU Discrete Event Systems Library (libfaudes)

   Copyright (C) 2006, 2007, 2008  Thomas Moor, Klaus Schmidt, Sebastian Perk

*/


#ifndef SIMDEVICEWIDGET_H
#define SIMDEVICEWIDGET_H

#include "libviodes.h"


/*
 ************************************************
 ************************************************

 A SimDeviceWidget is a widget to represent the
 status of a faudes device.

 It is connected via tradional callback (no signals etc)

 ************************************************
 ************************************************
 */

// forward
class SimWidget;


// class definition
class SimDeviceWidget : public QGroupBox  {

  Q_OBJECT

public:

  // construct/destruct
  SimDeviceWidget(SimWidget* simctrl, QWidget* par=0);
  virtual ~SimDeviceWidget(void);

public slots:

  // set/get device
  void Device(faudes::vDevice* dev);
  faudes::vDevice* Device(void);

  // start/stop/reset device
  void Start(void);
  void Stop(void);
  void Reset(void);

  // update from widgets
  void Update(void);

signals:
  void TextMessage(const QString&,int);

protected slots:
  // start stop button
  void StartStop(void);


private:

  // user data
  SimWidget* pSimCtrlWidget;
  faudes::vDevice* pDevice;
  QString mName;

  // auto update timer
  QTimer* mTimer;

  // layout: general
  QVBoxLayout* mVbox;  
  VioSymbolEdit* mEditName;

  // layout: buttons
  QPushButton* mButtonReset;
  QPushButton* mButtonStartStop;
  
  // layout: status line
  QLineEdit* mEditStatus;
  QLabel*    mLabelStatus;
  

};

#endif
