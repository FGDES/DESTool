/* simtrace.cpp  -  represent simulator trace   */


/*
   Simulator gui for FAU Discrete Event Systems Library (libfaudes)

   Copyright (C) 2006, 2007  Thomas Moor, Klaus Schmidt, Sebastian Perk

*/


#undef FAUDES_DEBUG_SIMULATOR

#include "simtrace.h"
#include "simcontrol.h"
#include "desstyle.h"


/*
 ********************************
 ********************************
 ********************************
  
 base class for my graphics item

 ********************************
 ********************************
 ********************************
 */

// class definition
class SimItem : public QGraphicsItem  {

public:
  // construct/destruct
  SimItem(QGraphicsItem* parent);
  virtual ~SimItem(void);

  // set/get label
  void setLabel(const std::string& label) { mLabel=VioStyle::QStrFromStr(label);};
  void setQLabel(QString label) { mLabel=label;};
  std::string label(void) const { return VioStyle::StrFromQStr(mLabel); };
  QString qlabel(void) const { return mLabel; };
  void setLabelWidth(const qreal& lwidth) { mLabelWidth=lwidth; };

  // set/get position (parameter only, real time);
  void setATime(faudes::Time::Type atime) { mATime=atime; };
  void setAScale(qreal ascale) { mAScale=ascale; };
  faudes::Time::Type atime(void) const { return mATime; };

  // set/get width of core item (duration)
  void setTime(qreal time) { mTime=time; };
  qreal  time(void) const { return mTime; };

  // set extra extensions (e.g. larger event lables)
  void setRightTime(qreal time) { mRightTime=time; };
  void setLeftTime(qreal time) { mLeftTime=time; };

  // set geometry guess (gets overwritten by layout)
  void setOuterRect(const QRectF& rect) {prepareGeometryChange(); mOuterRect=rect;};

  // fix width (close right end)
  void fixCore(bool flag=true) { mCoreFixed=flag;};
  bool fixedCore(void) const { return mCoreFixed;};

  // do the geometry (fast setup of outer rectangle)
  virtual void Geometry(void);

  // do the layout (set up paths, figure outer, core, extra)
  virtual void Layout(void) { FD_DX("LAYOUT ERROR"); };

  // do a complete configuration (inludes layout and update)
  virtual void Configure(void);

  // get geometrie (call Layout before)
  const QRectF& CoreRect()  { return mCoreRect; };
  const QRectF& ExtraRect() { return mExtraRect; };
  const QRectF& OuterRect() { return mOuterRect; };

  // re-implement QGraphicsItem
  virtual QRectF boundingRect(void) const { return mOuterRect;};
  virtual void paint(QPainter*, const QStyleOptionGraphicsItem* ,QWidget*);
  enum { Type = UserType+1};
  virtual int type(void) const { return Type;};


protected:

  // user data
  QString mLabel;
  qreal mLabelWidth;

  // position
  faudes::Time::Type mATime;
  qreal mAScale;
 
  // base geometry
  qreal mTime;
  qreal mLeftTime;
  qreal mRightTime;
  bool mCoreFixed;
  
  // overall gemetry
  QRectF mCoreRect;
  QRectF mExtraRect;
  QRectF mOuterRect;

  // content data
  QVector<QPainterPath> mPaths;
  QVector<QBrush> mBrushs;
  QVector<QPen> mPens;

};

// construct 
SimItem::SimItem(QGraphicsItem* parent) : 
  QGraphicsItem(parent) , 
  mATime(0), mAScale(1), 
  mTime(0), mLeftTime(0), mRightTime(0), 
  mCoreFixed(false) 
{
  // on top
  setZValue(-5);

  // item flags
  setFlag(QGraphicsItem::ItemIsMovable, false);
  setFlag(QGraphicsItem::ItemIsSelectable, false);
  setFlag(QGraphicsItem::ItemClipsToShape, false);
  setAcceptDrops(false);
  //setAcceptedMouseButtons(Qt::NoButton);

  // user data
  mLabel="";
  mTime =0;
  mLeftTime =0;
  mRightTime =0;
  mATime=0;
  mAScale=1;
  mCoreFixed=false;

  // empty geometry
  mCoreRect=QRectF(-2,-2,2,2);
  mExtraRect=QRectF(-2,-2,2,2);
  mOuterRect=QRectF(-2,-2,2,2);
}

// destruct 
SimItem::~SimItem(void) {
}


// paint myself
void SimItem::paint(
  QPainter *painter, 
  const QStyleOptionGraphicsItem *option,
  QWidget *widget) {
  FD_DX("SimItem::paint(): type " << type()-UserType << " at x " << scenePos().x());
  (void) option;
  (void) widget;
  // do the layout
  Layout();
  // do draw
  for(int i=0;;i++) {
    if(i>=mPaths.size()) break;
    if(i>=mPens.size()) break;
    if(i>=mBrushs.size()) break;
    painter->setPen(mPens[i]);
    painter->setBrush(mBrushs[i]);
    painter->drawPath(mPaths[i]);
  }
  // free mem
  mPaths.clear();
  mBrushs.clear();
  mPens.clear();
}

// configure: set up all and upate
void SimItem::Configure(void) {
  FD_DX("SimItem::Configure(): " << type()-UserType);
  // warn
  prepareGeometryChange();
  // doit (includes geoemtry)
  Layout();
  // schedule draw
  update();
  //FD_DX("SimItem::Configure(): ok");
}

// geomety: fast update of outer rect (defaults to layout)
void SimItem::Geometry(void) {
  //FD_DX("SimItem::Geometry(): " << type()-UserType);
  // warn
  prepareGeometryChange();
  // default: 
  Layout();
}

/*
 ********************************
 ********************************
 ********************************
  
 graphics item to represent event

 ********************************
 ********************************
 ********************************
 */

// class definition
class SimEvent : public SimItem  {

public:
  // construct/destruct
  SimEvent(QGraphicsItem* parent);
  virtual ~SimEvent(void);

  // my rtti
  enum { Type = UserType+2};
  virtual int type(void) const { return Type;};

  // get core rect before Layout()
  const QRectF& CoreRect();

  // graphical configuration
  void Layout(void);
  void Geometry(void);

protected:


};

// construct 
SimEvent::SimEvent(QGraphicsItem* parent) : SimItem(parent) {
}

// destruct 
SimEvent::~SimEvent(void) {
}

// get core rect
const QRectF& SimEvent::CoreRect() {
  QRectF trect;
  VioStyle::TextCP(trect,QPointF(0,0),mLabel); 
  qreal cheight=30; // style this !!
  qreal cwidth=trect.width()+20; // style this !!!
  mCoreRect=QRectF(-cwidth/2.0, -cheight/2.0, cwidth, cheight);
  return mCoreRect;
}  


// set outer rect
void SimEvent::Geometry(void) { 
  //FD_DX("SimEvent::Geometry()" << mTime);
  // warn
  prepareGeometryChange();
  // figure
  qreal cheight=30;   // style !!!
  qreal cwidth=mLabelWidth+20;
  qreal right = qMax<qreal>(cwidth/2.0,mRightTime);
  qreal left = qMin<qreal>(-cwidth/2.0,mLeftTime);
  mOuterRect=QRectF(left, -cheight/2.0, right-left, cheight);
  mOuterRect.adjust(-2,-2,2,2); 
}

// set text
void SimEvent::Layout(void) {
  // clear
  mPaths.clear();
  mBrushs.clear();
  mPens.clear();
  // label path
  QPainterPath tpath=QPainterPath();
  VioStyle::TextCP(tpath,QPointF(0,0),mLabel); 
  QRectF trect;
  VioStyle::TextCP(trect,QPointF(0,0),mLabel); 
  // frame path with core rect
  qreal cheight=30;
  qreal cwidth=trect.width()+20;
  QPainterPath fpath=QPainterPath();
  fpath.moveTo(QPointF(-cwidth/2.0 +0,0));
  fpath.lineTo(QPointF(-cwidth/2.0 +5, cheight/2.0));
  fpath.lineTo(QPointF(+cwidth/2.0 -5, cheight/2.0));
  fpath.lineTo(QPointF(+cwidth/2.0 +0, 0));
  fpath.lineTo(QPointF(+cwidth/2.0 -5, -cheight/2.0));
  fpath.lineTo(QPointF(-cwidth/2.0 +5, -cheight/2.0));
  fpath.lineTo(QPointF(-cwidth/2.0 +0,0));
  fpath.closeSubpath();
  // overrules width
  mTime=cwidth/2.0; 
  mRightTime=qMax<qreal>(mTime,mRightTime);
  mLeftTime=qMin<qreal>(-mTime,mLeftTime);
  // bounding rect (core)
  mCoreRect=QRectF(-cwidth/2.0, -cheight/2.0, cwidth, cheight);
  // extra time to right
  if(mRightTime>cwidth/2.0) {
    fpath.moveTo(QPointF(cwidth/2.0,0));
    fpath.lineTo(QPointF(mRightTime,0));
    fpath.closeSubpath();
  }
  // extra time to left
  if(mLeftTime<-cwidth/2.0) {
    fpath.moveTo(QPointF(-cwidth/2.0,0));
    fpath.lineTo(QPointF(mLeftTime,0));
    fpath.closeSubpath();
  }
  // bounding rect (extra)
  mExtraRect=fpath.controlPointRect(); 
  // bounding rect (outer)
  mOuterRect=mExtraRect;
  mOuterRect.adjust(-2,-2,2,2); // todo:style
  // install
  QPen fpen=VioStyle::DefaultPen();
  QBrush tbrush=VioStyle::DefaultBrush();
  mPaths.push_back(tpath);
  mBrushs.push_back(tbrush);
  mPens.push_back(Qt::NoPen);
  mPaths.push_back(fpath);
  mBrushs.push_back(Qt::NoBrush);
  mPens.push_back(fpen);
};


/*
 ********************************
 ********************************
 ********************************
  
 graphics item to represent state

 ********************************
 ********************************
 ********************************
 */

// class definition
class SimState : public SimItem  {

public:
  // construct/destruct
  SimState(QGraphicsItem* parent);
  virtual ~SimState(void);

  // set/get faudes idx
  void setIdx(faudes::Idx idx) { mIdx=idx; };
  faudes::Idx idx(void) const { return mIdx; };

  // my rtti
  enum { Type = UserType+3};
  virtual int type(void) const { return Type;};


  // graphical configuration
  void Layout(void);
  void Geometry(void);

private:
  // user data
  faudes::Idx mIdx;
};

// construct 
SimState::SimState(QGraphicsItem* parent) : SimItem(parent) , mIdx(0) {
  // clip labels
  setFlag(QGraphicsItem::ItemClipsToShape, true);
}

// destruct 
SimState::~SimState(void) {
}

// set outer rect
void SimState::Geometry(void) { 
  // warn
  prepareGeometryChange();
  // figure
  qreal cheight=30;   // style !!!
  qreal cwidth= mTime;
  if(!mCoreFixed) {
    cwidth+=20;   // style !!
    QRectF trect;
    VioStyle::TextLL(trect,QPointF(6,0),mLabel); // style!!
    if(trect.width()>cwidth) cwidth=trect.width();
  }
  mOuterRect=QRectF(0, -cheight/2.0, cwidth, cheight);
  mOuterRect.adjust(-2,-2,2,2); 
}

// set width 
void SimState::Layout(void) { 
  // clear
  mPaths.clear();
  mBrushs.clear();
  mPens.clear();
  // text path
  QPainterPath tpath;
  VioStyle::TextLL(tpath,QPointF(6,0),mLabel); 
  QRectF trect=tpath.controlPointRect();
  // frame path with core rect
  qreal cheight=30;
  qreal cwidth= mTime;
  if(!mCoreFixed) cwidth+=20;
  QPainterPath fpath=QPainterPath();
  if(cwidth>2) {
    fpath.moveTo(QPointF(cwidth-1, +cheight/2.0));
    fpath.lineTo(QPointF(1,        +cheight/2.0));
    fpath.lineTo(QPointF(1,        -cheight/2.0));
    fpath.lineTo(QPointF(cwidth-1, -cheight/2.0));
    if(mCoreFixed) 
      fpath.lineTo(QPointF(cwidth-1, +cheight/2.0));
  }
  //fpath.closeSubpath();
  // bounding rect (core=extra)
  mCoreRect=QRectF(0, -cheight/2.0, cwidth, cheight);
  mExtraRect=mCoreRect;
  // bounding rect (outer)
  mOuterRect = fpath.controlPointRect();
  if(!mCoreFixed) mOuterRect=mOuterRect.united(trect);
  mOuterRect.adjust(-2,-2,2,2); // todo:style
  // install
  QPen fpen =VioStyle::DefaultPen();
  QBrush tbrush=VioStyle::DefaultBrush();
  mPaths.push_back(tpath);
  mBrushs.push_back(tbrush);
  mPens.push_back(Qt::NoPen);
  mPaths.push_back(fpath);
  mBrushs.push_back(Qt::NoBrush);
  mPens.push_back(fpen);
};



/*
 ********************************
 ********************************
 ********************************
  
 graphics item to represent time

 ********************************
 ********************************
 ********************************
 */

// class definition
class SimDuration : public SimItem  {

public:
  // construct/destruct
  SimDuration(QGraphicsItem* parent);
  virtual ~SimDuration(void);

  // set tick time
  void setTick(faudes::Time::Type tick) { if((mTickTime=tick)<=0) mTickTime=1; };

  // set left space for labeld
  void setLeftSpace(qreal time) { mLeftSpace=time; };

  // set step
  void setStep(int step) { mStep=step; };

  // rtti
  enum { Type = UserType+3};
  virtual int type(void) const { return Type;};

  // graphical configuration
  void Layout(void);
  void Geometry(void);

private:

  // user data
  faudes::Time::Type mTickTime;
  qreal mLeftSpace;
  int mStep;

};

// construct 
SimDuration::SimDuration(QGraphicsItem* parent) : 
  SimItem(parent), mTickTime(1), mLeftSpace(100000.0), mStep(-1) 
{
  mLeftTime=-100000.0;
};

// destruct 
SimDuration::~SimDuration(void) {
}

// set outer rect
void SimDuration::Geometry(void) { 
  //FD_DX("SimDuration::Geometry()" << mTime);
  // warn
  prepareGeometryChange();
  // figure
  qreal cheight=50;   // style !!!
  qreal cwidth= qMax<qreal>(mTime,mRightTime);
  qreal cdigits= 10; // style/test/see
  mOuterRect=QRectF(-cdigits, -cheight/2.0, cwidth+cdigits, cheight);
  mOuterRect.adjust(-2,-2,2,2); 
}


// do layout
void SimDuration::Layout(void) { 
  FD_DX("SimDuration::Layout()");
  // clear
  mPaths.clear();
  mBrushs.clear();
  mPens.clear();
  // dont draw negative
  if(mATime<0) return;
  // frame path: base line
  qreal cheight=6;
  qreal cwidth=mTime;
  if(!mCoreFixed) cwidth+=20;
  QPainterPath fpath=QPainterPath();
  if(cwidth>0) {
    fpath.moveTo(QPointF(0,0));
    fpath.lineTo(QPointF(cwidth,0));
    fpath.moveTo(QPointF(0,-cheight/2.0));
    fpath.moveTo(QPointF(0,cheight/2.0));
    if(mCoreFixed) {
      fpath.moveTo(QPointF(cwidth,-cheight/2.0));
      fpath.lineTo(QPointF(cwidth,cheight/2.0));
    }
  }
  // frame path: tix
  int ifirst = qRound( ((qreal) mATime)/((qreal)mTickTime) );
  int ilast  = ifirst;
  if(mTime>0 && mAScale>0) ilast= qRound( (((qreal) mATime)+mTime/mAScale)/((qreal)mTickTime) );
  qreal tfirst = (ifirst*mTickTime - mATime)* mAScale; 
  if(tfirst < mLeftTime) {
    ifirst++;
    tfirst = (ifirst*mTickTime - mATime)* mAScale; 
  }
  for(int i=0; i<=ilast-ifirst; i++) {
    qreal now= tfirst+ i*mTickTime*mAScale;
    fpath.moveTo(QPointF(now,-cheight/2.0));
    fpath.lineTo(QPointF(now,+cheight/2.0));
  }
  // frame path: path duration
  qreal doffset=-10;
  QPainterPath dpath=QPainterPath();
  if(mTime>0) {
    dpath.moveTo(QPointF(0,doffset));
    dpath.lineTo(QPointF(cwidth,doffset));
    dpath.moveTo(QPointF(0,cheight/2.0+doffset));
    dpath.lineTo(QPointF(0,-cheight/2.0+doffset));
    //dpath.addEllipse(-cheight/2,doffset-cheight/2,cheight,cheight);
    if(mCoreFixed) {
      dpath.moveTo(QPointF(cwidth, cheight/2.0+doffset));
      dpath.lineTo(QPointF(cwidth,-cheight/2.0+doffset));
     //dpath.addEllipse(cwidth-cheight/2,doffset-cheight/2,cheight,cheight);
    }
  }
  // bounding rect (core)
  mCoreRect=fpath.controlPointRect();
  mCoreRect=mCoreRect.united(dpath.controlPointRect());
  // overrules extra width
  mRightTime=qMax<qreal>(mTime,mRightTime);
  // extra time to right
  if(mRightTime>cwidth) {
    fpath.moveTo(QPointF(cwidth,0));
    fpath.lineTo(QPointF(mRightTime,0));
  }
  // text path: duration
  QRectF trect=QRectF(0,0,0,0);
  QPainterPath tdpath;
  if(mTime>0 && mAScale>0) { 
    VioStyle::TextCP(tdpath,QPointF(mTime/2,doffset-cheight/2 -5),QString("%1").arg(mTime/mAScale)); 
    trect= trect.united(tdpath.controlPointRect());
  }
  // text path: time lower bound
  QPainterPath tlbpath;
  VioStyle::TextCP(tlbpath,QPointF(0,cheight/2+7),QString("%1").arg(mATime)); 
  QRectF tlbrect=tlbpath.controlPointRect();
  if(tlbrect.left() > mLeftSpace + 10) { // style
    trect= trect.united(tlbrect);
  } else {
    tlbpath = QPainterPath();
  }
  // text path: time upper bound
  QPainterPath tubpath;
  if(mCoreFixed && mTime>0 && mAScale>0) {
    VioStyle::TextCP(tubpath,QPointF(mTime,cheight/2+7),QString("%1").arg(mATime+mTime/mAScale)); 
    QRectF tubrect= tubpath.controlPointRect();
    if(mTime -20 > tubrect.width() ) {
      trect= trect.united(tubrect);
    } else {
      tubpath = QPainterPath();
    }
  }
  // text path: step
  QPainterPath sbpath;
  if(mStep>=0) {
    VioStyle::TextCP(sbpath,QPointF(mRightTime,cheight/2+21),QString("%1").arg(mStep)); 
    QRectF sbrect=sbpath.controlPointRect();
    trect= trect.united(sbrect);
  }
  // bounding rect (extra)
  mExtraRect = trect.united(mCoreRect);
  mOuterRect = mExtraRect.united(fpath.controlPointRect());
  mOuterRect.adjust(-2,-2,2,2); // todo:style

  // install: prepare
  QPen bpen = VioStyle::DefaultPen();
  QPen gpen = VioStyle::DefaultPen();
  QPen fpen = VioStyle::DefaultPen();
  bpen.setBrush(VioStyle::Color(VioBlue));
  gpen.setBrush(VioStyle::Color(VioGreen));
  QBrush bbrush = VioStyle::DefaultBrush();
  QBrush rbrush = VioStyle::DefaultBrush();
  QBrush gbrush = VioStyle::DefaultBrush();
  bbrush.setColor(VioStyle::Color(VioBlue));
  rbrush.setColor(VioStyle::Color(VioRed));
  gbrush.setColor(VioStyle::Color(VioGreen));
  // install: fpath
  mPaths.push_back(fpath);
  mBrushs.push_back(Qt::NoBrush);
  mPens.push_back(bpen);
  // install: dpath
  mPaths.push_back(dpath);
  mBrushs.push_back(gbrush);
  mPens.push_back(gpen);
  // install: lower bound
  mPaths.push_back(tlbpath);
  mBrushs.push_back(bbrush);
  mPens.push_back(Qt::NoPen);
  // install: upper bound
  mPaths.push_back(tubpath);
  mBrushs.push_back(bbrush);
  mPens.push_back(Qt::NoPen);
  // install: step
  mPaths.push_back(sbpath);
  mBrushs.push_back(rbrush);
  mPens.push_back(Qt::NoPen);
  // install: duration
  mPaths.push_back(tdpath);
  mBrushs.push_back(gbrush);
  mPens.push_back(Qt::NoPen);

};


/*
 ********************************
 ********************************
 ********************************
  
 graphics item to represent a sample

 ********************************
 ********************************
 ********************************
 */


// todo: make this a real class 
class SimSample : public QGraphicsItem {

public:
  // construct destruct
  SimSample(SimTrace* trace);
  virtual ~SimSample(void);

  // faudes data 
  faudes::LoggingExecutor::TraceSample mInitialSample; 
  faudes::LoggingExecutor::TraceSample mMergedSample; 
  // sample geometry data
  qreal mPosition;
  qreal mWidth;
  qreal mDurationWidth;
  qreal mExtraEventWidth;
  qreal mExtraDurationWidth;
  // previous sample geometry data
  bool mHasPrevious;
  qreal mPreviousPosition;
  qreal mPreviousExtraEventWidth;
  qreal mPreviousExtraDurationWidth;
  // relevant items
  SimEvent*   mSimEvent;
  SimDuration* mSimDuration;
  QVector<SimState*> mRecentSimStates;
  QVector<SimState*> mSimStates;

  // configure: stage a: state and position, set initial sample
  void GeometryA(const faudes::LoggingExecutor::TraceSample& fsample);

  // configure: stage a items: states
  void InstallItemsA(void);

  // configure: stage b: duration incl state extension, optional event
  bool GeometryB(const faudes::LoggingExecutor::TraceSample& fsample);

  // configure: stage b items: time and event
  void InstallItemsB(void);

  // configure: best guess of my outline
  void GeometryX(void);
  
  // configure: layout for painting
  void LayoutP(void);

  // query geometry
  const QRectF& CoreRect()   const  { return mCoreRect; };
  const QRectF& OuterRect()   const { return mOuterRect; };

  // query fsteps and ftime
  int  FirstStep(void) const {return mInitialSample.mStep;};
  int  LastStep(void)  const {return mMergedSample.mStep;};
  faudes::Time::Type Time(void)      const {return mInitialSample.mTime;};
  faudes::Time::Type Duration(void)  const {
    return mMergedSample.mDuration + (mMergedSample.mTime - mInitialSample.mTime);}


protected:

  // item geometry
  QRectF mCoreRect;
  QRectF mOuterRect;
  qreal mTimeScale;
  faudes::Time::Type mTickTime;
  SimTrace* pTrace;


  // re-implement QGraphicsItem
  virtual QRectF boundingRect(void) const { return mOuterRect;};
  virtual void paint(QPainter*, const QStyleOptionGraphicsItem* ,QWidget*);
  enum { Type = UserType+10};
  virtual int type(void) const { return Type;};
};

// construct
SimSample::SimSample(SimTrace* trace) {
  // record sematic parent
  pTrace=trace;
  // faudes
  mInitialSample.mStep=0;
  mInitialSample.mTime=0;
  mInitialSample.mEvent=0; 
  mInitialSample.mDuration=0;
  mMergedSample.mStep=0;
  mMergedSample.mTime=0;
  mMergedSample.mEvent=0; 
  mMergedSample.mDuration=0;
  // geometry
  mTimeScale=10;
  mTickTime=1;
  mPosition=0;
  mWidth=0;
  mDurationWidth=0;
  mExtraEventWidth=0;
  mExtraDurationWidth=0;
  mPreviousPosition=0;
  mPreviousExtraEventWidth=0;
  mPreviousExtraDurationWidth=0;
  mHasPrevious=false;
  // pointer
  mSimEvent=0;
  mSimDuration=0;
  // on bottom
  setZValue(-10);
};

//destruct;
SimSample::~SimSample(void) {
  FD_DX("SimSample::~SimSample(): step " << mInitialSample.mStep);
}

// set up geometry: outline, best guess
void SimSample::GeometryX(void) {

  prepareGeometryChange();


  int dim = pTrace->TraceComponents().size();

  qreal ylen   = 45 + dim*35;        //style !!
  qreal yextra = 25;                 //style !!
  
  qreal xmax = mWidth;
  if(mExtraEventWidth>xmax)    xmax=mExtraEventWidth;
  if(mExtraDurationWidth>xmax) xmax=mExtraDurationWidth;

  mCoreRect=QRectF(0, -yextra, xmax ,ylen+2*yextra);
  mOuterRect=mCoreRect.adjusted(-50,-10,50,10);

  //if(mSimEvent) mSimEvent->setOuterRect(mOuterRect.translated(-mSimEvent->pos()));
  //if(mSimDuration) mSimDuration->setOuterRect(mOuterRect.translated(-mSimDuration->pos()));
}



// set up geometry: stage a, from left to right only
void SimSample::GeometryA(
  const faudes::LoggingExecutor::TraceSample& fsample) 
{
  //FD_DX("SimSample::GeometryA(): for sample at " << fsample.mStep);
  // record faudes data, but dont accept the event jet
  mInitialSample = fsample;
  mInitialSample.mEvent=0;
  mMergedSample = mInitialSample;
  // get previous sample
  SimSample* psample=pTrace->CurrentSample(); 
#ifdef FAUDES_DEBUG_SIMULATOR
  if(psample) if((faudes::Idx) psample->LastStep() != fsample.mStep-1) { 
    FD_DX("SimSample::GeometryA(): sample mismatch");
  }; 
#endif
  // figure geometry
  mTimeScale=pTrace->mTimeScale;
  mTickTime=pTrace->mTickTime;
  mPosition=0;
  mWidth=0;
  if(psample) { 
    mHasPrevious=true;
    mPosition = psample->mPosition + psample->mWidth;
    mPreviousPosition= psample->mPosition;
    mPreviousExtraDurationWidth= psample->mExtraDurationWidth;
    mPreviousExtraEventWidth= psample->mExtraEventWidth;
  }
  // position myself
  setPos(mPosition,0);
  // position my items 
  if(mSimDuration!=0) {
    mSimDuration->setPos(mPosition, 45 + mSimStates.size()*35); // style
  }
  if(mSimEvent!=0) {
    mSimEvent->setPos(mPosition+mWidth,0); 
  }
  for(int i=0; i< mSimStates.size(); i++) {
   SimState* sstate = mSimStates[i];
   if(sstate!=0)
     sstate->setPos(mPosition, 35 + i*35); // style this
  }
}


// install items: from left to right only
void SimSample::InstallItemsA(void) {
  //FD_DX("SimSample::InstallItemsA(): step " << mInitialSample.mStep);
  // get previous sample
  SimSample* psample=pTrace->CurrentSample(); 
#ifdef FAUDES_DEBUG_SIMULATOR
  if(psample) if(psample->LastStep() != FirstStep()-1) { 
    FD_DX("SimSample::InstallItemsA(): sample mismatch");
  }; 
#endif
  // set recent state references: copy
  int dim = pTrace->TraceComponents().size();
  mRecentSimStates.clear();
  while(mRecentSimStates.size()< dim) mRecentSimStates.append(0);
  if(psample) mRecentSimStates = psample->mRecentSimStates;
  // my own sim states: clear (invalidates refs of future steps!!!)
  foreach(SimState* ss,mSimStates) 
    if(ss) { ss->setParentItem(0); delete ss;};
  mSimStates.clear();
  while(mSimStates.size()< dim) mSimStates.append(0);

  // states construct new or extend old
  for(int i=0; i< dim; i++) {
    // component number
    int j = pTrace->TraceComponents().at(i);
    // get current state
    SimState* cstate = mRecentSimStates[i];
    // grow duration
    if(cstate) { 
      //FD_DX("SimTrace::RecordSample(" << this << "): extending state for gen " << i);
      cstate->setTime(mPosition - cstate->scenePos().x());
      cstate->Geometry();
    }
    // no state change
    if(cstate) if(cstate->idx() == mInitialSample.mState.State[j]) {
      if(cstate->fixedCore()) {
        cstate->fixCore(false);
        cstate->Geometry();
      }
      continue;
    }
    // state changed: close recent state
    if(cstate) { 
      cstate->fixCore();
      cstate->Geometry();
    }
    // state changed: create new state
    SimState* sstate = new SimState(0);
    sstate->setQLabel(VioStyle::DispStateName(&pTrace->Executor()->At(j).Generator(), 
       mInitialSample.mState.State[j]));
    sstate->setIdx(mInitialSample.mState.State[j]);
    sstate->setPos(0, 35 + i*35); // style this
    // state changed: add to scene and record
    sstate->setParentItem(this);
    mSimStates[i]=sstate;
    mRecentSimStates[i]=sstate;
    //FD_DX("SimTrace::InstallItemsA(" << this << "): added state for gen " << i);
  }
}


// set up geometry: stage b (must have past stage a) 
// returns false on reject
bool SimSample::GeometryB(const faudes::LoggingExecutor::TraceSample& fsample) 
{
  //FD_DX("SimSample::GeometryB(): step " << mInitialSample.mStep << " at " << mPosition);
  // ignore if we are fine
  if(fsample.mEvent!=0 && mMergedSample.mEvent==fsample.mEvent) return true;
  // reject if we allready did accept an event
  if(mMergedSample.mEvent!=0) return false;  
  // update duration
  mMergedSample.mStep= fsample.mStep;
  mMergedSample.mTime= fsample.mTime;
  mMergedSample.mDuration= fsample.mDuration;
  // accept event
  if(pTrace->TraceEvents().Exists(fsample.mEvent)) 
    mMergedSample.mEvent=fsample.mEvent;
  // figure geometry: duration
  mDurationWidth=mTimeScale * Duration();
  mWidth=mDurationWidth;
  mExtraDurationWidth=mDurationWidth;
  mExtraEventWidth=mDurationWidth;
  // figure geometry: duration: sense left most and extend
  if(mMergedSample.mEvent!=0 && mMergedSample.mDuration < 10 && mPosition==0) {
    mWidth=mTimeScale*10;
  }
  // figure geometry: event extra width and extension
  if(mMergedSample.mEvent!=0) {
    // have half label width
    qreal lwidth=pTrace->mEventLabelWidth[mMergedSample.mEvent];
    // test for overlap
    if(mHasPrevious) {
      qreal overlap= 
        mPreviousPosition + mPreviousExtraEventWidth 
        - (mPosition+mDurationWidth - lwidth);
      if(mDurationWidth+overlap > mWidth) {
        mWidth = mDurationWidth+overlap;
      }
    }
    // record my extra event width
    mExtraEventWidth=mWidth+lwidth;
  } 
  // figure geometry: duration label extra width
  // text path: lower bound
  QRectF tlbrect;
  VioStyle::TextCP(tlbrect,QPointF(0,0),QString("%1").arg(mMergedSample.mTime)); 
  QRectF trect= tlbrect;
  // text path: upper bound
  QRectF tubrect;
  VioStyle::TextCP(tubrect,QPointF(mDurationWidth,0),QString("%1").arg(mMergedSample.mTime+mMergedSample.mDuration));
  if(mDurationWidth -20 > tubrect.width() ) {
    trect= trect.united(tubrect);
  } 
  // record
  mExtraDurationWidth = trect.right();
  // extend states
  for(int i=0; i< mRecentSimStates.size(); i++) {
    // get current state
    SimState* cstate = mRecentSimStates[i];
    // grow duration
    if(cstate) { 
      cstate->setTime(mPosition+mWidth - cstate->scenePos().x());
      cstate->Geometry();
    }
  }
  // position my items 
  if(mSimEvent!=0) {
    mSimEvent->setPos(mWidth,0); 
  }
  return true;
}


// install items B
void SimSample::InstallItemsB(void) {
  //FD_DX("SimSample::InstallItemsB(): step " << mInitialSample.mStep);
  // introduce duration
  if(!mSimDuration) mSimDuration= new SimDuration(0);
  int dim = pTrace->TraceComponents().size();
  mSimDuration->setPos(0,45 + dim*35); // style
  mSimDuration->setTime(mDurationWidth);
  mSimDuration->setAScale(mTimeScale);
  mSimDuration->setATime(mInitialSample.mTime);
  mSimDuration->setTick(mTickTime);
  if(mHasPrevious) {
    mSimDuration->setLeftSpace(mPreviousExtraDurationWidth + mPreviousPosition -mPosition);
  }
  mSimDuration->fixCore(mDurationWidth>0);
  mSimDuration->setRightTime(mWidth);
  if(mMergedSample.mEvent!=0) mSimDuration->setStep(LastStep());
  mSimDuration->Geometry();
  mSimDuration->setParentItem(this);
  // introduce event
  if(mMergedSample.mEvent!=0) {  
    if(!mSimEvent) mSimEvent =  new SimEvent(0);
    mSimEvent->setLabel(pTrace->Executor()->EventName(mMergedSample.mEvent));
    mSimEvent->setLabelWidth(pTrace->mEventLabelWidth[mMergedSample.mEvent]);
    mSimEvent->setPos(mWidth,0); 
    if(mHasPrevious) {
      mSimEvent->setLeftTime( (mPreviousPosition + mPreviousExtraEventWidth) -
          (mPosition + mWidth) );
    }
    mSimEvent->Geometry();
    mSimEvent->setParentItem(this);
  }
}



// set up geometry: get ready for painting
void SimSample::LayoutP(void) {
  FD_DX("SimSample::LayoutP(): step " << mInitialSample.mStep << " at pos " << mPosition << " width " << mWidth);
}


// paint myself
void SimSample::paint(
  QPainter *painter, 
  const QStyleOptionGraphicsItem *option,
  QWidget *widget) {
  FD_DX("SimSample::paint(): step " << mInitialSample.mStep);

  // fix paintings
  LayoutP();

  (void) option;
  (void) widget;
  (void) painter;

  /*
  QRectF labelrect=mCoreRect;
  labelrect.setWidth(mExtraDurationWidth);
  painter->setPen(Qt::yellow);
  painter->drawRect(labelrect);

  painter->setPen(Qt::green);
  painter->drawRect(mCoreRect);
  painter->setPen(Qt::red);
  painter->drawRect(mOuterRect);
  */

}







/*
 ********************************
 ********************************
 ********************************

 implementation of SimTrace

 ********************************
 ********************************
 ********************************
 */

// construct
SimTrace::SimTrace(SimWidget* simwidget) :  WspItem(simwidget) {
  FD_DX("SimTrace::SimTrace(" << simwidget << "): " << this);

  // overwrite wsp item defaults
  mName="Trace";
  mPersistent=false;
  mItemType=ITSimTrace;
  mVisual=true;
  mViewSatelite=true;

  // record simwidget
  pSimWidget = simwidget;

  // may configuration
  mTraceEnabled=false;

  // have my graphics scene incl view
  mScene = new QGraphicsScene(this);
  mScene->setBackgroundBrush(Qt::white);
  // todo: style this parameter
  TimeScale(10);
  // do all reset
  Reset();
}

// destruct
SimTrace::~SimTrace(void) {
  FD_DX("SimTrace::~SimTrace()");
}

// activate trace
void SimTrace::TraceEnable(bool on) {
  FD_DX("SimTrace::TraceEnable(" << on << ")");
  mTraceEnabled=on;
  if(!mTraceEnabled) Reset();
}

// Overload wsp item functins: widgets
QWidget* SimTrace::NewMainWidget(void) {
  SimTraceMainWidget* widget = new SimTraceMainWidget(0);
  widget->Model(this);
  return widget;
}

// Overload wsp item functins: widgets
QWidget* SimTrace::NewSateliteWidget(void) {
  SimTraceSateliteWidget* widget = new SimTraceSateliteWidget(0);
  widget->Model(this);
  return widget;
}

// executor access
const faudes::LoggingExecutor* SimTrace::Executor(void) const { 
  return pSimWidget->Executor();
};

// sim control access
const QList<QString>& SimTrace::EventNames(void) const { 
  return pSimWidget->EventNames(); 
};

// sim control access
const QList<QString>& SimTrace::ComponentNames(void) const { 
  return pSimWidget->ComponentNames(); 
};



// clear
void SimTrace::Clear(void) {
  FD_DX("SimTrace::Clear(" << this << "): A: items " << mScene->items().size());
  // clear scene (deletes items)
  mScene->clear();
  // clear my trace
  mTrace.clear();
  mTimeToMaxStep.clear();
  FD_DX("SimTrace::Clear(" << this << "): B: items " << mScene->items().size());
  // clear my scene
  /*
  foreach(QGraphicsItem* gitem, mScene->items()) {
    delete gitem;
  }
  */
  FD_DX("SimTrace::Clear(" << this << "): C: items " << mScene->items().size());
  // compiled data: labels
  mEventLabelWidth.clear();
  SimEvent* sevent = new SimEvent(0);
  faudes::EventSet::Iterator eit=Executor()->Alphabet().Begin();
  for(;eit!=Executor()->Alphabet().End();eit++) {
    FD_DX("SimTrace::Clear(" << this << "): compile label:" << Executor()->EventName(*eit));
    sevent->setLabel(Executor()->EventName(*eit));
    mEventLabelWidth[*eit]=sevent->CoreRect().right();
  }
  delete sevent;
  // compiled data: digits
  QRectF rect1, rect2;
  VioStyle::TextLL(rect1,QPoint(0,0),"8123458");
  VioStyle::TextLL(rect2,QPoint(0,0),"88");
  mDigitWidth=(rect1.width()-rect2.width())/5;
  // update mute
  UpdateTraceRestriction();
  // scene size
  mScene->setSceneRect(OuterRect());
  // notify dependants (ie main widget and control satelite)
  emit NotifyClear();
  // scroll
  emit RequestScrollEnd();
  // done
  FD_DX("SimTrace::Clear(" << this << "): done");
}


// Reset
void SimTrace::Reset(void) {
  Clear();
  // get current sample only
  const faudes::LoggingExecutor::TraceSample* fsample = Executor()->TraceCurrent();
  if(fsample) AppendSample(*fsample);
  else { FD_DX("SimTrace::Clear(" << this << "): could not get current trace from executor");};
  // get first sample and update all trace buffer
  /*
  if(Executor()->TraceBegin()!=Executor()->TraceEnd()) {
    AppendSample(*Executor()->TraceBegin());
    UpdateExtend();
  }
  */
  // scroll
  emit RequestScrollEnd();
}

// query mute events
const QSet<QString>& SimTrace::MuteEvents(void) const {
  return mMuteEvents;
}

// query mute components
const QSet<QString>& SimTrace::MuteComponets(void) const {
  return mMuteComponents;
}

// query mute 
bool SimTrace::MuteEvent(QString event) const {
  return mMuteEvents.contains(event);
}

// query mute 
bool SimTrace::MuteComponent(QString component) const {
  return mMuteComponents.contains(component);
}

// mute on/off
void SimTrace::MuteEvent(QString event, bool on) {
  // turn on
  if(on) {
    if(mMuteEvents.contains(event)) return;
    mMuteEvents.insert(event);
    Reset();
    return;
  }
  // turn off
  if(mMuteEvents.contains(event)) {
    mMuteEvents.remove(event);
    Reset();
  } 
}

// mute on/off
void SimTrace::MuteComponent(QString event, bool on) {
  // turn on
  if(on) {
    if(mMuteComponents.contains(event)) return;
    mMuteComponents.insert(event);
    Reset();
    return;
  }
  // turn off
  if(mMuteComponents.contains(event)) {
    mMuteComponents.remove(event);
    Reset();
  } 
}

// convert gui version to internal rep
void SimTrace::UpdateTraceRestriction(void) {
  FD_DX("SimTrace::UpdateTraceRestriction()");
  mTraceEvents.Clear();
  mTraceComponents.clear();
  /*
  for(unsigned int i=0; i<Executor()->Size(); i++) {
    QString comp = pSimWidget->ComponentName(i);
    if(MuteComponent(comp)) continue;
    if(comp.isEmpty()) continue;
    mTraceEvents.InsertSet(*pSimWidget->ComponentAlphabet(i));
  }
  */
  FD_DX("SimTrace::UpdateTraceEvent(): A: #" << mTraceEvents.Size());
  faudes::EventSet::Iterator eit=Executor()->Alphabet().Begin();
  faudes::EventSet::Iterator eit_end=Executor()->Alphabet().End();
  for(;eit!=eit_end;eit++) {
    QString event=VioStyle::QStrFromStr(Executor()->Alphabet().SymbolicName(*eit));
    if(MuteEvent(event)) continue;
    mTraceEvents.Insert(*eit);
  }
  FD_DX("SimTrace::UpdateTraceEvent(): B: #" << mTraceEvents.Size());
  for(unsigned int i=0; i<Executor()->Size(); i++) {
    QString comp = pSimWidget->ComponentName(i);
    if(MuteComponent(comp)) continue;
    if(comp.isEmpty()) continue;
    mTraceComponents.push_back(i);
  }
}


// query range
int  SimTrace::BeginStep(void) {
  if(mTrace.isEmpty()) return 0;
  return mTrace.front()->mInitialSample.mStep;
}
  
// query range
int  SimTrace::EndStep(void) {
  if(mTrace.isEmpty()) return 0;
  return mTrace.back()->mMergedSample.mStep + 1;
}
  
// query range
faudes::Time::Type SimTrace::BeginTime(void) {
  if(mTrace.isEmpty()) return 0;
  return mTrace.front()->mInitialSample.mTime;
}
  
// query range
faudes::Time::Type SimTrace::EndTime(void) {
  if(mTrace.isEmpty()) return 0;
  return mTrace.back()->mInitialSample.mTime + mTrace.back()->mMergedSample.mDuration;
}
  
// scene rect
QRectF SimTrace::OuterRect(void) {
  if(mTrace.size()==0) {
    return QRect(0,0,100,100);
  }
  QRectF r1 = mTrace.first()->OuterRect();
  r1.moveTo(mTrace.first()->pos());
  QRectF r2 = mTrace.last()->OuterRect();
  r2.moveTo(mTrace.last()->pos());
  QRectF res = r1.united(r2);
  res.adjust(-30,0,30,0);
  FD_DX("SimTrace::OuterRect() w " << res.width());
  return res;
}


// retrieve sample by step
SimSample*  SimTrace::SampleAtStep(int step) {
  FD_DX("SimTrace::SampleAtStep(" << step <<")");
  if(mTrace.size()==0) {
    FD_DX("SimTrace::SampleAtStep(" << step <<"): empty");
    return 0;
  }
  // out of range
  if(step < mTrace.first()->FirstStep() || step>mTrace.last()->LastStep()) {
    FD_DX("SimTrace::SampleAtStep(" << step <<"): out of range");
    return 0;
  }
  // interval search of sorted list
  int mini = 0;
  int maxi = mTrace.size()-1;
  int midi = 0;
  while(1) {
    FD_DX("SimTrace::SampleAtStep(" << step <<"): " << mini << " ... " << maxi);
    // midle
    midi = (mini+maxi)/2;
    // found
    if(mTrace.at(midi)->FirstStep() <= step)
    if(mTrace.at(midi)->LastStep() >= step)
      break;
    // select half
    if(step < mTrace.at(midi)->FirstStep()) 
      maxi=midi-1;
    else
      mini=midi+1;
    // error
    if(mini>=maxi) {
      FD_DX("SimTrace::SampleAtStep(" << step <<"): inconsitent");
      break;
    }
  }
  // validate
  SimSample* ssample=0;
  if(midi>=0 && midi<mTrace.size())
    ssample=mTrace.at(midi);
#ifdef FAUDES_DEBUG_SIMULATOR
  if(ssample) {
    FD_DX("SimTrace::SampleAtStep(" << step <<"): " << midi << "["
	  << ssample->FirstStep() << "," << ssample->LastStep() << "]");
  }
#endif
  if(ssample)
  if(ssample->FirstStep() <= step)
  if(ssample->LastStep() >= step)
    return ssample;
  return 0;
}


// retrieve last sample
SimSample*  SimTrace::CurrentSample() {
  if(mTrace.size()==0) return 0;
  return mTrace.back();
}


// retrieve position of sample (right most) {
qreal SimTrace::StepToPosition(int step) {
  FD_DX("SimTrace::StepToPosition(" << step <<")");
  qreal res = 0;
  // nominal case
  SimSample* ssample = SampleAtStep(step);
  // laset resolt
  if(!ssample) 
  if(!mTrace.isEmpty())
    ssample = mTrace.back();
  // interpret
  if(ssample)
    res= ssample->mPosition+ssample->mWidth;
  FD_DX("SimTrace::StepToPosition(" << step <<"): " << res);
  return res;
}

// retrieve step from time (right most) {
int SimTrace::TimeToStep(faudes::Time::Type time) {
  // trivial case
  if(mTimeToMaxStep.isEmpty()) return EndStep()-1;
  // query inverse mapping
  QMap<faudes::Time::Type,int>::const_iterator sit=mTimeToMaxStep.upperBound(time);
  // out of range
  if(sit==mTimeToMaxStep.begin()) return 0;
  // get right most
  sit--;
  return sit.value();
}


// append one faudes sample (internal method)
void SimTrace::AppendSample(const faudes::LoggingExecutor::TraceSample& fsample) {
  int step = (faudes::Idx) fsample.mStep;
  // check data
  FD_DX("SimTrace::AppendSample(): step " << step);
  if(fsample.mDuration < 0 ) {
    FD_DX("SimTrace::AppendSample(): negative duration");
    return;
  }
  if(fsample.mState.State.size() != Executor()->Size()) {
    FD_DX("SimTrace::AppendSample(): invalid dimension");
    return;
  }
  if(fsample.mState.State.size() == 0) {
    FD_DX("SimTrace::AppendSample(): invalid dimension 0");
    return;
  }
  if(mTrace.size()>0) if(mTrace.back()->LastStep()+1!=step &&  mTrace.back()->LastStep()!=step ) {
    FD_DX("SimTrace::AppendSample(" << this << "): out of order " << step);
    Reset();
  }
#ifdef FAUDES_DEBUG_SIMULATOR
  Executor()->TraceWrite(fsample);
#endif

  // record: try to extend current sample
  bool done = false;
  SimSample* psample=CurrentSample();
  if(psample) {
    // configure geometry, part B
    if(psample->GeometryB(fsample)) {
      // configure geometry, outer rect
      psample->GeometryX();
      // install, part B
      psample->InstallItemsB();
      done=true;
      FD_DX("SimTrace::AppendSample(" << this << "): extension for step " << step);
    }
  }

  // record: need to create new
  if(!done) {
    FD_DX("SimTrace::AppendSample(" << this << "): create for step " << step);
    psample = new SimSample(this);
    // configure geometry, part A
    psample->GeometryA(fsample);
    // install items, part A
    psample->InstallItemsA();
    // add simsample to scene 
    mScene->addItem(psample);
    mTrace.push_back(psample); 
    // configure geometry, part B
    psample->GeometryB(fsample);
    // configure simsample,  outer rect 
    psample->GeometryX();
    // install items, part B
    psample->InstallItemsB();
    // ok
    done=true;
  }

  // keep reverse map
  if(psample) 
     mTimeToMaxStep.insert(psample->mInitialSample.mTime+psample->mMergedSample.mDuration,psample->mMergedSample.mStep);

}

// extend by samples
void SimTrace::UpdateExtend(const std::deque<faudes::LoggingExecutor::TraceSample>& ftrace) {
  if(!mTraceEnabled) return;
  FD_DX("SimTrace::UpdateExtend():  at " << EndStep()-1 << " que #" << ftrace.size());
  std::deque<faudes::LoggingExecutor::TraceSample>::const_iterator fit = ftrace.begin();
  std::deque<faudes::LoggingExecutor::TraceSample>::const_iterator fit_end = ftrace.end();
  for(;fit!=fit_end;fit++) {
    const faudes::LoggingExecutor::TraceSample& fsample = *fit;
    FD_DX("SimTrace::UpdateExtend():  step " << fsample.mStep  << " duration " << fsample.mDuration);
    if(((int) fsample.mStep) < EndStep()-1)  continue; // ignore past samples
    if(((int) fsample.mStep) > EndStep()-1+1) break; // todo: clear and go on?
    AppendSample(fsample);
  }
  mScene->setSceneRect(OuterRect());
  FD_DX("SimTrace::UpdateExtend():  emit scroll request");
  emit RequestScrollEnd();
  FD_DX("SimTrace::UpdateExtend():  done");
};

// extend samples up to current
void SimTrace::UpdateExtend(void) {
  if(!mTraceEnabled) return;
  FD_DX("SimTrace::UpdateExtend():  trace last " << EndStep()-1);
  FD_DX("SimTrace::UpdateExtend():  exec current " << Executor()->CurrentStep());
  // simple case: current sample only
  if(EndStep()-1==Executor()->CurrentStep()) {
    // retrieve
    const faudes::LoggingExecutor::TraceSample* fsample 
      = Executor()->TraceCurrent();
    if(fsample) {
      AppendSample(*fsample);
      mScene->setSceneRect(OuterRect());
    }
    emit RequestScrollEnd();
    return;
  }    
  // test whether we can extend
  int todo=EndStep()-1;
  if(!Executor()->TraceAtStep(todo)) {
    FD_DX("SimTrace::UpdateExtend(): cannot retrieve begin " << todo);
    Clear();
    todo=0;
    if(Executor()->TraceLength()>0)
      todo= Executor()->TraceBegin()->mStep;
  }
  // extend to match
  emit TextMessage("updating trace",0);
  while(todo<=Executor()->CurrentStep()) {
    // retrieve
    const faudes::LoggingExecutor::TraceSample* fsample 
      = Executor()->TraceAtStep(todo);  
    if(!fsample) {
      FD_DX("SimTrace::UpdateExtend(): cannot retrieve step " << todo);
      return;
    }
    // do append it (or update last)
    AppendSample(*fsample);
    // increment
    todo++;
    // be nice
    //QApplication::processEvents(QEventLoop::ExcludeUserInputEvents);
  }
  mScene->setSceneRect(OuterRect());
  // fix view
  emit RequestScrollEnd();
}

// discard samples
void SimTrace::UpdateTruncate(void) {
  if(!mTraceEnabled) return;
  int step = Executor()->CurrentStep();
  FD_DX("SimTrace::DropSamples():  step " << step);
  // get that sample
  SimSample* ssample=SampleAtStep(step);
  // check data
  if(!ssample) {
    FD_DX("SimTrace::UpdateTruncate(): no such sample");
    return;
  }
  // delete all samples after and incl step
  while(1) {
    if(mTrace.size()<=1) break;
    SimSample* nsample=mTrace.back();
    if((int) nsample->LastStep()< step) break;
    FD_DX("SimTrace::DiscardSample(): delete up to step " << nsample->FirstStep());
    // delete myself
    mTrace.pop_back();
    mScene->removeItem(nsample);
    delete nsample;
  }
  // remove items from time map (todo)
  // extend
  UpdateExtend();
  // fix view
  FD_DX("SimTrace::DiscardSample(): request scroll ");
  emit RequestScrollEnd();
 
}


// scale (px per faudes time)
void SimTrace::TimeScale(qreal scale) {
  FD_DX("SimTrace::TimeScale(): Scale: " << scale);

  // set scale
  mTimeScale=scale;
  if(mTimeScale<=1/1000000.0) mTimeScale=1/1000000.0;
  if(mTimeScale>=1000000.0) mTimeScale=1000000.0;

  // set up tick time
  qreal deltapos=20;                     // points per tick
  qreal candidate = deltapos/mTimeScale; // faudes time per tick
  qreal deltatime=1;
  // tens
  for(;deltatime < 1000000.0; deltatime*=10)
    if(deltatime>candidate) break;
  if(deltatime>candidate) 
    for(;deltatime > 1.0/1000000.0; deltatime/=10)
      if(deltatime<candidate) break;
  // fives and twos
  //if(deltatime<candidate) if(deltatime*2 > candidate) deltatime*=2; 
  //if(deltatime<candidate) if(deltatime*5 > candidate) deltatime*=5; 
  // convert to int
  mTickTime= (faudes::Time::Type) deltatime;
  if(mTickTime<=0) mTickTime=1;
  FD_DX("SimTrace::TimeScale(): TickTime " << mTickTime);


  // update geometry
  /*
  for(int idx=0; idx < mTrace.size();idx++) {
    SimSample* ssample=mTrace[idx];
    FD_DX("SimTrace::TimeScale(): scaling step: " << ssample->mInitialSample.mStep);

    // configure geometry, part A
    ssample->GeometryA(ssample->mInitialSample);
    // configure geometry, part B
    ssample->GeometryB(ssample->mInitialSample);
    // configure simsample,  outer rect 
    ssample->GeometryX();

  } // loop all sample
  */
  Clear();
  UpdateExtend();

  // scene size
  mScene->setSceneRect(OuterRect());
}









/*
 ********************************
 ********************************
 ********************************

 implementation of SimTraceMainWidegt

 ********************************
 ********************************
 ********************************
 */

// construct
SimTraceMainWidget::SimTraceMainWidget(QWidget* parent) :  
  QWidget(parent), 
  pTrace(0),
  pScene(0)  
{
  
  FD_DX("SimTraceMainWidget::SimTraceMainWidget()");

  // have a graphics view
  mView = new QGraphicsView(this);
  mView->setRenderHints(QPainter::Antialiasing | QPainter::SmoothPixmapTransform);
  mView->setMinimumWidth(300);
  mView->setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Expanding);
  mView->viewport()->installEventFilter(this);

  // have a layout
  mVbox= new QVBoxLayout(this);
  mVbox->setSpacing(0);
  mVbox->setContentsMargins(0,0,0,0);
  mVbox->addWidget(mView);

  // fix appearance
  setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Expanding);
}

// destruct
SimTraceMainWidget::~SimTraceMainWidget(void) {
  FD_DX("SimTraceMainWidget::~SimTraceMainWidget()");
}


// get model
SimTrace* SimTraceMainWidget::Model(void) {
  return pTrace;
}

// set model
void SimTraceMainWidget::Model(SimTrace* model) {
  // disconnect
  if(pTrace) {
    disconnect(pTrace,SIGNAL(RequestScrollEnd(void)),this,SLOT(ScrollEnd(void)));
    disconnect(pTrace,SIGNAL(RequestScrollTime(faudes::Time::Type time)),this,SLOT(RequestScrollTime(faudes::Time::Type time)));
    disconnect(pTrace,SIGNAL(RequestScrollStep(int step)),this,SLOT(RequestScrollEnd(void)));
    if(!model) pTrace->TraceEnable(false);
  }
  mView->setScene(0);
  pScene=0;
  pTrace=0;
  // connect
  pTrace=model;
  if(pTrace) {
    pTrace->TraceEnable(true);
    pScene=pTrace->Scene();
    mView->setScene(pScene);
    connect(pTrace,SIGNAL(RequestScrollEnd(void)),this,SLOT(ScrollEnd(void)));
    connect(pTrace,SIGNAL(RequestScrollTime(faudes::Time::Type time)),this,SLOT(RequestScrollTime(faudes::Time::Type time)));
    connect(pTrace,SIGNAL(RequestScrollStep(int step)),this,SLOT(RequestScrollEnd(void)));
  }
}
 

// scroll current
void SimTraceMainWidget::ScrollEnd(void) {
  FD_DX("SimTraceMainWidget::ScrollEnd(" << this << ")");
  // ignore while slider down
  if(mView->horizontalScrollBar()->isSliderDown()) return;
  FD_DX("SimTraceMainWidget::ScrollEnd(" << this << "): doit");
  ScrollStep(Model()->EndStep());
  FD_DX("SimTraceMainWidget::ScrollEnd(" << this << "): done");
}


// Scroll
void SimTraceMainWidget::ScrollStep(int step) {
  FD_DX("SimTraceMainWidget::ScrollStep(" << step << ")");
  // bail out
  if(!pTrace) return;
  // find position
  qreal pos=pTrace->StepToPosition(step);
  // build rect
  FD_DX("SimTraceMainWidget::ScrollStep(" << step << "): doit");
  QRectF vrect(pos,-77,10, 35*(pTrace->Executor()->Size()+1) ); // style
  mView->ensureVisible(vrect);
}




// Scroll
void SimTraceMainWidget::ScrollTime(faudes::Time::Type time) {
  FD_DX("SimTraceMainWidget::ScrollTime():" << time );
  // bail out
  if(!pTrace) return;
  // doit
  int step = pTrace->TimeToStep(time);
  ScrollStep(step);
}



// wheel event
void SimTraceMainWidget::wheelEvent(QWheelEvent *event) {
  if(!pTrace) return;
  FD_DX("SimTraceMainWidget::wheelEvent(..) at (" << event->pos().x() << ", " << event->pos().y()
	<< ") with value " << event->angleDelta().y());
  // scale factor
  qreal degree= ((qreal) event->angleDelta().y()) / 8.0; 
  if(degree < -30) degree = -30.0;
  if(degree >  30) degree = 30.0;
  qreal sc = 1.0 + ( 20.0 * degree / 3000.0 ); // 20% steps per 30 degree
  // doit
  (void) sc;
  pTrace->TimeScale(pTrace->TimeScale()*sc);
  // done
  event->accept();
};


// steel wheel events
bool SimTraceMainWidget::eventFilter(QObject *obj, QEvent *ev) {
  //if(obj == mView) 
  if(ev->type() == QEvent::Wheel) {
    QWheelEvent *wevent = static_cast<QWheelEvent*>(ev);
    FD_DX("SimTraceMainWidget::eventFilter(): found wheel event");
    wheelEvent(wevent);
    return true;
  }
  return QWidget::eventFilter(obj,ev);
}

/*
 ********************************
 ********************************
 ********************************

 implementation of SimTraceSateliteWidegt

 ********************************
 ********************************
 ********************************
 */

// construct
SimTraceSateliteWidget::SimTraceSateliteWidget(QWidget* parent) :  
  QWidget(parent), 
  pTrace(0)
{
  
  FD_DX("SimTraceSateliteWidget::SimTraceSateliteWidget()");

  // gui items: enable
  mCheckEnable = new QCheckBox();
  mCheckEnable->setText("Enable Trace");

  // gui items: enable
  mButtonClear = new QPushButton();
  mButtonClear->setText("Clear Trace");

  // gui items: mute 
  mActiveEvents = new QTableWidget();
  mActiveComponents = new QTableWidget();

  // have a layout
  mVbox= new QVBoxLayout(this);
  mVbox->setSpacing(2);
  mVbox->setContentsMargins(0,0,0,0);

  // mute events
  QGroupBox* gbox1=new QGroupBox();
  gbox1->setTitle("Restrict Trace");
  QVBoxLayout* vbox1= new QVBoxLayout(gbox1);
  vbox1->setContentsMargins(2,2,2,2);
  vbox1->setSpacing(2);
  vbox1->addWidget(mActiveEvents);
  vbox1->addWidget(mActiveComponents);
  mVbox->addWidget(gbox1);

  // controls
  QGroupBox* gbox3=new QGroupBox();
  gbox3->setTitle("Controls");
  QVBoxLayout* vbox3= new QVBoxLayout(gbox3);
  vbox3->setContentsMargins(2,2,2,2);
  vbox3->setSpacing(2);
  vbox3->addWidget(mCheckEnable);
  //vbox3->addWidget(mButtonClear);
  mVbox->addWidget(gbox3);

  // fix appearance
  setMinimumWidth(100);
  setSizePolicy(QSizePolicy::Minimum, QSizePolicy::Expanding);


}

// destruct
SimTraceSateliteWidget::~SimTraceSateliteWidget(void) {
  FD_DX("SimTraceSateliteWidget::~SimTraceSateliteWidget()");
}


// get model
SimTrace* SimTraceSateliteWidget::Model(void) {
  return pTrace;
}

// set model
void SimTraceSateliteWidget::Model(SimTrace* model) {
  FD_DX("SimTraceSateliteWidget::Model(" << model << ")");
  // disconnect
  if(pTrace) {
    disconnect(pTrace,SIGNAL(NotifyClear(void)),this,SLOT(Update(void)));
  }
  pTrace=0;
  // connect
  pTrace=model;
  if(pTrace) {
    Update();
    connect(pTrace,SIGNAL(NotifyClear(void)),this,SLOT(Update(void)));
  }
}
 
// update from model
void SimTraceSateliteWidget::Update(void) {
  FD_DX("SimTraceSateliteWidget::Update()");
  // bail out
  if(!pTrace) return;
  // events: prepare table
  FD_DX("SimTraceSateliteWidget::Update(): event names #" 
     << pTrace->EventNames().size());
  mActiveEvents->disconnect();
  while(mActiveEvents->rowCount()>0) mActiveEvents->removeRow(0);
  mActiveEvents->setRowCount(pTrace->EventNames().size());
  mActiveEvents->setColumnCount(1);
  mActiveEvents->setShowGrid(false);         
  mActiveEvents->setHorizontalScrollBarPolicy(Qt::ScrollBarAlwaysOff);
  mActiveEvents->setSelectionBehavior(QAbstractItemView::SelectRows);
  mActiveEvents->setSelectionMode(QAbstractItemView::SingleSelection);
  mActiveEvents->horizontalHeader()->setStretchLastSection(true);
  mActiveEvents->verticalHeader()->hide();
  mActiveEvents->setHorizontalHeaderLabels(QStringList() << "Events");
  mActiveEvents->setSortingEnabled(false);
  // events: copy data
  for(int i=0; i<pTrace->EventNames().size(); i++) {
    QString event = pTrace->EventNames().at(i);
    QTableWidgetItem *evitem = new QTableWidgetItem(event);
    evitem->setFlags(Qt::ItemIsSelectable | Qt::ItemIsDragEnabled  | Qt::ItemIsDropEnabled | Qt::ItemIsEnabled | Qt::ItemIsUserCheckable);
    if(!pTrace->MuteEvent(event)) evitem->setCheckState(Qt::Checked);
    else evitem->setCheckState(Qt::Unchecked);
    mActiveEvents->setItem(i,0,evitem);
  }
  // events: fix table
  mActiveEvents->setSortingEnabled(true);
  mActiveEvents->sortItems(0);
  // events: connect
  connect(mActiveEvents,SIGNAL(itemChanged(QTableWidgetItem*)),
      this, SLOT(ActiveEventsEdited(QTableWidgetItem*)));
  // components: prepare table
  FD_DX("SimTraceSateliteWidget::Update(): component names #" 
     << pTrace->ComponentNames().size());
  mActiveComponents->disconnect();
  while(mActiveComponents->rowCount()>0) mActiveComponents->removeRow(0);
  mActiveComponents->setRowCount(pTrace->ComponentNames().size());
  mActiveComponents->setColumnCount(1);
  mActiveComponents->setShowGrid(false);         
  mActiveComponents->setHorizontalScrollBarPolicy(Qt::ScrollBarAlwaysOff);
  mActiveComponents->setSelectionBehavior(QAbstractItemView::SelectRows);
  mActiveComponents->setSelectionMode(QAbstractItemView::SingleSelection);
  mActiveComponents->horizontalHeader()->setStretchLastSection(true);
  mActiveComponents->verticalHeader()->hide();
  mActiveComponents->setHorizontalHeaderLabels(QStringList() << "Components");
  mActiveComponents->setSortingEnabled(false);
  // components: copy data
  for(int i=0; i<pTrace->ComponentNames().size(); i++) {
    QString component = pTrace->ComponentNames().at(i);
    QTableWidgetItem *cpitem = new QTableWidgetItem(component);
    cpitem->setFlags(Qt::ItemIsSelectable | Qt::ItemIsDragEnabled  | Qt::ItemIsDropEnabled | Qt::ItemIsEnabled | Qt::ItemIsUserCheckable);
    if(!pTrace->MuteComponent(component)) cpitem->setCheckState(Qt::Checked);
    else cpitem->setCheckState(Qt::Unchecked);
    mActiveComponents->setItem(i,0,cpitem);
  }
  // components: fix table
  //mActiveComponents->setSortingEnabled(true);
  //mActiveComponents->sortItems(0);
  // components: connect
  connect(mActiveComponents,SIGNAL(itemChanged(QTableWidgetItem*)),
      this, SLOT(ActiveComponentsEdited(QTableWidgetItem*)));
  // controls
  mCheckEnable->setCheckState(pTrace->TraceEnabled() ? Qt::Checked : Qt::Unchecked);
  mCheckEnable->disconnect();
  connect(mCheckEnable,SIGNAL(clicked(bool)),pTrace,SLOT(TraceEnable(bool)));

}   

// edit callback
void SimTraceSateliteWidget::ActiveEventsEdited(QTableWidgetItem* item) {
  FD_DX("SimTraceSateliteWidget::ActiveEventsEdited()");
  if(!item) return;
  QString event = item->data(Qt::DisplayRole).toString();
  FD_DX("SimTraceSateliteWidget::ActiveEventsEdited(): " << VioStyle::StrFromQStr(event));
  bool checked = item->checkState() == Qt::Checked;
  FD_DX("SimTraceSateliteWidget::ActiveEventsEdited(): " << checked);
  pTrace->MuteEvent(event,!checked);
}

// edit callback
void SimTraceSateliteWidget::ActiveComponentsEdited(QTableWidgetItem* item) {
  FD_DX("SimTraceSateliteWidget::ActiveComponentsEdited()");
  if(!item) return;
  QString component = item->data(Qt::DisplayRole).toString();
  FD_DX("SimTraceSateliteWidget::ActiveComponentsEdited(): " << VioStyle::StrFromQStr(component));
  bool checked = item->checkState() == Qt::Checked;
  FD_DX("SimTraceSateliteWidget::ActiveComponentsEdited(): " << checked);
  pTrace->MuteComponent(component,!checked);
}

// scroll current
void SimTraceSateliteWidget::ScrollEnd(void) {
}


// Scroll
void SimTraceSateliteWidget::ScrollStep(int step) {
  (void) step;
}

// Scroll
void SimTraceSateliteWidget::ScrollTime(faudes::Time::Type time) {
  (void) time;
}



