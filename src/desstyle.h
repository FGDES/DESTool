/* desstyle.h  -  script style and helper  */


/*
   Visual skripting for FAU Discrete Event Systems Library (libfaudes)

   Copyright (C) 2006, 2007  Thomas Moor, Klaus Schmidt, Sebastian Perk

   Except the flowlayout, which is based on code copyrighted by Trolltech,
   see original header at end of file

*/



#ifndef DESSTYLE_H
#define DESSTYLE_H


#include <iostream>
#include <QtGui>
#include "libviodes.h"

// fallback version string
#ifndef FAUDES_SCR_VERSION
#define FAUDES_SCR_VERSION "undefined script version"
#endif

// debugging: script level
#undef FD_DS
#ifdef FAUDES_DEBUG_SCRIPT
#define FD_DS(message) FAUDES_WRITE_CONSOLE("DESTOOL_SCRIPT: " << message);
#else
#define FD_DS(message) {};
#endif

// debugging: script level
#ifdef FAUDES_DEBUG_PROJECT
#define FD_DP(message) FAUDES_WRITE_CONSOLE("DESTOOL_PROJECT: " << message);
#else
#define FD_DP(message) {};
#endif

// debugging: items
#ifdef FAUDES_DEBUG_ITEMS
#define FD_DI(message) FAUDES_WRITE_CONSOLE("DESTOOL_ITEM " << message)
#else
#define FD_DI(message) {};
#endif


// debugging: simulation
// we use direct output since faudes console out is not threadsafe
#undef FD_DX
#ifdef FAUDES_DEBUG_SIMULATOR
#define FD_DX(message) FAUDES_WRITE_DIRECT("DESTOOL_SIM: " << message);
#else
#define FD_DX(message) {};
#endif

// forwards
class DesAssistant;

/*
*******************************************
*******************************************
*******************************************

DesStyle provides drawing parameters, basic
drawing routines, and other compiletime options.

*******************************************
*******************************************
*******************************************
*/

class DesStyle {

public:


  // drawing: common
  static void DefaultPen(QPen& pen);
  static void DefaultBrush(QBrush& brush);

  // drawing: static parameters
  static qreal SCALE_TICK_SMALL;
  static qreal SCALE_TICK_LARGE;
  static qreal SCALE_TICK_MAXDIST;

  // drawing: scale methods
  static void ScaleTickInter(qreal& tickinter, 
    const qreal& rangeLB, const qreal& rangeUB, const qreal& scale);
  static void ScalePaths(QPainterPath& fpath, QPainterPath& tpath, 
    const qreal& rangeLB, const qreal& rangeUB, const qreal& tickinter, const qreal& scale, 
    const qreal& x=0, const qreal& y=0);
  static void ScalePen(QPen& pen);
  static void ScaleBrush(QBrush& brush);

  // assistant
  static void ShowDocumentation(const QString& page="");
  static void QuitAssistant(void);


private:

  // my data
  static DesAssistant mAssistant;

};


/*
*******************************************
*******************************************
*******************************************

helper class: show a tooltip

*******************************************
*******************************************
*******************************************
*/


class DesShowTip : public QObject {

  Q_OBJECT

public:
  DesShowTip(QObject* parent=0) : QObject(parent) {};
  ~DesShowTip(void) {};

  static DesShowTip Static;

public slots:
  // show tip of sender
  void  Show(const QPoint& pos);
  // show tip for std item
  void  Show(QStandardItem* item, QWidget* wid=0);

};


/*
*******************************************
*******************************************
*******************************************

helper class: version of trolltechs flow layout

*******************************************
*******************************************
*******************************************
*/

// trolltechs flow layout
class FlowLayout : public QLayout {

public:
    FlowLayout(QWidget *parent, int margin = 0, int spacing = -1);
    FlowLayout(int spacing = -1);
    ~FlowLayout();

    void addItem(QLayoutItem *item);
    Qt::Orientations expandingDirections() const;
    bool hasHeightForWidth() const;
    int heightForWidth(int) const;
    int count() const;
    QLayoutItem *itemAt(int index) const;
    QSize minimumSize() const;
    void setGeometry(const QRect &rect);
    QSize sizeHint() const;
    QLayoutItem *takeAt(int index);

private:
    QRect doLayout(const QRect &rect, bool testOnly) const;

    QList<QLayoutItem *> itemList;

};


/*
*******************************************
*******************************************
*******************************************

helper class: table flow layout

*******************************************
*******************************************
*******************************************
*/

// trolltechs flow layout
class TableLayout : public QLayout {

public:
    TableLayout(QWidget *parent, int margin = 0, int spacing = -1);
    TableLayout(int spacing = -1);
    ~TableLayout();

    void addItem(QLayoutItem *item);
    Qt::Orientations expandingDirections() const;
    bool hasHeightForWidth() const;
    int heightForWidth(int) const;
    int count() const;
    QLayoutItem *itemAt(int index) const;
    QSize minimumSize() const;
    void setGeometry(const QRect &rect);
    QSize sizeHint() const;
    QLayoutItem *takeAt(int index);

private:
    QRect doLayout(const QRect &rect, bool testOnly) const;

    QList<QLayoutItem *> itemList;

};




/*
*******************************************
*******************************************
*******************************************

DesAssistant is a wrapper class that maintains a
process to run a qtassistant to show help pages.

*******************************************
*******************************************
*******************************************
*/


class DesAssistant {

public:
     DesAssistant();
     ~DesAssistant();
     void ShowDocumentation(const QString &file);
     void QuitAssistant(void);

private:
     bool startProcess();
     QProcess *mProcess;
};






#endif 



// flowlayout copyright:

/****************************************************************************
**
** Copyright (C) 2004-2007 Trolltech ASA. All rights reserved.
**
** This file is part of the example classes of the Qt Toolkit.
**
** Licensees holding a valid Qt License Agreement may use this file in
** accordance with the rights, responsibilities and obligations
** contained therein.  Please consult your licensing agreement or
** contact sales@trolltech.com if any conditions of this licensing
** agreement are not clear to you.
**
** Further information about Qt licensing is available at:
** http://www.trolltech.com/products/qt/licensing.html or by
** contacting info@trolltech.com.
**
** This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE
** WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
**
****************************************************************************/

