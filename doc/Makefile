################################################################################
# Makefile for destool html doc, tmoor 2024
#
# This is simple script to assemble destool documentation.
# Sources:
# - configured libFAUDES in viodes source
# - destool pages in destool/doc/src
# - dstinstall at destool/bin/dstinstall 
#
# Targets
# * dist-clean to start from scartch
# * html for destool pages
# * dstintl to install libFAUDES registry
#
# * defaults to target dstinst (implies html)
#
###############################################################################

# defaul target 
default: dstinst


####################################
# Directory structure
####################################

# my paths
SRCDIR = src
HTMLDIR = html
TMPDIR = tmp
SRCFAUDES = ../../libVIODES/libFAUDES_for_VIODES
DSTINST   = ../bin/dstinstall


# fref processing configuration (accept overwrite from hompage make process)
REF2HTML_CNAV ?= $(shell pwd)/src/destool_navigation.include_fref
REF2HTML_CSS  ?= destool.css


####################################
# DESTool doc source files
####################################

FREFFILES  = destool_intro.fref destool_instlx.fref destool_instlx83.fref destool_variables.fref destool_script.fref destool_project.fref destool_animation.fref destool_license.fref


####################################
# destool pages
####################################

# html targets
HTMLTARGETS = $(FREFFILES:%.fref=$(HTMLDIR)/%.html) 

# fref sources
FREFSOURCES =  $(FREFFILES:%.fref=$(SRCDIR)/%.fref)  
FREFSOURCES += $(SRCDIR)/destool.qhcp $(SRCDIR)/about.txt


# have refsrc dir
$(HTMLDIR)/refsrc/.tstamp: $(FREFSOURCES) $(REF2HTML_CNAV)
	- mkdir -p $(HTMLDIR)/refsrc
	cp $(FREFSOURCES)  $(HTMLDIR)/refsrc
	cp $(REF2HTML_CNAV) $(HTMLDIR)/refsrc/destool_navigation.include_fref
	- touch $@
$(HTMLDIR)/refsrc: $(HTMLDIR)/refsrc/.tstamp

# have merged css
$(HTMLDIR)/destool.css: $(SRCDIR)/destool.append_css $(HTMLDIR)/refsrc
	cp $(SRCFAUDES)/doc/faudes.css $(HTMLDIR)/refsrc
	cp $(SRCDIR)/destool.append_css $(HTMLDIR)/refsrc
	cp $(HTMLDIR)/refsrc/faudes.css $(HTMLDIR)/destool.css
	cat $(HTMLDIR)/refsrc/destool.append_css >> $(HTMLDIR)/destool.css

# fref process destool pages
$(HTMLDIR)/%.html: $(SRCDIR)/%.fref $(SRCFAUDES)/bin/ref2html
	$(SRCFAUDES)/bin/ref2html -css $(REF2HTML_CSS) -cnav $(REF2HTML_CNAV) $< $@


# images 
$(HTMLDIR)/images: 
	- mkdir -p $(HTMLDIR)/images 
	cp $(SRCDIR)/images/* $@


# user target
html: $(HTMLTARGETS) $(COPYTARGETS) $(HTMLDIR)/destool.css $(HTMLDIR)/images $(HTMLDIR)/refsrc

.PHONY : html $(HTMLDIR)/images

####################################
# dstinstall
####################################

# have reference dir
$(HTMLDIR)/reference: 
	mkdir $@

# have destination for extensions
../lib/plugins/luaextensions:
	mkdir -p $@

# do compile
dstinst: html $(HTMLDIR)/reference $(DSTINST) ../lib/plugins/luaextensions
	$(DSTINST) -lib $(SRCFAUDES) -dst ..
	cp $(HTMLDIR)/destool_intro.html $(HTMLDIR)/index.html

####################################
# clean up all
####################################

dist-clean:
	rm -rf $(HTMLDIR)/*



###############################
# note:
#   $@ = targe
#   $^ = prerequisites
#   $< = first prerequisite
###############################
