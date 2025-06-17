echo ==================== Deployment script DESTool  Mac OS X


# build all viodes and destool from scratch
CLEAN=true
#CLEAN=false

# sign/notarise bundle for distribution
OSXSIGN="Developer ID Application"
#OSXSIGN=dont

# set qt to Qt Project precompiled package
export QTOOLS=~/Qt/6.6.2/macos/bin
export QTOOLSX=~/Qt/6.6.2/macos/libexec
export QFRAMEWORKS=~/Qt/6.6.2/macos/lib
export PATH=$QTOOLS:$PATH
export PATH=$QTOOLSX:$PATH

# record source dirs
VIODES_BASE=$(pwd)/../libVIODES
FAUDES_BASE=$(pwd)/../libVIODES/libFAUDES_for_VIODES
DESTOOL_BASE=$(pwd)

# retrieve version 
. $VIODES_BASE/VERSION
FVERSION=${VIODES_VERSION_MAJOR}_${VIODES_VERSION_MINOR}

# set destination
DEST=faudes_destool_${FVERSION}_macx
BUNDLE=$(pwd)/$DEST/DESTool.app
BUNDLEEXE=$BUNDLE/Contents/MacOS
BUNDLELIB=$BUNDLE/Contents/Frameworks
BUNDLEVIO=$BUNDLE/Contents/PlugIns/viotypes

# report configuration
echo ==================== building version ${VIODES_VERSION_MAJOR}.${VIODES_VERSION_MINOR}
echo ==================== using viogen $VIODES_BASE
echo ==================== using destool $DESTOOL_BASE
echo ==================== using bundle $BUNDLE
echo ==================== qt  $(which qmake)
echo press return to proceed
read

############################################################################
# some consistency tests
if [ ! -d $VIODES_BASE/viodes ]; then
    echo "error: libviodes incomplete: abort"
    return
fi
if [ ! -f $VIODES_BASE/libviodes.pro ]; then
    echo "error: libVIODES incomplete: abort"
    return
fi
if [ ! -f $DESTOOL_BASE/destool.pro ]; then
    echo "error: DESTool incomplete: abort"
    return
fi
if [ ! -d $DESTOOL_BASE/../libFAUDES ]; then
    echo "error: libFAUDES incomplete: abort"
    return
fi

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
make  -j20 
cd $DESTOOL_BASE


# build DESTool
echo ==================== compile destool
cd $DESTOOL_BASE
if test $CLEAN == true; then
. ./distclean.sh
qmake "CONFIG-=debug" destool.pro
make clean
fi
qmake "CONFIG-=debug" destool.pro
make -j20

# prepare package
echo ==================== copy my bin
cd $DESTOOL_BASE
rm -rf $DEST
mkdir $DEST
cp -R DESTool.app $BUNDLE


echo ==================== run deploy tool
if test "$OSXSIGN" == dont ; then
  macdeployqt $BUNDLE -executable=$BUNDLEEXE/dstinstall 
else
  macdeployqt $BUNDLE -executable=$BUNDLEEXE/dstinstall -sign-for-notarization="$OSXSIGN"
  codesign -dvvv $BUNDLEEXE/luafaudes   
fi    

echo ==================== copy other vio
cp -v $DESTOOL_BASE/README.md  $DEST
cp -v $DESTOOL_BASE/LICENSE $DEST/LICENSE.txt
cp -Rv $DESTOOL_BASE/examples $DEST/Examples
cp -v $VIODES_BASE/vioedit/examples/vioconfig.txt  $DEST/Examples


############################################################################
# some consistency tests
if [ ! -f $BUNDLELIB/libfaudes.dylib ]; then
    echo "error: libFAUDES not in release"
    return
fi
if [ ! -f $BUNDLEEXE/luafaudes ]; then
    echo "error: luafaudes not in release"
    return
fi
if [ ! -f $BUNDLELIB/libviodes.dylib ]; then
    echo "error: libVIODES not in release"
    return
fi
if [ ! -f $BUNDLEEXE/DESTool ]; then
    echo "error: DESTool not in release"
    return
fi
if [ ! -f $BUNDLEVIO/libviosim.dylib ]; then
    echo "error: libVIODES plugins not in release"
    return
fi


echo ===================== make disk image
cd $DESTOOL_BASE
rm $DEST.dmg
hdiutil create -srcfolder $DEST -volname $DEST $DEST.dmg
if test "$OSXSIGN" != dont ; then
  codesign -s "$OSXSIGN" --timestamp $DEST.dmg
  codesign -dvvv $DEST.dmg  
fi    

echo ======================================== done
cd $DESTOOL_BASE


