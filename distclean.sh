echo ========= make clean
make clean
make -C doc clean
make -C dstinstall clean

echo ========= remove Makefiles
rm -f Makefile
rm -f dstinstall/Makefile
rm -f doc/Makefile

echo ========= delete conpiled doc
rm -rf doc/html

echo ========= delete binaries
cd bin
find . -type f -not -name 'destool' -delete
cd ..
rm -f dstinstall/dstinstall

echo ========= deleting linux lib section
rm -f bin/dstinstall
rm -rf lib/*
mkdir -p lib/plugins/luaextensions # tricky: required for qmake/macx/bundledata
mkdir -p lib/plugins/viotypes

echo ========= deleting macosx bundles
rm -rf DESTool.app

echo ========= deleting windows release
rm -rf release
rm -rf dstinstall/release


