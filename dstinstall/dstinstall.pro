#
# project file for dstinstall, tmoor 201602
#
#

# set friends paths
VIODES_BASE = ../../libviodes
VIODES_LIBFAUDES = ../../libviodes/libfaudes_for_viodes

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
TEMPLATE = app
LANGUAGE = C++
CONFIG += qt console 
CONFIG -= app_bundle
QT -= gui

# link statically with libfaudes
unix:!macx { LIBS += $$VIODES_LIBFAUDES/minfaudes.a }
macx:LIBS += $$VIODES_LIBFAUDES/minfaudes.a
win32:LIBS += $$VIODES_LIBFAUDES/minfaudes.lib wsock32.lib winmm.lib

# include path
INCLUDEPATH += $$VIODES_LIBFAUDES/include

# build paths
OBJECTS_DIR = ./obj
MOC_DIR = ./obj

# sources
HEADERS      += src/dstinstall.h
SOURCES      += src/dstinstall.cpp

