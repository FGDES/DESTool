/** @file wspviews.cpp  - Implementation */

/*
	FAU Discrete Event Systems Library (libfaudes)

	Copyright (C) 2009 Ruediger Berndt
	Copyright (C) 2009 Thomas Moor
*/


#include "wspviews.h"
#include "desbrowser.h"




/***************************************************************
****************************************************************
****************************************************************

implementation: wsp item view

****************************************************************
****************************************************************
****************************************************************/

// construct
WspItemView::WspItemView(WspPool* pool, QWidget* parent) :
  QWidget(parent),
  pPool(pool),
  pItem(0),
  mContent(0),
  mSatelite(0),
  mFollowPool(false)
{
  FD_DI("WspItemView::WspItemView()");
  // splitter construct
  mSplitter = new QSplitter();
  QWidget* lwid = new QWidget();
  QWidget* rwid = new QWidget();
  mSplitter->addWidget(lwid);
  mSplitter->addWidget(rwid);
  rwid->hide();
  mLbox = new QVBoxLayout(lwid);
  mLbox->setContentsMargins(0,0,0,0);
  mLbox->setSpacing(0);  
  mRbox = new QVBoxLayout(rwid);
  mRbox->setContentsMargins(0,0,0,0);
  mRbox->setSpacing(0);  

  // my layout
  mVbox = new QVBoxLayout(this);
  mVbox->setContentsMargins(0,0,0,0);
  mVbox->setSpacing(0);  
  mVbox->addWidget(mSplitter);

  // if we have a pool, follow then show requests
  if(pPool) {
    connect(pPool,SIGNAL(ShowItemRequest(QString,bool)),this,SLOT(ShowItem(QString,bool)));
  }
}

// destruct
WspItemView::~WspItemView() {
  FD_DI("WspItemView::~WspItemView()");
}

// get model
const WspItem* WspItemView::Model(void) const {
  return pItem;
};

// set model
void WspItemView::Model(WspItem* item) {
  FD_DI("WspItenView::Model(): set");
  // disconnect
  if(pItem) {
    FD_DI("WspItemView::Model(): disconnect");
    Satelite(0);
    Content(0);
    pItem=0;
  }
  // connect
  if(item) {
    FD_DI("WspItemView::Model(): connect to " << VioStyle::StrFromQStr(item->Name()));
    if(pPool) disconnect(pPool,SIGNAL(ShowItemRequest(QString,bool)),this,0);
    if(pItem) disconnect(pItem,SIGNAL(ShowItemRequest(QString,bool)),this,0);
    pItem=item;
    pPool=pItem->Pool();
    if(pItem->Visual()) {
      Content(pItem->NewMainWidget());
    }
    if(pItem->Visual() && pItem->ViewSatelite()) {
      Satelite(pItem->NewSateliteWidget());
    }
    if(mFollowPool) {
      if(pPool) connect(pPool,SIGNAL(ShowItemRequest(QString,bool)),this,SLOT(ShowItem(QString,bool)));
      else connect(pItem,SIGNAL(ShowItemRequest(QString,bool)),this,SLOT(ShowItem(QString,bool)));
    }
  }  
  FD_DI("WspItemView::Model(): done");
}

// set content
void WspItemView::Content(QWidget* widget) {
  if(mContent) {
    FD_DI("WspItemView::Content(): clear");
    mLbox->removeWidget(mContent);
    delete mContent;
    mContent=0;
  }
  if(widget) {
    mContent=widget;
    mContent->setParent(0); // must be 0 anyway
    mLbox->addWidget(mContent);
  }
  // tell others
  emit NotifyContent();
}

// get content
QWidget* WspItemView::Content(void) {
  return mContent;
}

// set satelite
void WspItemView::Satelite(QWidget* widget) {
  if(mSatelite) {
    FD_DI("WspItemView::Satelite(): clear");
    mRbox->removeWidget(mSatelite);
    delete mSatelite;
    mSatelite=0;
    mSplitter->widget(1)->hide();
  }
  if(widget) {
    FD_DI("WspItemView::Satelite(): set w " << widget->minimumWidth());
    mSatelite=widget;
    mSatelite->setParent(0); // must be 0 anyway
    mSplitter->widget(1)->show();
    mRbox->addWidget(mSatelite);
    QList<int> sz;
    int w = mSplitter->width(); 
    sz.push_back(w  - mSatelite->minimumWidth());
    sz.push_back(mSatelite->minimumWidth());
    mSplitter->setSizes(sz);
  }
}

// get satelite
QWidget* WspItemView::Satelite(void) {
  return mSatelite;
}

// connect
void WspItemView::ShowItem(QString itemname, bool show) {
  FD_DI("WspItemView::ShowItem(): " << VioStyle::StrFromQStr(itemname) << " " << show);
  // hide my content
  if(!show) {
    if(!pItem) return;
    if(itemname!=pItem->Name()) return;
    Model(0);
  }
  // try to show that item
  if(show) {
    if(!pPool) return;
    if(!pPool->Exists(itemname)) return;
    Model(pPool->At(itemname));
  }
}


/*
 ************************************************
 ************************************************
 ************************************************
 ************************************************

 implementation  WspItemWindow

 ************************************************
 ************************************************
 ************************************************
 ************************************************
 */

// construct
WspItemWindow::WspItemWindow(WspItem* item, DesProjectBrowser* browser) : QMainWindow() {
  FD_DI("WspItemWindow::WspItemWindow(" << VioStyle::StrFromQStr(item->Name()) << ")");

  // record context
  pItem = item;
  pBrowser = browser;

  // restore geometry
  QSettings settings;
  restoreGeometry(settings.value("geometry:item:"+pItem->Name()).toByteArray());

  // construct widget 
  mView=pItem->NewView();
  mView->Model(pItem);
  setCentralWidget(mView);
  setWindowTitle(pItem->Title()+"[*]");
  setAttribute(Qt::WA_DeleteOnClose);
  setWindowModified(pItem->Modified());


  // hide when item leaves
  connect(pItem,SIGNAL(ShowItemRequest(const QString&, bool)), this, SLOT(Show(const QString&, bool)));

  // track modified flag
  connect(pItem,SIGNAL(NotifyModified(bool)),this,SLOT(setWindowModified(bool)));

  // track changes in name
  connect(pItem,SIGNAL(NotifyProperties()),this,SLOT(Update()));

  // get menus from browser 
  if(pBrowser) {
    menuBar()->addMenu(pBrowser->CreateFileMenu(this));
    menuBar()->addMenu(pBrowser->CreateEditMenu(this));
    menuBar()->addMenu(pBrowser->CreateViewMenu(this));
    menuBar()->addMenu(pBrowser->CreateWindowsMenu(this));
    menuBar()->addMenu(pBrowser->CreateHelpMenu(this));
  }

  // have statusbar
  statusBar();
  connect(pItem, SIGNAL(StatusMessage(const QString&)), 
    this, SLOT(StatusBarMessage(const QString&)));

  FD_DI("WspItemWindow::WspItemWindow(" << VioStyle::StrFromQStr(item->Name()) << "): done");
};


// when we are shown (with dummy)
void WspItemWindow::Show(const QString& name, bool on) {
  if(name!=Name()) return;
  Show(on);
}

// when we are shown
void WspItemWindow::Show(bool on) {
  FD_DI("WspItemWindow::Show(" << on << "): " << VioStyle::StrFromQStr(Name()));
  // trivial
  if(on) return;
  // close TODO
}

// get window title (defaults to name of item)
const QString& WspItemWindow::Title(void)  const {
  return pItem->Name();
};

// get item 
const WspItem* WspItemWindow::Item(void) const {
  return pItem;
};

// get item name 
const QString& WspItemWindow::Name(void)  const {
  return pItem->Name();
};

// get id
int WspItemWindow::Id(void) const {
  return pItem->Id();
};

// update properties (name, type, etc ... invalid references) 
void WspItemWindow::Update(void)  {
  FD_DI("WspItemWindow::Update(): " << VioStyle::StrFromQStr(Name()));

  mView=pItem->NewView();
  mView->Model(pItem);
  setCentralWidget(mView);
  setWindowTitle(pItem->Title()+"[*]");
  setAttribute(Qt::WA_DeleteOnClose);
  setWindowModified(pItem->Modified());


  update();
  FD_DI("WspItemWindow::Update(): done");
};


// allert changes
void WspItemWindow::closeEvent(QCloseEvent* event) {
  FD_DI("WspItemWindow::closeEvent(): " << VioStyle::StrFromQStr(Name()));

  // save window state
  QSettings settings;
  settings.setValue("geometry:item:" + Name(), saveGeometry());
 
  // changes allert
  if(pItem->Modified()) 
  if(pItem->FileLinked()) 
  {
    int ret = QMessageBox::warning(this, tr("vioGen"),
      tr("Variable \"%1\" has been modified.").arg(Name()),
         QMessageBox::Save | QMessageBox::Discard | QMessageBox::Cancel, QMessageBox::Save);
     if(ret == QMessageBox::Save) {
       pItem->Save(); 
     } 
     if(ret == QMessageBox::Discard) {
       pItem->Modified(false);
     }  
     if(ret == QMessageBox::Cancel) { 
       event->ignore(); 
       return;
     }
  }

  // call base
  QMainWindow::closeEvent(event);

  FD_DI("WspItemWindow::closeEvent(): " << VioStyle::StrFromQStr(Name()) << " B");

  // tell var that were gone
  pItem->Shown(false);

  FD_DI("WspItemWindow::closeEvent(): " << VioStyle::StrFromQStr(Name()) << " C");
}


// track focus
bool WspItemWindow::event(QEvent* ev) {
  // track focus
  if(ev->type()==QEvent::WindowActivate) {
    FD_DI("WspItemWindow::event(): WindowActivate for " << VioStyle::StrFromQStr(Name()));
    emit NotifyWindowActivate(Id());
  }
  // pass on
  return QMainWindow::event(ev); 
}

// destruct
WspItemWindow::~WspItemWindow(void) {
  FD_DI("WspItemWindow::~WspItemWindow(): " << VioStyle::StrFromQStr(Name()) << " : ok");
};

// helper: disply status
void WspItemWindow::StatusBarMessage(const QString& message, int time) {
  FD_DI("WspItemWindow::StatusbarMessage(): " << VioStyle::StrFromQStr(message));
  statusBar()->showMessage(message,time);
}




/* 
 ******************************************
 ******************************************
 ******************************************

 properties widget

 ******************************************
 ******************************************
 ******************************************
 */


WspPropertiesView::WspPropertiesView(WspPool* pool, QWidget *parent) 
  : QWidget(parent) 
{
  FD_DI("WspPropertiesView::WspPropertiesView()");

  // keep ref to varpool
  pPool = pool;

  // overall layout
  mVbox = new QVBoxLayout(this);
  mVbox->setContentsMargins(2,2,2,2);
  mVbox->setSpacing(2);
  mVbox->addStretch(1);

  // edit name
  mEditName=new QLineEdit(this);  
  mEditName->setText("< no item >");
  mEditName->setReadOnly(true);
  mEditName->setValidator(new VioSymbolValidator(mEditName));
  QObject::connect(mEditName,SIGNAL(editingFinished()),this,SLOT(ReName()));

  // edit label
  QLabel* edla = new QLabel(this);
  edla->setText("Name:");
  edla->setBuddy(mEditName);

  // edit hbox
  QHBoxLayout* hbox1= new QHBoxLayout();
  hbox1->addWidget(edla);
  hbox1->addStretch(10);
  hbox1->addWidget(mEditName);
  mVbox->addLayout(hbox1);
  mVbox->addSpacing(10);

  // checkboxes: persistent
  mCheckPersistent = new QCheckBox();
  mCheckPersistent->setText("Persistent");
  mCheckPersistent->setCheckable(true);
  mVbox->addWidget(mCheckPersistent);

  // checkboxes: link to file
  mCheckFile = new QCheckBox();
  mCheckFile->setText("External File");
  mCheckFile->setCheckable(true);
  mVbox->addWidget(mCheckFile);

  // checkboxes: visual
  mCheckVisual = new QCheckBox();
  mCheckVisual->setText("Visual Representation");
  mCheckVisual->setCheckable(true);
  mVbox->addWidget(mCheckVisual);

  // connect checkboxes (we writing to the item)
  QObject::connect(mCheckFile,SIGNAL(clicked(bool)),this,SLOT(Commit()));
  QObject::connect(mCheckPersistent,SIGNAL(clicked(bool)),this,SLOT(Commit()));
  QObject::connect(mCheckVisual,SIGNAL(clicked(bool)),this,SLOT(Commit()));
  // connect item (others writing to the item, incl. delete)
  QObject::connect(pPool,SIGNAL(NotifyProperties(void)),this,SLOT(Update(void)));

  // initialize my values
  Update();  // great: non-virtual in constructor ;-)

};

// commit changes
void WspPropertiesView::Commit(void) {
  FD_DI("WspPropertiesView::Commit()");
} 

// change of name
void WspPropertiesView::ReName(void) {
  // bail out on no sender
  if(!sender()) return;
  // figure name
  QString newname=mEditName->text();
  // bail out on nop
  /*
  if(mVariable==newname) return;
  FD_DI("WspPropertiesView::ReName("<< VioStyle::StrFromQStr(mVariable)  << ", " << VioStyle::StrFromQStr(newname) << ")");
  // ask for rename
  if(pPool->ReName(mVariable,newname)) {
    // how to track selection
  }
  */
} 

// update from item
void WspPropertiesView::Update(void) {
  // if connected
  /*
  WspItem* item = 0; //pVarPool->At(mVariable);
  if(item) {
    // get name
    mEditName->setText(item->Name());
    mEditName->setReadOnly(false);
    // get type
    mComboType->setCurrentIndex(mComboType->findText(item->FaudesType()));
    mComboType->setEnabled(true);
    // get checkboxes
    mCheckPersistent->setChecked(item->Persistent());
    mCheckFile->setChecked(item->FileLinked());
    mCheckVisual->setChecked(item->Visual());
    mCheckSuper->setChecked(item->Supervisor());
    mCheckPlant->setChecked(item->Plant());
    // enable (adjust for elementary types)
    mCheckPersistent->setEnabled(!item->ElementaryType());
    mCheckFile->setEnabled(!item->ElementaryType());
    mCheckVisual->setEnabled(!item->ElementaryType());
    mCheckSuper->setEnabled(true);
    mCheckPlant->setEnabled(true);
    // disable file linkage when base dir is unknown
    mCheckFile->setEnabled(pItemPool->BaseDir()!="");
  } else {
    // set name
    mEditName->setText("< no item >");
    mEditName->setReadOnly(true);
    // disable
    mComboType->setEnabled(false);
    mCheckPersistent->setEnabled(false);
    mCheckFile->setEnabled(false);
    mCheckVisual->setEnabled(false);
    mCheckSuper->setEnabled(false);
    mCheckPlant->setEnabled(false);
  }
  */
} 


/*
 ************************************************
 ************************************************
 ************************************************
 ************************************************

 implementation  WspPoolView

 ************************************************
 ************************************************
 ************************************************
 ************************************************
 */

// constructor
WspPoolView::WspPoolView(QWidget* parent) :
  QTableView(parent)
{
  // configure tabel
  setShowGrid(false);    
  setHorizontalScrollBarPolicy(Qt::ScrollBarAlwaysOff);
  setAlternatingRowColors(true);
  setSelectionMode(QAbstractItemView::ExtendedSelection);
  setSelectionBehavior(QAbstractItemView::SelectRows);
  setSortingEnabled(true);
  setEditTriggers(QAbstractItemView::DoubleClicked | QAbstractItemView::SelectedClicked |
    QAbstractItemView::EditKeyPressed | QAbstractItemView::AnyKeyPressed);
  setDragDropMode(QAbstractItemView::InternalMove);
  //setDragEnabled(true);
  //setAcceptDrops(true);
  setDropIndicatorShown(true);
  //setDragDropOverwriteMode(false);
  verticalHeader()->hide();
  // layout
  setFrameStyle(QFrame::StyledPanel); // better on osx/win/kde
  //setFrameStyle(QFrame::NoFrame);       // better on winnt (aka winxp-classic)
  setMinimumSize(QSize(100,100));
  setSizePolicy(QSizePolicy::Expanding,QSizePolicy::Expanding);
  // context menu 
  setContextMenuPolicy(Qt::CustomContextMenu);
  connect(this,SIGNAL(customContextMenuRequested(QPoint)),
      this,SLOT(ContextMenuAtPoint(QPoint)));
  // configure my modes
  mInsertMode=true;
  mEditing=true;
}

// destructor
WspPoolView::~WspPoolView(void) {
}

// access
WspPool* WspPoolView::Model(void) {
  return qobject_cast<WspPool*>(model());
}

// access
void WspPoolView::Model(WspPool* pool) {
  setModel(pool);
  // layout after set model
  horizontalHeader()->setSectionResizeMode(QHeaderView::Interactive);
  horizontalHeader()->setStretchLastSection(true); 
  // use global selection
  setSelectionModel(pool->SelectionModel());
}


// contextmenu
void WspPoolView::ContextMenuAtPoint(QPoint pos) {
  FD_DI("WspPoolView::ContextMenuAtPoint("<< pos.x()<<", "<<pos.y() << ")");
  QModelIndex index=indexAt(pos);
  if(QTableView* widget=qobject_cast<QTableView*>(sender())) {
    pos=widget->viewport()->mapToGlobal(pos);
  } 
  //else if(QWidget* widget=qobject_cast<QWidget*>(sender())) {
  //  pos=widget->mapToGlobal(pos);
  //}
  ContextMenu(pos,index);
}

// contextmenu
void WspPoolView::ContextMenu(QPoint pos, const QModelIndex& index) {
  FD_DI("WspPoolView::ContextMenuAt("<< index.row() <<", "<<index.column() << ")");
  QString iname="";
  WspItem* witem =Model()->At(index.row());
  if(witem) iname=witem->Name();
  Model()->RunContextMenu(pos,iname);
  UserSelectionClear();
}


// we can select an item
void WspPoolView::UserSelect(const QString& iname, bool on) {
  FD_DI("WspPoolView::UserSelect(): A");
  int pos =Model()->Find(iname);
  if(pos<0) return;
  FD_DI("WspPoolView::UserSelect(): B");
  QModelIndex index = Model()->index(pos,0);
  if(selectionModel()->isSelected(index) == on) return;
  if(on) selectionModel()->select(index, QItemSelectionModel::Select | QItemSelectionModel::Rows);
  else   selectionModel()->select(index, QItemSelectionModel::Deselect | QItemSelectionModel::Rows);
  if(on) setCurrentIndex(index);
  FD_DI("WspPoolView::UserSelect(): C");
}

// we can deselect
void WspPoolView::UserSelectionClear(void) {
 selectionModel()->clear();
}

// user deleting selection
void WspPoolView::UserDelSelection(void) {
  FD_DI("WspPoolView::UserDelSelection()");
  QList<QString> selecteditems=Model()->SelectedItems();
  QList<QString>::iterator rit=selecteditems.begin();
  for(;rit!=selecteditems.end();rit++) {
    FD_DI("WspPoolView::UserDelSelection(): " << VioStyle::StrFromQStr(*rit));
    Model()->Erase(*rit);
  }
}

// user insert a new variable
void WspPoolView::UserInsert(void) {
  FD_DI("WspPoolView::UserInsert()");
  // figure where
  int row = model()->rowCount();
  QModelIndex index = currentIndex();
  if(index.isValid()) row=index.row()+1;
  // doit
  Model()->InsertAnonymous(row);  
  // show the new item
  setCurrentIndex(model()->index(row,0));
  WspItem* witem =Model()->At(row);
  if(!witem) return;
  FD_DI("WspPoolView::UserInsert(...): ask pool to issue show request for " << 
	VioStyle::StrFromQStr(witem->Name()));
  Model()->ShowItem(witem->Name(),true);

}

// get key events
void WspPoolView::keyPressEvent(QKeyEvent *event) {
  FD_DI("WspPoolView::keyPressEvent(...): " << event->key());
  // inactive
  /*
  QTableView::keyPressEvent(event);
  return;
  */
  // figure where
  int row = -1;
  int column = -1;
  QModelIndex index = currentIndex();
  if(index.isValid()) row=index.row();
  column=index.column();
  FD_DI("WspPoolView::keyPressEvent(...): row " << row << " col " << column);
  // switch: ingnore tab navigation
  if(event->key() == Qt::Key_Tab) {
    event->ignore();
    return;
  } 
  // switch: insert mode
  if( (event->key() == Qt::Key_Insert) || 
      ( (event->key() == Qt::Key_Return) && (event->modifiers() & Qt::ShiftModifier ) ) ) {
    FD_DI("WspPoolView::keyPressEvent(...): Insert row " << row);
    mInsertMode=true;
    mEditing=true;
    // retrieve row
    const QList<QString> selitems=Model()->SelectedItems();
    if(row<0 && selitems.size()==1)  { 
      row=Model()->Find(selitems.at(0));
      FD_DI("WspPoolView::keyPressEvent(...): Insert below at row " << row );
    }
    // clear slection TODO
    Model()->InsertAnonymous(row+1);
    setCurrentIndex(model()->index(row+1,0));
    QTableView::edit(currentIndex());
    event->accept();
    return;
  } 
  // switch: edit next column
  if( (event->key() == Qt::Key_Space) ) {
    FD_DI("WspPoolView::keyPressEvent(...): Next Col");
    mInsertMode=false;
    QModelIndex next= model()->index(currentIndex().row(), currentIndex().column()+1);
    if(!next.isValid() || !(model()->flags(next) & Qt::ItemIsEditable) ) 
      next= model()->index(currentIndex().row(), 0);
    if(next.isValid() && (model()->flags(next) & Qt::ItemIsEditable) ) {      
      mEditing=true;
      // clear slection TODO
      setCurrentIndex(next);
      QTableView::edit(currentIndex());
      event->accept();
      return;
    }
  } 
  // switch: edit current item
  if( (event->key() == Qt::Key_Return) ) {
    FD_DI("WspPoolView::keyPressEvent(...): Next Row");
    if(mEditing || mInsertMode) row=row+1;
    if(mInsertMode) {
      if(row>=model()->rowCount()) row=model()->rowCount();
      Model()->InsertAnonymous(row+1);
    }
    FD_DI("WspPoolView::keyPressEvent(...): Next Row ++ " << model());
    QModelIndex next=model()->index(row,column);
    FD_DI("WspPoolView::keyPressEvent(...): Next Row ** " << model());
    if(next.isValid() && (model()->flags(next) & Qt::ItemIsEditable) ) {      
      FD_DI("WspPoolView::keyPressEvent(...): Next Row at jj " << row);
      mEditing=true;
    // clear slection TODO
      setCurrentIndex(next);
      FD_DI("WspPoolView::keyPressEvent(...): Next Row at " << row);
      QTableView::edit(currentIndex());
      event->accept();
      FD_DI("WspPoolView::keyPressEvent(...): Next Row done ");
      return;
    }
    FD_DI("WspPoolView::keyPressEvent(...): Next Row -- ");
  } 
  // switch: delete selection
  if( (event->key() == Qt::Key_Delete)  || (event->key() == Qt::Key_Backspace) ) {
    FD_DI("WspPoolView::keyPressEvent(...): Delete");
    mInsertMode=false;
    mEditing=false;
    int current=currentIndex().row();
    UserDelSelection();
    int next=current -1;
     // clear slection TODO
    if(next<0) next=0;
    setCurrentIndex(model()->index(next,0));
    event->accept();
    return;
  } 
  // switch: call base
  FD_DI("WspPoolView::keyPressEvent(...): call base");
  QTableView::keyPressEvent(event);
  mInsertMode=false;
  mEditing=false; 
}  


// receive double click: make the pool issue a show request
void WspPoolView::ShowItem(const QModelIndex &index) {
  FD_DI("WspPoolView::ShowItem(...): " << index.row());
  WspItem* witem =Model()->At(index.row());
  if(!witem) return;
  FD_DI("WspPoolView::ShowItem(...): ask pool to issue show request for " << 
	VioStyle::StrFromQStr(witem->Name()));
  Model()->ShowItem(witem->Name(),true);
}

// bring item to front
void WspPoolView::RaiseItem(const QModelIndex &index) {
  FD_DI("WspPoolView::RaiseItem(...): " << index.row());
  WspItem* witem =Model()->At(index.row());
  if(!witem) return;
  FD_DI("WspPoolView::RaiseItem(...): ask pool to issue show request for " << 
	VioStyle::StrFromQStr(witem->Name()));
  emit RaiseItemRequest(witem->Name());
}


// track current index
void WspPoolView::currentChanged( const QModelIndex& current, const QModelIndex& previous) {
  //FD_DI("WspPoolView::currentChanged(...): " << current.row() << " (prev " << previous.row() << ")");
  // RaiseItem(current);
  QTableView::currentChanged(current,previous);
}


// re-implement qwidget to figure tool-tip events
bool WspPoolView::event(QEvent * ev) {
  // care about my tool tips
  if(ev->type()==QEvent::ToolTip) {
    FD_DI("WspItemView::event(): tool tip request");
    QHelpEvent* hev= dynamic_cast<QHelpEvent*>(ev);
    // figure relevant item
    QModelIndex index=indexAt(hev->pos());
    WspItem* witem =Model()->At(index.row());
    if(witem)  {
        witem->ToolTip();
        QToolTip::showText(hev->globalPos(), witem->toolTip());
    } else {
        QToolTip::hideText();
        ev->ignore();
    }
    return true;
  }
  // let base aka qwidget dispatch
  return QTableView::event(ev);
}
