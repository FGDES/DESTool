/* scropwidget.h  -  prpresent scroperation   */


/*
   Visual skripting for FAU Discrete Event Systems Library (libfaudes)

   Copyright (C) 2006, 2007  Thomas Moor, Klaus Schmidt, Sebastian Perk
   Copyright (C) 2009 Thomas Moor

*/


#ifndef SCROPWIDGET_H
#define SCROPWIDGET_H

#include "libviodes.h"
#include "wspitems.h"
#include "scroperation.h"



/*
 ************************************************
 ************************************************

 A ScrOpWidget is a widget to represent/edit a 
 ScrOperation. It is a view that holds (and owns!)
 a model. 

 ************************************************
 ************************************************
 */


// class definition
class ScrOpWidget : public QWidget  {

  Q_OBJECT

public:
  // construct/destruct
  ScrOpWidget(QWidget* parent=0);
  virtual ~ScrOpWidget(void);

  // get/set model
  ScrOperation* model(void);
  void setModel(ScrOperation* op); 

  // selection
  bool isSelected(void) const;
  void setSelected(bool);

  // record/query user changes 
  bool Modified(void) const;
  virtual void Modified(bool ch);

public slots:

  // toggle more stack
  void More(void);

  // set variant to model 
  void setVariant(void);

  // set vetor dimensions
  void setVectorCount(void);

  // set operand var to model
  void setParameterVar(void);
  
  // set option value to model
  void setOptionValue(void);
  
  // update display from operation model
  void UpdateAll(void);
  void UpdateState(void);
  void UpdateVariant(void);
  void UpdateParameter(int n);
  void UpdateParameter(void);
  void UpdateDimSelectComboBox(QComboBox* dimsel);
  void UpdateDimSelectComboBox(void);
  void UpdateVariableComboBox(QComboBox* vared);
  void UpdateVariableComboBox(void);
  void UpdateOption(QCheckBox* optbx);

  // run variable/operation context menu
  void VariableContextMenu(QPoint pos);
  void OperationContextMenu(QPoint pos);

  // Receive configuration changes from child (by user)
  void ChildModified(bool);

signals:

  // Configuration changed (by user)
  void NotifyModified(bool);

protected:
  
  // reimplement widget events
  void mousePressEvent (QMouseEvent *event);

  // my model
  ScrOperation* mScrOp;

  // container layout
  QHBoxLayout* mHbox;
  QWidget* mCwid;

  // view mode
  bool mMore;

  // my core items
  QLineEdit* mEditName; 
  QComboBox* mComboVariant; 
  QLabel* mLabelDescr;
  QVBoxLayout* mVbox;
  QFrame* mIndicatorL;
  QFrame* mIndicatorR;
  
  // my more stack
  QToolButton* mButtonMore;
  QStackedWidget* mMoreStack;
  QWidget* mMoreWidget;
  QWidget* mLessWidget;
  QVBoxLayout* mMoreVbox;
  QVBoxLayout* mLessVbox;
  QWidget* mMoreBodyWidget;
  QWidget* mLessBodyWidget;
  QVBoxLayout* mMoreBodyVbox;
  QVBoxLayout* mLessBodyVbox;

  // my parameter layout/widgets
  QList<QWidget*>  mParameterWidgets;
  QList<QVBoxLayout*>  mParameterBoxes;

  // two version of status info
  QLabel* mLessStatusInfo;
  QLabel* mMoreStatusInfo;
  QLabel* mCompleteErrorInfo;

  // selcetion
  bool mSelected;

  // Record modified state
  bool mModified;

};


/*
 ************************************************
 ************************************************

 Specialized ComboBox to display type-checked
 parameter list in a ScrOpWidget 

 ************************************************
 ************************************************
 */


// class definition
class ParameterComboBox : public QComboBox  {

  Q_OBJECT

public:
  // construct/destruct
  ParameterComboBox(ScrOpWidget* parent=0);
  virtual ~ParameterComboBox(void);

  // overwrite showpoup for updating
  virtual void showPopup(void);
  virtual void hidePopup(void);

  // prepare popup
  void Update(void);
  void Clear(void);

  // update my tooltip
  void ToolTip(void);

protected:

  // Parent
  ScrOpWidget* mOpWidget;

  // intercept event
  virtual bool 	event(QEvent* event);
};



#endif
