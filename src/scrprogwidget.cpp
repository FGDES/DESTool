/* scrprogwidget.h  -  widget to represent program   */


/*
   Visual skripting for FAU Discrete Event Systems Library (libfaudes)

   Copyright (C) 2006, 2007  Thomas Moor, Klaus Schmidt, Sebastian Perk

*/

#include "scrprogwidget.h"
#include "desstyle.h"


/* 
 ******************************************
 ******************************************
 ******************************************

 implementation of scrprogwidget

 ******************************************
 ******************************************
 ******************************************
 */

// construct
ScrProgWidget::ScrProgWidget(
  WspVariablePool* varpool, WspFunctionPool* fnctpool, QWidget* parent
) : QScrollArea(parent) 
{
  FD_DS("ScrProgWidget::ScrProgWidget()");

  // construct my program
  mProg = new ScrProgram(varpool,fnctpool,this);
  connect(mProg,SIGNAL(NotifyProperties()),this,SLOT(Update()));

  // my layout
  mContent = new QWidget();
  this->setMinimumWidth(200);
  mVbox = new QVBoxLayout(mContent);
  mVbox->setContentsMargins(0,0,0,0);
  mVbox->setSpacing(0);
  ClearLayout();

  // scroll area properties
  setWidget(mContent);
  setWidgetResizable(true);
  //setVerticalScrollBarPolicy(Qt::ScrollBarAlwaysOn);
  //setHorizontalScrollBarPolicy(Qt::ScrollBarAlwaysOff);

  // content properties
  mContent->setAutoFillBackground(true);

  // accept drops for operation move
  setAcceptDrops(true);

  // init changes reporter
  mModified=false;

  // overwrite
  setSizePolicy(QSizePolicy::Expanding,QSizePolicy::Preferred);

  // context menu 
  mContent->setContextMenuPolicy(Qt::CustomContextMenu);
  connect(mContent,SIGNAL(customContextMenuRequested(QPoint)),
      this,SLOT(ContextMenuAtPoint(QPoint)));
};

// destruct
ScrProgWidget::~ScrProgWidget(void) {
  FD_DS("ScrProgWidget::~ScrProgWidget()");
}; 

// clear my vbox
void ScrProgWidget::ClearLayout(void) {
  FD_DS("ScrProgWidget::ClearLayout()");
  QLayoutItem *child;
  while ((child = mVbox->takeAt(0)) != 0) {
    if(child->widget()) {
      FD_DS("ScrProgWidget::ClearLayout(): layout item " << child->widget()->metaObject()->className());
      delete child->widget();
      delete child;
    }
  }
  mBlank = new QWidget(mContent);
  mBlank->setSizePolicy(QSizePolicy::Preferred,QSizePolicy::Expanding);

  mVbox->addWidget(mBlank);
  mList.clear();
  mSelection.clear();
  mCurrent=0;
  FD_DS("ScrProgWidget::ClearLayout():done ");
};

// clear program
void ScrProgWidget::Clear(void) {
  FD_DS("ScrProgWidget::Clear()");
  // clear layout incl all my widgets
  ClearLayout();
  // delete program
  mProg->Clear(); 
  FD_DS("ScrProgWidget::Clear(): done");
};

// get widget by index
ScrOpWidget* ScrProgWidget::WidgetAt(int pos) {
  if(pos<0 || pos >=Size()) return 0;
  return mList[pos];
}; 

// get widget by coordinates
ScrOpWidget* ScrProgWidget::WidgetAt(QPoint point) {
  FD_DS("ScrProgWidget::WidgetAt()");
  int pos=IndexAt(point);
  return WidgetAt(pos);
}

// get index by coordinates
int ScrProgWidget::IndexAt(QPoint point) {
  FD_DS("ScrProgWidget::IndexAt()");
  // not in scroll area
  if(!mContent->rect().contains(point)) return -1;
  FD_DS("ScrProgWidget::IndexAt(): in area");
  // find in list
  for(int pos=0; pos< mList.size(); pos++) {
    ScrOpWidget* opwidget = mList[pos];
    QWidget* widget=opwidget->parentWidget();  // hack: the frame is 1st level parent ...
    if(widget->geometry().contains(point))    // ... geometry is in 2nd level parent coordinates 
      return pos;
  }
  // find in blank
  if(mBlank->geometry().contains(point))  
    return Size();
  // not found
  FD_DS("ScrProgWidget::IndexAt(): not found");
  return -1;
}

// update from model
int ScrProgWidget::InsertWidgetAt(int pos) {
  FD_DS("ScrProgWidget::InsertWidgetAt(" << pos << ")");
  // get operation
  ScrOperation* op = mProg->At(pos); 
  if(!op) return 1;
  FD_DS("ScrProgWidget::InsertWidgetAt(" << pos << "): operation " << VioStyle::StrFromQStr(op->Function()));
  // have a frame
  QFrame* frame = new QFrame(mContent);
  frame->setFrameStyle(QFrame::Panel | QFrame::Raised);
  frame->setLineWidth(2);  
  QHBoxLayout* hbox = new QHBoxLayout(frame);
  hbox->setContentsMargins(0,0,0,0);
  hbox->setSpacing(0);

  ScrOpWidget* opwidget= new ScrOpWidget(frame);
  opwidget->setModel(op);
  hbox->addWidget(opwidget);

 
  connect(opwidget,SIGNAL(NotifyModified(bool)),this,SLOT(ChildModified(bool)));
  // add to my layout
  frame->setSizePolicy(QSizePolicy::Minimum, QSizePolicy::Fixed);
  mVbox->insertWidget(pos,frame);
  mList.insert(pos,opwidget);
  return 0;
}


// prepare remove from mode
int ScrProgWidget::RemoveWidgetAt(int pos) {
  if(pos<0 || pos>=Size()) return 1;
  FD_DS("ScrProgWidget::RemoveWidgetAt(" << pos << ")");
  // delete the actual operation widget incl frame
  QLayoutItem* frame=mVbox->takeAt(pos);
  if(frame) {
    if(frame->widget()) delete frame->widget();
    delete frame;
  }
  // delete entry from list
  mList.removeAt(pos);
  // done
  return 0;
}


// update all from model
void ScrProgWidget::Update(void) {
  FD_DS("ScrProgWidget::Update(): todo: #" << mProg->Size());
  // clear my layout incl widgets
  ClearLayout();
  // repopulate
  for(int pos=0; pos<mProg->Size(); pos++ ) 
    InsertWidgetAt(pos);
  FD_DS("ScrProgWidget::Update(): done: #" << mVbox->count()-1);
}


// insert operation by description
int ScrProgWidget::OperationInsert(int pos, QString descr) {
  FD_DS("ScrProgWidget::OperationInsert(pos,op): " << VioStyle::StrFromQStr(descr));
  // create new luafunction
  if(descr=="New Lua Extension") {
    FD_DS("ScrProgWidget::OperationInsert(): create");
    FunctionPool()->AppendAnonymous();
    descr = FunctionPool()->At(FunctionPool()->Size()-1)->Name();
    FD_DS("ScrProgWidget::OperationInsert(): created" << VioStyle::StrFromQStr(descr));
  }
  // fix pos
  if(pos>=Size()) pos=Size();
  if(pos<0) pos=0;
  // insert operation
  mProg->InsertAnonymous(pos);
  // set function
  ScrOperation* op= mProg->At(pos);
  op->FunctionDefinition(descr);
  // fix selection
  SelectNothing();
  Select(pos,true);
  Modified(true); // must have been user interaction
  FD_DS("ScrProgWidget::OperationInsert(): ok with op at " << op);
  return 0;
}

// operation insert by sender
int ScrProgWidget::OperationInsert(void) {
  FD_DS("ScrProgWidget::OperationInsert()");
  // figure type by descr
  if(!sender()) return 1;
  QVariant prop = sender()->property("Function");
  QString  descr=prop.toString();
  // doit
  return OperationInsert(mCurrent,descr);
}

// append operation
int ScrProgWidget::OperationAppend(QString descr) {
  return OperationInsert(Size(),descr);
}

// remove operation
int ScrProgWidget::OperationRemove(int pos) {
  FD_DS("ScrProgWidget::OperationRemove(" << pos << ")");
  if(pos<0 || pos>=Size()) return 1;
  // fix selection
  SelectNothing();
  // doit
  mProg->Erase(pos);
  // done
  return 0;
}

// remove operation
int ScrProgWidget::OperationMove(int src, int dst) {
  FD_DS("ScrProgWidget::OperationMove(" << src << ", " << dst << ")");
  // fix selection
  SelectNothing();
  // doit
  if(!mProg->Move(src,dst)) return 1;
  // update
  Update();
  SelectNothing();
  Select(dst,true);
  Modified(true); // must have been user interaction
  FD_DS("ScrProgWidget::OperationMove(" << src << ", " << dst << "): done");
  return 0;
}


// init
ScrProgram::ProgramState ScrProgWidget::Initialize(void) {
  mCurrent=0;
  SelectNothing();
  Select(mCurrent,true);
  return mProg->Initialize(); 
};



// execute on operation (no break, no stop)
ScrProgWidget::ProgramState ScrProgWidget::Execute(int pos) {
  FD_DS("ScrProgWidget::Execute(int pos): " << pos);
  // ask for operation
  ScrOperation* op=mProg->At(pos);
  if(!op) return mProg->State();
  // clear user break (this should be automatic?)
  VioStyle::FaudesBreakClr();
  // save external data
  mProg->VariablePool()->SaveAll();
  mProg->FunctionPool()->SaveAll();
  // select
  SelectNothing();
  Select(pos);
  QApplication::processEvents(QEventLoop::ExcludeUserInputEvents);
  // doit
  FD_QP("Executing step " << pos+1 << "/"<< mProg->Size() << "  " << VioStyle::StrFromQStr(op->Function()));
  emit TextMessage(QString("%1").arg(pos) + ": " + op->Function()+" ...",0);
  QApplication::processEvents(QEventLoop::ExcludeUserInputEvents);
  ScrExecute exec(op);
  exec.Execute();
  emit TextMessage(QString("%1").arg(pos) + ": " + op->Function()+": done.",5000);
  // done
  QApplication::processEvents(QEventLoop::ExcludeUserInputEvents);
  return mProg->State();
}


// execute current operation (no break, no stop, proceed on success)
ScrProgWidget::ProgramState ScrProgWidget::Execute(void) {
  Execute(mCurrent);
  // proceed if it's now done
  bool ok=false;
  ScrOperation* op=mProg->At(mCurrent);
  if(op) ok = op->State()==ScrOperation::Done;
  // proceed && select 
  SelectNothing();
  if(ok) mCurrent=mProg->Next(mCurrent);
  Select(mCurrent);
  FD_DS("ScrProgWidget::Execute(): done with next " << mCurrent);
  return mProg->State();
}


// step next if ready
ScrProgWidget::ProgramState ScrProgWidget::Step(void) {
  //return mProg->Step();
  FD_DS("ScrProgWidget::Step()");
  // ask for next operation
  ScrOperation* op=mProg->At(mCurrent);
  if(!op) return mProg->State();
  // is it ready?
  ScrOperation::OperationState ostate = op->State();
  if(ostate!=ScrOperation::Ready) return mProg->State();
  // doit
  Execute(mCurrent);
  // select 
  SelectNothing();
  mCurrent=mProg->Next(mCurrent);
  Select(mCurrent);
  return mProg->State();
}


// run all operations
ScrProgWidget::ProgramState ScrProgWidget::Run(void) {
  FD_DS("ScrProgWidget::Run()");
  emit TextMessage("Running script ...",0);
  FD_QP("Run program");
  // save external data
  mProg->VariablePool()->SaveAll();
  mProg->FunctionPool()->SaveAll();
  //mProg->VariablePool()->SaveChanges();
  Initialize(); 
  // doit 
  QApplication::processEvents(QEventLoop::ExcludeUserInputEvents);
  // loop
  while(true) {
    ProgramState state=Step();
    if(state==ScrProgram::Error) break;
    if(state==ScrProgram::Done) break;
    if(mCurrent==-1) break;
  } 
  // check results
  mProg->SaveResults(); 
  emit TextMessage("Running script: done.",5000);
  SelectNothing();
  return mProg->State();
}


// Selection: get
QSet<int> ScrProgWidget::Selection(void) { return mSelection;};

// Selection: clear
void ScrProgWidget::SelectNothing(void) { 
  foreach(int pos, mSelection) // runs on copy
     Select(pos,false);
}

// Selection: set
void ScrProgWidget::Select(int pos, bool sel) { 
  if(pos<0 || pos >=Size()) return;
  if(sel) {
    mSelection.insert(pos);
    ScrOpWidget* op=WidgetAt(pos);
    if(!op) return;
    op->setSelected(true);
    ensureWidgetVisible(op);
  }
  if(!sel) {
    mSelection.remove(pos);
    ScrOpWidget* op=WidgetAt(pos);
    if(!op) return;
    op->setSelected(false);
  }
}

// Selection: remove
void ScrProgWidget::DeleteSelection(void) {
  QList<int> selpos(Selection().begin(),Selection().end());
  std::sort(selpos.begin(),selpos.end());
  for(int i=selpos.size()-1; i>=0; i--) {
    OperationRemove(selpos[i]);
  }
  Modified(true);
}


// Modified: query changes (dont emit signal)
bool ScrProgWidget::Modified(void) const { 
  return mModified;
};

// Modified: collect and pass on modifications of childs
void ScrProgWidget::ChildModified(bool changed) { 
  // ignre netagtives
  if(!changed) return;
  // report
  FD_DI("ScrProgWidget::ChildModified(1): model modified " << mModified);
  Modified(true);
};

// Modified: record changes and emit signal
void ScrProgWidget::Modified(bool ch) { 
  // set
  if(!mModified && ch) {
    FD_DI("ScrProgWidget::Modified(): emit postive modified notification");
    mModified=true;
    emit NotifyModified(mModified);
  }
  // pass on clear
  if(mModified && !ch) {
    foreach(ScrOpWidget* opwidget,mList) 
       opwidget->Modified(false);
  }
  // clr
  if(mModified && !ch) {
    mModified=false;
    FD_DI("ScrProgWidget::Modified(): emit negative modified notification");
    emit NotifyModified(mModified);
  }
}



// events: mouse press
void ScrProgWidget::mousePressEvent(QMouseEvent *event) {
  FD_DS("ScrProgWidget::mousePressEvent(" << event->x() << "," << event->y() << ")");
  // map to content widget
  QPoint cpos = mContent->mapFromGlobal(mapToGlobal(event->pos())); 
  FD_DS("ScrProgWidget::mousePressEvent(" << cpos.x() << "," << cpos.y() << ")");
  // find
  int pos = IndexAt(cpos);
  FD_DS("ScrProgWidget::mousePressEvent(" << pos << ")");
  ScrOpWidget* op = WidgetAt(pos);
  // pass on
  if(!op) {
    mCurrent=-1;
    SelectNothing();
    QWidget::mousePressEvent(event);
    return;
  }
  FD_DS("ScrProgWidget::mousePressEvent(): operation found: " << VioStyle::StrFromQStr(op->model()->Name()));
  // set current
  if(event->button() == Qt::LeftButton) {
    mCurrent=pos;
    mDragSrcOperation=pos;
    mDragSrcPosition=cpos;
  }
  // select one widget
  if(event->button() == Qt::LeftButton && event->modifiers()==Qt::NoModifier) {
    SelectNothing();
    Select(pos,true);
  }
  // accumulate selection 
  if(event->button() == Qt::LeftButton && event->modifiers()==Qt::ControlModifier) {
    Select(pos,!op->isSelected());
  }
  // call parent
  QWidget::mousePressEvent(event);
}

// events: mouse move
void ScrProgWidget::mouseMoveEvent(QMouseEvent *event) {
  // map to content widget
  QPoint cpos = mContent->mapFromGlobal(mapToGlobal(event->pos())); 
  // trigger drag
  if((cpos - mDragSrcPosition).manhattanLength() > QApplication::startDragDistance()) {
     FD_DS("ScrProgWidget::mouseMoveEvent(" << cpos.x() << "," << cpos.y() << "): drag");
     // figure source operation to drag
     ScrOpWidget* srcwidget= WidgetAt(mDragSrcOperation);
     ScrOperation* srcop= OperationAt(mDragSrcOperation);
     if(!srcwidget) return;
     if(!srcop) return;
     // install qt drag event
     QDrag *drag = new QDrag(this);
     QMimeData *mimeData = new QMimeData;
     mimeData->setText("DragScrOperation");
     drag->setMimeData(mimeData);
     QPixmap pixmap= srcwidget->grab();
     drag->setPixmap(pixmap.scaledToWidth(100));
     // run drag event
     Qt::DropAction dropAction = drag->exec(Qt::MoveAction);
     // should do: check result 
     if(dropAction==Qt::MoveAction)
       OperationMove(mDragSrcOperation, mDragDstOperation);
     FD_DS("ScrProgWidget::mouseMoveEvent(): " << mDragSrcOperation << "->" << mDragDstOperation << 
       ": done");
  }
}


// my context menu
void ScrProgWidget::ContextMenuAtPoint(QPoint point) {
  int pos=IndexAt(point);
  FD_DS("ScrProgWidget::ContextMenuAtPoint(): for " << pos);
  if(!mProg) return;
  mProg->RunContextMenu(mContent->mapToGlobal(point),pos);
}

// reimplement: keyboard
void ScrProgWidget::keyPressEvent(QKeyEvent* event) {
  FD_DS("ScrProgWidget::keyPressEvent(" << event->key() << ")");
  switch(event->key()) {
  /*
  case Qt::Key_Insert:
  case Qt::Key_I: // debug mac osx
  */
  // delete selection
  case Qt::Key_Delete:
  case Qt::Key_Backspace:
    DeleteSelection(); 
  break;
  // pass on to parent
  default:
    FD_DS("ScrProgWidget::keyPressEvent(" << event->key() << "): pass on");
    QWidget::keyPressEvent(event);
  }
}

// reimplement: drag enter (accept plain text)
void ScrProgWidget::dragEnterEvent(QDragEnterEvent *event){
  if(event->mimeData()->hasFormat("text/plain"))
     event->acceptProposedAction();
}


// reimplement: drop event (mimique internal move)
void ScrProgWidget::dropEvent(QDropEvent *event){
  // map to content widget
  QPoint cpos = mContent->mapFromGlobal(mapToGlobal(event->position().toPoint())); 
  // report
  FD_DS("ScrProgWidget::dropEvent(" << cpos.x() << "," << cpos.y() << ")");
  // reject invalid actions
  if(event->proposedAction()!=Qt::MoveAction &&  event->proposedAction()!=Qt::CopyAction) 
    return;
  // accept action
  event->acceptProposedAction();
  // find target operation
  int pos = IndexAt(cpos);
  if(pos>=Size()) pos=Size()-1;
  if(pos<0) pos=0;
  FD_DS("ScrProgWidget::dropEvent(): target index: " << pos);
  mDragDstOperation=pos;
}

/* 
 ******************************************
 ******************************************
 ******************************************

 implementation of scrprogbrowser

 ******************************************
 ******************************************
 ******************************************
 */



// construct
ScrProgBrowser::ScrProgBrowser(
  WspVariablePool* varpool, WspFunctionPool* fnctpool, QWidget* parent
) : QWidget(parent) {
  FD_DS("ScrProgBrowser::ScrProgBrowser()");

  // construct my program widget
  mProgWidget = new ScrProgWidget(varpool,fnctpool,this);

  // my buttons
  QPushButton* initbutton = new QPushButton("Init.");
  connect(initbutton,SIGNAL(pressed()),mProgWidget,SLOT(Initialize()));
  QPushButton* stepbutton = new QPushButton("Step");
  connect(stepbutton,SIGNAL(pressed()),mProgWidget,SLOT(Execute()));
  QPushButton* runbutton = new QPushButton("Exec.");
  connect(runbutton,SIGNAL(pressed()),mProgWidget,SLOT(Run()));

  // script layout
  QVBoxLayout* vbox1= new QVBoxLayout();
  vbox1->setContentsMargins(2,2,2,2);
  vbox1->setSpacing(2);
  vbox1->addWidget(mProgWidget);
  QGroupBox* gbox1=new QGroupBox();
  gbox1->setTitle("List of Operations");
  gbox1->setLayout(vbox1);
  gbox1->setSizePolicy(QSizePolicy::Preferred,QSizePolicy::Expanding);
  

  // button layout  
  QHBoxLayout* hbox2 = new QHBoxLayout();
  hbox2->setContentsMargins(0,0,0,0);
  hbox2->setSpacing(10);
  hbox2->addWidget(initbutton);
  hbox2->addWidget(stepbutton);
  hbox2->addStretch(10);
  hbox2->addWidget(runbutton);
  QVBoxLayout* vbox2= new QVBoxLayout();
  vbox2->setContentsMargins(2,2,2,2);
  vbox2->setSpacing(2);
  vbox2->addLayout(hbox2);
  QGroupBox* gbox2=new QGroupBox();
  gbox2->setTitle("Controls");
  gbox2->setLayout(vbox2);

  // overwrite
  gbox2->setSizePolicy(QSizePolicy::Preferred,QSizePolicy::Fixed);


  // my overall layout
  mVbox = new QVBoxLayout(this);
  mVbox->setContentsMargins(2,2,2,2);
  mVbox->setSpacing(0);
  mVbox->addWidget(gbox1);
  mVbox->addWidget(gbox2);


  // init changes reporter
  mModified=false;

  // std modified scheme
  connect(mProgWidget,SIGNAL(NotifyModified(bool)),this,SLOT(ChildModified(bool)));

  // pass on text message requaests
  connect(mProgWidget,SIGNAL(TextMessage(const QString&,int)),this,SIGNAL(TextMessage(const QString&,int)));

};

// destruct
ScrProgBrowser::~ScrProgBrowser(void) {
  FD_DS("ScrProgBrowser::~ScrProgBrowser()");
}; 


// Modified: query changes (dont emit signal)
bool ScrProgBrowser::Modified(void) const { 
  return mModified;
};

// Modified: collect and pass on modifications of childs
void ScrProgBrowser::ChildModified(bool changed) { 
  // ignre netagtives
  if(!changed) return;
  // report
  FD_DI("ScrProgBrowser::ChildModified(1): model modified " << mModified);
  Modified(true);
};

// Modified: record changes and emit signal
void ScrProgBrowser::Modified(bool ch) { 
  // set
  if(!mModified && ch) {
    FD_DI("ScrProgBrowser::Modified(): emit postive modified notification");
    mModified=true;
    emit NotifyModified(mModified);
  }
  // pass on clear
  if(mModified && !ch) {
    mProgWidget->Modified(false);
  }
  // clr
  if(mModified && !ch) {
    mModified=false;
    FD_DI("ScrProgBrowser::Modified(): emit negative modified notification");
    emit NotifyModified(mModified);
  }
}


/* 
 ******************************************
 ******************************************
 ******************************************

 implementation of scrprogdelegate

 ******************************************
 ******************************************
 ******************************************
 */

/*

// construct
ScrProgDelegate::ScrProgDelegate(QObject *parent) : QItemDelegate(parent) {
};

// track editor events
bool ScrProgDelegate::editorEvent (
    QEvent *event, 
    QAbstractItemModel *model, 
    const QStyleOptionViewItem& option, 
    const QModelIndex & index ) {
  FD_DS("ScrProgDelegate::EditorEvent()");
  return QItemDelegate::editorEvent(event,model,option,index);
};


// use ScrOpWidget as editor
QWidget* ScrProgDelegate::createEditor(
    QWidget *parent, 
    const QStyleOptionViewItem &option, 
    const QModelIndex &index) const {
  FD_DS("ScrProgDelegate::createEditor()");
  ScrOpWidget* opwidget = new ScrOpWidget(parent);
  setEditorData(opwidget,index);
  *const_cast<QSize*>(&mSizeHint)=opwidget->sizeHint();
  FD_DS("ScrProgDelegate::createEditor(): height " << mSizeHint.height());
  opwidget->setMinimumHeight(opwidget->sizeHint().height());
  return opwidget;
};


// set scropwidget dta from operation in program
void ScrProgDelegate::setEditorData(QWidget *editor, const QModelIndex &index) const {
  ScrOpWidget* opwidget = qobject_cast<ScrOpWidget*>(editor);
  if(!opwidget) return;
  const ScrProgram* prog = qobject_cast<const ScrProgram*>(index.model());
  if(!prog) return;
  int pos = index.row();
  if(pos<0 || pos>= prog->Size()) return;
  opwidget->setModel(prog->OperationAt(pos));
};

// set model data from scropwidget: note necessary
void ScrProgDelegate::setModelData(QWidget *editor, QAbstractItemModel *model,
    const QModelIndex &index) const {
  //QSpinBox *spinBox = static_cast<QSpinBox*>(editor);
  //spinBox->interpretText();
  //int value = spinBox->value();
  //model->setData(index, value);
};

// set geometry of editor aka scropwidget
void ScrProgDelegate::updateEditorGeometry(QWidget *editor,
     const QStyleOptionViewItem &option, const QModelIndex & index ) const {
  //editor->setGeometry(QSize(100,100));
  editor->setGeometry(option.rect);
};

// tell view preferred geometry 
QSize ScrProgDelegate::sizeHint(const QStyleOptionViewItem & option, const QModelIndex & index) const  {
  FD_DS("ScrProgDelegate::sizeHint(..): option " << option.state << " row " << index.row());

  //if(!(QStyle::State_Active & option.state))  return QItemDelegate::sizeHint(option,index);
  //return QItemDelegate::sizeHint(option,index);

  //if(mSizeHint.isValid()) return mSizeHint;
  return QItemDelegate::sizeHint(option,index);
  //QSize res(100,100);
  return QSize(100,100);
};

*/

/*


 // show the program
 QListView* progview = new QListView();
 progview->setModel(&mProgram);
 ScrProgDelegate* deleg = new ScrProgDelegate();
 progview->setItemDelegate(deleg);
 progview->setResizeMode(QListView::Adjust);
 progview->setUniformItemSizes(false);
 progview->show();

*/
