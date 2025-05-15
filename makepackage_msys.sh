echo ==================== Deployment script DESTool  MSYS


# build all viodes and destool from scratch
CLEAN=false
#CLEAN=true

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
if [ ! -f $VIODES_BASE/viodes.pro ]; then
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

# extansive clean
if test $CLEAN = true ; then  
# clean viodes
echo ===== clean libVIODES in  $VIODES_BASE
cd $VIODES_BASE
. ./distclean.sh
. ./copyfaudes.sh
qmake "CONFIG-=debug" viodes.pro
make clean
# clean destool
echo cd $DESTOOL_BASE
echo ===== clean DESTool in  $DESTOOL_BASE
cd $DESTOOL_BASE
qmake "CONFIG-=debug" destool.pro
make clean
# clean dstsintall
echo ===== clean dstinatll in $DESTOOL_BASE/dstinstall
cd $DESTOOL_BASE/dstinstall
qmake "CONFIG-=debug" dstinstall.pro
make clean
# clean doc
echo ===== clean docs in $DESTOOL_BASE/doc/html
cd $DESTOOL_BASE
make -C doc dist-clean
fi


# dstsintall (depends on nothing)
echo ==================== compile - dstinstall 
cd $DESTOOL_BASE/dstinstall
qmake "CONFIG-=debug" dstinstall.pro
make

# doc (uses dstinstll to compile frefs, installs to ./ as opposed to DESTool.app)
echo ==================== compile - doc 
make -C $DESTOOL_BASE/doc

# viodes (required by destool)
echo ==================== compile - viodes
cd $VIODES_BASE
qmake "CONFIG-=debug" viodes.pro
make -j20 

# destool (requires viodes to link, copies dstinstall to bundle, copies doc to bundle)
echo ==================== compile - destool 
cd $DESTOOL_BASE
qmake "CONFIG-=debug" destool.pro
make -j20

# run windeploy
cd $DESTOOL_BASE
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

