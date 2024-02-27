#!/bin/bash

# viodes base dir
VIODES=../libVIODES

# libfaudes base dir
FAUDES=$VIODES/libFAUDES_for_VIODES

# app destination
VIOLIB=lib
VIOBIN=bin

# figure os
unameOut="$(uname -s)"
case "$(uname -s)" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    CYGWIN*)    MACHINE=Cygwin;;
    MINGW*)     MACHINE=MinGw;;
    MSYS_NT*)   MACHINE=Git;;
    *)          MACHINE="UNKNOWN:${unameOut}"
esac
DOTSO=.so
if test $MACHINE == Mac ; then DOTSO=.dylib; fi
echo ========  sensed os $MACHINE

# qt sources
if  test -z $VIOQT ; then {
VIOQT=local
} fi
if test $VIOQT == local ; then {
VIOQTLIB=/usr/lib/x86_64-linux-gnu
VIOQTBIN=/usr/lib/qt6/bin
} else {
VIOQTLIB=$VIOQT/lib
VIOQTBIN=$VIOQT/bin
} fi
echo ========  qt at $VIOQTLIB

# clean before
rm -f $VIOLIB/qt.conf 
rm -rf $VIOBIN/luafaudes.flx
rm -rf $VIOBIN/*~
rm -rf $VIOLIB/plugins
rm -rf $VIOLIB/q*
rm -rf $VIOLIB/lib*
rm -rf $VIOBIN/luafaudes.flx

# prepare dirs
mkdir -p $VIOLIB/plugins
mkdir -p $VIOLIB/plugins/viotypes
mkdir -p $VIOLIB/plugins/luaextensions

# do copy libfaudes
cp $FAUDES/libfaudes$DOTSO $VIOLIB
cp $FAUDES/include/libfaudes.rti $VIOLIB
cp $FAUDES/bin/* $VIOBIN
cp $VIODES/libFAUDES_for_VIODES/stdflx/*.flx $VIOLIB/plugins/luaextensions

# do copy libviodes
cp -p $VIODES/libviodes$DOTSO $VIOLIB
cp $VIODES/vioedit/data/vioconfig.txt $VIOLIB
cp $VIODES/libviogen$DOTSO $VIOLIB/plugins/viotypes
cp $VIODES/libviohio$DOTSO $VIOLIB/plugins/viotypes
cp $VIODES/libviomtc$DOTSO $VIOLIB/plugins/viotypes
cp $VIODES/libviosim$DOTSO $VIOLIB/plugins/viotypes
cp $VIODES/libviodiag$DOTSO $VIOLIB/plugins/viotypes
cp $VIODES/libviolua$DOTSO $VIOLIB/plugins/viotypes


# copy/clear default extensions 

# do copy qt stuff  (this was for Qt4
#if test $VIOQT != local ; then {
#  mkdir $VIOAPP/plugins/sqldrivers
#  mkdir $VIOAPP/plugins/imageformats
#  cp src/qt.conf $VIOAPP
#  cp $VIOBIN/destool $VIOBIN/assistant 
#  cp -d $VIOQTLIB/libQtCore.so*   $VIOAPP
#  cp -d $VIOQTLIB/libQtGui.so*    $VIOAPP
#  cp -d $VIOQTLIB/libQtHelp.so*   $VIOAPP
#  cp -d $VIOQTLIB/libQtNetwork.so*  $VIOAPP
#  cp -d $VIOQTLIB/libQtSvg.so*  $VIOAPP
#  cp -d $VIOQTLIB/libQtSql.so*  $VIOAPP
#  cp -d $VIOQTLIB/libQtWebKit.so*  $VIOAPP
#  cp -d $VIOQTLIB/libQtXml.so*  $VIOAPP
#  cp -d $VIOQTLIB/libQtXmlPatterns.so*  $VIOAPP
#  cp -d $VIOQTLIB/libQtCLucene.so*  $VIOAPP
#  cp -d $VIOQTPLUGINS/sqldrivers/libqsqlite*so   $VIOAPP/plugins/sqldrivers/
#  cp -d $VIOQTPLUGINS/imageformats/libqjpeg*so   $VIOAPP/plugins/imageformats/
#  cp -d $VIOQTPLUGINS/imageformats/libqsvg*so   $VIOAPP/plugins/imageformats/
#  cp -d $VIOQTBIN/assistant $VIOAPP/assistant.bin
#  cp -d $VIOQTBIN/qhelpgenerator $VIOAPP/qhelpgenerator.bin
#  cp -d $VIOQTBIN/qcollectiongenerator $VIOAPP/qcollectiongenerator.bin
#} fi

