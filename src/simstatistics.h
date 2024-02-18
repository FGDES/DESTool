/* simstatwidget.h  -  represent simulator statastics   */


/*
   Simulator gui for FAU Discrete Event Systems Library (libfaudes)

   Copyright (C) 2006, 2007  Thomas Moor, Klaus Schmidt, Sebastian Perk

*/


#ifndef FAUDES_SIMSTATISTICS_H
#define FAUDES_SIMSTATISTICS_H

#include "libviodes.h"
#include "wspitems.h"
#include "wspviews.h"

// forward
class SimStatisticsMainWidget; 
class SimWidget;

/*
 ************************************************
 ************************************************

 A SimStatistics is a wsp-item to represent statistics
 of a simulation, to be viewed by an item view.

 ************************************************
 ************************************************
 */

// class definition
class SimStatistics : public WspItem  {

  Q_OBJECT

public:
  // construct/destruct
  SimStatistics(SimWidget* simwidget);
  virtual ~SimStatistics(void);

  // convenience: access sim control
  SimWidget* Control(void) { return pSimWidget;};

  // overload wsp item: widgets
  QWidget* NewMainWidget(void);
  QWidget* NewSateliteWidget(void);

 public slots:

  // clear statistics
  void Reset(void);

  // activate/clear trace
  void StatisticsEnable(bool on=true);
  bool StatisticsEnabled(void) const { return mStatisticsEnabled; };

  // update widget
  void Update(void);

signals:

  // update dependants
  void NotifyUpdate(void);
  void NotifyReset(void);

  // talk to user
  void TextMessage(const QString&,int);


private:

  // record simulator control
  SimWidget* pSimWidget;

  // have my current time
  faudes::Time::Type mCurrentTime;

  // behaviour
  bool mStatisticsEnabled;

};


// forward
class SimConditionStatisticsWidget; 
class SimDensityWidget;




/*
 ************************************************
 ************************************************

 A SimStatisticsMainWidget is a view to go with
 a SimStatistic. While a SimStatistic is a rather
 plain wsp-item, the SimStatisticMainWidget does
 the job.

 ************************************************
 ************************************************
 */

// class definition
class SimStatisticsMainWidget : public QWidget  {

  Q_OBJECT

public:
  // construct/destruct
  SimStatisticsMainWidget(QWidget* parent);
  virtual ~SimStatisticsMainWidget(void);

  // set/get model
  SimStatistics* Model(void);
  void Model(SimStatistics* model);

  // convenience: access control/executor
  const faudes::LoggingExecutor* Executor(void) const;
  SimWidget* Control(void);

public slots:

  // update stat data
  void Update(void);

  // update executor
  void Reset(void);

signals:

  // notify user interaction
  void MousePressCondition(faudes::Idx idx);

private:

  // record model
  SimStatistics* pStatistics;

  // layout
  TableLayout* mVbox;  
  QScrollArea* mScrollArea;
  QWidget* mContent;

  // statastic condition widgets
  QList<QWidget*> mWidgets;


};



/*
 ************************************************
 ************************************************

 A SimStatisticsSateliteWidget is a view to go with
 a SimStatistic. It shows simulation conditions
 and their properties.

 ************************************************
 ************************************************
 */

// class definition
class SimStatisticsSateliteWidget : public QWidget  {

  Q_OBJECT

public:
  // construct/destruct
  SimStatisticsSateliteWidget(QWidget* par=0);
  virtual ~SimStatisticsSateliteWidget(void);

  // set model
  void Model(SimStatistics* model);
  SimStatistics* Model(void) { return pStatistics;};

public slots:

  // update from executor
  void Reset(void);

  // update to executor
  void Update(void);

private:

  // user data
  SimStatistics* pStatistics;
  SimWidget* pControl;

  // my widgets
  VioWidget* mSimConditionSet;

  // layout: general
  QVBoxLayout* mVbox;  
  QCheckBox* mCheckEnabled;

};


/*
 ********************************
 ********************************
 ********************************

 graphicsscene to represent a density function

 ********************************
 ********************************
 ********************************
 */

// class definition
class SimDensityScene : public QGraphicsScene  {

  Q_OBJECT

public:
  // construct/destruct
 SimDensityScene(QObject* parent=0) : QGraphicsScene(parent) ,
    mWidth(200), mHeight(100), mTimeScale(1), mValueScale(1) {};
  virtual ~SimDensityScene(void) {};

  // set model (by copy)
  void setDensity(const faudes::DiscreteDensityFunction* pDensity);


protected:

  // todo: style
  qreal mWidth;
  qreal mHeight;
  qreal mTimeScale;
  qreal mValueScale;
};



// class definition
class SimDensityWidget : public QGraphicsView  {

  Q_OBJECT

public:
  // construct/destruct
  SimDensityWidget(QWidget* parent=0);
  virtual ~SimDensityWidget(void) {};

  // set model (by copy)
  void setDensity(const faudes::DiscreteDensityFunction* pDensity);

  // fixed size
  QSize sizeHint(void) const;
  QSize minimumSize(void) const { return sizeHint();};

protected:

  // my scene
  SimDensityScene* mDensityScene;


  // reimplement event handlers
  void mousePressEvent(QMouseEvent * event);
};


// class definition
class SimConditionStatisticsWidget : public QWidget  {

  Q_OBJECT

public:
  // construct/destruct
  SimConditionStatisticsWidget(QWidget* parent=0);
  virtual ~SimConditionStatisticsWidget(void) {};

  // set model (by copy)
  void setCondition(const faudes::AttributeSimCondition* pCondition, faudes::Idx idx=0);

  // fixed size
  QSize sizeHint(void) const;
  QSize minimumSize(void) const { return sizeHint();};

signals:

  // notify user interaction
  void MousePressCondition(faudes::Idx idx);


protected:

  // my faudes id
  faudes::Idx mIdx;

  // my widgets
  SimDensityWidget* mPeriodWidget;
  SimDensityWidget* mDurationWidget;

  // reimplement event handlers
  void mousePressEvent(QMouseEvent * event);

};



#endif
