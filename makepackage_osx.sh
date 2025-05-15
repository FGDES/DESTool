echo ==================== Deployment script DESTool  Mac OS X


# build all viodes and destool from scratch
#CLEAN=false
CLEAN=true

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
BUNDLEVIO=$BUNDLE/Contents/plugins/viotypes

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
if [ ! -d $VIODES_BASE/viocore ]; then
    echo "error: libviodes incomplete: abort"
    return
fi
if [ ! -f $VIODES_BASE/viodes.pro ]; then
    echo "error: libVIODESA incomplete: abort"
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
qmake "CONFIG-=debug" viodes.pro
make clean
fi
qmake "CONFIG-=debug" viodes.pro
make -j20
cd $DESTOOL_BASE


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

# prepare package
echo ==================== copy my bin
cd $DESTOOL_BASE
rm -rf $DEST
mkdir $DEST
cp -R DESTool.app $BUNDLE


#echo ==================== have qhelp tools 
#cd $DESTOOL_BASE
#cp -R -L $QTOOLSX/qhelpgenerator $BUNDLEEXE
#cp -R -L $QTOOLSX/qcollectiongenerator $BUNDLEEXE


echo ==================== run deploy tool
macdeployqt $BUNDLE -executable=$BUNDLEEXE/dstinstall # -executable=$BUNDLEEXE/qhelpgenerator


echo ==================== fix my plugins
# framework locations 
CHANGE_CORE="-change @rpath/QtCore.framework/Versions/A/QtCore @executable_path/../Frameworks/QtCore.framework/Versions/A/QtCore"
CHANGE_SVG="-change @rpath/QtSvg.framework/Versions/A/QtSvg  @executable_path/../Frameworks/QtSvg.framework/Versions/A/QtSvg" 
CHANGE_GUI="-change @rpath/QtGui.framework/Versions/A/QtGui  @executable_path/../Frameworks/QtGui.framework/Versions/A/QtGui" 
CHANGE_WIDGETS="-change @rpath/QtWidgets.framework/Versions/A/QtWidgets @executable_path/../Frameworks/QtWidgets.framework/Versions/A/QtWidgets" 
CHANGE_SQL="-change @rpath/QtSql.framework/Versions/A/QtSql  @executable_path/../Frameworks/QtSql.framework/Versions/A/QtSql" 
CHANGE_XML="-change @rpath/QtXml.framework/Versions/A/QtXml  @executable_path/../Frameworks/QtXml.framework/Versions/A/QtXml" 
CHANGE_HELP="-change @rpath/QtHelp.framework/Versions/A/QtHelp @executable_path/../Frameworks/QtHelp.framework/Versions/A/QtHelp"
CHANGE_NET="-change @rpath/QtNetwork.framework/Versions/A/QtNetwork @executable_path/../Frameworks/QtNetwork.framework/Versions/A/QtNetwork" 
# set frameworks to libvio*
#install_name_tool $CHANGE_CORE $CHANGE_SVG $CHANGE_GUI $BUNDLEEXE/libviodes.dylib
#install_name_tool $CHANGE_CORE $CHANGE_SVG $CHANGE_GUI $BUNDLEVIO/libviogen.dylib
#install_name_tool $CHANGE_CORE $CHANGE_SVG $CHANGE_GUI $BUNDLEVIO/libviohio.dylib
#install_name_tool $CHANGE_CORE $CHANGE_SVG $CHANGE_GUI $BUNDLEVIO/libviomtc.dylib
#install_name_tool $CHANGE_CORE $CHANGE_SVG $CHANGE_GUI $BUNDLEVIO/libviodiag.dylib
#install_name_tool $CHANGE_CORE $CHANGE_SVG $CHANGE_GUI $BUNDLEVIO/libviosim.dylib
#install_name_tool $CHANGE_CORE $CHANGE_SVG $CHANGE_GUI $BUNDLEVIO/libviolua.dylib
 
# set framework for dstinstall 
#install_name_tool $CHANGE_CORE $BUNDLEEXE/dstinstall
#install_name_tool -change @executable_path/../../libVIODES/libFAUDES_for_VIODES/libfaudes.dylib \
#  @executable_path/libfaudes.dylib  $BUNDLEEXE/dstinstall

#echo ==================== have assistant A copy

#cd $DESTOOL_BASE
#cp -R -L $QAPPS/Assistant.app $BUNDLE

#echo ==================== have assistant B abuse deploy tool

#macdeployqt $BUNDLE/Assistant.app

#echo ==================== have assistant C copy extra frameworks

#cp $BUNDLE/Assistant.app/Contents/MacOS/Assistant $BUNDLEEXE
#cp -R $BUNDLE/Assistant.app/Contents/Frameworks/QtHelp.framework $BUNDLE/Contents/Frameworks 
#cp -R $BUNDLE/Assistant.app/Contents/Frameworks/QtWebKit.framework $BUNDLE/Contents/Frameworks
#cp -R $BUNDLE/Assistant.app/Contents/Frameworks/QtSql.framework $BUNDLE/Contents/Frameworks 
#cp -R $BUNDLE/Assistant.app/Contents/Frameworks/libQtCLucene.4.dylib $BUNDLE/Contents/Frameworks 
#cp -R $BUNDLE/Assistant.app/Contents/Frameworks/QtNetwork.framework $BUNDLE/Contents/Frameworks 
# used on early Qt mac os 10.4
#cp -R $BUNDLE/Assistant.app/Contents/Frameworks/phonon.framework $BUNDLE/Contents/Frameworks
#cp -R $BUNDLE/Assistant.app/Contents/Frameworks/QtXmlPatterns.framework $BUNDLE/Contents/Frameworks


#echo ==================== have assistant D copy and fix sql driver

#mkdir $BUNDLE/Contents/plugins/sqldrivers
#cp -R $QPLUGINS/sqldrivers/libqsqlite.dylib $BUNDLE/Contents/plugins/sqldrivers

# tell dyn lib where frameworks are: sqlite depends on core and sql
#ACHANGE_SQL="-change $QFRAMEWORKS/QtSql.framework/Versions/4/QtSql @executable_path/../Frameworks/QtSql.framework/Versions/4/QtSql" 
#ACHANGE_CORE="-change $QFRAMEWORKS/QtCore.framework/Versions/4/QtCore @executable_path/../Frameworks/QtCore.framework/Versions/4/QtCore" 
#install_name_tool $ACHANGE_CORE $ACHANGE_SQL $BUNDLE/Contents/plugins/sqldrivers/libqsqlite.dylib


#rm -rf $BUNDLE/Assistant.app

#echo ==================== have qhelp tools b fix

# tell qhelpgenerator where frameworks are
#install_name_tool $CHANGE_CORE $CHANGE_XML $CHANGE_SQL $CHANGE_HELP $CHANGE_GUI $CHANGE_WIDGET $CHANGE_NET $BUNDLEEXE/qhelpgenerator

# tell qcollectiongenerator where frameworks are
#install_name_tool $CHANGE_CORE $CHANGE_XML $CHANGE_SQL $CHANGE_HELP $CHANGE_GUI $CHANHE_WIDGET $CHANGE_NET $BUNDLEEXE/qcollectiongenerator


echo ==================== copy other vio
cp -v $DESTOOL_BASE/README.md  $DEST
cp -v $DESTOOL_BASE/LICENSE $DEST/LICENSE.txt
cp -Rv $DESTOOL_BASE/examples $DEST/Examples
cp -v $VIODES_BASE/vioedit/examples/vioconfig.txt  $DEST/Examples


############################################################################
# some consistency tests
if [ ! -f $BUNDLEEXE/libfaudes.dylib ]; then
    echo "error: libFAUDES not in release"
    return
fi
if [ ! -f $BUNDLEEXE/libviodes.dylib ]; then
    echo "error: libVIODES not in release"
    return
fi
if [ ! -f $BUNDLEEXE/DESTool ]; then
    echo "error: DESTool not in release"
    return
fi
if [ ! -f $BUNDLEVIO/libviogen.dylib ]; then
    echo "error: libVIODES plugins not in release"
    return
fi


echo ===================== make disk image
cd $DESTOOL_BASE
rm $DEST.dmg
hdiutil create -srcfolder $DEST -volname $DEST $DEST.dmg


echo ======================================== done
cd $DESTOOL_BASE


