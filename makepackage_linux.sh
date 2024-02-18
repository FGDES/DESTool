#/bin/bash

echo ==================== Deployment script for DESTool -- Linux

echo ==================== for lsb versions you must have built libfaudes with lsb 

read

# do all viodes and destool from scratch
CLEAN=true
#CLEAN=false

# manually set qt: lsb version on destool 64bit
export VIOQT=/opt/qt-4.8.7-lsb-4.0
export PATH=$VIOQT/bin:/opt/lsb/bin:$PATH

# manually set qt: lsb version on destool 
#export VIOQT=/opt/qt-4.4.2-lsb-3.2   
#export PATH=$VIOQT/bin:/opt/lsb/bin:$PATH

# manually set qt: qt on destool
#export VIOQT=/opt/qtsdk-2010.01/qt
#export PATH=$VIOQT/bin:$PATH

# manually set qt: lsb version on wombat
#export VIOQT=/usr/local/Trolltech/Qt-4.4.2-lsb-3.2
#export PATH=$VIOQT/bin:/opt/lsb/bin:$PATH

# record dirs
VIODES_BASE=$(pwd)/../libviodes 
DESTOOL_BASE=$(pwd)

# retrieve version an pass to qmake
. $VIODES_BASE/VERSION
qmake -set VIODES_VERSION_MAJOR $VIODES_VERSION_MAJOR 
qmake -set VIODES_VERSION_MINOR $VIODES_VERSION_MINOR 
FVERSION=${VIODES_VERSION_MAJOR}_${VIODES_VERSION_MINOR}

# package name
PACKAGE=faudes_destool_${FVERSION}

# set destination
DEST=$(pwd)/${PACKAGE}


echo ==================== using qt $VIOQT
echo ==================== using viogen $VIODES_BASE
echo ==================== using destool $DESTOOL_BASE
echo ==================== using dest $DEST

echo ==================== prepare libviodes

cd $VIODES_BASE
if test $CLEAN = true ; then 
. ./distclean.sh
qmake "CONFIG-=debug" viodes.pro
make clean
fi

echo ==================== prepare destool

cd $DESTOOL_BASE
if test $CLEAN = true ; then 
. ./distclean.sh
qmake "CONFIG-=debug" destool.pro
make clean
fi

echo ==================== prepare dstinstall

cd $DESTOOL_BASE/dstinstall
if test $CLEAN = true ; then 
qmake "CONFIG-=debug"  dstinstall.pro
make clean
fi

echo ==================== compile libviodes

cd $DESTOOL_BASE
make -C $VIODES_BASE



echo ==================== compile dstinstall

cd $DESTOOL_BASE
make -C dstinstall
strip -R .debug_aranges -R .debug_pubnames dstinstall/dstinstall
cp dstinstall/dstinstall $DESTOOL_BASE/bin



echo ==================== compile destool

cd $DESTOOL_BASE
make
strip -R .debug_aranges -R .debug_pubnames lib/destool.bin


echo ==================== "libs  (dstinstall bin needed for doc)"
cd $DESTOOL_BASE

DESTOOL_LIB=$DESTOOL_BASE/lib
DESTOOL_BIN=$DESTOOL_BASE/bin
VIOQTLIB=$VIOQT/lib
VIOQTBIN=$VIOQT/bin
VIOQTPLUGINS=$VIOQT/plugins

mkdir $DESTOOL_LIB/plugins/sqldrivers
mkdir $DESTOOL_LIB/plugins/imageformats
cp src/qt.conf $DESTOOL_LIB
cp $DESTOOL_BIN/destool $DESTOOL_BIN/assistant 
cp -d $VIOQTLIB/libQtCore.so*   $DESTOOL_LIB
cp -d $VIOQTLIB/libQtGui.so*    $DESTOOL_LIB
cp -d $VIOQTLIB/libQtHelp.so*   $DESTOOL_LIB
cp -d $VIOQTLIB/libQtNetwork.so*  $DESTOOL_LIB
cp -d $VIOQTLIB/libQtSvg.so*  $DESTOOL_LIB
cp -d $VIOQTLIB/libQtSql.so*  $DESTOOL_LIB
cp -d $VIOQTLIB/libQtWebKit.so*  $DESTOOL_LIB
cp -d $VIOQTLIB/libQtXml.so*  $DESTOOL_LIB
cp -d $VIOQTLIB/libQtXmlPatterns.so*  $DESTOOL_LIB
cp -d $VIOQTLIB/libQtCLucene.so*  $DESTOOL_LIB
cp -d $VIOQTPLUGINS/sqldrivers/libqsqlite*so   $DESTOOL_LIB/plugins/sqldrivers/
cp -d $VIOQTPLUGINS/imageformats/libqjpeg*so   $DESTOOL_LIB/plugins/imageformats/
cp -d $VIOQTPLUGINS/imageformats/libqsvg*so   $DESTOOL_LIB/plugins/imageformats/
cp -d $VIOQTBIN/assistant $DESTOOL_LIB/assistant.bin
cp -d $VIOQTBIN/qhelpgenerator $DESTOOL_LIB/qhelpgenerator.bin
cp -d $VIOQTBIN/qcollectiongenerator $DESTOOL_LIB/qcollectiongenerator.bin

# echo fix rpaths (could also do this for dstinstall etc)
chrpath -r '$ORIGIN' $DESTOOL_LIB/qhelpgenerator.bin
chrpath -r '$ORIGIN' $DESTOOL_LIB/qcollectiongenerator.bin


echo ==================== compile docs 

if test $CLEAN = true ; then 
make -C doc dist-clean
fi
make -C doc

echo ==================== prepaer destination
cd $DESTOOL_BASE
rm -rf $DEST
mkdir $DEST
mkdir $DEST/lib
mkdir $DEST/bin
mkdir $DEST/doc
mkdir $DEST/examples


echo ==================== vio scripts/bins
cd $DESTOOL_BASE
cp -R $DESTOOL_BASE/bin/* $DEST/bin
cp -R $DESTOOL_BASE/lib/* $DEST/lib
cp $VIODES_BASE/libfaudes/bin/* $DEST/bin
rm -f $DEST/bin/*~

echo ====================
cp -v $DESTOOL_BASE/README.txt  $DEST
cp -v $DESTOOL_BASE/LICENSE.txt $DEST
cp -Rv $DESTOOL_BASE/tutorial/distsave/* $DEST/examples
cp -v $VIODES_BASE/vioedit/data/distsave/vioconfig.txt  $DEST/examples
cp -R $DESTOOL_BASE/doc/html/* $DEST/doc

echo ====================compile package
cd $DESTOOL_BASE
tar -cvzf $DEST.tar.gz $PACKAGE


echo ======================================== done


