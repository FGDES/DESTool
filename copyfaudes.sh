#!/bin/bash

# install plugins 

# viodes base dir
VIODES=../libVIODES

# app bundle dest
VIOAPP=lib
VIOBIN=bin

# default to local qt
if  test -z $VIOQT  ; then {
VIOQT=local
} fi

# qt sources
if test $VIOQT == local ; then {
VIOQTLIB=/usr/lib
VIOQTBIN=/usr/bin
VIOQTPLUGINS=/usr/lib/qt4/plugins
} else {
VIOQTLIB=$VIOQT/lib
VIOQTBIN=$VIOQT/bin
VIOQTPLUGINS=$VIOQT/plugins
} fi



# report
echo ========  copyplugins for qt at $VIOQTLIB

# tidy up
rm $VIOAPP/qt.conf 
rm -rf $VIOBIN/luafaudes.flx
rm -rf $VIOBIN/assistant
rm -rf $VIOBIN/*~
rm -rf $VIOAPP/plugins
rm -rf $VIOAPP/q*
rm -rf $VIOAPP/lib*


# prepare dirs
mkdir $VIOAPP/plugins
mkdir $VIOAPP/plugins/viotypes
mkdir $VIOAPP/plugins/luaextensions


# do copy libfaudes, clear accumulated extensions
cp -p $VIODES/libviodes*so $VIOAPP
cp $VIODES/libfaudes/libfaudes.so $VIOAPP
cp $VIODES/libfaudes/include/libfaudes.rti $VIOAPP
cp $VIODES/libfaudes/bin/* $VIOBIN
rm -rf $VIOBIN/luafaudes.flx


# do copy libviodes
cp $VIODES/tutorial/data/vioconfig.txt $VIOAPP
cp $VIODES/libviogen*so $VIOAPP/plugins/viotypes
cp $VIODES/libviohio*so $VIOAPP/plugins/viotypes
cp $VIODES/libviomtc*so $VIOAPP/plugins/viotypes
cp $VIODES/libviosim*so $VIOAPP/plugins/viotypes
cp $VIODES/libviodiag*so $VIOAPP/plugins/viotypes
cp $VIODES/libviolua*so $VIOAPP/plugins/viotypes


# do copy qt stuff
if test $VIOQT != local ; then {
  mkdir $VIOAPP/plugins/sqldrivers
  mkdir $VIOAPP/plugins/imageformats
  cp src/qt.conf $VIOAPP
  cp $VIOBIN/destool $VIOBIN/assistant 
  cp -d $VIOQTLIB/libQtCore.so*   $VIOAPP
  cp -d $VIOQTLIB/libQtGui.so*    $VIOAPP
  cp -d $VIOQTLIB/libQtHelp.so*   $VIOAPP
  cp -d $VIOQTLIB/libQtNetwork.so*  $VIOAPP
  cp -d $VIOQTLIB/libQtSvg.so*  $VIOAPP
  cp -d $VIOQTLIB/libQtSql.so*  $VIOAPP
  cp -d $VIOQTLIB/libQtWebKit.so*  $VIOAPP
  cp -d $VIOQTLIB/libQtXml.so*  $VIOAPP
  cp -d $VIOQTLIB/libQtXmlPatterns.so*  $VIOAPP
  cp -d $VIOQTLIB/libQtCLucene.so*  $VIOAPP
  cp -d $VIOQTPLUGINS/sqldrivers/libqsqlite*so   $VIOAPP/plugins/sqldrivers/
  cp -d $VIOQTPLUGINS/imageformats/libqjpeg*so   $VIOAPP/plugins/imageformats/
  cp -d $VIOQTPLUGINS/imageformats/libqsvg*so   $VIOAPP/plugins/imageformats/
  cp -d $VIOQTBIN/assistant $VIOAPP/assistant.bin
  cp -d $VIOQTBIN/qhelpgenerator $VIOAPP/qhelpgenerator.bin
  cp -d $VIOQTBIN/qcollectiongenerator $VIOAPP/qcollectiongenerator.bin
} fi

# copy my helper apps
cp dstinstall/dstinstall $VIOAPP/dstinstall.bin

# copy/clear default extensions 
cp $VIODES/libfaudes/stdflx/*.flx $VIOAPP/plugins/luaextensions
