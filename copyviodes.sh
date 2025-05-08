#!/bin/bash

# viodes base dir
VIODES=../libVIODES

# libfaudes base dir
FAUDES=$VIODES/libFAUDES_for_VIODES


# figure os
unameOut="$(uname -s)"
case "$(uname -s)" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    MINGW*)     MACHINE=MinGw;;
    *)          MACHINE="UNKNOWN:${unameOut}"
esac
echo ========  sensed OS $MACHINE
echo ========  using qmake $(which qmake)
echo ========  Qt at $(qmake -query QT_INSTALL_LIBS)


# set DSO naming conventions
if test $MACHINE == Mac ; then {
  PRESO=lib				 
  DOTSO=.dylib
} fi
if test $MACHINE == MinGw ; then {
  PRESO=				 
  DOTSO=.dll
} fi


# setup destinations
if test $MACHINE == Mac ; then {
  VIOEXE=lib
  VIOAUX=bin
} fi
if test $MACHINE == MinGw ; then {
  VIOEXE=release
  VIOAUX=release
} fi


# clean before
rm -rf $VIOEXE/plugins
rm -rf $VIOEXE/qt.conf
rm -rf $VIOEXE/*~
rm -rf $VIOAUX/luafaudes.flx
rm -rf $VIOEXE/lib*.so
rm -rf $VIOEXE/lib*.dylib
rm -rf $VIOEXE/*.dll


# prepare dirs
mkdir -p $VIOEXE/plugins
mkdir -p $VIOEXE/plugins/viotypes
mkdir -p $VIOEXE/plugins/luaextensions

# do copy libfaudes
cp $FAUDES/${PRESO}faudes${DOTSO} $VIOEXE
cp $FAUDES/include/libfaudes.rti $VIOEXE
cp $FAUDES/bin/* $VIOAUX
cp $FAUDES/stdflx/*.flx $VIOEXE/plugins/luaextensions

# do copy libviodes
cp $VIODES/${PRESO}viodes${DOTSO} $VIOEXE
cp $VIODES/vioedit/examples/vioconfig.txt $VIOEXE
cp $VIODES/${PRESO}viogen${DOTSO}  $VIOEXE/plugins/viotypes
cp $VIODES/${PRESO}viohio${DOTSO}  $VIOEXE/plugins/viotypes
cp $VIODES/${PRESO}viomtc${DOTSO}  $VIOEXE/plugins/viotypes
cp $VIODES/${PRESO}viosim${DOTSO}  $VIOEXE/plugins/viotypes
cp $VIODES/${PRESO}viodiag${DOTSO} $VIOEXE/plugins/viotypes
cp $VIODES/${PRESO}violua${DOTSO}  $VIOEXE/plugins/viotypes



# test for system Qt on Linux
if test $MACHINE == Linux ; then {
  if [[ $(which qmake) =~ "/usr/bin" ]]; then
     SYSQT=true 
     echo ========  sensed system qt libs
  fi
  if [[ $(which qmake) =~ "/usr/lib" ]]; then
     SYSQT=true 
     echo ========  sensed system qt libs
  fi
} fi


# do copy qt stuff  (this is still Qt4)
#if test $SYSQT != true ; then {
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

