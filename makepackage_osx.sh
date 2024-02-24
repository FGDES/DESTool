echo ==================== Deployment script DESTool  Mac OS X


# build all viodes and destool from scratch
CLEAN=false
#CLEAN=true

# manually set qt: self build LGPL 4.8.7
#export QTOOLS=/usr/local/qt-4.8.7-osx11/bin
#export QAPPS=$QTOOLS
#export QFRAMEWORKS=/usr/local/qt-4.8.7-osx11/lib
#export QPLUGINS=/usr/local/qt-4.8.7-osx11/plugins

# manually set qt: Qt Project precompiled package
export QTOOLS=~/Qt/6.6.2/macos/bin
export QTOOLSX=~/Qt/6.6.2/macos/libexec
export QFRAMEWORKS=~/Qt/6.6.2/macos/lib
export PATH=$QTOOLS:$PATH
export PATH=$QTOOLSX:$PATH

# record source dirs
VIODES_BASE=$(pwd)/../libVIODES
FAUDES_BASE=$(pwd)/../libVIODES/libFAUDES_for_VIODES
DESTOOL_BASE=$(pwd)

# retrieve version and pass to qmake
. $VIODES_BASE/VERSION
qmake -set VIODES_VERSION_MAJOR $VERSION_VERSION_MAJOR 
qmake -set VIODES_VERSION_MINOR $VERSION_VERSION_MINOR 
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

echo ==================== compile - prepare

# minimal clean (my binaries)
rm -rf $DESTOOL_BASE/DESTool.app 
rm -rf $DESTOOL_BASE/bin/dstinstall

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
echo ===== clean dstinatll in $DESTOOL_BASE/dstinstall
cd $DESTOOL_BASE
make -C doc dist-clean
fi


# dstsintall (depends on nothing)
echo ==================== compile - dstinstall 
echo cd $DESTOOL_BASE
cd $DESTOOL_BASE
make -C $DESTOOL_BASE/dstinstall

# viodes (required by destool)
echo ==================== compile - viodes
cd $DESTOOL_BASE
make -j 20 -C $VIODES_BASE
. ./copyfaudes.sh

# doc (uses dstinstll to compile frefs, installs to ./ as opposed to DESTool.app)
echo ==================== compile - doc 
cd $DESTOOL_BASE
make -C doc

# destool (requires viodes to link, copies dstinstall to bundle, copies doc to bundle)
echo ==================== compile - destool 
cd $DESTOOL_BASE
make   ## tricky build issue
make -j20

echo ==================== copy my bins and libs to bundle destination
cd $DESTOOL_BASE
rm -rf $DEST
mkdir $DEST
cp -R DESTool.app $BUNDLE

echo ==================== run deploy tool
macdeployqt $BUNDLE -executable=$BUNDLEEXE/dstinstall


echo ==================== fix my plugins

# framework locations 
CHANGE_CORE="-change QtCore.framework/Versions/4/QtCore @executable_path/../Frameworks/QtCore.framework/Versions/4/QtCore" 
CHANGE_SVG="-change QtSvg.framework/Versions/4/QtSvg @executable_path/../Frameworks/QtSvg.framework/Versions/4/QtSvg" 
CHANGE_GUI="-change QtGui.framework/Versions/4/QtGui @executable_path/../Frameworks/QtGui.framework/Versions/4/QtGui" 
CHANGE_SQL="-change QtSql.framework/Versions/4/QtSql @executable_path/../Frameworks/QtSql.framework/Versions/4/QtSql" 
CHANGE_XML="-change QtXml.framework/Versions/4/QtXml @executable_path/../Frameworks/QtXml.framework/Versions/4/QtXml" 
CHANGE_HELP="-change QtHelp.framework/Versions/4/QtHelp @executable_path/../Frameworks/QtHelp.framework/Versions/4/QtHelp" 
CHANGE_NET="-change QtNetwork.framework/Versions/4/QtNetwork @executable_path/../Frameworks/QtNetwork.framework/Versions/4/QtNetwork" 


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

echo ==================== have qhelp tools A copy

cd $DESTOOL_BASE
cp -R -L $QTOOLSX/qhelpgenerator $BUNDLEEXE

echo ==================== have qhelp tools b fix

# tell qhelpgenerator where frameworks are
#install_name_tool $CHANGE_CORE $CHANGE_XML $CHANGE_SQL $CHANGE_HELP $CHANGE_GUI $CHANGE_NET $BUNDLEEXE/qhelpgenerator

# tell qcollectiongenerator where frameworks are
#install_name_tool $CHANGE_CORE $CHANGE_XML $CHANGE_SQL $CHANGE_HELP $CHANGE_GUI $CHANGE_NET $BUNDLEEXE/qcollectiongenerator


echo ==================== copy other vio
cp -v $DESTOOL_BASE/README.md  $DEST
cp -v $DESTOOL_BASE/LICENSE $DEST/LICENSE.txt
cp -Rv $DESTOOL_BASE/tutorial $DEST/Examples
cp -v $VIODES_BASE/vioedit/data/distsave/vioconfig.txt  $DEST/Examples


echo ===================== make disk image
cd $DESTOOL_BASE
rm $DEST.dmg
hdiutil create -srcfolder $DEST -volname $DEST $DEST.dmg


echo ======================================== done
cd $DESTOOL_BASE


