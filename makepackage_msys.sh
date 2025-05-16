echo ==================== Deployment script DESTool  MSYS


# build all viodes and destool from scratch
#CLEAN=false
CLEAN=true

# set qt and compiler
FQGCC=/C/Qt/Tools/mingw1310_64/bin
FQLIB=/C/Qt/6.8.3/mingw_64/bin

# set inno path
FINNO="/c/Program Files (x86)/Inno Setup 6"

# tell make and submake
export PATH=$FINNO:$FQGCC:$FQLIB:$PATH

# source dirs
VIODES_BASE=$(pwd)/../libVIODES
FAUDES_BASE=$(pwd)/../libVIODES/libFAUDES_for_VIODES
DESTOOL_BASE=$(pwd)

# version numbers
. ../libVIODES/VERSION
FVERSION=${VIODES_VERSION_MAJOR}_${VIODES_VERSION_MINOR}

# report configuration
echo ==================== building version ${VIODES_VERSION_MAJOR}.${VIODES_VERSION_MINOR}
echo ==================== using viogen $VIODES_BASE
echo ==================== using destool $DESTOOL_BASE
echo ==================== qt  $(which qmake)
echo press return to proceed
read

############################################################################
# some consistency tests
if [ ! -f $VIODES_BASE/libviodes.pro ]; then
    echo "error: libVIODESA incomplete: abort"
    return
fi
if [ ! -f $DESTOOL_BASE/destool.pro ]; then
    echo "error: DESTool incomplete: abort"
    return
fi
if [ ! -f $FAUDES_BASE/VERSION ]; then
    echo "error: libFAUDES incomplete: abort"
    return
fi

# minimal clean (my binaries)
rm -rf $DESTOOL_BASE/release 
rm -rf $DESTOOL_BASE/bin/dstinstall.exe


# build libVIODES
echo ==================== compile libviodes
cd $VIODES_BASE
if test $CLEAN == true ; then
. ./copyfaudes.sh    
. ./distclean.sh
qmake "CONFIG-=debug" libviodes.pro
make clean
fi
qmake "CONFIG-=debug" libviodes.pro
make -j20


# build DESTool
echo ==================== compile destool
cd $DESTOOL_BASE
if test $CLEAN == true ; then
. ./distclean.sh
qmake "CONFIG-=debug" destool.pro
make clean
fi
qmake "CONFIG-=debug" destool.pro
make -j20


# run windeploy
cd $DESTOOL_BASE
echo ==================== deply tool
windeployqt release/DESTool.exe
cp $FQLIB/Qt6PrintSupport.dll release/


############################################################################
# some consistency tests
if [ ! -f $DESTOOL_BASE/release/faudes.dll ]; then
    echo "error: libFAUDES not in release"
    return
fi
if [ ! -f $DESTOOL_BASE/release/viodes.dll ]; then
    echo "error: libVIODES not in release"
    return
fi
if [ ! -f $DESTOOL_BASE/release/plugins/viogen.dll ]; then
    echo "error: libVIODES plugins not in release"
    return
fi
if [ ! -f $DESTOOL_BASE/release/DESTool.exe ]; then
    echo "error: DESTool incomplete"
    return
fi

# run inno
echo ==================== build installer
cd $DESTOOL_BASE
iscc.exe  makepackage_msys.iss -DVMAJOR=$VIODES_VERSION_MAJOR -DVMINOR=$VIODES_VERSION_MINOR

