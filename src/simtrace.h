/* simtrace.h  -  represent simulator trace   */


/*
   Simulator gui for FAU Discrete Event Systems Library (libfaudes)

   Copyright (C) 2006, 2007  Thomas Moor, Klaus Schmidt, Sebastian Perk

*/


#ifndef FAUDES_SIMTRACE_H
#define FAUDES_SIMTRACE_H

#include "libviodes.h"
#include "wspitems.h"
#include "wspviews.h"


/*
 ************************************************
 ************************************************

 A SimTrace is a wsp-item that represents
 an executor trace to be viewed via an item view.

 It is based on a graphics scene. Details, however,
 are hidden in the .cpp file ... this is a mess.

 ************************************************
 ************************************************
 */


// forward
class SimWidget;
class SimSample;

// class definition
class SimTrace : public WspItem  {

  Q_OBJECT

  friend class SimSample;

public:

  // construct/destruct
  SimTrace(SimWidget* simwidget);
  virtual ~SimTrace(void);

  // convenience: access executor
  const faudes::LoggingExecutor* Executor(void) const;
  const QList<QString>& EventNames(void) const;
  const QList<QString>& ComponentNames(void) const;
  SimWidget* Control(void) { return pSimWidget;};

  // update from executor
  void Update(void) {};
  void UpdateExtend(void);
  void UpdateExtend(const std::deque<faudes::LoggingExecutor::TraceSample>& ftrace);
  void UpdateTruncate(void);

  // set scale (px per faudes time)
  void TimeScale(qreal scale);
  qreal TimeScale(void) { return mTimeScale;};

  // query range (exclusive)
  int BeginStep(void);
  int EndStep(void);
  faudes::Time::Type BeginTime(void);
  faudes::Time::Type EndTime(void);
  qreal BeginPosition(void);
  qreal EndPosition(void);

  // query gemetry
  qreal StepToPosition(int step);
  int TimeToStep(faudes::Time::Type time);

  // set/get mute
  const QSet<QString>& MuteEvents(void) const;
  const QSet<QString>& MuteComponets(void) const;
  bool MuteEvent(QString event) const;
  bool MuteComponent(QString component) const;
  void MuteEvent(QString event, bool on);
  void MuteComponent(QString component, bool on);
  const faudes::EventSet& TraceEvents(void) const { return mTraceEvents; };
  const QList<int>& TraceComponents(void) const { return mTraceComponents; };

  // access scene
  QGraphicsScene* Scene(void) { return mScene;}

  // overload wsp item: widgets
  QWidget* NewMainWidget(void);
  QWidget* NewSateliteWidget(void);


public slots:

  // clear trace
  void Reset(void);
  void Clear(void);

  // activate/clear trace
  void TraceEnable(bool on=true);
  bool TraceEnabled(void) const { return mTraceEnabled; };

signals:

  // navigate views
  void RequestScrollEnd(void);
  void RequestScrollTime(faudes::Time::Type time);
  void RequestScrollStep(int step);

  // update dependants
  void NotifyClear(void);

  // talk to user
  void TextMessage(const QString&,int);

protected:


private:

  // semantical parent
  SimWidget* pSimWidget;

  // my graphics 
  QGraphicsScene* mScene;
  qreal mTimeScale;
  faudes::Time::Type mTickTime;

  // compiled trace
  QList<SimSample*> mTrace;
  QMap<faudes::Time::Type,int> mTimeToMaxStep;

  // configuration
  QSet<QString> mMuteEvents;
  QSet<QString> mMuteComponents;
  faudes::EventSet mTraceEvents;
  QList<int> mTraceComponents;
  bool mTraceEnabled;

  // item design pre-compile
  qreal mDigitWidth;
  QMap<faudes::Idx,qreal> mEventLabelWidth;

  // helper methods
  void AppendSample(const faudes::LoggingExecutor::TraceSample& sample);
  SimSample* SampleAtStep(int step);
  SimSample* CurrentSample(void);
  void UpdateTraceRestriction(void);
  QRectF OuterRect(void);

};



/*
 ************************************************
 ************************************************

 A SimTraceMainWidget is a widget to view 
 a SimTrace.


 ************************************************
 ************************************************
 */


// class definition
class SimTraceMainWidget : public QWidget   {

  Q_OBJECT


public:

  // construct/destruct
  SimTraceMainWidget(QWidget* parent);
  virtual ~SimTraceMainWidget(void);

  // get/set model
  SimTrace* Model(void);
  void Model(SimTrace* model);

public slots:

  // scroll
  void ScrollEnd(void);
  void ScrollTime(faudes::Time::Type time);
  void ScrollStep(int step);


protected:

  // reimplement qwidget
  void wheelEvent(QWheelEvent *event);

  // use myself to steel wheelevents
  bool eventFilter(QObject *obj, QEvent *ev);

private:

  // model
  SimTrace* pTrace;

  // my graphics
  QGraphicsView* mView;
  QGraphicsScene* pScene;

  // my layout
  QVBoxLayout* mVbox;

};



/*
 ************************************************
 ************************************************

 A SimTraceSateliteWidget is a widget to control
 the a SimTrace, i.e. to configure muted events
 etc.


 ************************************************
 ************************************************
 */


// class definition
class SimTraceSateliteWidget : public QWidget   {

  Q_OBJECT


public:

  // construct/destruct
  SimTraceSateliteWidget(QWidget* parent);
  virtual ~SimTraceSateliteWidget(void);

  // get/set model
  SimTrace* Model(void);
  void Model(SimTrace* model);

public slots:

  // scroll
  void ScrollEnd(void);
  void ScrollTime(faudes::Time::Type time);
  void ScrollStep(int step);

  // controls
  void EnableTrace(bool on) {(void) on;};
  void ClearTrace(void) {};

  // update all
  void Update(void);

protected slots:

  // edit callbacks
  void ActiveEventsEdited(QTableWidgetItem* item);
  void ActiveComponentsEdited(QTableWidgetItem* item);

protected:

  // model
  SimTrace* pTrace;

  // my data
  QCheckBox*    mCheckEnable;
  QPushButton*  mButtonClear;
  QTableWidget* mActiveEvents;
  QTableWidget* mActiveComponents;


  // my layout
  QVBoxLayout* mVbox;

};

#endif
