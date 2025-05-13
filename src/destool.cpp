/* destool.h  -  main eventloop of guifaudes */


/*
   Gui frontend for FAU Discrete Event Systems Library (libfaudes)

   Copyright (C) 2009 - 2025  Thomas Moor

*/



#include <QApplication>
#include <QtGui>


#include "destool.h"
#include "wspviews.h"
#include "desbrowser.h"

#ifdef VIO_OSXTRA
#include "osxtras.h"
#endif

#ifdef VIO_WINCONSOLE
#include <windows.h>
#endif




// read args and  start event loop
int main(int argc, char *argv[]) {

  // say hello, console only
  FD_WARN("DESTool main(): starting");
  
  // osx 11: fix fonts (nee to be before QApplication; was a Qt4 issue)
#ifdef Q_OS_MACOS
  QFont::insertSubstitution(".Lucida Grande UI", "Lucida Grande");
  QFont::insertSubstitution(".Helvetica Neue DeskInterface", "Helvetica Neue");
  QFont::insertSubstitution(".SF NS Text", "Helvetica Neue");
#endif

  // let Qt see commandline
  QApplication app(argc, argv); 
 
  // import default styles
  //QApplication::setDesktopSettingsAware(true);


 
  // lazy commandline, get filename and options
  QString  cfgname =  QCoreApplication::applicationDirPath() + "/vioconfig.txt";
  QString proname="";
  bool doext=false;
  bool dook=true;
  bool dowincon=false;
  QStringList qargs = QCoreApplication::arguments();  
  for(int i=1; i<qargs.size(); i++) {
    QString option = qargs.at(i);
    // config file
    if(option=="-c") { 
      i++; if(i>=qargs.size()) break;
      cfgname= qargs.at(i);
      continue;
    }
    // ext manager
    if(option=="-x") { 
      doext=true;
      continue;
    }
    // win console
    if(option=="-d") { 
      dowincon=true;
      continue;
    }
    // help
    if((option=="-?") || (option=="--help")) {
      dook=false;
      break;
    }
    // option: unknown
    if(option.size()>1)
    if(option.at(0)=='-') {
      dook=false;
      continue;
    }
    // set project
    if(proname=="") {
      proname=qargs.at(i);
      continue;
    }
    // break on no option
    dook=false;
    break;
  }

#ifdef VIO_WINCONSOLE
  // console debugging
  if(dowincon)
  if(AllocConsole()) {
    freopen("CONOUT$","wb",stdout);
    freopen("CONOUT$","wb",stderr);
  }
  // redirect libfaudes error to file
  if(!dowincon){ 
    QTemporaryFile deslog(QDir::tempPath() + "/destool_log_XXXXXX");
    deslog.setAutoRemove(false);
    deslog.open(); 
    QString deslogname = deslog.fileName(); 
    deslog.close();
    faudes::ConsoleOut::G()->ToFile(VioStyle::LfnFromQStr(deslogname));
    FD_WARN("DESTool logfile " << deslogname);
  }
#else
  (void) dowincon;
#endif
    FD_WARN("DESTool console out OK");

#ifdef Q_OS_WIN32  
#ifdef FAUDES_IODEVICE_SIMPLENET
  // if we have a net device on windows, initialise winsocks
  FD_WARN("Main(): init winsock");
  WSADATA wsaData; 
  if(WSAStartup(MAKEWORD(2,2), &wsaData)!=0) {
    FD_WARN("DESTool error: cannot open netdevice");
    return 1;
  }
#endif
#endif

  // report commandline errors
  if(!dook) {
    std::cout << "usage: destool [-x] [-d] [-c config.txt] [project.pro]" << std::endl;  
    return 1;
  }

#ifdef VIO_OSXTRA
  // fix osx menu for lion and above
  //OsxDisableXtraMenu();
#endif

#ifdef Q_OS_MACOS
  // this is for OsX 10.9 and 10.10 and needs testing
  QFont::insertSubstitution(".Lucida Grande UI", "Lucida Grande");
  QFont::insertSubstitution(".Helvetica Neue DeskInterface", "Helvetica Neue");
#endif

  // add my searchpath for plugins (obsolete?) (issues with osx?)
  QApplication::addLibraryPath(QCoreApplication::applicationDirPath() + "/plugins"); 

  // my id
  QApplication::setApplicationName("DESTool");
  QApplication::setOrganizationName("Faudes");
  QApplication::setOrganizationDomain("faudes.org");

 
  // configure: defaults
  VioStyle::Initialise();

   // configure: try read specified file
  if(cfgname=="") cfgname =  QCoreApplication::applicationDirPath() + "/vioconfig.txt";
  try { 
    FD_WARN("DESTool: loading config file "<< cfgname);
    VioStyle::ReadFile(cfgname); 
  } catch (faudes::Exception& fexcep) {
    QString err=QString("Details: ")+VioStyle::QStrFromStr(fexcep.What());
    QMessageBox errbox;
    errbox.setText(QString("<p><b>Error while loading config-file</b></p>"));
    errbox.setInformativeText(QString("<p>%1</p><p><b>Re-installation of DESTool may fix this issue.</b></p>").arg(err));
    errbox.setWindowTitle("DESTool");
    errbox.setIcon(QMessageBox::Information);
    errbox.addButton(
      "Ok", QMessageBox::YesRole);
    errbox.exec();
    exit(1);
  }


  // disclaimer
  {
  QSettings settings;
  QString never = settings.value("disclaimer2").toString();
  if(never!="dontShowDisclaimer") {

    QMessageBox disclaimer;
    disclaimer.setText(QString(
      "<p><b>This software is provided as a developer preview.</b></p>"
      "<p><b>Do you want to proceed?</b></p>"));
    disclaimer.setInformativeText(QString(
       "<p>This software should be functional, however, it may not always "
       "behave nice. Don't trust undo/ redo/ autosave etc. </p>"
        "<p> %1 </p>").arg(VioStyle::LicenseText()));
    disclaimer.setWindowTitle("DESTool");
    disclaimer.setIcon(QMessageBox::Information);
    QPushButton* disno = disclaimer.addButton(
      "No", QMessageBox::NoRole);
    QPushButton* disnever = disclaimer.addButton(
      "Yes, dont ask again", QMessageBox::YesRole);
    QPushButton* disyes = disclaimer.addButton(
      "Yes", QMessageBox::YesRole);
    disclaimer.exec();
    if( disclaimer.clickedButton() == disno) exit(1);
    if( disclaimer.clickedButton() == disnever) 
      settings.setValue("disclaimer2", "dontShowDisclaimer");
    (void) disyes;
  }
  }


  // initialise faudes registry 
  QString rtifile = QCoreApplication::applicationDirPath() + "/libfaudes.rti"; 
  try { 
    FD_WARN("DESTool: loading rti file "<< rtifile);
    faudes::LoadRegistry(VioStyle::LfnFromQStr(rtifile));
  } catch (faudes::Exception& fexcep) {
    QString err=QString("Details: ")+VioStyle::QStrFromStr(fexcep.What());
    QMessageBox errbox;
    errbox.setText(QString("<p><b>Error while loading RTI-file</b></p>"));
    errbox.setInformativeText(QString("<p>%1</p><p><b>Re-installation of DESTool may fix this issue.</b></p>").arg(err));
    errbox.setWindowTitle("DESTool");
    errbox.setIcon(QMessageBox::Information);
    errbox.addButton(
      "Ok", QMessageBox::YesRole);
    errbox.exec();
    exit(1);
  }


  // sense flx file
  QString flxfile = QCoreApplication::applicationDirPath() + "/luafaudes.flx"; 
  FD_WARN("DESTool: testing for flx file "<<VioStyle::StrFromQStr(flxfile));
  if(!QFileInfo(flxfile).exists()) {
    flxfile = QCoreApplication::applicationDirPath() + "/../bin/luafaudes.flx";
    FD_WARN("DESTool: testing for flx file "<<VioStyle::StrFromQStr(flxfile));
  }
  // load file
  if(QFileInfo(flxfile).exists()) {
    // catch and report
    try { 
      FD_WARN("DESTool: loading flx file "<<VioStyle::StrFromQStr(flxfile)); 
      faudes::LuaFunctionDefinition::Register(VioStyle::LfnFromQStr(flxfile));
    } catch (faudes::Exception& fexcep) {
      QString err=QString("Details: ")+VioStyle::QStrFromStr(fexcep.What());
      QMessageBox errbox;
      errbox.setText(QString("<p><b>Error while loading Lua-extensions</b></p>"));
      errbox.setInformativeText(QString(
        QString("<p>%1</p>"
              "<p><b>Delete compiled extension file %2?</b></p>").arg(err).arg(QFileInfo(flxfile).fileName())));
      errbox.setWindowTitle("DESTool");
      errbox.setIcon(QMessageBox::Information);
      QPushButton* eyes=errbox.addButton("Yes", QMessageBox::YesRole);
      errbox.addButton("No", QMessageBox::NoRole);
      errbox.exec();
      if( errbox.clickedButton() == eyes) {
        QFile flxdel(flxfile+"_deleted");
        flxdel.remove();
        QFile flx(flxfile);
        flx.rename(flxfile+"_deleted");
      }
      // refuse to run on errors
      exit(1);
    }
  }

  // reset lua state (incl. installation of LuaFunctions from registry
  try { 
    FD_WARN("DESTool: installing lua functions"); 
    faudes::LuaState::G()->Reset();
  } catch (faudes::Exception& fexcep) {
    QString err=QString("Details: ")+VioStyle::QStrFromStr(fexcep.What());
    QMessageBox errbox;
    errbox.setText(QString("<p><b>Error while installing Lua-extensions</b></p>"));
    errbox.setInformativeText(QString(
      QString("<p>%1</p>"
              "<p><b>Delete compiled extension file %2?</b></p>").arg(err).arg(QFileInfo(flxfile).fileName())));
    errbox.setWindowTitle("DESTool");
    errbox.setIcon(QMessageBox::Information);
    QPushButton* eyes=errbox.addButton("Yes", QMessageBox::YesRole);
    errbox.addButton("No", QMessageBox::NoRole);
    errbox.exec();
    if( errbox.clickedButton() == eyes) {
      QFile flxdel(flxfile+"_deleted");
      flxdel.remove();
      QFile flx(flxfile);
      flx.rename(flxfile+"_deleted");
    }
    // refuse to run on errors
    exit(1);
  }


  // check for viodes plugins 
  try { 
    VioTypeRegistry::Initialise();
  } catch (faudes::Exception& fexcep) {
    QString err=QString("Details: ")+VioStyle::QStrFromStr(fexcep.What());
    QMessageBox errbox;
    errbox.setText(QString("<p><b>Error while loading viodes-plug-ins</b></p>"));
    errbox.setInformativeText(QString("<p>%1</p><p><b>Re-installation of DESTool may fix this issue.</b></p>").arg(err));
    errbox.setWindowTitle("DESTool");
    errbox.setIcon(QMessageBox::Information);
    errbox.addButton(
      "Ok", QMessageBox::YesRole);
    errbox.exec();
    exit(1);
  }

  // setup viodes function registry
  try { 
    VioFunctionRegistry::Initialise();
  } catch (faudes::Exception& fexcep) {
    QString err=QString("Details: ")+VioStyle::QStrFromStr(fexcep.What());
    QMessageBox errbox;
    errbox.setText(QString("<p><b>Error while loading viodes-plug-ins</b></p>"));
    errbox.setInformativeText(QString("<p>%1</p><p><b>Re-installation of DESTool may fix this issue.</b></p>").arg(err));
    errbox.setWindowTitle("DESTool");
    errbox.setIcon(QMessageBox::Information);
    errbox.addButton(
      "Ok", QMessageBox::YesRole);
    errbox.exec();
    exit(1);
  }

  // run extension manager
  if(doext) {
    //VioFaudesLogger::G();
    WspConsole* console = new WspConsole(0);
    WspItemWindow*  conwin = new WspItemWindow(console);
    WspExtensionManager* extman = new WspExtensionManager(0);
    WspItemWindow*  extwin = new WspItemWindow(extman);
    console->Console()->BufferSize(10000);
    conwin->show();
    extwin->show();
    int res=app.exec();
    VioFaudesLogger::Destruct();
    delete console;
    return res;
  }



  // register my types with qt
  qRegisterMetaType<ScrOperation::OperationState>("OperationState");

  // load file and go
  //VioFaudesLogger::G();
  QString pwd=QDir::currentPath();
  DesProjectBrowser *deswin = new DesProjectBrowser();
  if(proname!="") deswin->LoadProject(proname);
  deswin->show();
  int res=0;
  try { 
    res=app.exec();
  } catch (faudes::Exception& fexcep) {
    QString err=QString("Details: ")+VioStyle::QStrFromStr(fexcep.What());
    QMessageBox errbox;
    errbox.setText(QString("<p><b>libFAUDES/DESTool Exception</b></p>"));
    errbox.setInformativeText(QString("<p>%1</p><p><b>This indicates a fatal error. Sorry.</b></p>").arg(err));
    errbox.setWindowTitle("DESTool");
    errbox.setIcon(QMessageBox::Information);
    errbox.addButton(
      "Ok", QMessageBox::YesRole);
    errbox.exec();
    exit(1);
  }
  VioFaudesLogger::Destruct();
  FD_DP("DESTool: done");
  QDir::setCurrent(pwd);
  return res;
}
