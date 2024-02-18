/***
 * Auto-generate the qhp-File needed by QT's Assistant to provide
 * online help for DESTool concerning the Run-Time-Interface.
 *
 * (this should merge with dstinstall)
 *
 * Copyright 2009 Ruediger Berndt
 * Copyright 2010 Thomas Moor
 */


#include <sys/types.h>
#include <dirent.h>
#include <errno.h>
#include <vector>
#include <string>
#include <cctype>
#include <iostream>
#include <fstream>

#include "corefaudes.h"


// ******************************************************************
// error exit
// ******************************************************************

void Usage(const std::string& rMessage="") {
  // ui hints
  if(rMessage!="") {
    std::cerr << rMessage << std::endl;
    std::cout << "" << std::endl;
  }
  std::cerr << "rti2qhp " << faudes::FDVersionString() << std::endl;
  std::cout << "" << std::endl;
  std::cerr << "utility to generate a qhp file from an libFAUDES" << std::endl;
  std::cerr << "run-time interface definition file" << std::endl;
  std::cerr << std::endl << "usage: " << std::endl;
  std::cerr << " rti2qhp <rti input file> <qhp output file>" << std::endl;
  std::cerr << std::endl << "note: use \"-\" as output file for console output" << std::endl;
  exit(-1);
}



// ******************************************************************
// parse rti for list of sections
// ******************************************************************

// global list of sections
std::set<std::string> RtiSections;

// parse
void ParseSections(void) {

  // scan types
  faudes::TypeRegistry::Iterator tit;
  for(tit=faudes::TypeRegistry::G()->Begin(); 
      tit!=faudes::TypeRegistry::G()->End(); tit++) 
  {
    std::string section= tit->second->KeywordAt(0);
    // bail out on trivial
    if(section=="") continue;
    // record
    RtiSections.insert(tit->second->KeywordAt(0));
  }

  // scan functions
  faudes::FunctionRegistry::Iterator fit;
  for(fit=faudes::FunctionRegistry::G()->Begin(); 
      fit!=faudes::FunctionRegistry::G()->End(); fit++) 
  {
    std::string section=fit->second->KeywordAt(0);
    // bail out on trivial
    if(section=="") continue;
    // record
    RtiSections.insert(fit->second->KeywordAt(0));
  }

}


// ******************************************************************
// parse rti for keywords
// ******************************************************************

// global map from keyword to set of refs
std::map< std::string, std::set<std::string> > RtiKeywords;

// parse
void ParseKeywords(void) {

  // fix doublets (qt displays the html title only, so we dont want two entries eith the same href)
  std::map< std::string, std::set<std::string> > doublets;

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
      RtiKeywords[key].insert("registry/"+href); 
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
      RtiKeywords[key].insert("registry/"+href); // fix doublets
    }
  }
}






// ******************************************************************
// command line ui
// ******************************************************************


int main(int argc, char *argv[]) {

  // arg count
  if(argc != 3) Usage();

  // load registry
  faudes::LoadRegistry(argv[1]);

  // output file
  std::ostream* hout= &std::cout;
  std::ofstream fout;
  if(std::string(argv[argc-1]) != "-") {
    fout.open(argv[argc-1], std::ios::out);
    hout = &fout;
  }

 
  // parse rti
  ParseSections();
  ParseKeywords();

  // header
  fout << "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" << std::endl;
  fout << "<QtHelpProject version=\"1.0\">" << std::endl;
  fout << "  <namespace>com.faudes</namespace>" << std::endl;
  fout << "  <virtualFolder>doc</virtualFolder>" << std::endl;
  fout << "  <filterSection>" << std::endl;

  // table of contents (static)
  fout << "  <toc>" << std::endl;
  fout << "    <section title=\"About\" ref =\"destool_intro.html\"></section> " << std::endl;
  fout << "    <section title=\"Project\" ref=\"destool_project.html\"></section>" << std::endl;
  fout << "    <section title=\"Variables\" ref=\"destool_variables.html\"></section>" << std::endl;
  fout << "    <section title=\"Script\" ref=\"destool_script.html\"></section>" << std::endl;
  fout << "    <section title=\"Animation\" ref=\"destool_animation.html\"></section>" << std::endl;
  fout << "    <section title=\"libFAUDES Reference\" ref=\"registry/index.html\">" << std::endl;

  // tabel of contents (dynamic)
  std::set< std::string >::iterator pit;
  for(pit=RtiSections.begin(); pit != RtiSections.end(); pit++) {
    std::string sname = *pit;
    std::string shtml = sname+"_index.html";
    std::transform(shtml.begin(),shtml.end(),shtml.begin(),::tolower);
    fout << "      <section title=\"" << sname << "\" ref=\"registry/" << shtml << "\"></section>"<< std::endl;
  }

  // table of contents (done)
  fout << "    </section>" << std::endl;
  fout << "  </toc>" << std::endl;

  // keywords
  fout << "  <keywords>" << std::endl;
  std::map< std::string, std::set<std::string> >::iterator kit;
  for(kit = RtiKeywords.begin(); kit!=RtiKeywords.end(); ++kit) {
    std::string key=kit->first;
    std::set<std::string>::iterator hit;
    for(hit = kit->second.begin(); hit!=kit->second.end(); ++ hit) {
      std::string href=*hit;
      fout << "  <keyword " <<
	"name=\"" << key << "\" "<<
        "ref=\"" << href << "\" " << "/>" << std::endl;
    }
  }
  fout << "  </keywords>" << std::endl;


  // files
  fout << "  <files>" << std::endl;
  fout << "    <file>destool.css</file>" << std::endl;
  fout << "    <file>faudes.css</file>" << std::endl;
  fout << "    <file>destool_intro.html</file>" << std::endl;
  fout << "    <file>destool_project.html</file>" << std::endl;
  fout << "    <file>destool_variables.html</file>" << std::endl;
  fout << "    <file>destool_script.html</file>" << std::endl;
  fout << "    <file>destool_animation.html</file>" << std::endl;
  fout << "    <file>destool_license.html</file>" << std::endl;
  fout << "    <file>faudes_images/*</file>" << std::endl;
  fout << "    <file>registry/*</file>" << std::endl;
  fout << "  </files>" << std::endl;


  //footer
  fout << "  </filterSection>" << std::endl;
  fout << "</QtHelpProject>" << std::endl;

  return(0);
}


