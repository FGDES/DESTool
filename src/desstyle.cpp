/* desstyle.cpp  -  script style and  helper  */


/*
   Visual skripting for FAU Discrete Event Systems Library (libfaudes)

   Copyright (C) 2006, 2007  Thomas Moor, Klaus Schmidt, Sebastian Perk
   Copyright (C) 2024  

*/


#define FAUDES_DEBUG_VIO
#define FAUDES_DEBUG_SCRIPT

#include "desstyle.h"
#include "libfaudes.h"
#include <QtGlobal>


/*
*******************************************
*******************************************
*******************************************

implementation of desstyle

*******************************************
*******************************************
*******************************************
*/

// drawing:: common
void DesStyle::DefaultPen(QPen& pen){
  pen = QPen();
  pen.setStyle(Qt::SolidLine);
  pen.setBrush(Qt::SolidPattern);
  pen.setBrush(Qt::black);
  pen.setWidthF(1);
}

// drawing:: common
void DesStyle::DefaultBrush(QBrush& brush){
  brush = QBrush();
  brush.setStyle(Qt::SolidPattern);
  brush.setColor(Qt::black);
}


// geometry of tick
qreal DesStyle::SCALE_TICK_SMALL = 4;
qreal DesStyle::SCALE_TICK_LARGE = 6;
qreal DesStyle::SCALE_TICK_MAXDIST = 20;

// find tick interval
void DesStyle::ScaleTickInter(qreal& tickinter, 
    const qreal& rangeLB, const qreal& rangeUB, const qreal& scale) {
  FD_DS("DesStyle::ScaleTick()");
  (void) rangeUB;
  (void) rangeLB;

  qreal candidate = SCALE_TICK_MAXDIST/scale;
  tickinter=1;
  // tens
  for(;tickinter < 1000000.0; tickinter*=10)
    if(tickinter>candidate) break;
  if(tickinter>candidate) 
    for(;tickinter > 1.0/1000000.0; tickinter/=10)
      if(tickinter<candidate) break;
  // fives or twos ?
  if(5*tickinter< SCALE_TICK_MAXDIST/scale) {
    tickinter*=5;
  } else if(2*tickinter< SCALE_TICK_MAXDIST/scale) {
    tickinter*=2;
  }
  // error
  if(tickinter<=0) tickinter=1; 
  FD_DS("DesStyle::ScaleTick(): " << tickinter);

}

// draw scale
void DesStyle::ScalePaths(
     QPainterPath& fpath, QPainterPath& tpath, 
     const qreal& rangeLB, const qreal& rangeUB, const qreal& tickinter, const qreal& scale,
     const qreal& x, const qreal& y) {
  // frame path: base line
  fpath.moveTo(QPointF(x,y));
  fpath.lineTo(QPointF(x+(rangeUB-rangeLB)*scale, y));
  fpath.moveTo(QPointF(x,y-SCALE_TICK_LARGE/2.0));
  fpath.lineTo(QPointF(x,y+SCALE_TICK_LARGE/2.0));
  fpath.moveTo(QPointF(x+(rangeUB-rangeLB)*scale,y-SCALE_TICK_LARGE/2.0));
  fpath.lineTo(QPointF(x+(rangeUB-rangeLB)*scale,y+SCALE_TICK_LARGE/2.0));
  // begin/end label
  VioStyle::TextCP(tpath,QPointF(x,y+(SCALE_TICK_LARGE/2.0)+7),
    QString("%1").arg(rangeLB)); 
  VioStyle::TextCP(tpath,QPointF(x+(rangeUB-rangeLB)*scale,y+(SCALE_TICK_LARGE/2.0)+7),
    QString("%1").arg(rangeUB)); 
  // frame path: tix
  int ifirst = qRound( rangeLB/tickinter );
  int ilast = qRound( rangeUB/tickinter ) +1;
  for(int i=ifirst; i<=ilast; i++) {
    qreal now= i*tickinter;
    if(now < rangeLB+0.5*tickinter) continue;
    if(now > rangeUB-0.5*tickinter) continue;
    qreal pos= (now-rangeLB)*scale;
    qreal cheight=SCALE_TICK_SMALL;
    if(i % 5 == 0) cheight=SCALE_TICK_LARGE;
    fpath.moveTo(QPointF(x+pos,y-cheight/2.0));
    fpath.lineTo(QPointF(x+pos,y+cheight/2.0));
    if(i % 5 == 0)   {
      QPainterPath newtext;
      VioStyle::TextCP(newtext,QPointF(x+pos,y+(SCALE_TICK_LARGE/2.0)+7),QString("%1").arg(now)); 
      QRectF newrect=newtext.controlPointRect().adjusted(-7,0,+7,0);
      if(!tpath.intersects(newrect)) tpath.addPath(newtext);
    }
  }
}

// drawing:: common
void DesStyle::ScalePen(QPen& pen){
  pen = QPen();
  pen.setStyle(Qt::SolidLine);
  pen.setBrush(Qt::SolidPattern);
  pen.setBrush(VioStyle::Color(VioBlue));
  pen.setWidthF(1);
}

// drawing:: common
void DesStyle::ScaleBrush(QBrush& brush){
  brush = QBrush();
  brush.setStyle(Qt::SolidPattern);
  brush.setColor(VioStyle::Color(VioBlue));
}


// assistant: static member
DesAssistant DesStyle::mAssistant;

// assistant: do it
void DesStyle::ShowDocumentation(const QString& page) {
  mAssistant.ShowDocumentation(page);
}

// assistant: quit
void DesStyle::QuitAssistant(void) {
  mAssistant.QuitAssistant();
}





/*
*******************************************
*******************************************
*******************************************

implementation of showtip

*******************************************
*******************************************
*******************************************
*/


// show senders tooltip
void DesShowTip::Show(const QPoint& pos) {
  FD_DS("DesShowTip::Show()");
  QWidget* widget = qobject_cast<QWidget*>(sender());
  if(!widget) return;
  QToolTip::showText(widget->mapToGlobal(pos),widget->toolTip(),widget,widget->geometry());
};

// show items tool tip (not functional, need map global ... need widget to exist)
void  DesShowTip::Show(QStandardItem* item, QWidget* wid) {
  if(wid) 
    QToolTip::showText(
      QPoint(wid->geometry().x()+100, wid->geometry().y()),
      item->toolTip()); //, wid, wid->geometry());
  else
    QToolTip::showText(
      QPoint(250,250),item->toolTip());
}

// static for convenience
DesShowTip DesShowTip::Static;




/*
*******************************************
*******************************************
*******************************************

implementation of table flow layout

*******************************************
*******************************************
*******************************************
*/


TableLayout::TableLayout(QWidget *parent, int margin, int spacing)
    : QLayout(parent)
{
  setContentsMargins(margin,margin,margin,margin);
  setSpacing(spacing);
}

TableLayout::TableLayout(int spacing)
{
  setSpacing(spacing);
}

TableLayout::~TableLayout()
{
    QLayoutItem *item;
    while ((item = takeAt(0)))
        delete item;
}

void TableLayout::addItem(QLayoutItem *item)
{
    itemList.append(item);
}

int TableLayout::count() const
{
    return itemList.size();
}

QLayoutItem *TableLayout::itemAt(int index) const
{
    return itemList.value(index);
}

QLayoutItem *TableLayout::takeAt(int index)
{
    if (index >= 0 && index < itemList.size())
        return itemList.takeAt(index);
    else
        return 0;
}

Qt::Orientations TableLayout::expandingDirections() const
{
  return Qt::Vertical;
}

bool TableLayout::hasHeightForWidth() const
{
    return true;
}


int TableLayout::heightForWidth(int width) const 
{
    QRect crect=doLayout(QRect(0, 0, width, 0), true);
    return crect.height();
}

void TableLayout::setGeometry(const QRect &rect)
{
    QLayout::setGeometry(rect);
    doLayout(rect, false);
}

QSize TableLayout::sizeHint() const
{
    return minimumSize();
}

QSize TableLayout::minimumSize() const
{
    QSize size;
    QLayoutItem *item;
    foreach (item, itemList)
        size = size.expandedTo(item->minimumSize());

    size += QSize(
      contentsMargins().left()+contentsMargins().right(),
      contentsMargins().top()+contentsMargins().bottom());
    //FD_DQ("TableLayout::minimumSize(): " << size.width() << " " << size.height());
    return size;
}

QRect TableLayout::doLayout(const QRect &rect, bool testOnly)  const 
{
    // bail out 
    if(itemList.size()==0) return rect;

    //FD_DQ("TableLayout::doLayout() for : " << rect.width() << " " << rect.height());

    // guess numer of columns
    int columnWidth=1;
    foreach(QLayoutItem *item, itemList) columnWidth=qMax(columnWidth,item->sizeHint().width());
    int columnCount= qMax(1, rect.width() / columnWidth );
    columnWidth= rect.width()/columnCount+1;

    // get sizes
    int x = rect.x();
    int y = rect.y();
    int c=0;
    int lineHeight=0;

    for(int i=0; i<itemList.size(); i++) {

      // advance line
      if(c==columnCount) {
        c=0;
        x=rect.x();
        y= y+lineHeight+spacing();
        lineHeight=0;
      }

      // have an item
      QLayoutItem* item = itemList.at(i);

      // track lineheight
      lineHeight = qMax(lineHeight, item->sizeHint().height());

      // position item
      if(!testOnly) 
         item->setGeometry(QRect(x, y, columnWidth,item->sizeHint().height()));

      // advance
      x= x+columnWidth+spacing();
      c++;
   
    }

    // record height
    int widgetHeight = y + lineHeight - rect.y();
    QRect crect(rect.x(),rect.y(),rect.width(),widgetHeight);

    //FD_DQ("TableLayout::doLayout() result : " << crect.width() << " " << crect.height());

    // return
    return crect;
}

/*
*******************************************
*******************************************
*******************************************

implementation of flow layout

*******************************************
*******************************************
*******************************************
*/


FlowLayout::FlowLayout(QWidget *parent, int margin, int spacing) : QLayout(parent) {
  setContentsMargins(margin,margin,margin,margin);
  setSpacing(spacing);
}

FlowLayout::FlowLayout(int spacing) {
  setSpacing(spacing);
}

FlowLayout::~FlowLayout()
{
    QLayoutItem *item;
    while ((item = takeAt(0)))
        delete item;
}

void FlowLayout::addItem(QLayoutItem *item)
{
    itemList.append(item);
}

int FlowLayout::count() const
{
    return itemList.size();
}

QLayoutItem *FlowLayout::itemAt(int index) const
{
    return itemList.value(index);
}

QLayoutItem *FlowLayout::takeAt(int index)
{
    if (index >= 0 && index < itemList.size())
        return itemList.takeAt(index);
    else
        return 0;
}

Qt::Orientations FlowLayout::expandingDirections() const
{
  return Qt::Vertical;
}

bool FlowLayout::hasHeightForWidth() const
{
    return true;
}


int FlowLayout::heightForWidth(int width) const 
{
    QRect crect=doLayout(QRect(0, 0, width, 0), true);
    return crect.height();
}

void FlowLayout::setGeometry(const QRect &rect)
{
    QLayout::setGeometry(rect);
    doLayout(rect, false);
}

QSize FlowLayout::sizeHint() const
{
    return minimumSize();
}

QSize FlowLayout::minimumSize() const
{
    QSize size;
    QLayoutItem *item;
    foreach (item, itemList)
      size = size.expandedTo(item->minimumSize());
    size += QSize(
      contentsMargins().left()+contentsMargins().right(),
      contentsMargins().top()+contentsMargins().bottom());
    //FD_DQ("FlowLayout::minimumSize(): " << size.width() << " " << size.height());
    return size;
}

QRect FlowLayout::doLayout(const QRect &rect, bool testOnly)  const 
{
    // bail out 
    if(itemList.size()==0) return rect;

    //FD_DQ("FlowLayout::doLayout() for : " << rect.width() << " " << rect.height());

    // get sizes
    int x = rect.x();
    int y = rect.y();
    int lineHeight=0;

    for(int i=0; i<itemList.size(); i++) {

      // have an item
      QLayoutItem* item = itemList.at(i);

      // advance line
      if(x + spacing()+item->sizeHint().width() > rect.x()+rect.width()) {
        x=rect.x();
        y= y+lineHeight+spacing();
        lineHeight=0;
      }


      // track lineheight
      lineHeight = qMax(lineHeight, item->sizeHint().height());

      // position item
      if(!testOnly) 
         item->setGeometry(QRect(x, y, item->sizeHint().width(),item->sizeHint().height()));

      // advance
      x= x+item->sizeHint().width()+spacing();
   
    }

    // record height
    int widgetHeight = y + lineHeight - rect.y();
    QRect crect(rect.x(),rect.y(),rect.width(),widgetHeight);

    //FD_DQ("FlowLayout::doLayout() result : " << crect.width() << " " << crect.height());

    // return
    return crect;
}


/*
*******************************************************
*******************************************************
*******************************************************

implementation: DesAssistant 

*******************************************************
*******************************************************
*******************************************************
*/


// construct
DesAssistant::DesAssistant() : mProcess(nullptr) {
};

// find my data aka help collection
const QString& DesAssistant::DocPath(void) {
    if(mDocPath!="") return mDocPath;
    // a) linux: development
    if(!QFileInfo(mDocPath).isDir()) {
        mDocPath =  QCoreApplication::applicationDirPath()
                   +  QLatin1String("/../doc/html");
    }
    // b) linux: package
    if(!QFileInfo(mDocPath).isDir()) {
        mDocPath =  QCoreApplication::applicationDirPath()
                   +  QLatin1String("/../doc");
    }
    // c) macosx: bundle
    if(!QFileInfo(mDocPath).isDir()) {
        mDocPath =  QCoreApplication::applicationDirPath()
                   + QLatin1String("/../Resources/doc/destool_html");
    }
    // d) windows: package
    if(!QFileInfo(mDocPath).isDir()) {
        mDocPath =  QCoreApplication::applicationDirPath()
                   +  QLatin1String("/Doc");
    }
    // ... fail
    if(!QFileInfo(mDocPath).isDir()) {
        mDocPath =  "cannot find doc path";
    }
    return mDocPath;
}

// find assistant path ... abandoned with DESTool 0.84
const QString& DesAssistant::ExePath(void) {
    if(mExePath!="") return mExePath;
    mExePath="";    
/*
    // a) linux: package, binary
    if(!QFileInfo(mExePath).isExecutable()) {
        mExePath = QCoreApplication::applicationDirPath()
                   + QLatin1String("/../lib/assistant.bin");
    }
    // b) linux: package, shell script
    if(!QFileInfo(mExePath).isExecutable()) {
        mExePath = QCoreApplication::applicationDirPath()
                   + QLatin1String("/../bin/assistant");
    }
    // c) linux: using locally installed qt (must remove qt_conf for this to work)
    if(!QFileInfo(mExePath).isExecutable()) {
        mExePath = QLibraryInfo::path(QLibraryInfo::BinariesPath)
                   + QLatin1String("/assistant");
    }
    // d) linux: system (must remove qt_conf and local qtlibs for this to work)
    if(!QFileInfo(mExePath).isExecutable()) {
        mExePath = "/usr/bin/assistant";
    }
    // e) macosx: installed system qt
    if(!QFileInfo(mExePath).isExecutable()) {
        mExePath = QLibraryInfo::path(QLibraryInfo::BinariesPath)
                   +QLatin1String("/Assistant.app/Contents/MacOS/Assistant");
    }
    // f) macosx: destool bundle
    if(!QFileInfo(mExePath).isExecutable()) {
        mExePath = QCoreApplication::applicationDirPath()
                   + QLatin1String("/Assistant");
    }
    // g) windows: destool package
    if(!QFileInfo(mExePath).isExecutable()) {
        mExePath = QCoreApplication::applicationDirPath()
                   + QLatin1String("\\assistant.exe");
    }
    // ... fail
    if(!QFileInfo(mExePath).isExecutable()) {
        mExePath = "cannot find help browser";
    }
*/
    return mExePath;
}

//destruct
DesAssistant::~DesAssistant() {
  FD_DS("DesAssistant::~DesAssistant()");
  // kill qt assitant process
  if(mProcess)
  if(mProcess->state() == QProcess::Running) {
    mProcess->terminate();
    mProcess->waitForFinished(3000);
  }
}

// doit
void DesAssistant::ShowDocumentation(const QString &page) {
  FD_DS("DesAssistant::ShowDocumentation(" << VioStyle::StrFromQStr(page)<<"}");
  QString opage=page;
  // detect section hash
  QString spage=opage;
  qsizetype seppos=opage.lastIndexOf(".html#");
  // strip and insert ?
  QString secmark;
  if(seppos >0){
    spage=opage.left(seppos+5);
    secmark=opage.mid(seppos+6);
  }  
  // test file existence
  if(!QFileInfo(DocPath()+"/"+spage).isFile()) {
    spage="destool_intro.html";
    secmark="";
  }    
  // use system HTML browser
  QString path=DocPath()+"/"+spage;
#ifdef Q_OS_WIN32
  path="/"+path;
#endif  
  QUrl url;
  url.setScheme("file");
  url.setPath(path);
  if(secmark!="") url.setFragment(secmark);
  FD_DS("DesAssistant::ShowDocumentation(..): url: " << VioStyle::StrFromQStr(url.toDisplayString()));
  QDesktopServices::openUrl(url);
/*
  // ensure process is up
  if(!startProcess()) return;
  // my default
  QString dpage = page;
  if(dpage=="") dpage=QLatin1String("destool_intro.html");
  QString dmssg = QLatin1String("setSource qthelp://com.faudes/doc/") + dpage;
  FD_DS("DesAssistant::ShowDocumentation(..): sending message: " << VioStyle::StrFromQStr(dmssg));
  // set up stream, send message
  QTextStream str(mProcess);
  str  << dmssg << QLatin1String("\n");
*/
}

// quit
void DesAssistant::QuitAssistant(void) {
  // bail out
  if(!mProcess) return;
  // try to reminate
  mProcess->terminate();
  mProcess->waitForFinished(3000);
  mProcess->kill();
  mProcess->waitForFinished(3000);
}

// start process
bool DesAssistant::startProcess() {
  // construct process
  if(!mProcess) {
     mProcess = new QProcess();
     mProcess->setProcessChannelMode(QProcess::MergedChannels);
     // todo: setup LANG=en.utf8
  }
  // allready running, fine
  if(mProcess->state() == QProcess::Running) return true;
  // 1. find assistant path ...
  QString app=ExePath();
  // report
  FD_WARN("DesAssistant::startProcess: assistant at " << VioStyle::StrFromQStr(app));
  // 2. find help file *qch to register ...
  QString qch=DocPath() + QLatin1String("/destool.qch");
  if(!QFileInfo(qch).isReadable()) {
    qch =  "cannot find destool.qch";
  }
  // report
  FD_WARN("DesAssistant::startProcess: compressed helpfile at \"" << VioStyle::StrFromQStr(qch) << "\"");
  /*
  // 3. assistant args for registration
  QStringList rargs;
  rargs << QLatin1String("-register")
       << qch;
  // 4. do register
  FD_WARN("DesAssistant::startProcess: register");
  mProcess->start(app, rargs);
  mProcess->waitForStarted();
  if(!mProcess->waitForFinished(-1)) {
    QString err(mProcess->readAllStandardOutput());
    FD_WARN("DesAssistant::startProcess: register error: " << err);
    QMessageBox::critical(0, QObject::tr("DESTool Help"),
       QObject::tr("Warning at registration of DESTool help collection\nAssistant: %1\nCollection: %2\nMessage: %3").arg(app).arg(qch).arg(err));
    //return false;
  }
  */
  // 6. find help file *qch to register ...
  QString qhc=DocPath() + QLatin1String("/destool.qhc");
  if(!QFileInfo(qhc).isReadable()) {
      qhc =  "cannot find destool.qch";
  }
  // assistant args for launch
  QStringList largs;
  largs << QLatin1String("-collectionFile")
       << qhc
       << QLatin1String("-enableRemoteControl");
  // 5. do launch
  FD_WARN("DesAssistant::startProcess: launch");
  mProcess->start(app, largs);
  if(!mProcess->waitForStarted()) {
    QMessageBox::critical(0, QObject::tr("DESTool Help"),
    QObject::tr("Unable to launch help browser (%1 for %2)").arg(app).arg(qhc));
    return false;
  }
  FD_WARN("DesAssistant::startProcess: up and running");
  return true;
}

