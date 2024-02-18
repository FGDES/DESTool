echo ========= make clean
make clean
make -C doc clean
make -C dstinstall clean
rm -rf doc/html

echo ========= delete binaries
cd bin
find . -type f -not -name 'destool' -delete
cd ..

echo remove Makefile
rm Makefile
rm dstinstall/Makefile

echo ========= deleting linux lib section
rm dstinstall/dstinstall
rm -rf lib/*
mkdir -p lib/plugins/luaextensions # tricky: required for qmake/macx/bundledata
mkdir -p lib/plugins/viotypes

echo ========= deleting macosx bundles
rm -rf DESTool.app


