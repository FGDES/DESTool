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


echo ==================== compile libviodes
cd $VIODES_BASE
if test $CLEAN == true ; then
. ./copyfaudes.sh    
. ./distclean.sh
fi
qmake "CONFIG-=debug" viodes.pro
make -j20
cd $DESTOOL_BASE


echo ==================== compile destool
cd $DESTOOL_BASE
if test $CLEAN == true ; then
. ./distclean.sh
fi
qmake "CONFIG-=debug" destool.pro
make -j20
strip -R .debug_aranges -R .debug_pubnames lib/destool.bin
strip -R .debug_aranges -R .debug_pubnames dstinstall/dstinstall


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


############################################################################
# some consistency tests
if [ ! -f $DEST/lib/libfaudes.so ]; then
    echo "error: libFAUDES not in release"
    return
fi
if [ ! -f $DEST/lib/libviodes.so ]; then
    echo "error: libVIODES not in release"
    return
fi
if [ ! -f $DEST/lib/plugins/viotypes/libviogen.so ]; then
    echo "error: libVIODES plugins not in release"
    return
fi
if [ ! -f $DEST/lib/destool.bin ]; then
    echo "error: DESTool incomplete"
    return
fi

echo ====================compile package
cd $DESTOOL_BASE
tar -cvzf $DEST.tar.gz $PACKAGE


echo ======================================== done


