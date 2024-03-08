#/bin/bash

echo ==================== Deployment script for DESTool -- Linux


# do all viodes and destool from scratch
#CLEAN=true
CLEAN=false

# manually set qt: local qt5
export VIOQT=local
export PATH=/usr/lib/qt5/bin:$PATH

# manually set qt: local qt6
#export VIOQT=local
#export PATH=/usr/lib/qt6/bin:$PATH

# manually set qt: lsb version on destool 64bit
#export VIOQT=/opt/qt-4.8.7-lsb-4.0
#export PATH=$VIOQT/bin:/opt/lsb/bin:$PATH

# manually set qt: lsb version on destool 
#export VIOQT=/opt/qt-4.4.2-lsb-3.2   
#export PATH=$VIOQT/bin:/opt/lsb/bin:$PATH

# manually set qt: qt on early destool
#export VIOQT=/opt/qtsdk-2010.01/qt
#export PATH=$VIOQT/bin:$PATH

# manually set qt: lsb version on wombat
#export VIOQT=/usr/local/Trolltech/Qt-4.4.2-lsb-3.2
#export PATH=$VIOQT/bin:/opt/lsb/bin:$PATH

# record dirs
VIODES_BASE=$(pwd)/../libVIODES
DESTOOL_BASE=$(pwd)
DESTOOL_LIB=$DESTOOL_BASE/lib
DESTOOL_BIN=$DESTOOL_BASE/bin

# retrieve version and pass to qmake
. $VIODES_BASE/VERSION
qmake -set VIODES_VERSION_MAJOR $VIODES_VERSION_MAJOR 
qmake -set VIODES_VERSION_MINOR $VIODES_VERSION_MINOR 
FVERSION=${VIODES_VERSION_MAJOR}_${VIODES_VERSION_MINOR}

# package name
PACKAGE=faudes_destool_${FVERSION}

# set destination
DEST=$(pwd)/${PACKAGE}



echo ==================== using qt $VIOQT
echo ==================== using qmake $(qmake -v)
echo ==================== using viogen $VIODES_BASE
echo ==================== using destool $DESTOOL_BASE
echo ==================== using dest $DEST

echo ==================== press return or ctrl-c to bail out
read


echo ==================== prepare destool clean
if test $CLEAN == true ; then
cd $DESTOOL_BASE
. ./distclean.sh
fi


echo ==================== compile libviodes
cd $VIODES_BASE
if test $CLEAN == true ; then
. ./distclean.sh
. ./copyfaudes.sh    
fi
qmake "CONFIG-=debug" viodes.pro
make -j20
cd $DESTOOL_BASE


echo ==================== compile dstinstall
cd $DESTOOL_BASE/dstinstall
qmake "CONFIG-=debug" dstinstall.pro
if test $CLEAN == true ; then
make clean
fi    
make 
strip -R .debug_aranges -R .debug_pubnames dstinstall/dstinstall
cp dstinstall $DESTOOL_BASE/bin
cd $DESTOOL_BASE


echo ==================== compile docs 
cd $DESTOOL_BASE
if test $CLEAN == true ; then
make dist-clean
fi    
make -C doc


echo ==================== compile destool
cd $DESTOOL_BASE
qmake "CONFIG-=debug" destool.pro
if test $CLEAN == true ; then
make clean
fi    
make -j20
strip -R .debug_aranges -R .debug_pubnames lib/destool.bin


echo ==================== copy libraries

#### this is still for qt4
if test $VIOQT != local ; then 

cd $DESTOOL_BASE
VIOQTLIB=$VIOQT/lib
VIOQTBIN=$VIOQT/bin
VIOQTPLUGINS=$VIOQT/plugins

cp src/qt.conf $DESTOOL_LIB
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
mkdir $DESTOOL_LIB/plugins/sqldrivers
mkdir $DESTOOL_LIB/plugins/imageformats
cp -d $VIOQTPLUGINS/sqldrivers/libqsqlite*so   $DESTOOL_LIB/plugins/sqldrivers/
cp -d $VIOQTPLUGINS/imageformats/libqjpeg*so   $DESTOOL_LIB/plugins/imageformats/
cp -d $VIOQTPLUGINS/imageformats/libqsvg*so   $DESTOOL_LIB/plugins/imageformats/
cp -d $VIOQTBIN/qhelpgenerator $DESTOOL_LIB/qhelpgenerator.bin
cp -d $VIOQTBIN/qcollectiongenerator $DESTOOL_LIB/qcollectiongenerator.bin
# echo fix rpaths (could also do this for dstinstall etc)
chrpath -r '$ORIGIN' $DESTOOL_LIB/qhelpgenerator.bin
chrpath -r '$ORIGIN' $DESTOOL_LIB/qcollectiongenerator.bin

fi



echo ==================== prepare destination
cd $DESTOOL_BASE
rm -rf $DEST
mkdir $DEST
mkdir $DEST/lib
mkdir $DEST/bin
mkdir $DEST/doc
mkdir $DEST/examples


echo ==================== copy libs and bins
cd $DESTOOL_BASE
cp -R $DESTOOL_BASE/bin/* $DEST/bin
cp -R $DESTOOL_BASE/lib/* $DEST/lib
cp $VIODES_BASE/libfaudes/bin/* $DEST/bin
rm -f $DEST/bin/*~

echo ==================== copy extras
cp -v $DESTOOL_BASE/README.md  $DEST
cp -v $DESTOOL_BASE/LICENSE $DEST/LICENSE.txt
cp -Rv $DESTOOL_BASE/examples/* $DEST/examples/
cp -v $VIODES_BASE/vioedit/examples/vioconfig.txt  $DEST/examples
cp -R $DESTOOL_BASE/doc/html/* $DEST/doc

echo ====================compile package
cd $DESTOOL_BASE
tar -cvzf $DEST.tar.gz $PACKAGE


echo ======================================== done


