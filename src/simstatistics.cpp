/* simstatwidget.cpp  -  represent simulator statastics   */


/*
   Simulator gui for FAU Discrete Event Systems Library (libfaudes)

   Copyright (C) 2006, 2007  Thomas Moor, Klaus Schmidt, Sebastian Perk

*/


#include "desstyle.h"
#include "simstatistics.h"
#include "simcontrol.h"




/*
 ********************************
 ********************************
 ********************************

 implement SimDensityScene

 ********************************
 ********************************
 ********************************
 */


// set model (by copy)
void SimDensityScene::setDensity(const faudes::DiscreteDensityFunction* pDensity) {
  FD_DX("SimDensityScene::setDensity(" << this << "): " << pDensity->Name());
  // fixme: style
  mWidth=200;
  mHeight=100;
  setSceneRect(-0.1*mWidth,-0.025*mHeight,1.2*mWidth,1.175*mHeight);
  // clear my scene
  foreach(QGraphicsItem* gitem, items()) {
    removeItem(gitem);
    delete gitem;
  }
  // title
  int txtline=0;
  QGraphicsSimpleTextItem* n1item = new QGraphicsSimpleTextItem;
  n1item->setText(VioStyle::QStrFromStr(pDensity->Name()));
  n1item->setPos(0,0);
  addItem(n1item);
  txtline++;
  // range
  QGraphicsSimpleTextItem* n2item = new QGraphicsSimpleTextItem;
  n2item->setText(QString("#%1 in [%2,%3]").arg(pDensity->Count()).arg(pDensity->MinTime()).arg(pDensity->MaxTime())) ;
  n2item->setPos(0,12*txtline+4); 
  addItem(n2item);
  txtline++;
  // quantile
  QGraphicsSimpleTextItem* n3item = new QGraphicsSimpleTextItem;
  n3item->setText(QString("90% in [%1,%2]").arg(pDensity->Quantile05()).arg(pDensity->Quantile95())) ;
  n3item->setPos(0,12*txtline+4);
  addItem(n3item);
  txtline++;
  // mue/sigma
  QGraphicsSimpleTextItem* n4item = new QGraphicsSimpleTextItem;
  n4item->setText(QString("mue %1, sigma %2]").arg(pDensity->Average()).arg(pDensity->Variance())) ;
  n4item->setPos(0,12*txtline+4); 
  addItem(n4item);
  txtline++;
  // version a) low number of density values: text
  int sz=0;
  faudes::DiscreteDensityFunction::CIterator mit;
  for(mit=pDensity->Begin(); mit!=pDensity->End() && sz<6; mit++) // todo: need size
    sz++;
  if(sz<5) {
    for(mit=pDensity->Begin(); mit!=pDensity->End(); mit++) {
      QGraphicsSimpleTextItem* niitem = new QGraphicsSimpleTextItem;
      qreal cnt = pDensity->TimeInt(mit).UB() - pDensity->TimeInt(mit).LB();
      cnt *= (pDensity->Value(mit) * pDensity->Count());
      int icnt = cnt+0.5;
      niitem->setText(QString("#%1 in [%2,%3]").arg(
        icnt).arg(pDensity->TimeInt(mit).LB()).arg(pDensity->TimeInt(mit).UB()));
      niitem->setPos(0,12*txtline+8);
      addItem(niitem);
      txtline++;
    }
    return;
  }
  // version b) .... graphics
  // get scales: time
  faudes::Time::Type timeMin  = pDensity->Quantile05();
  faudes::Time::Type timeMax  = pDensity->Quantile95();
  faudes::Time::Type duration=timeMax-timeMin+1; // discrete time
  timeMin=qMax<double>(timeMin - 0.75 * duration,((double) pDensity->MinTime()));
  timeMax=qMin<double>(timeMax + 0.75 * duration,((double) pDensity->MaxTime()));
  if(timeMin < 0.25*duration) timeMin=0;
  //timeMin=pDensity->MinTime();
  //timeMax=pDensity->MaxTime();
  if(timeMin > timeMax) timeMin=0;
  if(timeMin < 0) timeMin=0;
  if(timeMin >= timeMax) timeMax=timeMin+1;
  duration=timeMax-timeMin;
  mTimeScale = mWidth/duration;
  // get scales: height
  qreal valueMin  = 0; pDensity->MinValue();
  qreal valueMax  = pDensity->MaxValue();
  if(valueMin > valueMax) return; // error
  if(valueMin >= valueMax) valueMax=valueMax+1;
  qreal range=valueMax-valueMin;
  mValueScale = mHeight/range;
  FD_DX("SimDensityScene::setDensity(): scales t " << mTimeScale << " p " << mValueScale);
  // do draw function
  //faudes::DiscreteDensityFunction::CIterator mit;
  for(mit=pDensity->Begin(); mit!=pDensity->End(); mit++) {
    if(pDensity->TimeInt(mit).UB() < timeMin) continue;
    if(pDensity->TimeInt(mit).LB() > timeMax) continue;
    qreal x0 = (pDensity->TimeInt(mit).LB()-timeMin) * mTimeScale - 0.5*mTimeScale; // discrete adjust
    qreal w =  (pDensity->TimeInt(mit).UB()-pDensity->TimeInt(mit).LB()) * mTimeScale;
    qreal h =  (pDensity->Value(mit)-valueMin) * mValueScale;
    QRectF block(x0,mHeight - h,w,h);
    block=block.intersected(QRectF(-0.05*mWidth,0,1.1 * mWidth,mHeight));
    // FD_DX("SimDensityScene::setDensity(): block " << block.x() << "/" << block.y() << "/" << block.width() << "/" << block.height());
    QGraphicsRectItem* ritem= new QGraphicsRectItem(block);
    QBrush brush = VioStyle::DefaultBrush();
    brush.setColor(VioStyle::Color(VioRed).lighter(300));
    ritem->setPen(Qt::NoPen);
    ritem->setBrush(brush);
    ritem->setZValue(-20);
    ritem->setPos(0,0);
    addItem(ritem);
  }
  // do scale
  QPainterPath sfpath;
  QPainterPath stpath;
  qreal tickinter;
  DesStyle::ScaleTickInter(tickinter,timeMin,timeMax,mTimeScale);
  DesStyle::ScalePaths(sfpath,stpath,timeMin,timeMax,tickinter,mTimeScale);
  QGraphicsPathItem* sfitem= new QGraphicsPathItem(sfpath);
  QPen sfpen;
  DesStyle::ScalePen(sfpen);
  sfitem->setPen(sfpen);
  sfitem->setBrush(Qt::NoBrush);
  sfitem->setPos(0,mHeight+DesStyle::SCALE_TICK_LARGE);
  addItem(sfitem);
  QGraphicsPathItem* stitem= new QGraphicsPathItem(stpath);
  QBrush stbrush;
  DesStyle::ScaleBrush(stbrush);
  stitem->setPen(Qt::NoPen);
  stitem->setBrush(stbrush);
  stitem->setPos(0,mHeight+DesStyle::SCALE_TICK_LARGE);
  addItem(stitem);
  // do indicate average/variance
  qreal cheight=6;
  QPainterPath fpath;
  fpath.moveTo(-pDensity->Variance()*mTimeScale,0);
  fpath.lineTo(+pDensity->Variance()*mTimeScale,0);
  fpath.moveTo(-pDensity->Variance()*mTimeScale,-cheight/2);
  fpath.lineTo(-pDensity->Variance()*mTimeScale,+cheight/2);
  fpath.moveTo(+pDensity->Variance()*mTimeScale,-cheight/2);
  fpath.lineTo(+pDensity->Variance()*mTimeScale,+cheight/2);
  QGraphicsPathItem* fitem= new QGraphicsPathItem(fpath);
  QPen fpen = VioStyle::DefaultPen();
  fpen.setColor(VioStyle::Color(VioBlue));
  fitem->setPen(fpen);
  fitem->setBrush(Qt::NoBrush);
  fitem->setPos((pDensity->Average()-timeMin)*mTimeScale,mHeight-DesStyle::SCALE_TICK_LARGE);
  addItem(fitem);
  QPainterPath dpath;
  dpath.moveTo(0,0);
  dpath.lineTo(-cheight,-cheight);
  dpath.lineTo(cheight,-cheight);
  dpath.lineTo(0,0);
  dpath.closeSubpath();
  QGraphicsPathItem* ditem= new QGraphicsPathItem(dpath);
  QBrush dbrush=VioStyle::DefaultBrush();
  dbrush.setColor(VioStyle::Color(VioBlue));
  ditem->setPen(Qt::NoPen);
  ditem->setBrush(dbrush);
  ditem->setPos((pDensity->Average()-timeMin)*mTimeScale,mHeight-DesStyle::SCALE_TICK_LARGE);
  addItem(ditem);
  FD_DX("SimDensityScene::setDensity(" << pDensity << "): done");
}



/*
 ********************************
 ********************************
 ********************************

 implement SimDensityWidget

 ********************************
 ********************************
 ********************************
 */

// construct
SimDensityWidget::SimDensityWidget(QWidget* parent) : QGraphicsView(parent) {
  mDensityScene = new SimDensityScene(this);
  FD_DX("SimDensityWidget::SimDensityWidget(" << this << "): with scene " << mDensityScene);
  setRenderHints(QPainter::Antialiasing | QPainter::SmoothPixmapTransform);
  setScene(mDensityScene);
  setMinimumWidth(250);
  setMinimumHeight(150);
  setSizePolicy(QSizePolicy::MinimumExpanding, QSizePolicy::Fixed);
  setVerticalScrollBarPolicy(Qt::ScrollBarAlwaysOff);
  setHorizontalScrollBarPolicy(Qt::ScrollBarAlwaysOff);
  setContentsMargins(0,0,0,0);
  setLineWidth(0);
};

// pass through: set
void SimDensityWidget::setDensity(const faudes::DiscreteDensityFunction* pDensity) {
  FD_DX("SimDensityWidget::setDensity(" << this << "): " << pDensity->Name() << 
    " to scene " << mDensityScene);
  mDensityScene->setDensity(pDensity);
}


// pass through: size
QSize SimDensityWidget::sizeHint(void) const {
  return QSize(250,150); // todo
}

// reimplement
void SimDensityWidget::mousePressEvent(QMouseEvent * event) {
  FD_DX("SimDensityWidget::mousePressEvent(" <<  this << ")");
  QGraphicsView::mousePressEvent(event);
  event->ignore();
}

/*
 ********************************
 ********************************
 ********************************

 implement SimConditionStatisticsWidget

 ********************************
 ********************************
 ********************************
 */

// construct
SimConditionStatisticsWidget::SimConditionStatisticsWidget(QWidget* parent) : QWidget(parent) {
  FD_DX("SimConditionStatisticsWidget::SimConditionStatisticsWidget(" << this << ")");
  mIdx=0;
  setSizePolicy(QSizePolicy::MinimumExpanding, QSizePolicy::Fixed);
  QHBoxLayout* hbox = new QHBoxLayout(this);
  hbox->setContentsMargins(0,0,0,0);
  hbox->setSpacing(0);
  mDurationWidget = new SimDensityWidget(this);
  mPeriodWidget = new SimDensityWidget(this);
  hbox->addWidget(mPeriodWidget);
  hbox->addWidget(mDurationWidget);
}

// pass through: set by copy
void SimConditionStatisticsWidget::setCondition(const faudes::AttributeSimCondition* pCondition, faudes::Idx idx) {
  FD_DX("SimConditionStatisticsWidget::setCondition(" <<  this << "): " << idx);
  mIdx=idx;
  faudes::SampledDensityFunction samples;
  samples = pCondition->mSamplesPeriod;
  samples.Compile();
  mPeriodWidget->setDensity(&samples);
  samples = pCondition->mSamplesDuration;
  samples.Compile();
  mDurationWidget->setDensity(&samples);
}

// pass through: size
QSize SimConditionStatisticsWidget::sizeHint(void) const {
  return QSize(500,150); // todo
}

// reimplement
void SimConditionStatisticsWidget::mousePressEvent(QMouseEvent * event) {
  FD_DX("SimConditionStatisticsWidget::mousePressEvent(" <<  this << "): " << mIdx);
  emit MousePressCondition(mIdx);  
  QWidget::mousePressEvent(event);
}

/*
 ********************************
 ********************************
 ********************************

 implementation of SimStatistics

 ********************************
 ********************************
 ********************************
 */

// construct
SimStatistics::SimStatistics(SimWidget* simwidget) :  WspItem(simwidget) {
  FD_DX("SimStatistics::SimStatistics(" << simwidget << "): " << this);

  // overwrite wsp item defaults
  mName="Statistics";
  mPersistent=false;
  mItemType=ITSimStatistics;
  mVisual=true;
  mViewSatelite=true;

  // record simwidget
  pSimWidget = simwidget;

  // may configuration
  mStatisticsEnabled=false;

  // do all reset
  Reset();
}


// destruct
SimStatistics::~SimStatistics(void) {
  FD_DX("SimStatistics::~SimStatistics()");
}


// activate stats
void SimStatistics::StatisticsEnable(bool on) {
  FD_DX("SimStatistics::StatisticsEnable(" << on << ")");
  mStatisticsEnabled=on;
  if(!mStatisticsEnabled) Reset();
}


// Overload wsp item functins: widgets
QWidget* SimStatistics::NewMainWidget(void) {
  SimStatisticsMainWidget* widget = new SimStatisticsMainWidget(0);
  widget->Model(this);
  return widget;
}

// Overload wsp item functins: widgets
QWidget* SimStatistics::NewSateliteWidget(void) {
  SimStatisticsSateliteWidget* widget = new SimStatisticsSateliteWidget(0);
  widget->Model(this);
  return widget;
}

// clear
void SimStatistics::Reset(void) {
  FD_DX("SimStatistics::Reset(" << this << ")");
  // notify dependants (ie main widget and control satelite)
  emit NotifyReset();
  // Reset implies update
  Update();
}


// get densities
void SimStatistics::Update(void) {
  if(!mStatisticsEnabled) return;
  FD_DX("SimStatistics::Update()");
  mCurrentTime = Control()->Executor()->CurrentTime();
  emit NotifyUpdate();
}


/*
 ********************************
 ********************************
 ********************************

 implementation of SimStatisticsMainWidegt

 ********************************
 ********************************
 ********************************
 */

// construct
SimStatisticsMainWidget::SimStatisticsMainWidget(QWidget* parent) :  QWidget(parent) {
  FD_DX("SimStatisticsMainWidget::SimStatisticsMainWidget(" << parent << "): " << this);

  // no model
  pStatistics = 0;

  // have a layout (inner to outer)
  mVbox= new TableLayout();
  mVbox->setSpacing(0);
  mVbox->setContentsMargins(0,0,0,0);
  mContent = new QWidget(); 
  mContent->setLayout(mVbox);
  mContent->setSizePolicy(QSizePolicy::MinimumExpanding, QSizePolicy::MinimumExpanding);
  mScrollArea = new QScrollArea(this);
  mScrollArea->setVerticalScrollBarPolicy(Qt::ScrollBarAsNeeded);
  mScrollArea->setHorizontalScrollBarPolicy(Qt::ScrollBarAlwaysOff);
  mScrollArea->setWidgetResizable(true);
  mScrollArea->setWidget(mContent);
  mScrollArea->setSizePolicy(QSizePolicy::Minimum, QSizePolicy::Minimum);
  mScrollArea->setMinimumWidth(300);
  mScrollArea->setMinimumHeight(300);
  QHBoxLayout* hbox= new QHBoxLayout(this);
  hbox->setSpacing(0);
  hbox->setContentsMargins(0,0,0,0);
  hbox->addWidget(mScrollArea);
  FD_DX("SimStatisticsMainWidget::SimStatisticsMainWidget(): done");

}

// destruct
SimStatisticsMainWidget::~SimStatisticsMainWidget(void) {
  FD_DX("SimStatisticsMainWidget::~SimStatisticsMainWidget()");
  Model(0);
  FD_DX("SimStatisticsMainWidget::~SimStatisticsMainWidget(): ok");
}


// executor access
const faudes::LoggingExecutor* SimStatisticsMainWidget::Executor(void) const {
  if(!pStatistics) return 0; 
  return pStatistics->Control()->Executor();
}

// simcontrol access
SimWidget* SimStatisticsMainWidget::Control(void) { 
  if(!pStatistics) return 0; 
  return pStatistics->Control(); 
}

// get model
SimStatistics* SimStatisticsMainWidget::Model(void) {
  return pStatistics;
}

// set model
void SimStatisticsMainWidget::Model(SimStatistics* model) {
  // disconnect
  if(pStatistics) {
    disconnect(pStatistics,0,this,0);
    if(!model) pStatistics->StatisticsEnable(false);
  }
  pStatistics=0;
  // connect
  pStatistics=model;
  if(pStatistics) {
    pStatistics->StatisticsEnable(true);
    connect(pStatistics,SIGNAL(NotifyReset(void)),this,SLOT(Reset(void)));
    connect(pStatistics,SIGNAL(NotifyUpdate(void)),this,SLOT(Update(void)));
    Reset();
  }
}
 



// clear
void SimStatisticsMainWidget::Reset(void) {
  FD_DX("SimStatisticsMainWidget::Reset(" << this << ")");
  // clear data
  foreach(QWidget* widget, mWidgets) { mVbox->removeWidget(widget); delete widget; };
  mWidgets.clear();
  // construct data
  int ccount=0;
  faudes::LoggingExecutor::ConditionIterator cit;
  for(cit=Executor()->ConditionsBegin();cit!=Executor()->ConditionsEnd(); cit++) {
    if(!Executor()->Condition(*cit).Enabled()) continue;
    // set up widget
    SimConditionStatisticsWidget* widget = new SimConditionStatisticsWidget(mContent);
    mVbox->addWidget(widget);
    // pass on user signals
    connect(widget,SIGNAL(MousePressCondition(faudes::Idx)), this, SIGNAL(MousePressCondition(faudes::Idx)));
    // record this widget
    mWidgets.push_back(widget);
    ccount++;
  }
  // if there are no conditions
  if(ccount==0) {
    QLabel* nocon = new QLabel();
    nocon->setText("No conditions defined/enabled/initialised");
    mVbox->addWidget(nocon);
    mWidgets.push_back(nocon);
  }
  // show them
  Update();
  // done
  FD_DX("SimStatisticsMainWidget::Reset(" << this << "): done");
}


// get densities
void SimStatisticsMainWidget::Update(void) {
  FD_DX("SimStatisticsMainWidget::Update()");
  int pos=0;
  faudes::LoggingExecutor::ConditionIterator cit;
  for(cit=Executor()->ConditionsBegin(); cit!=Executor()->ConditionsEnd(); ++cit) {
    if(!Executor()->Condition(*cit).Enabled()) continue;
    if(pos>=mWidgets.size()) break; // error
    SimConditionStatisticsWidget* simcon = 
      qobject_cast<SimConditionStatisticsWidget*>(mWidgets[pos]);
    if(!simcon) break; // error
    simcon->setCondition(&Executor()->Condition(*cit),*cit);
    pos++;
  }
  FD_DX("SimStatisticsMainWidget::Update(): done");
}


/*
 ********************************
 ********************************
 ********************************

 implementation of SimStatisticsSateliteWidegt

 ********************************
 ********************************
 ********************************
 */



// construct: my layout
SimStatisticsSateliteWidget::SimStatisticsSateliteWidget(QWidget *par) 
  : QWidget(par) 
{

  FD_DX("SimStatisticsSateliteWidget::SimStatisticsSateliteWidget(" << par << ")");

  // record sim control
  pControl= 0;
  pStatistics=0;

  // overall layout
  QVBoxLayout* mVbox = new QVBoxLayout(this);
  mVbox->setContentsMargins(2,2,2,2);
  mVbox->setSpacing(2);

  // conditionset
  mSimConditionSet = VioTypeRegistry::NewWidget("DEST_SimConditionSet");
  connect(mSimConditionSet,SIGNAL(NotifyChange),this,SLOT(Update()));
  mVbox->addWidget(mSimConditionSet);

  // enabled condition checkbox

  // controls
  mCheckEnabled = new QCheckBox();
  mCheckEnabled->setText("Enable Statistics");
  QGroupBox* gbox3=new QGroupBox();
  gbox3->setTitle("Controls");
  QVBoxLayout* vbox3= new QVBoxLayout(gbox3);
  vbox3->setContentsMargins(2,2,2,2);
  vbox3->setSpacing(2);
  vbox3->addWidget(mCheckEnabled);
  mVbox->addWidget(gbox3);

  // layout hint
  setMinimumWidth(150);

  FD_DX("SimStatisticsSateliteWidget::SimStatisticsSateliteWidget(" << par << "): done");
};


// destruct: easy, all qobjects
SimStatisticsSateliteWidget::~SimStatisticsSateliteWidget(void) {
  FD_DX("SimStatisticsSateliteWidget::~SimStatisticsSateliteWidget()");
  Model(0);
};


// set model
void SimStatisticsSateliteWidget::Model(SimStatistics* model) {
  // disconnect
  if(pStatistics) {
    disconnect(pStatistics,SIGNAL(NotifyReset(void)),this,SLOT(Reset(void)));
    disconnect(mCheckEnabled,0,0,0);
    // get control back
    faudes::Type* ft=mSimConditionSet->TakeFaudesObject(); 
    (void) ft;
  }
  pStatistics=0;
  // connect
  pStatistics=model;
  if(pStatistics) {
    pControl=pStatistics->Control();
    pStatistics->StatisticsEnable(true);
    // non const -> vio to take conrol
    mSimConditionSet->InsertFaudesObject(pControl->Conditions()); 
    connect(pStatistics,SIGNAL(NotifyReset(void)),this,SLOT(Reset(void)));
    connect(mCheckEnabled,SIGNAL(clicked(bool)),pStatistics,SLOT(StatisticsEnable(bool)));
    mCheckEnabled->setCheckState(pStatistics->StatisticsEnabled() ? Qt::Checked : Qt::Unchecked);
  }
}



// load from generator
void SimStatisticsSateliteWidget::Reset(void) {
  FD_DX("SimStatisticsSateliteWidget::Reset()");
  mCheckEnabled->setCheckState(pStatistics->StatisticsEnabled() ? Qt::Checked : Qt::Unchecked);
}


// update from widget
void SimStatisticsSateliteWidget::Update(void) {
  FD_DX("SimStatisticsSateliteWidget::Update()");
}


