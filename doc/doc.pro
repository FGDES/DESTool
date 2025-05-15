# qmake file to prepare DESTool dokumentation


# project layout
LIBFAUDES = ../../libVIODES/libFAUDES_for_VIODES
unix:DSTINSTALL = ../bin/dstinstall 
win32:DSTINSTALL = ../bin/dstinstall.exe
unix:REF2HTML = $$LIBFAUDES/bin/ref2html

# Windows overwrite
win32 {
  DSTINSTALL = ../bin/dstinstall.exe
  REF2HTML = $$LIBFAUDES/bin/ref2html.exe
}

# fref processing configuration (accept overwrite from hompage make process)
REF2HTML_CNAV = ./src/destool_navigation.include_fref
REF2HTML_CSS  = destool.append_css

TEMPLATE = aux
CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt

# destool reference files  
FREFSRC += \
  src/destool_project.fref \
  src/destool_animation.fref \			
  src/destool_example.fref \
  src/destool_script.fref \
  src/destool_instlx.fref \
  src/destool_variables.fref \
  src/destool_instlx83.fref \
  src/destool_intro.fref \			
  src/destool_license.fref \

# fref compiler  
cfref.name = "Compile FAUDES .fref to HTML"
#cfref.CONFIG += no_link
cfref.input = FREFSRC
cfref.output = ./html/${QMAKE_FILE_BASE}.html
cfref.commands = \
    $$REF2HTML -css $$REF2HTML_CSS -cnav $$REF2HTML_CNAV ${QMAKE_FILE_NAME} ${QMAKE_FILE_OUT}
QMAKE_EXTRA_COMPILERS += cfref


# copy fref sources
copyfref.commands = \
  $$QMAKE_MKDIR ./html/refsrc &  \
  $$QMAKE_MKDIR ./html/reference &  \
  $$QMAKE_COPY $$LIBFAUDES/doc/faudes.css ./html/refsrc && \
  $$QMAKE_COPY src/destool.append_css ./html/refsrc && \
  $$QMAKE_COPY $$LIBFAUDES/doc/faudes.css  ./html/destool.css && \
  cat src/destool.append_css >> ./html/destool.css && \
  $$QMAKE_COPY src/*fref ./html/refsrc 
  
# copy images
copyimgs.commands = \
  $$QMAKE_COPY_DIR  src/images ./html/

# run dstinstall
dstinst.commands = \
  $$DSTINSTALL -lib $$LIBFAUDES -b -dst .. && \
  $$QMAKE_COPY ./html/destool_intro.html ./html/index.html

  
   
# register my copy targets   
QMAKE_EXTRA_TARGETS += copyfref copyimgs dstinst
PRE_TARGETDEPS += copyfref copyimgs dstinst


  
