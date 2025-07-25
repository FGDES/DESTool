#
# project file for destool, tmoor 2025 (incl msys and msvc)
#
#


# set libfaudes and friends paths
VIODES_BASE = ../libVIODES
VIODES_LIBFAUDES = $$VIODES_BASE/libFAUDES_for_VIODES

# retrieve version
include($$VIODES_BASE/VERSION)
VIODES_VERSION = $${VIODES_VERSION_MAJOR}.$${VIODES_VERSION_MINOR}
DEFINES += VIODES_VERSION='\\"$${VIODES_VERSION}\\"'

# target setting
TEMPLATE = app
LANGUAGE = C++
QT += core gui svg widgets printsupport 

# target name
unix:TARGET = lib/destool.bin
macx:TARGET = DESTool
macx:QMAKE_TARGET_BUNDLE_PREFIX = org.faudes
win32:TARGET = DESTool

# say hello
message("=== preparing " $$TARGET)
message("=== libVIODES base at" $${VIODES_BASE})
message("=== libVIODES version" $${VIODES_VERSION})
#message("=== using Qt at" $${QMAKE_LIBDIR_QT})   #QT5
message("=== using Qt at" $$[QT_HOST_LIBS])       #Qt6


# destool debugging
debug {
#DEFINES += FAUDES_DEBUG_PROJECT
#DEFINES += FAUDES_DEBUG_SCRIPT
#DEFINES += FAUDES_DEBUG_SIMULATOR
#DEFINES += FAUDES_DEBUG_ITEMS
}

# platform dependend library linking
unix {
  LIBS += -L$${VIODES_LIBFAUDES} -lfaudes
  LIBS += -L$${VIODES_BASE} -lviodes
}
win32-msvc {
  LIBS += $${VIODES_LIBFAUDES}\\faudes.lib
  LIBS += $${VIODES_BASE}\\viodes.lib
}
win32-g++ {
  LIBS += $${VIODES_LIBFAUDES}\\faudes.lib
  LIBS += $${VIODES_BASE}\\libviodes.a
}

# dll import/export switch
DEFINES += FAUDES_BUILD_APP
DEFINES += VIODES_BUILD_APP

# include path
INCLUDEPATH += $$VIODES_LIBFAUDES/include
INCLUDEPATH += $$VIODES_BASE/include

# mac os clang relaxed rpath (alt: trust on deploy tool)
#macx {
#  LIBS += -rpath @executable_path -rpath @executable_path/../plugins/viotypes
#}

# win32 MSVC extra configuration 
win32-msvc {
  QMAKE_CXXFLAGS += /EHsc 
  LIBS += -lwsock32
  DEFINES += VIO_WINCONSOLE
}

# win32 MSYS extra configuration 
win32-g++ {
  LIBS += -lwsock32
  DEFINES += VIO_WINCONSOLE
}

# build paths
OBJECTS_DIR = ./obj
MOC_DIR = ./obj

# resource file
#RESOURCES = destool.qrc

# DESTool core sources
HEADERS      += src/desstyle.h  \
                src/desbrowser.h  \
                src/destool.h \
                src/wspitems.h  \
                src/wspviews.h  \
                src/wspvariables.h  \
                src/wspfunctions.h  \
                src/wspconsole.h  \
                src/extmanager.h  \
                src/scroperation.h \
                src/scrprogram.h \
                src/scropwidget.h \
                src/scrprogwidget.h \
                src/simcontrol.h  \
                src/simtrace.h  \
                src/simstatistics.h  \
                src/simeventwidget.h  \
                src/simdevicewidget.h    
SOURCES      += src/desstyle.cpp \
                src/desbrowser.cpp  \
                src/destool.cpp \
                src/wspitems.cpp  \
                src/wspviews.cpp  \
                src/wspvariables.cpp  \
                src/wspfunctions.cpp  \
                src/wspconsole.cpp  \
                src/extmanager.cpp  \
                src/scroperation.cpp \
                src/scrprogram.cpp \
                src/scropwidget.cpp \
                src/scrprogwidget.cpp \
                src/simcontrol.cpp  \
                src/simtrace.cpp  \
                src/simstatistics.cpp  \
                src/simeventwidget.cpp  \
                src/simdevicewidget.cpp   

# application icon (mac/win)
ICON = ./images/icon_osx.icns 
RC_FILE = ./images/icon_win.rc



#
#
# below this line: copy files in place
#
#


# copy individual files to a directory
defineTest(viodes_copy_files) {
  srcfiles=$$1
  dstdir=$$2            
  QMAKE_POST_LINK += $$QMAKE_MKDIR $$shell_path($$dstdir) $$escape_expand(\\n\\t)
  for(file, srcfiles) {
    QMAKE_POST_LINK += $$QMAKE_COPY_FILE $$shell_path($$file) $$shell_path($$dstdir/) $$escape_expand(\\n\\t)
  }
  export(QMAKE_POST_LINK)
}

# copy recursively all files from one dir to another
defineTest(viodes_copy_dir) {
  QMAKE_POST_LINK += $$QMAKE_MKDIR $$shell_path($$2) $$escape_expand(\\n\\t)
  QMAKE_POST_LINK += $$QMAKE_COPY_DIR $$shell_path($$1/*) $$shell_path($$2) $$escape_expand(\\n\\t)
  export(QMAKE_POST_LINK)
}
  

# linux: copy libVIODES and libFAUDES
unix:!macx {

  DESTOOL_LIBS = $$VIODES_LIBFAUDES/libfaudes.so
  DESTOOL_LIBS += $$VIODES_LIBFAUDES/include/libfaudes.rti
  DESTOOL_LIBS += $$VIODES_BASE/libviodes.so
  DESTOOL_LIBS += $$VIODES_BASE/vioedit/examples/vioconfig.txt

  VIODES_PLUGINS =  $$VIODES_BASE/libviogen.so
  VIODES_PLUGINS += $$VIODES_BASE/libviohio.so
  VIODES_PLUGINS += $$VIODES_BASE/libviomtc.so
  VIODES_PLUGINS += $$VIODES_BASE/libviosim.so
  VIODES_PLUGINS += $$VIODES_BASE/libviodiag.so
  VIODES_PLUGINS += $$VIODES_BASE/libviolua.so

  DESTOOL_BINS += $$VIODES_LIBFAUDES/bin/*

  viodes_copy_files($$DESTOOL_LIBS, ./lib)
  viodes_copy_files($$DESTOOL_BINS, ./bin)
  viodes_copy_files($$VIODES_PLUGINS, ./lib/plugins/viotypes)
  viodes_copy_files($$VIODES_LIBFAUDES/stdflx/*.flx, ./lib/plugins/luaextensions)
}


# mac: populayte bundle
macx {

  ContFiles.files += $$VIODES_LIBFAUDES/bin/ref2html
  ContFiles.files += $$VIODES_LIBFAUDES/bin/rti2code
  ContFiles.files += $$VIODES_LIBFAUDES/bin/flxinstall
  ContFiles.files += $$VIODES_LIBFAUDES/bin/simfaudes
  ContFiles.files += $$VIODES_LIBFAUDES/bin/luafaudes
  ContFiles.path = Contents/MacOS
  QMAKE_BUNDLE_DATA += ContFiles

  FrameFiles.files += $$VIODES_LIBFAUDES/libfaudes.dylib
  FrameFiles.files += $$VIODES_BASE/libviodes.dylib
  FrameFiles.files +=  $$VIODES_BASE/libviogen.dylib
  FrameFiles.path = Contents/Frameworks
  QMAKE_BUNDLE_DATA += FrameFiles

  ConfFiles.files += $$VIODES_BASE/vioedit/examples/vioconfig.txt 
  ConfFiles.files += $$VIODES_LIBFAUDES/include/libfaudes.rti   
  ConfFiles.files += $$VIODES_LIBFAUDES/bin/luafaudes.flx
  ConfFiles.path = Contents/Resources/vioconf
  QMAKE_BUNDLE_DATA += ConfFiles

  ViopFiles.files +=  $$VIODES_BASE/libviohio.dylib
  ViopFiles.files +=  $$VIODES_BASE/libviomtc.dylib
  ViopFiles.files +=  $$VIODES_BASE/libviosim.dylib
  ViopFiles.files +=  $$VIODES_BASE/libviodiag.dylib
  ViopFiles.files +=  $$VIODES_BASE/libviolua.dylib
  ViopFiles.path = Contents/PlugIns/viotypes
  QMAKE_BUNDLE_DATA += ViopFiles

  LuaxFiles.files = $$VIODES_LIBFAUDES/stdflx/
  LuaxFiles.path  = Contents/Resources/luaextensions
  QMAKE_BUNDLE_DATA += LuaxFiles
}

# mac: copy dstinstall and doc
macx {
  viodes_copy_files(bin/dstinstall, $${TARGET}.app/Contents/MacOs)
  viodes_copy_dir(doc/html, $${TARGET}.app/Contents/Resources/doc/destool_html)
}  

# mac: fix library paths (disabled, now using strategic clang options)
macx { 
  # install_name_tool replacement commands for all our libraries
  ITF_LIBFAUDES = -change libfaudes.dylib @executable_path/libfaudes.dylib 
  ITF_LIBVIODES = -change libviodes.dylib @executable_path/libviodes.dylib 
  ITF_LIBVIOGEN = -change libviogen.dylib @executable_path/../plugins/viotypes/libviogen.dylib 
  ITF_ALL = $$ITF_LIBFAUDES $$ITF_LIBVIODES $$ITF_LIBVIOGEN

  QMAKE_EXTRA_TARGETS += macfix
  macfix.target = macfix
  macfix.commands += \
    install_name_tool $$ITF_ALL DESTool.app/Contents/MacOS/DESTool ; \
    install_name_tool $$ITF_ALL DESTool.app/Contents/MacOS/libviodes.dylib ; \
    install_name_tool $$ITF_ALL DESTool.app/Contents/plugins/viotypes/libviogen.dylib ; \
    install_name_tool $$ITF_ALL DESTool.app/Contents/plugins/viotypes/libviohio.dylib ; \
    install_name_tool $$ITF_ALL DESTool.app/Contents/plugins/viotypes/libviomtc.dylib ; \
    install_name_tool $$ITF_ALL DESTool.app/Contents/plugins/viotypes/libviosim.dylib ; \
    install_name_tool $$ITF_ALL DESTool.app/Contents/plugins/viotypes/libviodiag.dylib ; \
    install_name_tool $$ITF_ALL DESTool.app/Contents/plugins/viotypes/libviolua.dylib
  #QMAKE_POST_LINK += make macfix ### (disabled)
}


# Windows (both msys and msvc)
win32 {

  DESTOOL_LIBS = $$VIODES_LIBFAUDES/faudes.dll
  DESTOOL_LIBS += $$VIODES_LIBFAUDES/include/libfaudes.rti
  DESTOOL_LIBS += $$VIODES_BASE/viodes.dll
  DESTOOL_LIBS += $$VIODES_BASE/vioedit/examples/vioconfig.txt

  VIODES_PLUGINS =  $$VIODES_BASE/viogen.dll
  VIODES_PLUGINS += $$VIODES_BASE/viohio.dll
  VIODES_PLUGINS += $$VIODES_BASE/viomtc.dll
  VIODES_PLUGINS += $$VIODES_BASE/viosim.dll
  VIODES_PLUGINS += $$VIODES_BASE/viodiag.dll
  VIODES_PLUGINS += $$VIODES_BASE/violua.dll

  DESTOOL_BINS += $$VIODES_LIBFAUDES/bin/*.exe

  viodes_copy_files($$DESTOOL_LIBS, ./release/)
  viodes_copy_files($$DESTOOL_BINS, ./release/)
  viodes_copy_files($$VIODES_PLUGINS, ./release/plugins/)
  viodes_copy_files($$VIODES_LIBFAUDES/stdflx/*.flx, ./release/plugins/luaextensions/)

}

                
# fake submake
SUBDIRS += dstinstall doc
for(dir, SUBDIRS) {
  message("=== qmake for $$dir")
  res=$$system( $$QMAKE_CD $$dir && $$QMAKE_QMAKE $$dir.pro  )
  unix:QMAKE_PRE_LINK += make -C $$dir $$escape_expand(\\n\\t)
  win32-g++:QMAKE_PRE_LINK += make -C $$dir $$escape_expand(\\n\\t)
}



# qmake inspection
#for(var, $$list($$enumerate_vars())) {
#    message($$var)
#    message($$eval($$var))
#}
