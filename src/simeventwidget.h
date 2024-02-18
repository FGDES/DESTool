/* simeventwidget.h  -  represent simulator trace   */


/*
   Simulator gui for FAU Discrete Event Systems Library (libfaudes)

   Copyright (C) 2006, 2007, 2008  Thomas Moor, Klaus Schmidt, Sebastian Perk

*/


#ifndef SIMEVENTWIDGET_H
#define SIMEVENTWIDGET_H

#include "libviodes.h"


/*
 ************************************************
 ************************************************

 A SimEventAttributeWidget is a widget to represent the
 simulation properties of one event.

 It is connected via trditinal callback (no signals etc)

 ************************************************
 ************************************************
 */

// forward
class SimWidget;


// class definition
class SimEventAttributeWidget : public QWidget  {

  Q_OBJECT

public:
  // construct/destruct
  SimEventAttributeWidget(SimWidget* simctrl, QWidget* par=0);
  virtual ~SimEventAttributeWidget(void);

public slots:

  // set/get attribute
  void Attribute(const faudes::SimEventAttribute& sattr);
  const faudes::SimEventAttribute& Attribute(void);

  // set/get name
  void Name(const std::string& name);
  void Name(QString name);
  const std::string& Name(void);

  // update from widgets
  void Update(void);


private:

  // user data
  SimWidget* pSimCtrlWidget;
  faudes::SimEventAttribute  mAttribute;
  std::string mName;

  // layout: general
  QVBoxLayout* mVbox;  
  VioSymbolEdit* mEditName;
  QLabel* mLabelName;

  // layout: priority
  QCheckBox* mCheckPriority;
  QLineEdit* mEditPriority;
  QWidget*   mWidgetPriority;
  
  // layout: stochastic
  QCheckBox* mCheckStochastic;
  QComboBox* mComboStochType;
  QComboBox* mComboStochPdf;
  QWidget*   mWidgetStoch1;
  QWidget*   mWidgetStoch2;
  QWidget*   mWidgetStoch3;
  QLineEdit* mEditStoch1Par0;
  QLineEdit* mEditStoch1Par1;
  QLineEdit* mEditStoch1Par2;
  QLineEdit* mEditStoch1Par3;
  QLineEdit* mEditStoch2Par0;
  QLineEdit* mEditStoch2Par1;
  QLineEdit* mEditStoch2Par2;
  QLineEdit* mEditStoch3Par0;
  QLineEdit* mEditStoch3Par1;
  QWidget*   mWidgetStochastic;
  QStackedWidget*   mStackedStochastic;
  


};

#endif
