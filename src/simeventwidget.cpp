/* simeventwidget.cpp  -  represent simulator event attribute   */


/*
   Simulator gui for FAU Discrete Event Systems Library (libfaudes)

   Copyright (C) 2006, 2007, 2008  Thomas Moor, Klaus Schmidt, Sebastian Perk
   Copyright (C) 2024, Thomas Moor.

*/


#include "simeventwidget.h"
#include "simcontrol.h"


// construct: my layout
SimEventAttributeWidget::SimEventAttributeWidget(SimWidget* simctrl, QWidget *par) 
  : QWidget(par) 
{

  FD_DS("SimEventAttributeWidget::SimEventAttributeWidget(" << par << ")");

  // clear
  mAttribute = faudes::SimEventAttribute();

  // record sim control
  pSimCtrlWidget= simctrl;

  // title of this group
  //setTitle("Execution Properties");

  // overall layout
  QVBoxLayout* mVbox = new QVBoxLayout(this);
  mVbox->setContentsMargins(2,2,2,2);
  mVbox->setSpacing(2);

  // event name (selectable)
  mEditName=new VioSymbolEdit();
  mEditName->setCompleter(pSimCtrlWidget->EventCompleter());
  mEditName->setSymbolMode(VioSymbol::KnownSymbolsOnly | VioSymbol::ComboBox);
  connect(mEditName,SIGNAL(textChanged(QString)),this,SLOT(Name(QString)));
 
  // event name (static)
  mLabelName=new QLabel();
 
  // event name label
  QLabel* edla = new QLabel();
  edla->setText("Event:");
  edla->setBuddy(mEditName);

  // event name hbox
  QHBoxLayout* hbox1= new QHBoxLayout();
  hbox1->addWidget(edla);
  hbox1->addStretch(10);
  hbox1->addWidget(mEditName);
  //hbox1->addWidget(mLabelName);
  mVbox->addLayout(hbox1);
  mVbox->addSpacing(10);

  // priority checkbox
  mCheckPriority = new QCheckBox();
  mCheckPriority->setText("Priority Attribute");
  connect(mCheckPriority, SIGNAL(clicked()), this, SLOT(Update()));
  mVbox->addWidget(mCheckPriority);
  mVbox->addSpacing(5);

  // priority level
  mEditPriority = new QLineEdit();
  mEditPriority->setText("0");
  QValidator* pvalidator = new QIntValidator(-100000, 100000, this);
  mEditPriority->setValidator(pvalidator);
  connect(mEditPriority, SIGNAL(editingFinished()), this, SLOT(Update()));

  // priority level label
  QLabel* epla = new QLabel();
  epla->setText("Level:");
  epla->setBuddy(mEditPriority);

  // priority level hbox
  QHBoxLayout* plbox = new QHBoxLayout();
  plbox->addSpacing(10);
  plbox->addWidget(epla);
  plbox->addStretch(10);
  plbox->addWidget(mEditPriority);

  // priority  widget
  mWidgetPriority = new QWidget();
  QVBoxLayout* pvbox = new QVBoxLayout(mWidgetPriority);
  pvbox->setSpacing(0);
  pvbox->setContentsMargins(0,0,0,0);
  pvbox->addLayout(plbox);
  pvbox->addSpacing(10);
  mVbox->addWidget(mWidgetPriority);

  // stochastic checkbox
  mCheckStochastic = new QCheckBox();
  mCheckStochastic->setText("Stochastic Attribute");
  connect(mCheckStochastic, SIGNAL(clicked()), this, SLOT(Update()));
  mVbox->addWidget(mCheckStochastic);
  mVbox->addSpacing(5);

  // stochastic type combobox
  mComboStochType = new QComboBox();
  mComboStochType->addItem("Extern");
  mComboStochType->addItem("Trigger");
  mComboStochType->addItem("Delay");
  connect(mComboStochType, SIGNAL(activated(int)), this, SLOT(Update()));

  // stochastic type label
  QLabel* styla = new QLabel();
  styla->setText("Type:");
  styla->setBuddy(mComboStochType);

  // stochastic type hbox
  QHBoxLayout* stbox= new QHBoxLayout();
  stbox->addSpacing(10);
  stbox->addWidget(styla);
  stbox->addStretch(10);
  stbox->addWidget(mComboStochType);

  // stochastic pdf combobox
  mComboStochPdf = new QComboBox();
  mComboStochPdf->addItem("Exponential");
  mComboStochPdf->addItem("Gauss");
  mComboStochPdf->addItem("Uniform");
  connect(mComboStochPdf, SIGNAL(activated(int)), this, SLOT(Update()));

  // stochastic pdf label
  QLabel* spdfla = new QLabel();
  spdfla->setText("PDF:");
  spdfla->setBuddy(mComboStochPdf);

  // stochastic pdf hbox
  QHBoxLayout* spbox= new QHBoxLayout();
  spbox->addSpacing(10);
  spbox->addWidget(spdfla);
  spbox->addStretch(10);
  spbox->addWidget(mComboStochPdf);

  // stoch page 1: gauss
  mWidgetStoch1 = new QWidget();
  QVBoxLayout* vb1 = new QVBoxLayout(mWidgetStoch1);
  vb1->setContentsMargins(0,0,0,0);
  vb1->setSpacing(2);

  // parameter 0
  mEditStoch1Par0 = new QLineEdit();
  mEditStoch1Par0-> setText("0");
  QValidator* val1p0 = new VioFtuValidator(this);
  mEditStoch1Par0->setValidator(val1p0);
  connect(mEditStoch1Par0, SIGNAL(editingFinished()), this, SLOT(Update()));
  QLabel* lab1p0 = new QLabel();
  lab1p0->setText("tmin:");
  lab1p0->setBuddy(mEditStoch1Par0);
  QHBoxLayout* hb1p0 = new QHBoxLayout();
  hb1p0->setSpacing(0);
  hb1p0->setContentsMargins(0,0,0,0);
  hb1p0->addSpacing(10);
  hb1p0->addWidget(lab1p0);
  hb1p0->addStretch(10);
  hb1p0->addWidget(mEditStoch1Par0);
  vb1->addLayout(hb1p0);

  // parameter 1
  mEditStoch1Par1 = new QLineEdit();
  mEditStoch1Par1-> setText("0");
  QValidator* val1p1 = new VioFtuValidator(this);
  mEditStoch1Par1->setValidator(val1p1);
  connect(mEditStoch1Par1, SIGNAL(editingFinished()), this, SLOT(Update()));
  QLabel* lab1p1 = new QLabel();
  lab1p1->setText("tmax:");
  lab1p1->setBuddy(mEditStoch1Par1);
  QHBoxLayout* hb1p1 = new QHBoxLayout();
  hb1p1->setSpacing(0);
  hb1p1->setContentsMargins(0,0,0,0);
  hb1p1->addSpacing(10);
  hb1p1->addWidget(lab1p1);
  hb1p1->addStretch(10);
  hb1p1->addWidget(mEditStoch1Par1);
  vb1->addLayout(hb1p1);

  // parameter 2
  mEditStoch1Par2 = new QLineEdit();
  mEditStoch1Par2-> setText("0");
  QValidator* val1p2 = new QDoubleValidator(this);
  mEditStoch1Par2->setValidator(val1p2);
  connect(mEditStoch1Par2, SIGNAL(editingFinished()), this, SLOT(Update()));
  QLabel* lab1p2 = new QLabel();
  lab1p2->setText("mue:");
  lab1p2->setBuddy(mEditStoch1Par2);
  QHBoxLayout* hb1p2 = new QHBoxLayout(0);
  hb1p2->setSpacing(0);
  hb1p2->setContentsMargins(0,0,0,0);
  hb1p2->addSpacing(10);
  hb1p2->addWidget(lab1p2);
  hb1p2->addStretch(10);
  hb1p2->addWidget(mEditStoch1Par2);
  vb1->addLayout(hb1p2);

  // parameter 3
  mEditStoch1Par3 = new QLineEdit();
  mEditStoch1Par3-> setText("0");
  QValidator* val1p3 = new QDoubleValidator(this);
  mEditStoch1Par3->setValidator(val1p3);
  connect(mEditStoch1Par3, SIGNAL(editingFinished()), this, SLOT(Update()));
  QLabel* lab1p3 = new QLabel();
  lab1p3->setText("sigma:");
  lab1p3->setBuddy(mEditStoch1Par3);
  QHBoxLayout* hb1p3 = new QHBoxLayout();
  hb1p3->setSpacing(0);
  hb1p3->setContentsMargins(0,0,0,0);
  hb1p3->addSpacing(10);
  hb1p3->addWidget(lab1p3);
  hb1p3->addStretch(10);
  hb1p3->addWidget(mEditStoch1Par3);
  vb1->addLayout(hb1p3);
  vb1->addStretch(10);

  // stoch page 1: exponential
  mWidgetStoch2 = new QWidget();
  QVBoxLayout* vb2 = new QVBoxLayout(mWidgetStoch2);
  vb2->setContentsMargins(0,0,0,0);
  vb2->setSpacing(2);

  // parameter 0
  mEditStoch2Par0 = new QLineEdit();
  mEditStoch2Par0-> setText("0");
  QValidator* val2p0 = new VioFtuValidator(this);
  mEditStoch2Par0->setValidator(val2p0);
  connect(mEditStoch2Par0, SIGNAL(editingFinished()), this, SLOT(Update()));
  QLabel* lab2p0 = new QLabel();
  lab2p0->setText("tmin:");
  lab2p0->setBuddy(mEditStoch2Par0);
  QHBoxLayout* hb2p0 = new QHBoxLayout();
  hb2p0->setSpacing(0);
  hb2p0->setContentsMargins(0,0,0,0);
  hb2p0->addSpacing(10);
  hb2p0->addWidget(lab2p0);
  hb2p0->addStretch(10);
  hb2p0->addWidget(mEditStoch2Par0);
  vb2->addLayout(hb2p0);

  // parameter 1
  mEditStoch2Par1 = new QLineEdit();
  mEditStoch2Par1-> setText("0");
  QValidator* val2p1 = new VioFtuValidator(this);
  mEditStoch2Par1->setValidator(val2p1);
  connect(mEditStoch2Par1, SIGNAL(editingFinished()), this, SLOT(Update()));
  QLabel* lab2p1 = new QLabel();
  lab2p1->setText("tmax:");
  lab2p1->setBuddy(mEditStoch2Par1);
  QHBoxLayout* hb2p1 = new QHBoxLayout();
  hb2p1->setSpacing(0);
  hb2p1->setContentsMargins(0,0,0,0);
  hb2p1->addSpacing(10);
  hb2p1->addWidget(lab2p1);
  hb2p1->addStretch(10);
  hb2p1->addWidget(mEditStoch2Par1);
  vb2->addLayout(hb2p1);

  // parameter 2
  mEditStoch2Par2 = new QLineEdit();
  mEditStoch2Par2-> setText("0");
  QValidator* val2p2 = new QDoubleValidator(this);
  mEditStoch2Par2->setValidator(val2p2);
  connect(mEditStoch2Par2, SIGNAL(editingFinished()), this, SLOT(Update()));
  QLabel* lab2p2 = new QLabel();
  lab2p2->setText("lambda:");
  lab2p2->setBuddy(mEditStoch2Par2);
  QHBoxLayout* hb2p2 = new QHBoxLayout(0);
  hb2p2->setSpacing(0);
  hb2p2->setContentsMargins(0,0,0,0);
  hb2p2->addSpacing(10);
  hb2p2->addWidget(lab2p2);
  hb2p2->addStretch(10);
  hb2p2->addWidget(mEditStoch2Par2);
  vb2->addLayout(hb2p2);
  vb2->addStretch(10);

  // stoch page 3: uniform
  mWidgetStoch3 = new QWidget();
  QVBoxLayout* vb3 = new QVBoxLayout(mWidgetStoch3);
  vb3->setContentsMargins(0,0,0,0);
  vb3->setSpacing(2);

  // parameter 0
  mEditStoch3Par0 = new QLineEdit();
  mEditStoch3Par0-> setText("0");
  QValidator* val3p0 = new VioFtuValidator(this);
  mEditStoch3Par0->setValidator(val3p0);
  connect(mEditStoch3Par0, SIGNAL(editingFinished()), this, SLOT(Update()));
  QLabel* lab3p0 = new QLabel();
  lab3p0->setText("tmin:");
  lab3p0->setBuddy(mEditStoch3Par0);
  QHBoxLayout* hb3p0 = new QHBoxLayout();
  hb3p0->setSpacing(0);
  hb3p0->setContentsMargins(0,0,0,0);
  hb3p0->addSpacing(10);
  hb3p0->addWidget(lab3p0);
  hb3p0->addStretch(10);
  hb3p0->addWidget(mEditStoch3Par0);
  vb3->addLayout(hb3p0);

  // parameter 1
  mEditStoch3Par1 = new QLineEdit();
  mEditStoch3Par1-> setText("0");
  QValidator* val3p1 = new VioFtuValidator(this);
  mEditStoch3Par1->setValidator(val3p1);
  connect(mEditStoch3Par1, SIGNAL(editingFinished()), this, SLOT(Update()));
  QLabel* lab3p1 = new QLabel();
  lab3p1->setText("tmax:");
  lab3p1->setBuddy(mEditStoch3Par1);
  QHBoxLayout* hb3p1 = new QHBoxLayout();
  hb3p1->setSpacing(0);
  hb3p1->setContentsMargins(0,0,0,0);
  hb3p1->addSpacing(10);
  hb3p1->addWidget(lab3p1);
  hb3p1->addStretch(10);
  hb3p1->addWidget(mEditStoch3Par1);
  vb3->addLayout(hb3p1);
  vb3->addStretch(10);

  // stoch parameter stack
  mStackedStochastic = new QStackedWidget();
  mStackedStochastic->addWidget(mWidgetStoch1);
  mStackedStochastic->addWidget(mWidgetStoch2);
  mStackedStochastic->addWidget(mWidgetStoch3);

  // overall stochastic  widget
  mWidgetStochastic = new QWidget();
  QVBoxLayout* svbox = new QVBoxLayout(mWidgetStochastic);
  svbox->setSpacing(0);
  svbox->setContentsMargins(0,0,0,0);
  svbox->addLayout(stbox);
  svbox->addLayout(spbox);
  svbox->addWidget(mStackedStochastic);
  svbox->addSpacing(10);

  // add to my layout
  mVbox->addWidget(mWidgetStochastic);
  mVbox->addStretch(1);
 
  FD_DS("SimEventAttributeWidget::SimEventAttributeWidget(" << par << ")");
};


// destruct: easy, all qobjects
SimEventAttributeWidget::~SimEventAttributeWidget(void) {};

// set name (incl get attribute from sim control)
void SimEventAttributeWidget::Name(QString ev) {
  Name(VioStyle::StrFromQStr(ev));
}

// set name (incl get attribute from sim control)
void SimEventAttributeWidget::Name(const std::string& ev) {
  FD_DS("SimEventAttributeWidget::SimEventAttributeWidget::Name(" << ev << ")");
  if(!pSimCtrlWidget->Alphabet().Exists(ev)) return;
  mName=ev;
  mEditName->setSymbol(VioStyle::QStrFromStr(mName));
  mLabelName->setText(VioStyle::QStrFromStr(mName));
  mAttribute=pSimCtrlWidget->EventAttribute(mName);
  Attribute(mAttribute); 
}

// get name
const std::string& SimEventAttributeWidget::Name(void) {
  return mName;
}

// set attribute 
void SimEventAttributeWidget::Attribute(const faudes::SimEventAttribute& sattr) {
  FD_DS("SimEventAttributeWidget::Attribute(): set");
  mAttribute=sattr;
  // set priority widgets
  if(mAttribute.IsPriority()) {
    mEditPriority->setText(QString("%1").arg(mAttribute.Priority().mPriority));
    mCheckPriority->setChecked(true);
    mWidgetPriority->show();
    mWidgetPriority->setEnabled(true);
  } else {
    mCheckPriority->setChecked(false);
    // mWidgetPriority->hide();
    mWidgetPriority->setEnabled(false);
  }

  // set stochastic widgets
  if(mAttribute.IsStochastic()) {
    if(mAttribute.Stochastic().mType==faudes::SimStochasticEventAttribute::Extern) {
      int i= mComboStochType->findText("Extern");
      mComboStochType->setCurrentIndex(i);
    }
    if(mAttribute.Stochastic().mType==faudes::SimStochasticEventAttribute::Trigger) {
      int i= mComboStochType->findText("Trigger");
      mComboStochType->setCurrentIndex(i);
    }
    if(mAttribute.Stochastic().mType==faudes::SimStochasticEventAttribute::Delay) {
      int i= mComboStochType->findText("Delay");
      mComboStochType->setCurrentIndex(i);
    }
    if(mAttribute.Stochastic().mPdf==faudes::SimStochasticEventAttribute::Gauss) {
      int i= mComboStochPdf->findText("Gauss");
      mComboStochPdf->setCurrentIndex(i);
      mEditStoch1Par0->setText("");
      if(mAttribute.Stochastic().mParameter.size()>0)
        mEditStoch1Par0->setText(VioStyle::QStrFromFloat(mAttribute.Stochastic().mParameter.at(0)));
      mEditStoch1Par1->setText("");
      if(mAttribute.Stochastic().mParameter.size()>1)
        mEditStoch1Par1->setText(VioStyle::QStrFromFloat(mAttribute.Stochastic().mParameter.at(1)));
      mEditStoch1Par2->setText("");
      if(mAttribute.Stochastic().mParameter.size()>2)
        mEditStoch1Par2->setText(VioStyle::QStrFromFloat(mAttribute.Stochastic().mParameter.at(2)));
      mEditStoch1Par3->setText("");
      if(mAttribute.Stochastic().mParameter.size()>3)
        mEditStoch1Par3->setText(VioStyle::QStrFromFloat(mAttribute.Stochastic().mParameter.at(3)));
      mStackedStochastic->setCurrentIndex(0);
      FD_WARN("p0 " << mAttribute.Stochastic().mParameter.at(0));
      FD_WARN("p1 " << mAttribute.Stochastic().mParameter.at(1));

    }
    if(mAttribute.Stochastic().mPdf==faudes::SimStochasticEventAttribute::Exponential) {
      int i= mComboStochPdf->findText("Exponential");
      mComboStochPdf->setCurrentIndex(i);
      mEditStoch2Par0->setText("");
      if(mAttribute.Stochastic().mParameter.size()>0)
        mEditStoch2Par0->setText(VioStyle::QStrFromFloat(mAttribute.Stochastic().mParameter.at(0)));
      mEditStoch2Par1->setText("");
      if(mAttribute.Stochastic().mParameter.size()>1)
        mEditStoch2Par1->setText(VioStyle::QStrFromFloat(mAttribute.Stochastic().mParameter.at(1)));
      mEditStoch2Par2->setText("");
      if(mAttribute.Stochastic().mParameter.size()>2)
        mEditStoch2Par2->setText(VioStyle::QStrFromFloat(mAttribute.Stochastic().mParameter.at(2)));
      mStackedStochastic->setCurrentIndex(1);
    }
    if(mAttribute.Stochastic().mPdf==faudes::SimStochasticEventAttribute::Uniform) {
      int i= mComboStochPdf->findText("Uniform");
      mComboStochPdf->setCurrentIndex(i);
      mEditStoch3Par0->setText("");
      if(mAttribute.Stochastic().mParameter.size()>0)
        mEditStoch3Par0->setText(VioStyle::QStrFromFloat(mAttribute.Stochastic().mParameter.at(0)));
      mEditStoch3Par1->setText("");
      if(mAttribute.Stochastic().mParameter.size()>1)
        mEditStoch3Par1->setText(VioStyle::QStrFromFloat(mAttribute.Stochastic().mParameter.at(1)));
      mStackedStochastic->setCurrentIndex(2);
    }
    mCheckStochastic->setChecked(true);
    mWidgetStochastic->show();
    mWidgetStochastic->setEnabled(true);
  } else {
    mCheckStochastic->setChecked(false);
    //mWidgetStochastic->hide();
    mWidgetStochastic->setEnabled(false);
  }

}

// get attribute 
const faudes::SimEventAttribute& SimEventAttributeWidget::Attribute(void) {
  FD_DS("SimEventAttributeWidget::Attribute(): get");
  // make priority and stochastic exclusive
  if(mCheckPriority->isChecked() && (mCheckStochastic->isChecked())) {
    mCheckPriority->setChecked( !mAttribute.IsPriority());
    mCheckStochastic->setChecked( !mAttribute.IsStochastic());
  }
  // priority attribute
  if(mCheckPriority->isChecked()) {
    faudes::SimPriorityEventAttribute pattr;
    pattr.mPriority=mEditPriority->text().toInt();
    mAttribute.Priority(pattr);
  } 
  if(mCheckStochastic->isChecked()) {
    faudes::SimStochasticEventAttribute sattr;
    if(mComboStochType->currentText()=="Extern")
      sattr.mType=faudes::SimStochasticEventAttribute::Extern;
    if(mComboStochType->currentText()=="Trigger")
      sattr.mType=faudes::SimStochasticEventAttribute::Trigger;
    if(mComboStochType->currentText()=="Delay")
      sattr.mType=faudes::SimStochasticEventAttribute::Delay;
    if(mComboStochPdf->currentText()=="Gauss")
      sattr.mPdf=faudes::SimStochasticEventAttribute::Gauss;
    if(mComboStochPdf->currentText()=="Exponential")
      sattr.mPdf=faudes::SimStochasticEventAttribute::Exponential;
    if(mComboStochPdf->currentText()=="Uniform")
      sattr.mPdf=faudes::SimStochasticEventAttribute::Uniform;
    if(sattr.mPdf==faudes::SimStochasticEventAttribute::Gauss) {
      sattr.mParameter.clear();
      sattr.mParameter.push_back(VioStyle::FloatFromQStr(mEditStoch1Par0->text()));
      sattr.mParameter.push_back(VioStyle::FloatFromQStr(mEditStoch1Par1->text()));
      sattr.mParameter.push_back(mEditStoch1Par2->text().toDouble());
      sattr.mParameter.push_back(mEditStoch1Par3->text().toDouble());
    };
    if(sattr.mPdf==faudes::SimStochasticEventAttribute::Exponential) {
      sattr.mParameter.clear();
      sattr.mParameter.push_back(VioStyle::FloatFromQStr(mEditStoch2Par0->text()));
      sattr.mParameter.push_back(VioStyle::FloatFromQStr(mEditStoch2Par1->text()));
      sattr.mParameter.push_back(mEditStoch2Par2->text().toDouble());
    };
    if(sattr.mPdf==faudes::SimStochasticEventAttribute::Uniform) {
      sattr.mParameter.clear();
      sattr.mParameter.push_back(VioStyle::FloatFromQStr(mEditStoch3Par0->text()));
      sattr.mParameter.push_back(VioStyle::FloatFromQStr(mEditStoch3Par1->text()));
    };
    mAttribute.Stochastic(sattr);
  } 
  return mAttribute;
}

// update widgets
void SimEventAttributeWidget::Update(void) {
  Attribute();
  Attribute(mAttribute);
  pSimCtrlWidget->EventAttribute(mName,mAttribute);
}


