/* scrprogwidget.h  -  widget to represent program   */


/*
   Visual skripting for FAU Discrete Event Systems Library (libfaudes)

   Copyright (C) 2006, 2007  Thomas Moor, Klaus Schmidt, Sebastian Perk

*/


#ifndef SCRPROGWIDGET_H
#define SCRPROGWIDGET_H

#include "libviodes.h"
#include "scrprogram.h"
#include "scropwidget.h"


/* 
 ******************************************
 ******************************************
 ******************************************

 A ScrProgWidget is a widget that represents
 a ScrProgram for execution and editing.

 ******************************************
 ******************************************
 ******************************************
 */


// class definition
class ScrProgWidget : public QScrollArea {

  Q_OBJECT

public:

  // import typedef
  typedef ScrProgram::ProgramState ProgramState;

  // construct/destruct
  ScrProgWidget(WspVariablePool* varpool, WspFunctionPool* fnctpool, QWidget* parent=0);
  ~ScrProgWidget(void);

  // get variablepool 
  WspVariablePool* VariablePool(void) {return mProg->VariablePool();};
  WspFunctionPool* FunctionPool(void) {return mProg->FunctionPool();};

  // query properties
  int Size(void) const { return mProg->Size(); };

  // access list
  ScrOperation* OperationAt(int pos) const { return mProg->At(pos); };
  int OperationFind(const QString name) const { return mProg->Find(name); };

  // record/query user changes 
  bool Modified(void) const;
  virtual void Modified(bool ch);

public slots:

  // clear program, update from model
  void Clear();
  void Update(); 

  // edit list: return 0 on ok
  int OperationInsert(void);
  int OperationInsert(int pos, QString descr);
  int OperationAppend(QString descr);
  int OperationRemove(int pos);
  int OperationMove(int src, int dst);

  // selection
  QSet<int> Selection(void);
  void SelectNothing(void);
  void Select(int pos, bool sel=true);
  void DeleteSelection(void);

  // execute
  ProgramState State(void) { return mProg->State(); };
  ProgramState Initialize(void);
  ProgramState Step(void);
  ProgramState Execute(int pos);
  ProgramState Execute(void);
  ProgramState Run(void);

  // file io
  void  Read(faudes::TokenReader& rTr) { mProg->Read(rTr); Update(); Modified(false); };
  void  Write(faudes::TokenWriter& rTw) { mProg->Write(rTw); Modified(false); };

  // Receive configuration changes from child (by user)
  void ChildModified(bool);

signals:

  // request for status message
  void TextMessage(const QString& message, int time); 

  // Configuration changed (by user)
  void NotifyModified(bool);

protected slots:

  // my context menu
  void ContextMenuAtPoint(QPoint pos);

protected:

  // handle my widgets
  void ClearLayout(void);
  int IndexAt(QPoint point);
  ScrOpWidget* WidgetAt(int pos);
  ScrOpWidget* WidgetAt(QPoint point);
  int InsertWidgetAt(int pos);
  int RemoveWidgetAt(int pos);

  // my program
  ScrProgram* mProg;

  // my layout
  QWidget* mContent;
  QWidget* mBlank;
  QVBoxLayout* mVbox;

  // my operation widgets
  QList<ScrOpWidget*> mList;

  // selection
  QSet<int> mSelection;
  int mCurrent;

  // dragging
  int mDragSrcOperation;
  int mDragDstOperation;
  QPoint mDragSrcPosition;

  // reimplement widget events
  void mousePressEvent(QMouseEvent *event);
  void mouseMoveEvent(QMouseEvent *event);
  void keyPressEvent(QKeyEvent* event);
  void dragEnterEvent(QDragEnterEvent *event);
  void dropEvent(QDropEvent *event);


  // Record modified state
  bool mModified;
 
};

/* 
 ******************************************
 ******************************************
 ******************************************

 A ScrProgBrowser is an ScrProgWidget plus 
 some extra buttons to make it a self 
 contained editor incl execution control

 ******************************************
 ******************************************
 ******************************************
 */


// class definition
class ScrProgBrowser : public QWidget {

  Q_OBJECT

public:

  // construct/destruct
  ScrProgBrowser(WspVariablePool* varpool, WspFunctionPool* fnctpool, QWidget* parent=0);
  ~ScrProgBrowser(void);

  // convenience access to program
  WspVariablePool* VariablePool(void) {return mProgWidget->VariablePool();};
  WspFunctionPool* FunctionPool(void) {return mProgWidget->FunctionPool();};
  int Size(void) const { return mProgWidget->Size(); };
  ScrOperation* OperationAt(int pos) const { return mProgWidget->OperationAt(pos); };
  int OperationFind(const QString name) const { return mProgWidget->OperationFind(name); };

  // access to program widget
  ScrProgWidget* Program(void) { return mProgWidget;}

  // record/query user changes 
  bool Modified(void) const;
  virtual void Modified(bool ch);

public slots:

  // convenience access to program
  void Clear() { mProgWidget->Clear(); };

  // convenience access for file io
  void  Read(faudes::TokenReader& rTr) { mProgWidget->Read(rTr); Modified(false); };
  void  Write(faudes::TokenWriter& rTw) { mProgWidget->Write(rTw); Modified(false); };

  // Receive configuration changes from child (by user)
  void ChildModified(bool);

signals:

  // request for status message
  void TextMessage(const QString& message, int time); 

  // Configuration changed (by user)
  void NotifyModified(bool);

protected:

  // my program widget (incl program)
  ScrProgWidget* mProgWidget;

  // my layout
  QVBoxLayout* mVbox;

  // Record modified state
  bool mModified;
 
};


/* 
 ******************************************
 ******************************************
 ******************************************

 A ScrProgDelegate is an QItemDelegate that
 uses a ScrOpWidget for editing

 ******************************************
 ******************************************
 ******************************************
 */
/*


class ScrProgDelegate : public QItemDelegate {

  Q_OBJECT

public:
  // construct
  ScrProgDelegate(QObject *parent = 0);

  // reimplement: track editor events
  bool editorEvent (QEvent *event, QAbstractItemModel *model, const QStyleOptionViewItem& option, 
    const QModelIndex & index );

  // reimplement: create editor
  QWidget *createEditor(QWidget *parent, const QStyleOptionViewItem &option,
    const QModelIndex &index) const;

  // reimplement: initialze editor data
  void setEditorData(QWidget *editor, const QModelIndex &index) const;

  // reimplement: write data to model
  void setModelData(QWidget *editor, QAbstractItemModel *model, const QModelIndex &index) const;

  // reimplement: resizing
  void updateEditorGeometry(QWidget *editor, const QStyleOptionViewItem &option, const QModelIndex &index) const;

  // reimplement: desired size of editor/painter
  QSize sizeHint(const QStyleOptionViewItem & option, const QModelIndex & index) const;

  QSize mSizeHint;
};

*/

#endif
