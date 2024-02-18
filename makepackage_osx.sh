echo ==================== Deployment script viodes/destool Mac OS X
echo ==================== libfaudes build in libviodes/libfaudes_for_viodes required  

read

# build all viodes and destool from scratch
#CLEAN=true
CLEAN=false

# manually set qt: Trolltech precompiled package
#export QTOOLS=/Developer/Tools/Qt
#export QAPPS=/Developer/Applications/Qt
#export QFRAMEWORKS=/Library/Frameworks
#export QPLUGINS=/Developer/Applications/Qt/plugins

# manually set qt: self build LPGL 4.8.7
export QTOOLS=/usr/local/qt-4.8.7-osx11/bin
export QAPPS=$QTOOLS
export QFRAMEWORKS=/usr/local/qt-4.8.7-osx11/lib
export QPLUGINS=/usr/local/qt-4.8.7-osx11/plugins

# record source dirs
VIODES_BASE=$(pwd)/../libviodes
DESTOOL_BASE=$(pwd)

# retrieve version an pass to qmake
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
echo ==================== qmake version
qmake -v


echo ==================== compile - prepare

rm -rf $DESTOOL_BASE/DESTool.app 
rm -rf $DESTOOL_BASE/dstinstall/dstinstall

if test $CLEAN = true ; then  
# clean viodes
cd $VIODES_BASE
. ./distclean.sh
qmake "CONFIG-=debug" viodes.pro
make clean
cd $DESTOOL_BASE
# clean destool
. ./distclean.sh
qmake "CONFIG-=debug" destool.pro
make clean
# clean dstsintall
cd $DESTOOL_BASE/dstinstall
qmake "CONFIG-=debug" dstinstall.pro
make clean
cd $DESTOOL_BASE
# clean doc
make -C $DESTOOL_BASE/doc dist-clean
fi

# dstsintall (depends on nothing)
echo ==================== compile - dstinstall 
make -C dstinstall

# viodes (required by destool)
echo ==================== compile - viodes
make -C $VIODES_BASE

# doc (uses dstinstll to compile frefs, installs to ./ as opposed to DESTool.app)
echo ==================== compile - doc 
cp $VIODES_BASE/libfaudes_for_viodes/bin/* ./bin
cp $VIODES_BASE/libfaudes_for_viodes/include/libfaudes.rti ./lib
make -C doc

# destool (requires viodes to link, copies dstinstall to bundle, copies doc to bundle)
echo ==================== compile - destool 
make 



echo ==================== copy bins and libs to bundle destination

cd $DESTOOL_BASE
rm -rf $DEST
mkdir $DEST
cp -R DESTool.app $BUNDLE
cp $VIODES_BASE/libfaudes_for_viodes/bin/* $BUNDLEEXE

echo ==================== run deploy tool

macdeployqt $BUNDLE


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
install_name_tool $CHANGE_CORE $CHANGE_SVG $CHANGE_GUI $BUNDLEEXE/libviodes.dylib
install_name_tool $CHANGE_CORE $CHANGE_SVG $CHANGE_GUI $BUNDLEVIO/libviogen.dylib
install_name_tool $CHANGE_CORE $CHANGE_SVG $CHANGE_GUI $BUNDLEVIO/libviohio.dylib
install_name_tool $CHANGE_CORE $CHANGE_SVG $CHANGE_GUI $BUNDLEVIO/libviomtc.dylib
install_name_tool $CHANGE_CORE $CHANGE_SVG $CHANGE_GUI $BUNDLEVIO/libviodiag.dylib
install_name_tool $CHANGE_CORE $CHANGE_SVG $CHANGE_GUI $BUNDLEVIO/libviosim.dylib
install_name_tool $CHANGE_CORE $CHANGE_SVG $CHANGE_GUI $BUNDLEVIO/libviolua.dylib
 
# set framework for dstinstall 
install_name_tool $CHANGE_CORE $BUNDLEEXE/dstinstall
install_name_tool -change @executable_path/../../libviodes/libfaudes_for_viodes/libfaudes.dylib \
  @executable_path/libfaudes.dylib  $BUNDLEEXE/dstinstall

echo ==================== have assistant A copy

cd $DESTOOL_BASE
cp -R -L $QAPPS/Assistant.app $BUNDLE

echo ==================== have assistant B abuse deploy tool

macdeployqt $BUNDLE/Assistant.app

echo ==================== have assistant C copy extra frameworks

cp $BUNDLE/Assistant.app/Contents/MacOS/Assistant $BUNDLEEXE
cp -R $BUNDLE/Assistant.app/Contents/Frameworks/QtHelp.framework $BUNDLE/Contents/Frameworks 
cp -R $BUNDLE/Assistant.app/Contents/Frameworks/QtWebKit.framework $BUNDLE/Contents/Frameworks
cp -R $BUNDLE/Assistant.app/Contents/Frameworks/QtSql.framework $BUNDLE/Contents/Frameworks 
cp -R $BUNDLE/Assistant.app/Contents/Frameworks/libQtCLucene.4.dylib $BUNDLE/Contents/Frameworks 
cp -R $BUNDLE/Assistant.app/Contents/Frameworks/QtNetwork.framework $BUNDLE/Contents/Frameworks 
# used on early Qt mac os 10.4
#cp -R $BUNDLE/Assistant.app/Contents/Frameworks/phonon.framework $BUNDLE/Contents/Frameworks
#cp -R $BUNDLE/Assistant.app/Contents/Frameworks/QtXmlPatterns.framework $BUNDLE/Contents/Frameworks


echo ==================== have assistant D copy and fix sql driver

mkdir $BUNDLE/Contents/plugins/sqldrivers
cp -R $QPLUGINS/sqldrivers/libqsqlite.dylib $BUNDLE/Contents/plugins/sqldrivers

# tell dyn lib where frameworks are: sqlite depends on core and sql
ACHANGE_SQL="-change $QFRAMEWORKS/QtSql.framework/Versions/4/QtSql @executable_path/../Frameworks/QtSql.framework/Versions/4/QtSql" 
ACHANGE_CORE="-change $QFRAMEWORKS/QtCore.framework/Versions/4/QtCore @executable_path/../Frameworks/QtCore.framework/Versions/4/QtCore" 
install_name_tool $ACHANGE_CORE $ACHANGE_SQL $BUNDLE/Contents/plugins/sqldrivers/libqsqlite.dylib


rm -rf $BUNDLE/Assistant.app

echo ==================== have qhelp tools A copy

cd $DESTOOL_BASE
cp -R -L $QTOOLS/qhelpgenerator $BUNDLEEXE
cp -R -L $QTOOLS/qcollectiongenerator $BUNDLEEXE

echo ==================== have qhelp tools b fix

# tell qhelpgenerator where frameworks are
install_name_tool $CHANGE_CORE $CHANGE_XML $CHANGE_SQL $CHANGE_HELP $CHANGE_GUI $CHANGE_NET $BUNDLEEXE/qhelpgenerator

# tell qcollectiongenerator where frameworks are
install_name_tool $CHANGE_CORE $CHANGE_XML $CHANGE_SQL $CHANGE_HELP $CHANGE_GUI $CHANGE_NET $BUNDLEEXE/qcollectiongenerator


echo ==================== copy other vio
cp -v $DESTOOL_BASE/README.txt  $DEST
cp -v $DESTOOL_BASE/LICENSE.txt $DEST
cp -Rv $DESTOOL_BASE/tutorial/distsave $DEST/Examples
cp -v $VIODES_BASE/vioedit/data/distsave/vioconfig.txt  $DEST/Examples


echo ===================== make disk image
cd $DESTOOL_BASE
rm $DEST.dmg
hdiutil create -srcfolder $DEST -volname $DEST $DEST.dmg


echo ======================================== done
cd $DESTOOL_BASE

