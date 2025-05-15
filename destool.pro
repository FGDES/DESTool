#
# project file for destool, tmoor 2025
#
#


# set libfaudes and friends paths
VIODES_BASE = ../libVIODES
VIODES_LIBFAUDES = $$VIODES_BASE/libFAUDES_for_VIODES

# retreive version from qmake persistent settings
VIODES_VERSION_MAJOR = $$[VIODES_VERSION_MAJOR]
VIODES_VERSION_MINOR = $$[VIODES_VERSION_MINOR]
isEmpty( VIODES_VERSION_MAJOR ): error("=== error: libVIODES major version not configured")
isEmpty( VIODES_VERSION_MINOR ): error("=== error: libVIODES minor version not configured")
VIODES_VERSION = $${VIODES_VERSION_MAJOR}.$${VIODES_VERSION_MINOR}

# say hello
message("=== building DESTool")
message("=== libVIODES base at" $${VIODES_BASE})
message("=== libVIODES version" $${VIODES_VERSION})
#message("=== using Qt at" $${QMAKE_LIBDIR_QT})   #QT5
message("=== using Qt at" $$[QT_HOST_LIBS])       #Qt6

# target setting
TEMPLATE = app
LANGUAGE = C++
QT += core gui svg widgets printsupport 

# target name
unix:TARGET = lib/destool.bin
macx:TARGET = DESTool
win32:TARGET = DESTool


# platform dependand library names
unix {
  VIODES_LIBFAUDES_DSO = -L$${VIODES_LIBFAUDES} -lfaudes
  VIODES_LIBVIODES_DSO = -L$${VIODES_BASE} -lviodes
}
win32-msvc {
  VIODES_LIBFAUDES_DSO = $${VIODES_LIBFAUDES}\\faudes.lib
  VIODES_LIBVIODES_DSO = $${VIODES_BASE}\\viodes.lib
}
win32-g++ {
  VIODES_LIBFAUDES_DSO = $${VIODES_LIBFAUDES}\\faudes.lib
  VIODES_LIBVIODES_DSO = $${VIODES_BASE}\\libviodes.a
}


# link to libviodes and libfaudes
LIBS += $${VIODES_LIBFAUDES_DSO} 
LIBS += $${VIODES_LIBVIODES_DSO} 


# dll import/export switch
DEFINES += FAUDES_BUILD_APP
DEFINES += VIODES_BUILD_APP


# destool debugging
debug {
#DEFINES += FAUDES_DEBUG_PROJECT
#DEFINES += FAUDES_DEBUG_SCRIPT
#DEFINES += FAUDES_DEBUG_SIMULATOR
#DEFINES += FAUDES_DEBUG_ITEMS
}

# pass on version to compiler
DEFINES += VIODES_VERSION='\\"$${VIODES_VERSION}\\"'

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

# mac extra configuration
mac { 
    DEFINES += VIO_OSXTRA
#    HEADERS += src/osxtras.h
#    OBJECTIVE_SOURCES += src/osxtras.mm
    LIBS += -framework Cocoa
}

# include path
INCLUDEPATH += $$VIODES_LIBFAUDES/include
INCLUDEPATH += $$VIODES_BASE/include

# build paths
OBJECTS_DIR = ./obj
MOC_DIR = ./obj

# resource file
#RESOURCES = destool.qrc


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
# below this line: copy libraries in place
#
#
#


# copy via post link target
defineTest(viodes_copy) {
  src = $$1
  dst = $$2
  QMAKE_POST_LINK += $$QMAKE_MKDIR  $$shell_path($$dst) &
  for(file, src) {
    QMAKE_POST_LINK += $$QMAKE_COPY_FILE $$shell_path($$file) $$shell_path($$dst/) $$escape_expand(\\n\\t)
  }
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

  viodes_copy($$DESTOOL_LIBS, ./lib)
  viodes_copy($$DESTOOL_BINS, ./bin)
  viodes_copy($$VIODES_PLUGINS, ./lib/plugins/viotypes)
  viodes_copy($$VIODES_LIBFAUDES/stdflx/*.flx, ./lib/plugins/luaextensions)

}


# mac: copy libFAUDES to bundle 
macx { 
  ContFiles.files += $$VIODES_LIBFAUDES/include/libfaudes.rti 
  ContFiles.files += $$VIODES_LIBFAUDES/libfaudes.dylib
  ContFiles.files += $$VIODES_LIBFAUDES/bin/ref2html
  ContFiles.files += $$VIODES_LIBFAUDES/bin/rti2code
  ContFiles.files += $$VIODES_LIBFAUDES/bin/flxinstall
  ContFiles.files += $$VIODES_LIBFAUDES/bin/simfaudes
  ContFiles.files += $$VIODES_LIBFAUDES/bin/luafaudes
  ContFiles.files += bin/dstinstall
  ContFiles.files += $$VIODES_LIBFAUDES/bin/luafaudes.flx
  ContFiles.files += $$VIODES_BASE/libviodes.dylib
  ContFiles.files += $$VIODES_BASE/vioedit/examples/vioconfig.txt 
  ContFiles.path = Contents/MacOS
  QMAKE_BUNDLE_DATA += ContFiles

  ViopFiles.files +=  $$VIODES_BASE/libviogen.dylib
  ViopFiles.files +=  $$VIODES_BASE/libviohio.dylib
  ViopFiles.files +=  $$VIODES_BASE/libviomtc.dylib
  ViopFiles.files +=  $$VIODES_BASE/libviosim.dylib
  ViopFiles.files +=  $$VIODES_BASE/libviodiag.dylib
  ViopFiles.files +=  $$VIODES_BASE/libviolua.dylib
  ViopFiles.path = Contents/plugins/viotypes
  QMAKE_BUNDLE_DATA += ViopFiles

  LuaxFiles.files = $$VIODES_LIBFAUDES/stdflx/
  LuaxFiles.path  = Contents/plugins/luaextensions
  QMAKE_BUNDLE_DATA += LuaxFiles
}

# mac: fix library paths
macx { 
  # install_name_tool replacement commands for all our libraries
  ITF_LIBFAUDES = -change libfaudes.dylib @executable_path/libfaudes.dylib 
  ITF_LIBVIODES = -change libviodes.dylib @executable_path/libviodes.dylib 
  ITF_LIBVIOGEN = -change libviogen.dylib @executable_path/../plugins/viotypes/libviogen.dylib 
  ITF_ALL = $$ITF_LIBFAUDES $$ITF_LIBVIODES $$ITF_LIBVIOGEN

  QMAKE_EXTRA_TARGETS += macfix
  macfix.target = macfix
  macfix.commands += \
    install_name_tool $$ITF_ALL DESTool.app/Contents/MacOS/DESTool && \
    install_name_tool $$ITF_ALL DESTool.app/Contents/MacOS/libviodes.dylib && \
    install_name_tool $$ITF_ALL DESTool.app/Contents/plugins/viotypes/libviogen.dylib && \
    install_name_tool $$ITF_ALL DESTool.app/Contents/plugins/viotypes/libviohio.dylib && \
    install_name_tool $$ITF_ALL DESTool.app/Contents/plugins/viotypes/libviomtc.dylib && \
    install_name_tool $$ITF_ALL DESTool.app/Contents/plugins/viotypes/libviosim.dylib && \
    install_name_tool $$ITF_ALL DESTool.app/Contents/plugins/viotypes/libviodiag.dylib && \
    install_name_tool $$ITF_ALL DESTool.app/Contents/plugins/viotypes/libviolua.dylib
  QMAKE_POST_LINK += make macfix
}

# mac: copy doc to bundle 
macx { 
  DocFiles.files = doc/html/
  DocFiles.path = Contents/Resources/doc/destool_html/
  QMAKE_BUNDLE_DATA += DocFiles
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

  viodes_copy($$DESTOOL_LIBS, ./release/)
  viodes_copy($$DESTOOL_BINS, ./release/)
  viodes_copy($$VIODES_PLUGINS, ./release/plugins/)
  viodes_copy($$VIODES_LIBFAUDES/stdflx/*.flx, ./release/plugins/luaextensions/)

}

                
# fake submake
SUBDIRS += dstinstall doc
for(dir, SUBDIRS) {
  message("=== qmake for $$dir")
  res=$$system( $$QMAKE_CD $$dir && $$QMAKE_QMAKE $$dir.pro  )
  unix:QMAKE_PRE_LINK += make -C $$dir $$escape_expand(\\n\\t)
}



# qmake inspection
#for(var, $$list($$enumerate_vars())) {
#    message($$var)
#    message($$eval($$var))
#}
