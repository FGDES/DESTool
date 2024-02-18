/* desbrowser.h  -  project browser for destool */


/*
   Gui frontend for FAU Discrete Event Systems Library (libfaudes)

   Copyright (C) 2006, 2007  Thomas Moor, Klaus Schmidt, Sebastian Perk
   Copyright (C) 2009 Thomas

*/


#ifndef DESBROWSER_H
#define DESBROWSER_H

#include <QList>
#include <QMainWindow>

#include "libviodes.h"
#include "scrprogwidget.h"
#include "simcontrol.h"
#include "wspconsole.h"
#include "extmanager.h"

// forward (why not include QGui?)
class QAction;
class QMenu;

class WspFaudesImportDialog;
class WspFaudesExportDialog;


/*

This is the main application window, the item browser.
It owns all project data (variables, simulator etc) and 
provides user navigation.

*/


class DesProjectBrowser : public QMainWindow
{
    Q_OBJECT

friend class WspFaudesImportDialog;
friend class WspFaudesExportDialog;


public:
  // construct/destruct
  DesProjectBrowser();
  virtual ~DesProjectBrowser();

  // record/query user changes 
  bool Modified(void) const;
  virtual void Modified(bool ch);

  // create menues for satelite windows
  QMenu* CreateFileMenu(QWidget* parent);
  QMenu* CreateEditMenu(QWidget* parent);
  QMenu* CreateViewMenu(QWidget* parent);
  QMenu* CreateWindowsMenu(QWidget* parent);
  QMenu* CreateHelpMenu(QWidget* parent);

  // get window by item id, get active window
  WspItemWindow* Window(int id);
  WspItemWindow* ActiveWindow(void);

  // re-implement virtual size hint
  virtual QSize sizeHint(void) const;

  // get Title
  QString Title(void);

public slots:

  // user interaction
  void New();
  void Open();
  int  Save();
  int  SaveAs();
  void Exit();
  void StatusBarMessage(const QString &message, int time=0);
  void OpenRecentFile();
  void LoadProject(QString fileName);
  int  SaveProject(QString fileName);
  void  FaudesImport(void);
  void  FaudesImport(const QStringList& files, bool vis=true, bool pers=true, bool over=true);
  void  FaudesExport(void);
  void  FaudesExport(const QStringList& vars, const QStringList& fncts, const QStringList& sims, const QString& dstdir);

  // show requests (incl create window if necessary)
  void ShowSimulator(bool on=true);
  void ShowVariables(bool on=true);
  void ShowTrace(bool on=true);
  void ShowStatistics(bool on=true);
  void ShowScript(bool on=true);
  void ShowVariable(const QString &varname="", bool on=true);
  void ShowFunction(const QString &fnctname="", bool on=true);
  void ShowConsole(bool on=true);
  void ShowExtensionManager(bool on=true);

  // manage windows (bring to front etc)
  void ActivateBrowser(void);
  void ActivateWindow(void);
  void ActivateWindow(int id);
  void ActivateVariable(const QString& vname);
  void RaiseWindow(void);
  void RaiseWindow(int id);
  void RaiseVariable(const QString& vname);
  void RaiseFunction(const QString& fname);
  void RaiseAllWindows(void);
  void CloseAllWindows(void);

  // help and docu
  void About(void);
  void ShowDocumentation(const QString &page="");
  void EnterWhatsThis();


  // Receive configuration changes from child (by user)
  void ChildModified(bool);

  // notify that the state has been reset
  void LuaReset(void);


protected slots:

  // dynamic gui elements
  void UpdateFileMenu(void);
  void UpdateEditMenu(void);
  void UpdateViewMenu(void);
  void UpdateWindowsMenu(void);
  void TrackActiveWindow(int id);

  // manual update(installation of dynamic menues
  void UpdateFileMenu(QMenu* menu, WspItemWindow* iwin=0);
  void UpdateEditMenu(QMenu* menu, WspItemWindow* iwin=0);
  void UpdateViewMenu(QMenu* menu, WspItemWindow* iwin=0);
  void UpdateWindowsMenu(QMenu* menu, WspItemWindow* iwin=0);

signals:

  // Configuration changed (by user)
  void NotifyModified(bool);

  // show notification
  void ShowItemNotify(const QString& name, bool on);

protected:

  // reimplement
  void closeEvent (QCloseEvent* event );
  bool event(QEvent* ev);

  // helper
  int SaveModified(void);

private:

  // initialise
  void CreateActions();
  void InstallMenus();

  // state
  void setCurrentFile(const QString &fileName);
  QString strippedName(const QString &fullFileName);
  QString curFile;

  // gui elements

  QMenu *mFileMenu;
  QMenu *mEditMenu;
  QMenu *mViewMenu;
  QMenu *mWindowsMenu;
  QMenu *mHelpMenu;

  QAction *newAct;
  QAction *openAct;
  QAction *saveAct;
  QAction *saveAsAct;
  QAction *newvarAct;
  QAction *allloadAct;
  QAction *allsaveAct;
  QAction *fauimpAct;
  QAction *fauexpAct;
  QAction *exitAct;

  QAction *undoAct;
  QAction *redoAct;

  const QList<QMenu*> *insertMenus;
  QAction *initAct;
  QAction *stepAct;
  QAction *runAct;

  QAction *browserAct;
  QAction *traceAct;
  QAction *statAct;
  QAction *consoleAct;
  QAction *extmanagerAct;
  QActionGroup *ldockActGroup;

  QAction *aboutAct;
  QAction *helpAct;
  QAction *whatsAct;

  enum { MaxRecentFiles = 5 };
  QAction *recentFileActs[MaxRecentFiles];

  // project variables
  WspVariablePool* mVariables;
  WspVariablePoolBrowser* mVariableBrowser;
  WspFunctionPool* mFunctions;
  ScrProgBrowser*  mScript; 
  SimWidget*  mSimulator; 

  // layout: docks
  QTabWidget* mTabs;
  QWidget* mVariablesTab;
  QWidget* mScriptTab;
  QWidget* mSimulatorTab;

  // state
  int mTopItemId;

  // track user changes
  bool mModified;

  // global style variables 
  WspExtensionManager* mExtensionManager;
  WspConsole* mConsole;

};


// helper: faudes import
class WspFaudesImportDialog : public QDialog {
Q_OBJECT
public:
  WspFaudesImportDialog(DesProjectBrowser* browser, QWidget* parent=0);
  virtual ~WspFaudesImportDialog();
  //void setHasDiscard(bool show);
  //void setText(const QString& text);
 public slots:
  void Import(void);
  void Cancel(void);
  void Browse(void);
  void Update(void);
 signals:
  void NotifyChanges();
 protected:
  DesProjectBrowser* pBrowser;
  QDialogButtonBox* mBbox;
  QTextEdit* mSourceText;
  QStringList mSourceList;
  QCheckBox* mUseFileName;
  QCheckBox* mUseFaudesName;
  QCheckBox* mMakePersistent;
  QCheckBox* mMakeVisual;
  QCheckBox* mOverwrite;
};
 

// helper: faudes export dialog
class WspFaudesExportDialog : public QDialog {
Q_OBJECT
public:
  WspFaudesExportDialog(DesProjectBrowser* browser, QWidget* parent=0);
  virtual ~WspFaudesExportDialog();
 public slots:
  void Browse(void);
  void Export(void);
  void Cancel(void);
 protected:
  QLineEdit* mDestText;
  QString mDestination;
  DesProjectBrowser* pBrowser;
  QListWidget* mTodoVariables;
  QListWidget* mTodoFunctions;
  QListWidget* mTodoSimulation;
  QDialogButtonBox* mBbox;
  QPushButton* mExportButton;
};
 



#endif
