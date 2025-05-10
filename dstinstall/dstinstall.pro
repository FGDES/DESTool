#
# project file for dstinstall, tmoor 201602
#
#

# set friends paths
VIODES_BASE = ../../libVIODES
VIODES_LIBFAUDES = ../../libVIODES/libFAUDES_for_VIODES

# retrieve version from qmake persistent settings
# figure version numbers from qmake database
VIODES_VERSION_MAJOR = $$[VIODES_VERSION_MAJOR]
VIODES_VERSION_MINOR = $$[VIODES_VERSION_MINOR]
isEmpty( VIODES_VERSION_MAJOR ): error("=== error: libVIODES major version not configured")
isEmpty( VIODES_VERSION_MINOR ): error("=== error: libVIODES minor version not configured")
VIODES_VERSION = $${VIODES_VERSION_MAJOR}.$${VIODES_VERSION_MINOR}

# pass on version
DEFINES += VIODES_VERSION=\\\"$${VIODES_VERSION}\\\"

# target setting
unix:!macx { TARGET = ../lib/dstinstall.bin }
macx:TARGET = ../bin/dstinstall
win32:TARGET = ../../bin/dstinstall

TEMPLATE = app
LANGUAGE = C++
CONFIG += qt console 
CONFIG -= app_bundle
QT -= gui widgets

# link statically with libfaudes
unix:!macx { LIBS += $$VIODES_LIBFAUDES/minfaudes.a }
macx:LIBS += $$VIODES_LIBFAUDES/minfaudes.a
win32:LIBS += $$VIODES_LIBFAUDES/minfaudes.lib -lwsock32 -lwinmm

# include path
INCLUDEPATH += $$VIODES_LIBFAUDES/include

# build paths
OBJECTS_DIR = ./obj
MOC_DIR = ./obj

# sources
HEADERS      += src/dstinstall.h
SOURCES      += src/dstinstall.cpp

