/* scropwidget.cpp  -  represent scroperations */


/*
   Visual skripting for FAU Discrete Event Systems Library (libfaudes)

   Copyright (C) 2006, 2007  Thomas Moor, Klaus Schmidt, Sebastian Perk

*/


#include "scropwidget.h"
#include "desstyle.h"

/*
 ********************************
 ********************************
 ********************************

 implementation of ScrOpWidget

 ********************************
 ********************************
 ********************************
 */


// construct
ScrOpWidget::ScrOpWidget(QWidget* parent) : QWidget(parent) {
  FD_DS("ScrOpWidget::ScrOpWidget()");
  // no model yet
  mScrOp= NULL;
  mSelected=false;
  // general widget settings
  setAutoFillBackground(true);
  setMinimumWidth(150);

  // init changes reporter
  mModified=false;

  // have one layout
  mHbox= new QHBoxLayout(this);
  mHbox->setContentsMargins(0,0,0,0);
  mHbox->setSpacing(0);

  // have one central widget 
  mCwid= new QWidget();
  mHbox->addWidget(mCwid);
 
  // toggle view
  mMore=false;

}

// destruct
ScrOpWidget::~ScrOpWidget(void) {
  FD_DS("ScrOpWidget::~ScrOpWidget()");
}


// get model ref
ScrOperation* ScrOpWidget::model(void) {
  return mScrOp;
}

// get model ref
void ScrOpWidget::setModel(ScrOperation* op) {
  FD_DS("ScrOpWidget::setModel("<<op<<")");
  // ignore 0 request
  if(!op) return;
  FD_DS("ScrOpWidget::setModel("<<op<<"): B");
  if(!op->VariablePool()) return;
  FD_DS("ScrOpWidget::setModel("<<op<<"): C");
  // set the model
  mScrOp= op;
  mScrOp->Initialize();
  // re-create visual
  UpdateAll();
  // track
  connect(op,SIGNAL(NotifySignatureChange()),this,SLOT(UpdateAll()));
  // init changes reporter
  Modified(false);
}

// update all visual
void ScrOpWidget::UpdateAll(void) {
  // bail out on no model
  if(!mScrOp) return;

  FD_DS("ScrOpWidget::UpdateAll("<<mScrOp<<"): A");


  // delete old layout via cwid and childs
  mCwid= mHbox->takeAt(0)->widget();
  delete mCwid;
  mCwid = new QWidget();
  mHbox->addWidget(mCwid);
  
  FD_DS("ScrOpWidget::UpdateAll(" << mScrOp << "): B");

  // have a tooltip
  setToolTip(mScrOp->ToolTip());
  setWhatsThis(mScrOp->WhatsThis());

  // overall layout with indicator bars
  QHBoxLayout* hbox = new QHBoxLayout(mCwid); 
  hbox->setContentsMargins(0,0,0,0);
  hbox->setSpacing(0);
  mIndicatorL=new QFrame(this);
  mIndicatorL->setFrameStyle(QFrame::VLine | QFrame::Plain);
  mIndicatorL->setLineWidth(5);  
  hbox->addWidget(mIndicatorL);
  hbox->addSpacing(1);
  mVbox = new QVBoxLayout();
  mVbox->setContentsMargins(5,5,5,5);
  mVbox->setSpacing(0);
  hbox->addLayout(mVbox);
  hbox->addSpacing(1);
  mIndicatorR=new QFrame(this);
  hbox->addWidget(mIndicatorR);

  // descr
  FD_DS("ScrOpWidget::UpdateAll("<<mScrOp<<"): desrc " << VioStyle::StrFromQStr(mScrOp->Function()));
  mLabelDescr = new QLabel(this);
  mLabelDescr->setText(mScrOp->Function());
  mLabelDescr->setAlignment(Qt::AlignLeft);
  /* ... now done by progwidget
  mLabelDescr->setContextMenuPolicy(Qt::CustomContextMenu);
  mLabelDescr->setProperty("OperationDescr",mScrOp->Function());
  QObject::connect(mLabelDescr,SIGNAL(customContextMenuRequested(QPoint)),
    this,SLOT(OperationContextMenu(QPoint)));
  */

  // more 
  mButtonMore = new QToolButton(this);
  mButtonMore->setArrowType(Qt::DownArrow);
  mButtonMore->setIconSize(QSize(8,8));
  QObject::connect(mButtonMore,SIGNAL(clicked(void)), this, SLOT(More(void)));

  // first line
  QHBoxLayout* hbox1= new QHBoxLayout();
  hbox1->addWidget(mLabelDescr);
  hbox1->addStretch(10);
  hbox1->addWidget(mButtonMore);
  mVbox->addLayout(hbox1);

  // have two widgets on more stack, both hidden initially
  mMoreWidget = new QWidget();
  mMoreWidget->hide();
  mMoreVbox = new QVBoxLayout(mMoreWidget);
  mMoreVbox->setContentsMargins(0,0,0,0);
  mMoreVbox->setSpacing(2);
  mMoreVbox->addSpacing(10);
  mVbox->addWidget(mMoreWidget);

  mLessWidget = new QWidget();
  mLessWidget->hide();
  mLessVbox = new QVBoxLayout(mLessWidget);
  mLessVbox->setContentsMargins(0,0,0,0);
  mLessVbox->setSpacing(0);
  mLessVbox->addSpacing(0);
  mVbox->addWidget(mLessWidget);

  FD_DS("ScrOpWidget::UpdateAll("<<mScrOp<<"): V #" << mScrOp->VariantCount());

  // (default) no more version 
  mComboVariant=0;

  // more version: add variant selector 
  if(mScrOp->VariantCount()>1) {

  QLabel* hela  = new QLabel(mMoreWidget);
  hela->setText("Variants");
  hela->setAlignment(Qt::AlignLeft);
  mComboVariant=new QComboBox();  
  for(int i=0; i < mScrOp->VariantCount(); i++) 
    mComboVariant->addItem(mScrOp->VariantDescr(i));
  mComboVariant->setEditable(false);
  QObject::connect(mComboVariant,SIGNAL(activated(int)),
      this,SLOT(setVariant(void)));
  QHBoxLayout* hbox= new QHBoxLayout();
  hbox->addWidget(hela);
  hbox->addSpacing(10);
  hbox->addWidget(mComboVariant);
  mMoreVbox->addSpacing(10);
  mMoreVbox->addLayout(hbox);

  }

  // have two body layouts for variant dependent stuff
  mMoreBodyVbox = new QVBoxLayout();
  mMoreBodyVbox->setContentsMargins(0,0,0,0);
  mMoreBodyVbox->setSpacing(0);
  mMoreVbox->addLayout(mMoreBodyVbox);
  mLessBodyVbox = new QVBoxLayout();
  mLessBodyVbox->setContentsMargins(0,0,0,0);
  mLessBodyVbox->setSpacing(0);
  mLessVbox->addLayout(mLessBodyVbox);

  // reset variant depedndant parents
  mMoreBodyWidget=0;
  mLessBodyWidget=0;
  mParameterWidgets.clear();
  mParameterBoxes.clear();

  // default: expose less 
  if(mMore) {
    mMoreWidget->show();
    mLessWidget->hide();
    mButtonMore->setArrowType(Qt::UpArrow);
  } else {
    mMoreWidget->hide();
    mLessWidget->show();
    mButtonMore->setArrowType(Qt::DownArrow);
  }

  // set up variant dependent stuff ie the body boxes
  UpdateVariant();

  // add status (more version)
  QHBoxLayout* hbox4= new QHBoxLayout();
  QLabel* hela4  = new QLabel();
  hela4->setText("Status");
  hbox4->addWidget(hela4);
  hbox4->addStretch(1);
  mMoreStatusInfo  = new QLabel();
  mMoreStatusInfo->setContextMenuPolicy(Qt::CustomContextMenu);
  QObject::connect(mMoreStatusInfo,SIGNAL(customContextMenuRequested(QPoint)),
      &DesShowTip::Static,SLOT(Show(QPoint)));
  hbox4->addWidget(mMoreStatusInfo);
  mMoreVbox->addSpacing(10);
  mMoreVbox->addLayout(hbox4);
  mCompleteErrorInfo  = new QLabel();
  mCompleteErrorInfo->setWordWrap(true);
  mCompleteErrorInfo->hide();
  mCompleteErrorInfo->setFrameStyle(QFrame::Panel | QFrame::Sunken);

  mMoreVbox->addSpacing(5);
  mMoreVbox->addWidget(mCompleteErrorInfo);

  // status info (less version)
  QHBoxLayout* hbox5= new QHBoxLayout();
  QLabel* hela5  = new QLabel();
  hela5->setText("Status:");
  hbox5->addWidget(hela5);
  hbox5->addStretch(1);
  mLessStatusInfo  = new QLabel();
  mLessStatusInfo->setContextMenuPolicy(Qt::CustomContextMenu);
  QObject::connect(mLessStatusInfo,SIGNAL(customContextMenuRequested(QPoint)),
      &DesShowTip::Static,SLOT(Show(QPoint)));
  hbox5->addWidget(mLessStatusInfo);
  mLessVbox->addLayout(hbox5);

  // connect state
  QObject::connect(mScrOp,SIGNAL(StateChanged(ScrOperation::OperationState)),this,SLOT(UpdateState(void)));
  UpdateState();

  // connect variant selector
  QObject::connect(mScrOp,SIGNAL(VariantChanged(void)),this,SLOT(UpdateVariant(void)));
  QObject::connect(mScrOp,SIGNAL(VectorChanged(int)),this,SLOT(UpdateParameter(int)));

  // size policy
  setSizePolicy(QSizePolicy::Minimum, QSizePolicy::Fixed);

  // initialze vars
  mSelected=false;
}


// update variant (incl setup body and parameter widgets)
void ScrOpWidget::UpdateVariant(void) {
  FD_DS("ScrOpWidget::UpdateVariant("<<mScrOp<<"): A");
  if(!mScrOp) return;
  if(!mScrOp->VariablePool()) return;
  FD_DS("ScrOpWidget::UpdateVariant(): B");
  int n = mScrOp->Variant();
  if(n<0) return;
  if(n>=mScrOp->VariantCount()) return;
  FD_DS("ScrOpWidget::UpdateVariant(): C to variant " << n);

  // update varaiant combo
  if(mComboVariant) mComboVariant->setCurrentIndex(n);

  // delete all children in body widgets: clear (disconnect?)
  if(mMoreBodyWidget) delete mMoreBodyWidget;
  if(mLessBodyWidget) delete mLessBodyWidget;
  mMoreBodyWidget=0;
  mLessBodyWidget=0;

  // children of mMoreBodyWidget have been deleted, too 
  mParameterWidgets.clear();
  mParameterBoxes.clear();
 
  // recreate body widgets 
  mMoreBodyWidget = new QWidget();
  mMoreBodyVbox->addWidget(mMoreBodyWidget);
  QVBoxLayout* mvbox = new QVBoxLayout(mMoreBodyWidget);
  mvbox->setContentsMargins(0,0,0,0);
  mvbox->setSpacing(0);
  mLessBodyWidget = new QWidget();
  mLessBodyVbox->addWidget(mLessBodyWidget);
  QVBoxLayout* lvbox = new QVBoxLayout(mLessBodyWidget);
  lvbox->setContentsMargins(0,0,0,0);
  lvbox->setSpacing(0);

  // less versions: add operands 
  FlowLayout* hbox2= new FlowLayout(0,0,0);
  QLabel* hela2  = new QLabel();
  hela2->setText("Parameters: ");
  hbox2->addWidget(hela2);
  //hbox2->addSpacing(10);
  for(int i=0; i < mScrOp->ParameterCount(); i++) {
  for(int j=0; j < mScrOp->VectorCount(i); j++) {
    // skip unset
    if(mScrOp->ParameterVar(i,j)=="") continue;
    // variable
    QLabel* varla=new QLabel();  
    if((i != mScrOp->ParameterCount()-1) && (j!= mScrOp->VectorCount(i)-1)) 
      varla->setText(mScrOp->ParameterVar(i,j)+", ");
    if((i != mScrOp->ParameterCount()-1) && (j== mScrOp->VectorCount(i)-1)) 
      varla->setText(mScrOp->ParameterVar(i,j)+"; ");
    if((i == mScrOp->ParameterCount()-1) && (j== mScrOp->VectorCount(i)-1)) 
      varla->setText(mScrOp->ParameterVar(i,j));
       varla->setProperty("Variable",mScrOp->ParameterVar(i,j));
    varla->setContextMenuPolicy(Qt::CustomContextMenu);
    QObject::connect(varla,SIGNAL(customContextMenuRequested(QPoint)),
      this,SLOT(VariableContextMenu(QPoint)));
    hbox2->addWidget(varla);
  }}
  lvbox->addLayout(hbox2);

  // below this line is more version only
  if(!mMore) return;

  // more version: add operands headline 
  if(mScrOp->ParameterCount()>0) {
    QLabel* hela  = new QLabel(0);
    hela->setText("Parameters");
    hela->setAlignment(Qt::AlignLeft);
    mvbox->addSpacing(10);
    mvbox->addWidget(hela);
    mvbox->addSpacing(10);
  }

  // more version: recreate parameter widgets 
  for(int i=0; i< mScrOp->ParameterCount(); i++) {
    FD_DS("ScrOpWidget::UpdateVariant(): D params " << i);
    // have a dim select for vectors
    if(mScrOp->VectorDescr(i)!="") {
      FD_DS("ScrOpWidget::UpdateVariant(): dimselect for par " << i);
      FD_DS("ScrOpWidget::UpdateVariant(): dimension is " << mScrOp->VectorCount(i));
      QComboBox* dimsel=new QComboBox();  
      dimsel->setEditable(true);
      dimsel->setDuplicatesEnabled(false);
      dimsel->lineEdit()->setValidator(new QIntValidator(dimsel->lineEdit()));
      dimsel->setProperty("ParameterNumI",i);
      UpdateDimSelectComboBox(dimsel);
      QObject::connect(dimsel,SIGNAL(activated(int)),
        this,SLOT(setVectorCount(void)));
      // vect descr
      QLabel* vecla1 = new QLabel();
      vecla1->setText(mScrOp->VectorDescr(i));
      vecla1->setAlignment(Qt::AlignLeft);
      // vect text
      QLabel* vecla2 = new QLabel();
      vecla2->setText("dim.: ");
      vecla2->setAlignment(Qt::AlignLeft);
      // line
      QHBoxLayout* vhbox= new QHBoxLayout();
      vhbox->addWidget(vecla1);
      vhbox->addSpacing(10);
      vhbox->addWidget(vecla2);
      vhbox->addWidget(dimsel);
      vhbox->addStretch(2);
      mvbox->addSpacing(2);
      mvbox->addLayout(vhbox);
    }
    // have the actual parameter stack
    QVBoxLayout* parbox = new QVBoxLayout();
    parbox->setContentsMargins(0,0,0,0);
    parbox->setSpacing(0);
    QWidget* parwid = new QWidget();
    parbox->addWidget(parwid);
    mvbox->addLayout(parbox);
    mvbox->addSpacing(5);
    mParameterWidgets.append(parwid);
    mParameterBoxes.append(parbox);
  }

  // more version: fill parameter widgets/boxes
  for(int i=0; i< mScrOp->ParameterCount(); i++) 
    UpdateParameter(i);

  // more version: add options 
  if(mScrOp->OptionCount()>0) {

  QLabel* hela  = new QLabel();
  hela->setText("Options");
  hela->setAlignment(Qt::AlignLeft);
  mvbox->addSpacing(10);
  mvbox->addWidget(hela);
  mvbox->addSpacing(10);
  for(int i=0; i < mScrOp->OptionCount(); i++) {
    // option
    QCheckBox* optbx=new QCheckBox();  
    optbx->setText(mScrOp->OptionDescr(i));
    optbx->setProperty("OptionNumI",i);
    QObject::connect(optbx,SIGNAL(clicked(void)),this,SLOT(setOptionValue(void)));
    UpdateOption(optbx);
    // line
    QHBoxLayout* hbox= new QHBoxLayout();
    hbox->addWidget(optbx);
    hbox->addStretch(1);
    mvbox->addSpacing(1);
    mvbox->addLayout(hbox);
    // tooltip
    optbx->setToolTip(mScrOp->OptionToolTip(i));
    optbx->setWhatsThis(mScrOp->OptionWhatsThis(i));
  }
  } // end: if options

  FD_DS("ScrOpWidget::UpdateVariant(): done");

}


// update a parameter related stuff
void ScrOpWidget::UpdateParameter(int n) {
  FD_DS("ScrOpWidget::UpdateParameter("<<n<<"): A");
  if(!mScrOp) return;
  if(!mScrOp->VariablePool()) return;
  if(n<0 || n>=mParameterWidgets.size()) return;
  if(n<0 || n>=mParameterBoxes.size()) return;
  FD_DS("ScrOpWidget::UpdateParameter("<<n<<"): B");
  QWidget* parwid= mParameterWidgets.at(n);
  QVBoxLayout* parbox= mParameterBoxes.at(n);
  if(!parbox) return;  
  FD_DS("ScrOpWidget::UpdateParameter("<<n<<"): C");

  // delete all children in parameter widgets: clear (disconnect?)
  if(parwid) delete parwid;
 
  // recreate parameter widget and put to box
  parwid = new QWidget();
  mParameterWidgets[n]=parwid;
  parbox->addWidget(parwid);
  
  // have a layout myself to fill
  QVBoxLayout* vbox = new QVBoxLayout(parwid);
  vbox->setContentsMargins(0,0,0,0);
  vbox->setSpacing(0);

  // vector flag
  bool vec=(mScrOp->VectorDescr(n)!="");

  // now the variables
  for(int j=0; j < mScrOp->VectorCount(n); j++) {
    // variable
    ParameterComboBox* vared=new ParameterComboBox(this);  
    vared->setDuplicatesEnabled(false);
    vared->setEditable(true);
    vared->lineEdit()->setValidator(new VioSymbolValidator(vared->lineEdit()));
    vared->setProperty("ParameterNumI",n);
    vared->setProperty("ParameterNumJ",j);
    vared->setProperty("Variable",mScrOp->ParameterVar(n,j));
    UpdateVariableComboBox(vared);
    QObject::connect(vared,SIGNAL(activated(int)),
      this,SLOT(setParameterVar(void)));
    vared->setContextMenuPolicy(Qt::CustomContextMenu);
    QObject::connect(vared,SIGNAL(customContextMenuRequested(QPoint)),
      this,SLOT(VariableContextMenu(QPoint)));
    // descr
    QLabel* desla = new QLabel();
    if(vec) desla->setText(QString("#%1").arg(j+1));
    if(!vec) desla->setText(mScrOp->ParameterDescr(n,j));
    desla->setAlignment(Qt::AlignLeft);
    desla->setBuddy(vared);
    // attri
    QLabel* attrla = new QLabel();
    attrla->setText("["+mScrOp->ParameterAttr(n)+"]");
    attrla->setAlignment(Qt::AlignLeft);
    //todo: description tool tip
    // line
    QHBoxLayout* hbox= new QHBoxLayout();
    hbox->addWidget(desla);
    hbox->addSpacing(10);
    hbox->addWidget(attrla);
    hbox->addStretch(1);
    hbox->addSpacing(10);
    hbox->addWidget(vared);
    vbox->addSpacing(1);
    vbox->addLayout(hbox);
  } 
  FD_DS("ScrOpWidget::UpdateParameter(): done");
}

// update a parameter related stuff
void ScrOpWidget::UpdateParameter(void) {
  FD_DS("ScrOpWidget::UpdateParameter()");
  // retrieve vector index from property
  if(!mScrOp) return;
  if(!mScrOp->VariablePool()) return;
  if(!sender()) return;
  QVariant propi = sender()->property("ParameterNumI");
  int i=propi.toInt();
  if((i<0) || (i>=mScrOp->ParameterCount())) return;
  // pass on
  UpdateParameter(i);
}

// switch layout
void ScrOpWidget::More(void) {
  if(!mMore) {
    mMoreWidget->show();
    mLessWidget->hide();
    mButtonMore->setArrowType(Qt::UpArrow);
    mMore=true;
  } else {
    mLessWidget->show();
    mMoreWidget->hide();
    mButtonMore->setArrowType(Qt::DownArrow);
    mMore=false;
  }
  UpdateVariant();
}

// set variant callback slot
void ScrOpWidget::setVariant(void) {
  if(!mScrOp) return;
  if(!mComboVariant) return;
  int n = mComboVariant->currentIndex();
  FD_DS("ScrOpWidget::setVariant(): "<< n);
  mScrOp->Variant(n); // emits signal to cause update
  Modified(true);
}

// set operand var name callback slot
void ScrOpWidget::setParameterVar(void) {
  if(!mScrOp) return;
  FD_DS("ScrOpWidget::setParameterVar()");
  QString varname="";
  if(QLineEdit* vared=qobject_cast<QLineEdit*>(sender())) varname=vared->text();
  if(QComboBox* vared=qobject_cast<QComboBox*>(sender())) varname=vared->currentText();
  if(varname=="") return;
  FD_DS("ScrOpWidget::setParameterVar(): operand name " << VioStyle::StrFromQStr(varname));
  QVariant propi = sender()->property("ParameterNumI");
  if(!(propi.typeId()==QMetaType::Int)) return;
  int i = propi.toInt();
  QVariant propj = sender()->property("ParameterNumJ");
  if(!(propj.typeId()==QMetaType::Int)) return;
  int j = propj.toInt();
  FD_DS("ScrOpWidget::setParameterVar(): setting operand " << i << "-" << j);
  mScrOp->ParameterVar(varname,i,j);
  mScrOp->Initialize();
  mScrOp->State(); //trigger status update
  sender()->setProperty("Variable",varname);
  FD_DS("ScrOpWidget::setParameterVar(): try to update the combo box itself");
  if(QComboBox* vared=qobject_cast<QComboBox*>(sender())) {
    UpdateVariableComboBox(vared);
  }  
  Modified(true);
}
 

// set vector dimension callback slot
void ScrOpWidget::setVectorCount(void) {
  if(!mScrOp) return;
  FD_DS("ScrOpWidget::setVectorCount()");
  QString newdim;
  if(QLineEdit* vared=qobject_cast<QLineEdit*>(sender())) newdim=vared->text();
  if(QComboBox* vared=qobject_cast<QComboBox*>(sender())) newdim=vared->currentText();
  if(newdim=="") return;
  FD_DS("ScrOpWidget::setVectorCount(): newdim " << VioStyle::StrFromQStr(newdim));
  int m=-1;
  bool ok;
  m=newdim.toInt(&ok);
  if(!ok) return;
  FD_DS("ScrOpWidget::setVectorCount(): newdim " << m);
  QVariant propi = sender()->property("ParameterNumI");
  if(!(propi.typeId()==QMetaType::Int)) return;
  int i = propi.toInt();
  FD_DS("ScrOpWidget::setVectorCount(): setting dimension for position " << i);
  mScrOp->VectorCount(i,m); // emits update signal
  // done
  Modified(true);
}
 



// set option var callback slot
void ScrOpWidget::setOptionValue(void) {
  if(!mScrOp) return;
  if(!mScrOp->VariablePool()) return;
  FD_DS("ScrOpWidget::setOptionValue()");
  QVariant prop = sender()->property("OptionNumI");
  if(!(prop.typeId()==QMetaType::Int)) return;
  int optidx = prop.toInt();
  FD_DS("ScrOpWidget::setOptionValue() for " << optidx);
  bool value=false;
  if(QCheckBox* optbx=qobject_cast<QCheckBox*>(sender())) {value=optbx->isChecked();};
  FD_DS("ScrOpWidget::setOptionValue(): to " << value);
  mScrOp->OptionVal(value,optidx);
  Modified(true);
}
 


// update state
void ScrOpWidget::UpdateState(void) {
  if(!mScrOp) return;
  FD_DS("ScrOpWidget::UpdateState()");
  ScrOperation::OperationState state=mScrOp->State();
  QColor color=VioStyle::Color(VioBlack);
  QPalette palette;
  if(state==ScrOperation::Ready)   color=VioStyle::Color(VioGreen);
  if(state==ScrOperation::Waiting) color=VioStyle::Color(VioYellow);
  if(state==ScrOperation::Error)   color=VioStyle::Color(VioRed);
  if(color!=VioStyle::Color(VioBlack)) {
    palette.setColor(QPalette::Base,      VioStyle::ColorTaint(palette.color(QPalette::Base), color, 0.1));
    palette.setColor(QPalette::Text,      VioStyle::ColorTaint(palette.color(QPalette::Text), color, 0.4));
    palette.setColor(QPalette::Window,    VioStyle::ColorTaint(palette.color(QPalette::Window), color, 0.6));
    palette.setColor(QPalette::WindowText,VioStyle::ColorTaint(palette.color(QPalette::WindowText), color, 0.4));
    palette.setColor(QPalette::Button,    VioStyle::ColorTaint(palette.color(QPalette::Button), color, 0.4));
    palette.setColor(QPalette::ButtonText,VioStyle::ColorTaint(palette.color(QPalette::ButtonText), color, 0.4));
    palette.setColor(QPalette::Light,     VioStyle::ColorTaint(palette.color(QPalette::Light), color, 0.4));
    palette.setColor(QPalette::Midlight,  VioStyle::ColorTaint(palette.color(QPalette::Midlight), color, 0.4));
    palette.setColor(QPalette::Dark,      VioStyle::ColorTaint(palette.color(QPalette::Dark), color, 0.4));
    palette.setColor(QPalette::Shadow,    VioStyle::ColorTaint(palette.color(QPalette::Shadow), color, 0.4));
    palette.setColor(QPalette::Mid,       VioStyle::ColorTaint(palette.color(QPalette::Mid), color, 0.4));
  }
  setPalette(palette);
  // fix status
  mLessStatusInfo->setText(mScrOp->StateInfo());
  mMoreStatusInfo->setText(mScrOp->StateInfo());
  mLessStatusInfo->setToolTip("<p>"+mScrOp->StateExtraInfo().toHtmlEscaped()+"</p>");
  mCompleteErrorInfo->setText("<p>"+mScrOp->StateExtraInfo().toHtmlEscaped()+"</p>");
  if(mScrOp->StateExtraInfo()!="") mCompleteErrorInfo->show();
  else mCompleteErrorInfo->hide();
  // selection
  if(!isSelected()) {
    palette.setColor(QPalette::WindowText, VioStyle::ColorTaint(palette.color(QPalette::Window), color, 1));
  }
  mIndicatorL->setPalette(palette);

}

// update variable combobox
void ScrOpWidget::UpdateVariableComboBox(QComboBox* vared) {
  FD_DS("ScrOpWidget::UpdateVariableComboBox()");
  // retrieve variable name from property
  if(!mScrOp) return;
  if(!mScrOp->VariablePool()) return;
  QVariant propname = vared->property("Variable");
  QString varname=propname.toString();
  QVariant propi = vared->property("ParameterNumI");
  int i=propi.toInt();
  QVariant propj = vared->property("ParameterNumJ");
  int j=propj.toInt();
  FD_DS("ScrOpWidget::UpdateVariableComboBox(): for \"" << VioStyle::StrFromQStr(varname) << "\" at position " << i << "-" << j);
  // set up the combo box
  vared->clear();
  /*
  const QList<WspItem*> poolvars = mScrOp->VariablePool()->ItemList();
  foreach(WspItem* witem, poolvars) 
    if(mScrOp->TypeCheck(witem->Name(),i,j))
       vared->addItem(witem->Name());
  */
  vared->insertItem(0,"< new >"); 
  int pos=vared->findText(varname);
  if(pos<0 && varname!="")
    vared->addItem(varname);
  // set current entry
  pos=vared->findText(varname);
  if(pos>=0) {
    vared->setCurrentIndex(pos);
  } else {
    vared->setCurrentIndex(0);
  }
  vared->setEditText(varname);
  // set tool tips
  /*
  WspVariable* var=mScrOp->VariablePool()->At(varname);
  if(var) {
    vared->setToolTip(var->ToolTip());
    vared->setWhatsThis(var->WhatsThis());
  }
  */
  FD_DS("ScrOpWidget::UpdateVariableComboBox(): done()");
}

// update variable combobox
void ScrOpWidget::UpdateVariableComboBox(void) {
  if(QComboBox* vared=qobject_cast<QComboBox*>(sender())) UpdateVariableComboBox(vared);
}

// update dimension select
void ScrOpWidget::UpdateDimSelectComboBox(QComboBox* dimsel) {
  FD_DS("ScrOpWidget::UpdateDimSelectComboBox()");
  // retrieve vector index from property
  if(!mScrOp) return;
  if(!mScrOp->VariablePool()) return;
  QVariant propi = dimsel->property("ParameterNumI");
  int i=propi.toInt();
  if((i<0) || (i>=mScrOp->ParameterCount())) return;
  FD_DS("ScrOpWidget::UpdateDimSelectComboBox(): for vector " << i);
  if(mScrOp->VectorDescr(i)=="") return;
  FD_DS("ScrOpWidget::UpdateDimSelectComboBox(): for vector parameter " << VioStyle::StrFromQStr(mScrOp->VectorDescr(i)));
  // set up the combo box
  dimsel->clear();
  dimsel->insertItem(0,"< dim >"); 
  for(int j=0; j<mScrOp->VectorCount(i)+5; j++) 
    dimsel->addItem(QString("%1").arg(j));
  int pos=dimsel->findText(QString("%1").arg(mScrOp->VectorCount(i)));
  if(pos<0) pos =0;
  // set current entry
  dimsel->setCurrentIndex(pos);
  dimsel->setEditText(QString("%1").arg(mScrOp->VectorCount(i)));
  // set tool tips
  dimsel->setToolTip(QString("set dimension of vector %1").arg(mScrOp->VectorDescr(i)));
  dimsel->setWhatsThis(QString("set dimension of vector %1").arg(mScrOp->VectorDescr(i)));
}

// update dimselect combobox
void ScrOpWidget::UpdateDimSelectComboBox(void) {
  if(QComboBox* dimsel=qobject_cast<QComboBox*>(sender())) UpdateDimSelectComboBox(dimsel);
}


// update variable combobox
void ScrOpWidget::UpdateOption(QCheckBox* optbx) {
  FD_DS("ScrOpWidget::UpdateOption()");
  if(!mScrOp) return;
  if(!mScrOp->VariablePool()) return;
  QVariant prop = optbx->property("OptionNumI");
  int optidx=prop.toInt();
  FD_DS("ScrOpWidget::UpdateOption(): for" << optidx);
  optbx->setChecked(mScrOp->OptionVal(optidx));
}


// run context menu on variable
void ScrOpWidget::VariableContextMenu(QPoint pos) {
  FD_DS("ScrOpWidget::VariableContextMenu()");
  if(!sender()) return;
  QVariant prop = sender()->property("Variable");
  if(!(prop.typeId()==QMetaType::QString)) return;
  QString varname = prop.toString();
  if(QWidget* widget=qobject_cast<QWidget*>(sender())) {
    pos=widget->mapToGlobal(pos);
  }
  WspVariable* var=mScrOp->VariablePool()->At(varname);
  if(!var) return;
  QMenu* menu= var->NewContextMenu();
  menu->exec(pos);
  delete menu;
}


// run context menu on operation
void ScrOpWidget::OperationContextMenu(QPoint pos) {
  FD_DS("ScrOpWidget::OperationContextMenu()");
  if(!sender()) return;
  QVariant prop = sender()->property("OperationDescr");
  if(!(prop.typeId()==QMetaType::QString)) return;
  QString opdescr = prop.toString();
  FD_DS("ScrOpWidget::OperationContextMenu(): descr " << VioStyle::StrFromQStr(opdescr));
  if(QWidget* widget=qobject_cast<QWidget*>(sender())) {
    pos=widget->mapToGlobal(pos);
  }
  /* 
  // std: menu is wsp item
  WspFunction* wfnct=mScrOp->FunctionPool()->At(opdescr);
  if(!wfnct) return;
  FD_DS("ScrOpWidget::OperationContextMenu(): founf wsp function");
  QMenu* menu= wfnct->NewContextMenu();
  */
  // operation shows
  QMenu* menu = mScrOp->NewContextMenu();
  menu->exec(pos);
  delete menu;
}


// selection
bool ScrOpWidget::isSelected(void) const {return mSelected;};
void ScrOpWidget::setSelected(bool sel) {
  if(mSelected!=sel) {
    mSelected=sel;
    UpdateState();
  }
};


// Modified: query changes (dont emit signal)
bool ScrOpWidget::Modified(void) const { 
  return mModified;
};

// Modified: collect and pass on modifications of childs
void ScrOpWidget::ChildModified(bool changed) { 
  // ignre netagtives
  if(!changed) return;
  // report
  FD_DS("ScrOpWidget::ChildModified(1): model modified " << mModified);
  Modified(true);
};

// Modified: record changes and emit signal
void ScrOpWidget::Modified(bool ch) { 
  // set
  if(!mModified && ch) {
    FD_DS("ScrOpWidget::Modified(): emit postive modified notification");
    mModified=true;
    emit NotifyModified(mModified);
  }
  // clr
  if(mModified && !ch) {
    mModified=false;
    FD_DS("ScrOpWidget::Modified(): emit negative modified notification");
    emit NotifyModified(mModified);
  }
}




// events: mouse press
void ScrOpWidget::mousePressEvent(QMouseEvent *event) {
  //FD_DS("ScrOpWidget::mousePressEvent(event)");
  // call parent
  QWidget::mousePressEvent(event);
  // was accepted?
  //FD_DS("ScrOpWidget::mousePressEvent(event): " << event->isAccepted());
}
  



/*
 ************************************************
 ************************************************
 ************************************************

 ParamterComboBox implementation

 ************************************************
 ************************************************
 ************************************************
 */


// construct/destruct
ParameterComboBox::ParameterComboBox(ScrOpWidget* parent) : QComboBox(parent) {
  mOpWidget=parent;
  setMinimumContentsLength(15);
}
ParameterComboBox::~ParameterComboBox(void) {
}

// update my popup
void ParameterComboBox::Update(void) {
  FD_DS("ParameterComboBox::Update(): A");
  // default to blank
  clear();
  insertItem(0,"< new >"); 
  // retrive model
  if(!mOpWidget) return;
  ScrOperation* scrop=mOpWidget->model();
  if(!scrop) return;
  // retrieve variable name from property
  FD_DS("ParameterComboBox::Update(): B");
  QVariant propname = property("Variable");
  QString varname= propname.toString();
  QVariant propi = property("ParameterNumI");
  int i=propi.toInt();
  QVariant propj = property("ParameterNumJ");
  int j=propj.toInt();
  FD_DS("ParameterComboBox::showPopup(): C \"" << VioStyle::StrFromQStr(varname) << "\" at position " << i << "-" << j);
  // set up the combo box
  clear();
  if(scrop->VariablePool()) {
    const QList<WspItem*> poolvars = scrop->VariablePool()->ItemList();
    foreach(WspItem* witem, poolvars) 
      if(scrop->TypeCheck(witem->Name(),i,j))
         addItem(witem->Name());
  }
  insertItem(0,"< new >"); 
  int pos=findText(varname);
  if(pos<0 && varname!="")
     addItem(varname);
  // set current entry
  pos=findText(varname);
  if(pos>=0) {
    setCurrentIndex(pos);
  } else {
    setCurrentIndex(0);
  }
  setEditText(varname);
  // done
  FD_DS("ParameterComboBox::showPopup(): D");
}

// clear my self
void ParameterComboBox::Clear(void) {
  QString curitem=currentText();
  FD_DS("ParameterComboBox::Clear(): with " << VioStyle::StrFromQStr(curitem));
  clear();
  if(curitem!="") {
    insertItem(0,curitem); 
    setCurrentIndex(0);
  }
  setEditText(curitem);
}

// update my tooltip
void ParameterComboBox::ToolTip(void) {
  FD_DS("ParameterComboBox::ToolTip(): A");
  // default to blank
  setToolTip("");
  // retrive model
  if(!mOpWidget) return;
  ScrOperation* scrop=mOpWidget->model();
  if(!scrop) return;
  // retrieve variable name from property
  FD_DS("ParameterComboBox::ToolTip(): B");
  QVariant propname = property("Variable");
  QString varname= propname.toString();
  FD_DS("ParameterComboBox::ToolTip(): C \"" << VioStyle::StrFromQStr(varname));
  // set tool tips
  WspVariable* var=scrop->VariablePool()->At(varname);
  if(var) {
    setToolTip(var->ToolTip());
    setWhatsThis(var->WhatsThis());
  }
}

// overwrite showpopup for updating
void ParameterComboBox::showPopup(void) {
  // update my self
  Update();
  // pass on
  QComboBox::showPopup();
}

// overwrite hidepopup for updating
void ParameterComboBox::hidePopup(void) {
  FD_DS("ParameterComboBox::hidePopup()");
  // pass on 
  QComboBox::hidePopup();
}

// intercept toolzip event
bool ParameterComboBox::event(QEvent* ev) {
  if(ev->type()==QEvent::WhatsThis) ToolTip();
  if(ev->type()==QEvent::ToolTip) ToolTip();
  return QComboBox::event(ev);
}

