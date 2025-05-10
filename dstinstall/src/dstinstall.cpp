/***
 * Install libFAUDES to DESTool
 *
 * On addition to copying the relevant shared libraries, this tool will
 *
 * - compile provided fref documentation to html (using ref2html)
 * - assemble qhelp and compile files (using qt tools)
 * - fix library path (on mac osx)
 *
 * Gui frontend for FAU Discrete Event Systems Library (libfaudes)
 *
 *  Copyright (C) 2011, 2013 Thomas Moor
 */



#include <QCoreApplication>
#include <QtCore>

#include "corefaudes.h"

#include "dstinstall.h"


// global console out
QTextStream* qout(NULL);

/*
***********************************************************************
***********************************************************************
***********************************************************************

pragmatic helper

***********************************************************************
***********************************************************************
***********************************************************************
*/

QString QStrFromStr(const std::string& str) {
  return QString::fromUtf8(str.c_str());
}

std::string StrFromQStr(const QString& qstr) {
  return std::string(qstr.toUtf8().constData()); 
}

std::string LfnFromQStr(const QString& qstr) {
  return std::string(QFile::encodeName(qstr).constData()); 
}


/*
***********************************************************************
***********************************************************************
***********************************************************************

error exit

***********************************************************************
***********************************************************************
***********************************************************************
*/


void usage_exit(const QString& rMessage="") {
  // ui hints
  if(rMessage!="") {
    *qout << "\n";
    *qout << rMessage << "\n";
    *qout << "\n";
    qout->flush();
    exit(1);
  }
  *qout << "dstinstall: utility to install libFAUDES within DESTool" << "\n";
  *qout << "\n" << "usage: " << "\n";
  *qout << " dstinstall [-v] -lib <libfaudes-path> [-b] -dst <DESTool-path> " << "\n";
  *qout << " dstinstall [-v] -flx <luaextensions-path> -dst <DESTool-path> " << "\n";
  qout->flush();
  exit(1);
}


/*
***********************************************************************
***********************************************************************
***********************************************************************

Configuration

***********************************************************************
***********************************************************************
***********************************************************************
*/


// core config
QString mSrcLibfaudes;
QString mSrcExtensions;
QString mDstDestool;
bool    mOptBuild=false;
bool    mOptVerb=false;

// dependent config
QString mCfgRtiFile;
QString mCfgRef2Html;
QString mCfgRti2Code;
QString mCfgFlxinstall;
QString mCfgNavigationFile;
QString mCfgQhelpgenerator;
QString mCfgQcollectiongenerator;

QString mDstDocBase;
QString mDstLibfaudes;
QString mDstFlxFile;
QString mDstHelper;
QString mDstLibfaudesRtiFile;
QString mDstPluginFlx;
QString mDstDocRefsrc;
QString mDstDocReference;
QString mDstDocImages;
QString mDstDocRtiFile;
QString mDstDocToc;
QString mDstDocQhp;
QString mDstDocQch;
QString mDstDocQhcp;
QString mDstDocQhc;

QString mSrcLibfaudesFile;
QString mSrcLibfaudesRtiFile;
QString mSrcHelper;
QString mSrcRef2Html;
QString mSrcRti2Code;
QString mSrcFlxinstall;
QString mSrcDocRefsrc;
QString mSrcDocImages;
QString mSrcDocReference;
QString mSrcStdflx; 

// populate from core
void ConfigFromCore(void) {
  // tool names
  mCfgRef2Html="ref2html";
  mCfgRti2Code="rti2code";
  mCfgFlxinstall="flxinstall";
  // dst structure default aka linux
  mDstDocBase = mDstDestool + "/doc/html";
  if(!QFileInfo(mDstDocBase).isDir())
    mDstDocBase = mDstDestool + "/doc";
  mDstLibfaudes = mDstDestool + "/lib";
  mDstLibfaudesRtiFile = mDstDestool + "/lib/libfaudes.rti";
  mDstHelper = mDstDestool + "/bin";
  mDstPluginFlx = mDstDestool + "/lib/plugins/luaextensions";
  // derived dst
  mDstDocRefsrc = mDstDocBase+"/refsrc";
  mDstDocImages = mDstDocBase+"/images";
  mDstDocReference = mDstDocBase+"/reference";
  mDstFlxFile = mDstHelper + "/luafaudes.flx";
  mDstDocToc = mDstDocRefsrc+"/toc.ftoc";
  mDstDocQhp = mDstDocBase+"/destool.qhp";
  mDstDocQch = mDstDocBase+"/destool.qch";
  mDstDocQhcp = mDstDocRefsrc+"/destool.qhcp";
  mDstDocQhc = mDstDocBase+"/destool.qhc";
  // src structure default aka linux
  mSrcLibfaudesFile = mSrcLibfaudes+"/libfaudes.so";
  mSrcLibfaudesRtiFile = mSrcLibfaudes+"/include/libfaudes.rti";
  mSrcHelper = mSrcLibfaudes+"/bin";
  mSrcRef2Html = mSrcHelper+"/ref2html";
  mSrcRti2Code = mSrcHelper+"/rti2code";
  mSrcFlxinstall = mSrcHelper+"/flxinstall";
  mSrcLibfaudesRtiFile = mSrcLibfaudes+"/include/libfaudes.rti";
  mSrcDocRefsrc = mSrcLibfaudes + "/doc/refsrc";
  mSrcDocImages = mSrcLibfaudes + "/doc/images";  
  mSrcDocReference = mSrcLibfaudes + "/doc/reference";  
  mSrcStdflx = mSrcLibfaudes + "/stdflx";


#ifdef Q_OS_MAC

  // tool names
  mCfgRef2Html="ref2html";
  mCfgRti2Code="rti2code";
  mCfgFlxinstall="flxinstall";
  // dst structure mac: app bundle
  if(!mOptBuild) {
    mDstDocBase = mDstDestool + "/Contents/Resources/doc/destool_html";
    mDstLibfaudes = mDstDestool + "/Contents/MacOS";
    mDstLibfaudesRtiFile = mDstDestool + "/Contents/MacOS/libfaudes.rti";
    mDstHelper = mDstDestool + "/Contents/MacOS";
    mDstPluginFlx = mDstDestool + "/Contents/plugins/luaextensions";
  }
  // dst structure mac: build mode
  if(mOptBuild) {
    mDstDocBase = mDstDestool + "/doc/html";
    mDstLibfaudes = mDstDestool + "/lib"; 
    mDstLibfaudesRtiFile = mDstDestool + "/lib/libfaudes.rti"; 
    mDstHelper = mDstDestool +"/bin"; 
    mDstPluginFlx = mDstDestool + "/lib/plugins/luaextensions"; 
  }
  // derived dst
  mDstDocRefsrc = mDstDocBase+"/refsrc";
  mDstDocImages = mDstDocBase+"/images";
  mDstDocReference = mDstDocBase+"/reference";
  mDstFlxFile = mDstHelper + "/luafaudes.flx";
  mDstDocToc = mDstDocRefsrc+"/toc.ftoc";
  mDstDocQhp = mDstDocBase+"/destool.qhp";
  mDstDocQch = mDstDocBase+"/destool.qch";
  mDstDocQhcp = mDstDocRefsrc+"/destool.qhcp";
  mDstDocQhc = mDstDocBase+"/destool.qhc";
  // src structure mac
  mSrcLibfaudesFile = mSrcLibfaudes+"/libfaudes.dylib";
  mSrcLibfaudesRtiFile = mSrcLibfaudes+"/include/libfaudes.rti";
  mSrcHelper = mSrcLibfaudes+"/bin";
  mSrcRef2Html = mSrcHelper+"/ref2html";
  mSrcRti2Code = mSrcHelper+"/rti2code";
  mSrcFlxinstall = mSrcHelper+"/flxinstall";
  mSrcLibfaudesRtiFile = mSrcLibfaudes+"/include/libfaudes.rti";
  mSrcDocRefsrc = mSrcLibfaudes + "/doc/refsrc";
  mSrcDocImages = mSrcLibfaudes + "/doc/images";  
  mSrcDocReference = mSrcLibfaudes + "/doc/reference";  
  mSrcStdflx = mSrcLibfaudes + "/stdflx";

#endif


#ifdef Q_OS_WIN32  
  // tool names on win distro
  mCfgRef2Html="ref2html.exe";
  mCfgRti2Code="rti2code.exe";
  mCfgFlxinstall="flxinstall.exe";
  // dst structure win distro
  if(!mOptBuild) {
    mDstDocBase = mDstDestool + "/Doc";
    mDstLibfaudesRtiFile = mDstDestool + "/libfaudes.rti";
    mDstHelper = mDstDestool;
    mDstLibfaudes = mDstDestool;
    mDstPluginFlx = mDstDestool + "/plugins/luaextensions";
  }
  // dst structure mac: build mode
  if(mOptBuild) {
    mDstDocBase = mDstDestool + "/doc/html";
    mDstLibfaudes = mDstDestool + "/lib"; 
    mDstLibfaudesRtiFile = mDstDestool + "/lib/libfaudes.rti"; 
    mDstHelper = mDstDestool +"/bin"; 
    mDstPluginFlx = mDstDestool + "/lib/plugins/luaextensions"; 
  }
  // dst structure derived
  mDstDocRefsrc = mDstDocBase+"/refsrc";
  mDstDocImages = mDstDocBase+"/images";
  mDstDocReference = mDstDocBase+"/reference";
  mDstFlxFile = mDstHelper + "/luafaudes.flx";
  mDstDocToc = mDstDocRefsrc+"/toc.ftoc";
  mDstDocQhp = mDstDocBase+"/destool.qhp";
  mDstDocQch = mDstDocBase+"/destool.qch";
  mDstDocQhcp = mDstDocRefsrc+"/destool.qhcp";
  mDstDocQhc = mDstDocBase+"/destool.qhc";
  // src structure win distro
  mSrcLibfaudesFile = mSrcLibfaudes+"/faudes.dll";
  mSrcLibfaudesRtiFile = mSrcLibfaudes+"/libfaudes.rti";
  mSrcHelper = mSrcLibfaudes+"/bin";
  mSrcRef2Html = mSrcHelper+"/ref2html.exe";
  mSrcRti2Code = mSrcHelper+"/rti2code.exe";
  mSrcFlxinstall = mSrcHelper+"/flxinstall.exe";
  mSrcLibfaudesRtiFile = mSrcLibfaudes+"/include/libfaudes.rti";
  mSrcDocRefsrc = mSrcLibfaudes + "/doc/refsrc";
  mSrcDocImages = mSrcLibfaudes + "/doc/images";  
  mSrcDocReference = mSrcLibfaudes + "/doc/reference";  
  mSrcStdflx = mSrcLibfaudes + "/stdflx";
#endif

  // fallback to system path for qt tools [win/mac/linux]
  mCfgQcollectiongenerator="qcollectiongenerator";
  mCfgQhelpgenerator="qhelpgenerator";

  // prefer local qtools 
  QFileInfo qtool;
  qtool=QFileInfo(mDstHelper + "/qcollectiongenerator");
  if(qtool.isExecutable()) 
    mCfgQcollectiongenerator=qtool.canonicalFilePath();  
  qtool=QFileInfo(mDstHelper + "/qhelpgenerator");
  if(qtool.isExecutable()) 
    mCfgQhelpgenerator=qtool.canonicalFilePath();  
  qtool=QFileInfo(mDstHelper + "/qcollectiongenerator.exe");
  if(qtool.isExecutable()) 
    mCfgQcollectiongenerator=qtool.canonicalFilePath();  
  qtool=QFileInfo(mDstHelper + "/qhelpgenerator.exe");
  if(qtool.isExecutable()) 
    mCfgQhelpgenerator=qtool.canonicalFilePath();  
  qtool=QFileInfo(mDstDestool + "/lib/qcollectiongenerator.bin");
  if(qtool.isExecutable()) 
    mCfgQcollectiongenerator=qtool.canonicalFilePath();  
  qtool=QFileInfo(mDstDestool + "/lib/qhelpgenerator.bin");
  if(qtool.isExecutable()) 
    mCfgQhelpgenerator=qtool.canonicalFilePath();  

}

// test files
void ConfigTest(void) {
  // tool: ref2html
  if(!QFileInfo(mCfgRef2Html).isExecutable())
    usage_exit("cannot execute " + mCfgRef2Html); 
  // tool: flxinstall
  if(!QFileInfo(mCfgFlxinstall).isExecutable())
    usage_exit("cannot execute " + mCfgFlxinstall); 
  // files: rti
  if(!QFileInfo(mSrcLibfaudesRtiFile).isReadable())
    usage_exit("cannot read " + mSrcLibfaudesRtiFile);
  // files: doc dst
  if(!QFileInfo(mDstDocBase).isDir())
    usage_exit("cannot open " + mDstDocBase); 
  if(!QFileInfo(mDstDocRefsrc).isDir())
    usage_exit("cannot open " + mDstDocRefsrc); 
  if(!QFileInfo(mDstDocImages).isDir())
    usage_exit("cannot open " + mDstDocImages); 
  if(!QFileInfo(mDstPluginFlx).isDir())
    usage_exit("cannot open " + mDstPluginFlx); 
  // files: navigation
  if(!QFileInfo(mCfgNavigationFile).isReadable())
    usage_exit("cannot read " + mCfgNavigationFile); 
  // files: doc src
  if(mSrcLibfaudes!="") {
    if(!QFileInfo(mSrcDocRefsrc).isDir())
      usage_exit("cannot open " + mSrcDocRefsrc); 
    if(!QFileInfo(mSrcDocImages).isDir())
      usage_exit("cannot open " + mSrcDocImages); 
    if(!QFileInfo(mSrcStdflx).isDir())
      usage_exit("cannot open " + mSrcStdflx); 
  }
}


/*
***********************************************************************
***********************************************************************
***********************************************************************

My tools: copy

***********************************************************************
***********************************************************************
***********************************************************************
*/

#define IOBUFFER (1024*1024)
char mIOBuffer[IOBUFFER];

// copy one file
// * accept dir as destination
// * create dest directory if necessary
// * exit on any error
void CopyFile(const QString& src, const QString& dst) {
  if(mOptVerb) {
    *qout << "copy: " << src << " -> " << dst << "\n";
    qout->flush();
  }
  QString fdst = dst;
  // if dst is a dir, append filename
  if(QFileInfo(dst).isDir()) 
    fdst=fdst + "/" + QFileInfo(src).fileName();
  // if dst dir does not exist, create
  QString ddst = QFileInfo(fdst).path();
  if(!QDir(ddst).exists()) QDir().mkpath(ddst);
  if(!QDir(ddst).exists()) 
    usage_exit("ERROR: copy files: cannot open/create destination directory" + ddst);
  // report
  if(mOptVerb) {
    *qout << "copy: " << src << " -> " << fdst << "\n";
    qout->flush();
  }
  QFile sfile(src);
  QFile dfile(fdst);
  if(!sfile.open(QIODevice::ReadOnly))
     usage_exit("cannot read " + src);
  if(!dfile.open(QIODevice::WriteOnly))
     usage_exit("cannot write " + fdst );
  while(true) {
    qint64 cnt=sfile.read(mIOBuffer,IOBUFFER);
    if(cnt==0) break;
    while(cnt>0) cnt-=dfile.write(mIOBuffer,cnt);
    if(cnt!=0)
      usage_exit("failed to copy " + src);
  }  
  dfile.flush();
  if(!(dfile.setPermissions(sfile.permissions())))
   usage_exit("failed to set permissions for " + dst);
}

// copy entire directories
// * specfify src and dst as directory
// * create dst directory if necessary
// * recursive
// * exit on errors
void CopyFiles(const QString& src, const QString& dst, int rec=0) {
  // silently break recursion
  if(rec>10) return;
  // test src directory
  if(!QFileInfo(src).isDir())
    usage_exit("copy files: cannot open " + src);
  // test/create dst directory
  if(!QDir(dst).exists()) QDir().mkpath(dst);
  if(!QDir(dst).exists()) 
    usage_exit("copy files: cannot open/create " + dst);
  // report
  if(rec==0) 
    *qout << "### copy files: " << src << " -> " << dst << ": ";
  // do copy the files
  QDir srcdir(src);
  QStringList srcfiles=srcdir.entryList(QDir::Files | QDir::Dirs | QDir::NoDotAndDotDot |QDir::NoSymLinks);
  foreach(QString file, srcfiles) {
    // if src is a dir, do recursion
    if(QFileInfo(src+"/"+file).isDir()) {
      *qout << "."; qout->flush();
      CopyFiles(src+"/"+file, dst+"/"+file,rec+1);
      continue;
    }
    // ordinary file
    //*qout << "."; qout->flush();
    CopyFile(src+"/"+file,dst);
  } 
  // say goodbye
  if(rec==0) *qout << " done\n";
  qout->flush();
}


// delete one file (no errors)
void DeleteFile(const QString& src) {
  QFile sfile(src);
  sfile.remove();
}

// delete all files in one directory 
// * non-recursive
// * keep directory
// * no errors
void DeleteFiles(const QString& src) {
  // test directories
  /*
  if(!QFileInfo(src).isDir())
    usage_exit("delete files: cannot open " + src);
  if(!QFileInfo(src).isWritable())
    usage_exit("delete files: cannot wrtie to " + src);
  */
  // report
  *qout << "### delete files: " << src << ": ";
  // do delere the files
  QDir srcdir(src);
  QStringList srcfiles=srcdir.entryList(QDir::Files);
  foreach(QString file, srcfiles) {
    DeleteFile(src+"/"+file);
    *qout << ".";
    qout->flush();
  } 
  *qout << " done\n";
  qout->flush();
}


/*
***********************************************************************
***********************************************************************
***********************************************************************

My tools: read RTI and prepare qhelp configuration 

***********************************************************************
***********************************************************************
***********************************************************************
*/


// global list of sections
QStringList mReferenceSections;

// parse for sections
void ParseSections(void) {

  // scan types
  faudes::TypeRegistry::Iterator tit;
  for(tit=faudes::TypeRegistry::G()->Begin(); 
      tit!=faudes::TypeRegistry::G()->End(); tit++) 
  {
    QString section= QStrFromStr(tit->second->KeywordAt(0));
    // bail out on trivial
    if(section=="") continue;
    // record
    mReferenceSections.push_back(section);
  }

  // scan functions
  faudes::FunctionRegistry::Iterator fit;
  for(fit=faudes::FunctionRegistry::G()->Begin(); 
      fit!=faudes::FunctionRegistry::G()->End(); fit++) 
  {
    QString section= QStrFromStr(fit->second->KeywordAt(0));
    // bail out on trivial
    if(section=="") continue;
    // record
    mReferenceSections.push_back(section);
  }

  // sort & remove duplicates
  mReferenceSections.removeDuplicates();
  mReferenceSections.sort();
}



// global map from keyword to set of refs
QMap< QString , QSet<QString> > mReferenceKeywords;

// parse rti for keywords
void ParseKeywords(void) {

  // fix doublets (qt displays the html title only, so we dont want two entries eith the same href)
  std::map< std::string, std::set< std::string> > doublets;

  // scan types
  faudes::TypeRegistry::Iterator tit;
  for(tit = faudes::TypeRegistry::G()->Begin(); tit != faudes::TypeRegistry::G()->End(); tit++) {
    const faudes::Documentation& fdoc = *tit->second;
    for(int i = 0; i < fdoc.KeywordsSize(); ++i) {
      // the key
      std::string key=fdoc.KeywordAt(i);
      transform(key.begin(), key.end(), key.begin(), ::tolower);
      // the href
      std::string href= fdoc.HtmlDoc();
      std::string sref= href;
      int pos = sref.find_last_of('#');
      sref=sref.substr(0,pos);
      if(doublets[key].count(sref)) continue;
      doublets[key].insert(sref);
      mReferenceKeywords[QStrFromStr(key)].insert(QStrFromStr("reference/"+href)); 
    }
  }
  // scan functions
  faudes::FunctionRegistry::Iterator fit;
  for(fit = faudes::FunctionRegistry::G()->Begin(); fit != faudes::FunctionRegistry::G()->End(); fit++) {
    const faudes::Documentation& fdoc = *fit->second;
    for(int i = 0; i < fdoc.KeywordsSize(); ++i) {
      // the key
      std::string key=fdoc.KeywordAt(i);
      transform(key.begin(), key.end(), key.begin(), ::tolower);
      // the href
      std::string href= fdoc.HtmlDoc();
      std::string sref= href;
      int pos = sref.find_last_of('#');
      sref=sref.substr(0,pos);
      if(doublets[key].count(sref)) continue;
      doublets[key].insert(sref);
      mReferenceKeywords[QStrFromStr(key)].insert(QStrFromStr("reference/"+href)); // fix doublets
    }
  }
}


// compile qhelp file
void CompileQhelp(void) {
 
  // bail out --- we dropped this when moving to Qt6
  *qout << "### dstinstall: skipping qhp-file ### " << "\n";
  qout->flush();
  return;
  
  // report
  *qout << "### dstinstall: generate qhp-file ### " << "\n";
  qout->flush();

  // init file io
  QFile file(mDstDocQhp);
  file.open(QFile::WriteOnly);
  QTextStream fout(&file);

  // parse rti
  ParseSections();
  ParseKeywords();

  // header
  fout << "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" << "\n";
  fout << "<QtHelpProject version=\"1.0\">" << "\n";
  fout << "  <namespace>com.faudes</namespace>" << "\n";
  fout << "  <virtualFolder>doc</virtualFolder>" << "\n";
  fout << "  <filterSection>" << "\n";

  // table of contents (static)
  fout << "  <toc>" << "\n";
  fout << "    <section title=\"About\" ref =\"destool_intro.html\"></section> " << "\n";
  fout << "    <section title=\"Project\" ref=\"destool_project.html\"></section>" << "\n";
  fout << "    <section title=\"Variables\" ref=\"destool_variables.html\"></section>" << "\n";
  fout << "    <section title=\"Script\" ref=\"destool_script.html\"></section>" << "\n";
  fout << "    <section title=\"Animation\" ref=\"destool_animation.html\"></section>" << "\n";
  fout << "    <section title=\"libFAUDES Reference\" ref=\"reference/index.html\">" << "\n";

  // tabel of contents (dynamic)
  QStringList::iterator pit;
  for(pit=mReferenceSections.begin(); pit != mReferenceSections.end(); pit++) {
    QString sname = *pit;
    QString shtml = QString(sname+"_index.html").toLower();
    fout << "      <section title=\"" << sname << "\" ref=\"reference/" << shtml << "\"></section>"<< "\n";
  }

  // table of contents (done)
  fout << "    </section>" << "\n";
  fout << "  </toc>" << "\n";

  // keywords
  fout << "  <keywords>" << "\n";
  QMap< QString, QSet<QString> >::iterator kit;
  for(kit = mReferenceKeywords.begin(); kit!=mReferenceKeywords.end(); ++kit) {
    QString key=kit.key();
    QSet<QString>::iterator hit;
    for(hit = kit.value().begin(); hit!=kit.value().end(); ++ hit) {
      QString href=*hit;
      fout << "  <keyword " <<
	"name=\"" << key << "\" "<<
        "ref=\"" << href << "\" " << "/>" << "\n";
    }
  }
  fout << "  </keywords>" << "\n";


  // files
  fout << "  <files>" << "\n";
  fout << "    <file>destool.css</file>" << "\n";
  fout << "    <file>destool_intro.html</file>" << "\n";
  fout << "    <file>destool_instlx.html</file>" << "\n";
  fout << "    <file>destool_project.html</file>" << "\n";
  fout << "    <file>destool_variables.html</file>" << "\n";
  fout << "    <file>destool_script.html</file>" << "\n";
  fout << "    <file>destool_animation.html</file>" << "\n";
  fout << "    <file>destool_license.html</file>" << "\n";
  // wildcard is ok for newer Qt only 
  //fout << "    <file>images/*</file>" << "\n";
  //fout << "    <file>reference/*</file>" << "\n";
  // use explicit listing
  QDir regdir(mDstDocReference);
  QStringList regfiles=regdir.entryList(QDir::Files | QDir::Readable);
  foreach(QString file, regfiles) {
    fout << "    <file>reference/" << file << "</file>" << "\n";
  } 
  QDir imgdir(mDstDocImages);
  QStringList imgfiles=imgdir.entryList(QDir::Files | QDir::Readable);
  foreach(QString file, imgfiles) {
    fout << "    <file>images/" << file << "</file>" << "\n";
  } 
  // end: files
  fout << "  </files>" << "\n";


  //footer
  fout << "  </filterSection>" << "\n";
  fout << "</QtHelpProject>" << "\n";
  fout.flush();
  file.close();

  // qhp
  *qout << "### dstinstall: compile qch-file ### " << "\n";
  *qout << "### using qt tool: " << mCfgQhelpgenerator << "\n";
  *qout << "### using src: " << mDstDocQhp << "\n";
  *qout << "### using dst: " << mDstDocQch;
  qout->flush();
  QProcess doit1;
  doit1.start(mCfgQhelpgenerator, QStringList() 
    << QDir::toNativeSeparators(mDstDocQhp) << "-o" << QDir::toNativeSeparators(mDstDocQch));
  if(!doit1.waitForStarted()) 
    usage_exit("\nfailed run qhelpgenerator on " + mDstDocQhp + " (a)");
  if(!doit1.waitForFinished())
    usage_exit("\nfailed run qhelpgenerator on " + mDstDocQhp + " (b)");
  if(doit1.exitStatus()!=  QProcess::NormalExit || doit1.exitCode()!=0)
   usage_exit("\nfailed run qhelpgenerator on " + mDstDocQhp + " (c)");
  *qout << "\n"; qout->flush();

  // qhcp
  *qout << "### dstinstall: compile qhc-file ### " << "\n";
  *qout << "### using qt tool: " << mCfgQcollectiongenerator << "\n";
  *qout << "### using src: " << mDstDocQhcp << "\n";
  *qout << "### using dst: " << mDstDocQhc;
  qout->flush();
  // move arround sources to actual base (make qt happy) 
  CopyFile(mDstDocRefsrc+"/about.txt",mDstDocBase);
  CopyFile(mDstDocQhcp,mDstDocBase);
  QString cpqhcp=mDstDocBase+"/"+QFileInfo(mDstDocQhcp).fileName();
  QProcess doit2;
  //doit2.setWorkingDirectory(mDstDocBase);  // osx used to need this relative?
  doit2.start(mCfgQhelpgenerator, QStringList() 
    << QDir::toNativeSeparators(cpqhcp)  << "-o" << QDir::toNativeSeparators(mDstDocQhc));
  if(!doit2.waitForStarted()) 
    usage_exit("\nfailed run qcollectiongenerator on " + mDstDocQhcp + " (a)");
  if(!doit2.waitForFinished())
    usage_exit("\nfailed run qcollectiongenerator on " + mDstDocQhcp + " (b)");
  if(doit2.exitStatus()!=  QProcess::NormalExit || doit2.exitCode()!=0)
    usage_exit("\nfailed run qcollectiongenerator on " + mDstDocQhcp + " (c)");
  *qout << "\n"; qout->flush();

  // clean
  *qout << "### dstinstall: remove temp files" << "\n";
  //DeleteFile(mDstDocQhp);
  //DeleteFile(mDstDocQch);
  DeleteFile(cpqhcp);
  DeleteFile(mDstDocBase+"/about.txt");
}


/*
***********************************************************************
***********************************************************************
***********************************************************************

My tools: fref process

***********************************************************************
***********************************************************************
***********************************************************************
*/


// fref process one file (obsolete - do batches of entire directories)
void ProcessFrefFile(const QString& fref, const QString& html, const QStringList& options=QStringList()) {
  //*qout << "process: " << fref << " -> " << html << "\n";
 QProcess doit;
 doit.start(mCfgRef2Html, QStringList() 
    << "-cnav" << QDir::toNativeSeparators(mCfgNavigationFile)
    << "-css" <<  "destool.css"
    << "-inc" <<  QDir::toNativeSeparators(mDstDocToc)
    << "-rti" <<  QDir::toNativeSeparators(mCfgRtiFile)
    << "-app"
    << options
    << QDir::toNativeSeparators(fref) << QDir::toNativeSeparators(html));
 if(!doit.waitForStarted()) 
   usage_exit("failed run ref2html on " + fref);
 if(!doit.waitForFinished())
   usage_exit("failed run ref2html on " + fref);
 if(doit.exitStatus()==  QProcess::NormalExit || doit.exitCode()!=0)
   *qout << ".";
 else
   *qout << "!";
 qout->flush();
}

// fref process directory (obsolete - using flxinstall)
void ProcessFrefFiles(const QString& src, const QString& dst, const QStringList& options=QStringList()) {
  // report
  *qout << "### process fref files: " << src << ": "; qout->flush();
  // test/create dst directory
  if(!QDir(dst).exists()) QDir().mkpath(dst);
  if(!QDir(dst).exists()) 
    usage_exit("cannot open/create " + dst);
  // loop the files (obsolete)
  /*
  QDir srcdir(src);
  QStringList srcfiles=srcdir.entryList(QDir::Files);
  foreach(QString file, srcfiles) {
    if(file=="toc.fref") continue;
    if(QFileInfo(file).suffix()!="fref") continue;
    ProcessFrefFile(src+"/"+file, dst+"/"+QFileInfo(file).baseName()+".html",options);
  } 
  */
 QProcess doit;
 doit.start(mCfgRef2Html, QStringList() 
    << "-cnav" << QDir::toNativeSeparators(mCfgNavigationFile)
    << "-css" <<  "destool.css"
    << "-inc" <<  QDir::toNativeSeparators(mDstDocToc)
    << "-rti" <<  QDir::toNativeSeparators(mCfgRtiFile)
    << "-app"
    << options
    << QDir::toNativeSeparators(src) << QDir::toNativeSeparators(dst));
 if(!doit.waitForStarted()) 
   usage_exit("failed run ref2html on " + src);
 if(!doit.waitForFinished())
   usage_exit("failed run ref2html on " + src);
 if((doit.exitStatus()!=  QProcess::NormalExit) || doit.exitCode()!=0)
   usage_exit("failed run ref2html on " + src);
  *qout << "done\n";
  qout->flush();
}

// all fref files
QStringList mReferenceFiles;

// collect toc files
void CollectFrefFiles(const QString& dir) {
  // loop the files
  QDir srcdir(dir);
  QStringList srcfiles=srcdir.entryList(QDir::Files);
  foreach(QString file, srcfiles) {
    if(QFileInfo(file).suffix()!="fref") continue;
    if(file=="toc.fref") continue;
    mReferenceFiles << dir+"/"+file;
  } 
}

// collect toc files
void CompileFrefToc(const QString& dst) {
  // build command lin eopt
  QStringList tocopt = mReferenceFiles;
  tocopt.push_front("-toc");
  tocopt.push_back(dst);
  // run
  QProcess doit;
  doit.start(mCfgRef2Html, tocopt);
  if(!doit.waitForStarted()) 
    usage_exit("failed to run ref2html for toc (a)");
  if(!doit.waitForFinished())
    usage_exit("failed to run ref2html for toc (b)");
  //foreach(QString str,tocopt) *qout << str;
  //*qout << mCfgRef2Html;
  //  QString ret(doit.readAllStandardError());
  // *qout << "xx" <<  ret << "xx";
  if(doit.exitStatus()!=  QProcess::NormalExit || doit.exitCode()!=0)
   usage_exit("failed to run ref2html for toc (c)");

}

/*
***********************************************************************
***********************************************************************
***********************************************************************

Fix mac osx

***********************************************************************
***********************************************************************
***********************************************************************
*/

void FixMacDeps(void){
  /*
 // pre libFAUDES 2.27
 QProcess doit;
 doit.start("install_name_tool", QStringList() 
	    << "-change" <<  "libfaudes.dylib" << "@executable_path/libfaudes.dylib"
	    << mDstLibfaudes + "/libluafaudes.dylib");
 if(!doit.waitForStarted()) 
   usage_exit("failed run name tool on libluafaudes (a)");
 if(!doit.waitForFinished())
   usage_exit("failed run name tool on libluafaudes (b)");
 if(doit.exitStatus()!=  QProcess::NormalExit || doit.exitCode()!=0)
   usage_exit("failed run name tool on libluafaudes (c)");
  */
};


/*
***********************************************************************
***********************************************************************
***********************************************************************

Luaextensions

***********************************************************************
***********************************************************************
***********************************************************************
*/

// all flx files
QStringList mLuaextensionFiles;

// collect flx files
void CollectLuaextensions(const QString& dir) {
  // special case: its a file
  if(QFileInfo(dir).suffix()=="flx") {
    mLuaextensionFiles << dir;
    return;
  }
  // loop the files
  QDir srcdir(dir);
  QStringList srcfiles=srcdir.entryList(QDir::Files);
  foreach(QString file, srcfiles) {
    if(QFileInfo(file).suffix()!="flx") continue;
    mLuaextensionFiles << dir+"/"+file;
  } 
}


// process all extensions: 
// 1. copy to plugins/luextensions/
// 2. run flxinstall (generate fref pages, process to html and compile luafaudes.flx)
void ProcessLuaextensions(void) {
  // report and fix 
  QStringList nfiles;
  foreach(QString file, mLuaextensionFiles) {
    *qout << "### luaextensions: " << QFileInfo(file).fileName() << "\n";
    nfiles << QDir::toNativeSeparators(file);
  } 
  qout->flush();
  // run flxinstall
  *qout << "### luaextensions: process by flxinstall \n";
  qout->flush();
  QStringList options;
  options
    << "-tbin" << QDir::toNativeSeparators(mDstHelper)
    << "-tdoc" << QDir::toNativeSeparators(mDstDocBase)
    << "-tcnav" << QDir::toNativeSeparators(mCfgNavigationFile)
    << "-tcss" <<  "destool.css"
    << "-trti" <<  QDir::toNativeSeparators(mCfgRtiFile)
    << "-tapp" 
    << "-i" << nfiles
    << QDir::toNativeSeparators(mDstDestool);
  *qout << "flxinstall options: ";
  foreach(QString str, options) { *qout << str << " ";};
  *qout << "\n";
  qout->flush();
  QProcess doit;
  doit.setProcessChannelMode(QProcess::MergedChannels);
  doit.start(mCfgFlxinstall, options);
  if(!doit.waitForStarted()) 
    usage_exit("failed run flxinstall (a)");
  while(!doit.waitForFinished(100)) {
    QString sret = QString::fromLocal8Bit(doit.readAllStandardOutput().constData());
    *qout << sret;
    qout->flush();
  }
  QString sret(doit.readAllStandardOutput());
  *qout << sret; // << "\n";
  qout->flush();
  if(doit.exitStatus()!=  QProcess::NormalExit || doit.exitCode()!=0)
   usage_exit("\nfailed run flxinstall (c)");
}



/*
***********************************************************************
***********************************************************************
***********************************************************************

Install libfaudes

***********************************************************************
***********************************************************************
***********************************************************************
*/


void InstallLibfaudes(void) {

  // say hello
  *qout << "### dstinstall: configure ### " << "\n";
  *qout << " src path " << mSrcLibfaudes << "\n";
  *qout << " dst path " << mDstDestool << "\n";
  qout->flush();

  // set default processing options
  mCfgRtiFile =  mSrcLibfaudesRtiFile;
  mCfgRef2Html = mSrcRef2Html;
  mCfgRti2Code = mSrcRti2Code;
  mCfgFlxinstall = mSrcFlxinstall;
  mCfgNavigationFile = mDstDocRefsrc + "/destool_navigation.include_fref";

  // test
  ConfigTest();

  // load registry
  *qout << "### dstinstall: load registry ### " << "\n";
  qout->flush();
  faudes::LoadRegistry(LfnFromQStr(mSrcLibfaudesRtiFile));

  // copy fref doc to dstrefsrc
  *qout << "### dstinstall: copy reference source ### " << "\n";
  qout->flush();
  DeleteFiles(mDstDocReference);
  DeleteFiles(mDstDocRefsrc+"/reference");
  DeleteFiles(mDstDocRefsrc+"/images");
  CopyFiles(mSrcDocRefsrc+"/reference",mDstDocRefsrc+"/reference");
  CopyFiles(mSrcDocRefsrc+"/images",mDstDocRefsrc+"/images");
  CopyFiles(mSrcDocImages,mDstDocImages);
  
  // copy libfaudes
  *qout << "### dstinstall: copy libfaudes ### " << "\n";
  qout->flush();
  CopyFile(mSrcLibfaudesRtiFile,mDstLibfaudesRtiFile);
  CopyFile(mSrcRef2Html,mDstHelper);
  CopyFile(mSrcRti2Code,mDstHelper);
  CopyFile(mSrcFlxinstall,mDstHelper);
  CopyFile(mSrcLibfaudesFile,mDstLibfaudes);
#ifdef Q_WS_MAC
  *qout << "### dstinstall: mac osx fix dependencies ### " << "\n";
  FixMacDeps();
#endif

  // figure and process my luaextensions (using flxinstall, trusting is to leave tmp_flx)
  *qout << "### dstinstall: replace luaextensions ### " << "\n";
  qout->flush();
  DeleteFiles(mDstPluginFlx);
  CollectLuaextensions(mSrcLibfaudes + "/stdflx");
  foreach(QString file, mLuaextensionFiles) 
    CopyFile(file,mDstPluginFlx);
  mLuaextensionFiles.clear();
  CollectLuaextensions(mDstPluginFlx);
  ProcessLuaextensions();

  // fix my index
  CopyFile(mDstDocBase+"/destool_intro.html",mDstDocBase+"/index.html");

  // collect fref
  *qout << "### dstinstall: compile fref-toc ### " << "\n";
  qout->flush();
  CollectFrefFiles(mDstDocRefsrc+"/reference");
  CollectFrefFiles(mDstDocRefsrc+"/images");
  CollectFrefFiles(mDstDocRefsrc+"/tmp_flx");
  CollectFrefFiles(mDstDocRefsrc);
   
  /*
  // compile toc
  *qout << "### dstinstall: compile fref-toc ### " << "\n";
  CompileFrefToc(mDstDocToc);


  // process fref
  *qout << "### dstinstall: process fref-doc ### " << "\n";
  ProcessFrefFiles(mDstDocRefsrc+"/reference", mDstDocBase+"/reference", QStringList() << "-rel" << "../");
  ProcessFrefFiles(mDstDocRefsrc+"/images",mDstDocBase+"/images",QStringList() << "-rel" << "../");
  ProcessFrefFiles(mDstDocRefsrc,mDstDocBase);
  CopyFile(mDstDocReference+"/reference_index.html",mDstDocReference+"/index.html");
  CopyFile(mDstDocBase+"/destool_intro.html",mDstDocBase+"/index.html");
  */

  // load/update registry
  *qout << "### dstinstall: load registry ### " << "\n";
  qout->flush();
  faudes::LoadRegistry(LfnFromQStr(mDstLibfaudesRtiFile));
  if(mDstFlxFile!="") {
    faudes::FunctionRegistry::G()->MergeDocumentation(LfnFromQStr(mDstFlxFile));
  }

  // run qt
  *qout << "### dstinstall: compile qhelp ### " << "\n";
  qout->flush();
  CompileQhelp();

  // all fine exit
  *qout << "### dstinstall: done ### " << "\n";
  qout->flush();
}

/*
***********************************************************************
***********************************************************************
***********************************************************************

Install extensions

***********************************************************************
***********************************************************************
***********************************************************************
*/


void InstallExtensions(void) {

  // say hello
  *qout << "### dstinstall: configure ### " << "\n";
  *qout << " src path " << mSrcExtensions << "\n";
  *qout << " dst path " << mDstDestool << "\n";
  qout->flush();


  // set processing options
  mCfgRtiFile =  mDstLibfaudesRtiFile;
  mCfgRef2Html = mDstHelper+ "/" + mCfgRef2Html;
  mCfgRti2Code = mDstHelper+ "/" + mCfgRti2Code;
  mCfgFlxinstall = mDstHelper+ "/" + mCfgFlxinstall;
  mCfgNavigationFile = mDstDocRefsrc + "/destool_navigation.include_fref";

  // tweak: use dst rti as source
  mSrcLibfaudesRtiFile=mDstLibfaudesRtiFile;

  // test
  ConfigTest();

  // figure my luaextensions
  *qout << "### dstinstall: locate luaextensions ### " << "\n";
  CollectLuaextensions(mSrcExtensions);

  // figure whether source lies outside plugin/luaextensions 
  bool ext=true;
  foreach(QString file, mLuaextensionFiles) 
    if(QFileInfo(file).dir().canonicalPath() == QDir(mDstPluginFlx).canonicalPath())
      ext=false;

  // if all sources are external, delete existing plugins and copy sources   
  if(ext) {
    *qout << "### dstinstall: replace luaextensions ### " << "\n";
    DeleteFiles(mDstPluginFlx);
    foreach(QString file, mLuaextensionFiles) 
      CopyFile(file,mDstPluginFlx);
    mLuaextensionFiles.clear();
    CollectLuaextensions(mDstPluginFlx);
  }

  *qout << "### dstinstall: process luaextensions ### " << "\n";
  ProcessLuaextensions();

  // fix my index
  *qout << "### dstinstall: fix main index " << "\n";
  CopyFile(mDstDocBase+"/destool_intro.html",mDstDocBase+"/index.html");

  // load/update registry
  *qout << "### dstinstall: load registry ### " << "\n";
  faudes::LoadRegistry(LfnFromQStr(mDstLibfaudesRtiFile));
  if(mDstFlxFile!="") {
    faudes::FunctionRegistry::G()->MergeDocumentation(LfnFromQStr(mDstFlxFile));
  }

  // collect fref
  *qout << "### dstinstall: compile fref-toc ### " << "\n";
  CollectFrefFiles(mDstDocRefsrc+"/reference");
  CollectFrefFiles(mDstDocRefsrc+"/images");
  CollectFrefFiles(mDstDocRefsrc+"/tmp_flx");
  CollectFrefFiles(mDstDocRefsrc);
  CompileFrefToc(mDstDocToc);

  // run qt
  *qout << "### dstinstall: compile qhelp ### " << "\n";
  CompileQhelp();

  // all fine exit
  *qout << "### dstinstall: done ### " << "\n";
  qout->flush();
}


/*
***********************************************************************
***********************************************************************
***********************************************************************

Main

***********************************************************************
***********************************************************************
***********************************************************************
*/

#include <iostream>

// read args 
int main(int argc, char *argv[]) {

  // let Qt see commandline
  QCoreApplication app(argc, argv);
  QStringList qargs = QCoreApplication::arguments();  
 
  // init console io
  qout = new QTextStream(stdout);

  // add my searchpath for plugins (obsolete?) (isuues with osx)
  QCoreApplication::addLibraryPath(QCoreApplication::applicationDirPath() + QDir::separator()+ "plugins"); 

  // my id
  QCoreApplication::setApplicationName("dstinstall");
  QCoreApplication::setOrganizationName("Faudes");
  QCoreApplication::setOrganizationDomain("faudes.org");

  // lazy command line
  // min args
  if(qargs.size() < 3) usage_exit();

  // primitive commad line parsing
  int i;
  for(i=1; i<qargs.size(); i++) {
    QString option = qargs.at(i);
    // option: build mode
    if(option=="-b") { 
      mOptBuild=true;
      continue;
    }
    // option: verbose mode
    if(option=="-v") { 
      mOptVerb=true;
      continue;
    }
    // option: src
    if(option=="-lib") { 
      i++; if(i>=qargs.size()) usage_exit();
      mSrcLibfaudes=QDir::fromNativeSeparators(qargs.at(i));
      continue;
    }
    // option: src
    if(option=="-flx") { 
      i++; if(i>=qargs.size()) usage_exit();
      mSrcExtensions=QDir::fromNativeSeparators(qargs.at(i));
      continue;
    }
    // option: dst
    if(option=="-dst") { 
      i++; if(i>=qargs.size()) usage_exit();
      mDstDestool=QDir::fromNativeSeparators(qargs.at(i));
      continue;
    }
    // option: help
    if((option=="-?") || (option=="--help")) {
      usage_exit();
      continue;
    }
    // option: unknown
    if(option.size()>1)
    if(option.at(0)=='-') {
      usage_exit(QString("unknown option ") + option);
      continue;
    }
    // extra args
    usage_exit("unknown parameter");
  }

  // bail out on error
  if(mSrcLibfaudes!="" && mSrcExtensions!="")
    usage_exit("use either -flx or -lib");
  if(mSrcLibfaudes=="" && mSrcExtensions=="")
    usage_exit("use either -flx or -lib");
  if(mOptBuild && mSrcExtensions!="")
    usage_exit("use -b with -lib");
  if(mDstDestool=="")
    usage_exit("destination not specified");

  // set up paths
  ConfigFromCore();

  // do process
  if(mSrcLibfaudes!="") 
    InstallLibfaudes();
  if(mSrcExtensions!="") 
    InstallExtensions();


  return 0;
}
