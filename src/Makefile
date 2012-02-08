# ***************************************************************** #
#   This is a makefile that builds the Komi morphological parser    #
# ***************************************************************** #

# Search for prerequisites from the bin-directory.
SHELL = /bin/sh
.SUFFIXES:

# Language codes:
GTLANG=kom
lg = $(GTLANG)

all: ../bin/i$(GTLANG).fst

# Include the makefile that converts from xml to lexc:
include Makefile_xml

ifeq (victorio.uit.no, $(shell hostname))
XFST = /opt/sami/xerox/c-fsm/ix86-linux2.6-gcc3.4/bin/fst -utf8
LEXC = /opt/sami/xerox/bin/lexc -utf8
TWOLC = /opt/sami/xerox/bin/twolc -utf8
endif

XFST = xfst 
LEXC = lexc 
TWOLC = twolc


# This is a preliminary file that builds a Komi parser based upon
# xfst and not twolc.

# Here we build the final generator, an inverted transducer of the analyzer.
# It is dependent upon $(GTLANG).save

../bin/i$(GTLANG).fst: r-$(GTLANG).fst $(GTLANG)-num.fst
	@echo
	@echo "*** Building the inverse $(@F) ***"
	@echo
	@printf "load ../bin/$(GTLANG).save \n\
	invert net \n\
	save stack ../bin/i$(GTLANG).fst \n\
	quit \n" > ../../tmp/i$(GTLANG)-fst-script
	$(XFST) < ../../tmp/i$(GTLANG)-fst-script
	@rm -f ../../tmp/i$(GTLANG)-fst-script


# We want an analyzer with Russian tags. It takes the linguistic 
# $(GTLANG).fst as input and gives us an alternate r-$(GTLANG).fst

../bin/r-$(GTLANG).fst: ../bin/$(GTLANG).fst ../int/tag-rus.fst
	@echo
	@echo "*** Building $(@F), $(<F) with Russian tags ***"
	@echo
	@printf "read regex [[@\"../int/tag-rus.fst\"] .o. \
	[@\"../bin/$(GTLANG).fst\"]] ; \n\
	save stack ../bin/r-$(GTLANG).fst \n\
	quit \n" > ../../tmp/r-$(GTLANG)-fst-script
	$(XFST) < ../../tmp/r-$(GTLANG)-fst-script
	@rm -f ../../tmp/r-$(GTLANG)-fst-script


# In order to make r-$(GTLANG).fst we need a binary tag-rus.fst
# This goal depends on tag-rus.regex

../int/tag-rus.fst: tag-rus.regex
	@echo
	@echo "*** Building $(@F) ***" ;
	@echo
	@printf "read regex < tag-rus.regex \n\
	save stack ../int/tag-rus.fst \n\
	quit \n" > ../../tmp/$(GTLANG)-tag-rus-script
	$(XFST) < ../../tmp/$(GTLANG)-tag-rus-script
	@rm -f ../../tmp/$(GTLANG)-tag-rus-script


# This goal is to build the final analyser. It depends on all the files.
#Attempt 2011-10-10				../bin/allcaps.fst \
#	[@\"../bin/allcaps.fst\"] .o. \

../bin/$(GTLANG).fst: \
				../bin/$(GTLANG).save \
				../bin/caseconv.fst \
				../bin/tok.fst \
				$(GTHOME)/gt/common/bin/spellrelax.fst
	@echo
	@echo "*** Building $(@F) ***" ;
	@echo
	@printf "read regex [[@\"../bin/$(GTLANG).save\"] .o. \
	[@\"../bin/caseconv.fst\"] .o. \
	[@\"$(GTHOME)/gt/common/bin/spellrelax.fst\"]] ; \n\
	save stack ../bin/$(GTLANG).fst \n\
	quit \n" > ../../tmp/$(GTLANG)-fst-script
	$(XFST) < ../../tmp/$(GTLANG)-fst-script
	@rm -f ../../tmp/$(GTLANG)-fst-script


# This goal is to allow for Latin / Cyrillic i, ö / і, ӧ variation
$(GTHOME)/gt/common/bin/spellrelax.fst: $(GTHOME)/gt/common/src/spellrelax.regex
	@echo
	@echo "*** Building $(@F) ***" ;
	@echo
	@printf "read regex < $< \n\
	save stack $@ \n\
	quit \n" > ../../tmp/spellrelax-script
	$(XFST) < ../../tmp/spellrelax-script
	@rm -f ../../tmp/spellrelax-script


# The second goal is to build the caseconv.fst file
# This goal depends on case.regex

caseconv.fst: ../bin/caseconv.fst
../bin/caseconv.fst: case.regex
	@echo
	@echo "*** Building $(@F) ***" ;
	@echo
	@printf "read regex < case.regex \n\
	save stack ../bin/caseconv.fst \n\
	quit \n" > ../../tmp/caseconv-script
	$(XFST) < ../../tmp/caseconv-script
	@rm -f ../../tmp/caseconv-script

# Adapted from allcaps-sme.regex in gt/sme/rsc/Makefile 2011-10-10
# This goal depends on allcaps.txt
#
#allcaps.fst: ../bin/allcaps.fst
#../bin/allcaps.fst: allcaps.regex
#	@echo
#	@echo "*** Building allcaps.fst ***" ;
#	@echo
#	@printf "read text < allcaps.regex \n\
#	save stack ../bin/allcaps.fst \n\
#	quit \n" > ../../tmp/allcaps-script
#	$(XFST) < ../../tmp/allcaps-script
#	@rm -f ../../tmp/allcaps-script



# Another goal is to build a preprocessor.This goal depends on tok.txt
# We actually use the perl preprocesssor "preprocess" now.
tok.fst: ../bin/tok.fst
../bin/tok.fst: tok.txt
	@echo
	@echo "*** Building the tokenizer $(@F) ***" ;
	@echo
	@printf "source tok.txt \n\
	save stack ../bin/tok.fst \n\
	quit \n" > ../../tmp/tok-script
	$(XFST) < ../../tmp/tok-script
	@rm -f ../../tmp/tok-script


$(GTLANG).save: ../bin/$(GTLANG).save
../bin/$(GTLANG).save: ../bin/$(GTLANG)-lex.save ../bin/xfst-$(GTLANG).bin 
	@echo
	@echo "*** Building the parser $(@F) ***"
	@echo
	@printf "read regex [[@\"../bin/$(GTLANG)-lex.save\"] .o. \
	[@\"../bin/xfst-$(GTLANG).bin\"]] ; \n\
	save stack ../bin/$(GTLANG).save \n\
	quit \n" > ../../tmp/$(GTLANG)-save-script
	$(XFST) < ../../tmp/$(GTLANG)-save-script
	@rm -f ../../tmp/$(GTLANG)-save-script

# Compile the lexicon:
$(GTLANG)-lex.save: ../bin/$(GTLANG)-lex.save
../bin/$(GTLANG)-lex.save: $(SRCS)
	@echo
	@echo "*** Building $(@F) ***" ;
	@echo
	printf "compile-source $^ \n\
	save-source ../bin/$(GTLANG)-lex.save \n\
	quit \n" > ../../tmp/$(GTLANG)-lex-save-script
	$(LEXC) < ../../tmp/$(GTLANG)-lex-save-script
	rm -f ../../tmp/$(GTLANG)-lex-save-script


# The second goal is to build xfst-$(GTLANG).bin
# This goal depends on xfst-$(GTLANG).txt
# Compile the phonological rules:
xfst-$(GTLANG).bin: ../bin/xfst-$(GTLANG).bin
../bin/xfst-$(GTLANG).bin: xfst-$(GTLANG).txt
	@echo
	@echo "*** Building $(@F) ***" ;
	@echo
	@printf "source xfst-$(GTLANG).txt \n\
	save stack ../bin/xfst-$(GTLANG).bin \n\
	quit \n" > ../../tmp/xfst-$(GTLANG)-script
	$(XFST) < ../../tmp/xfst-$(GTLANG)-script
	@rm -f ../../tmp/xfst-$(GTLANG)-script


$(GTLANG)-num.fst: ../bin/$(GTLANG)-num.fst
../bin/$(GTLANG)-num.fst: $(GTLANG)-num.txt
	@echo
	@echo "*** Building $(notdir $@) ***" ;
	@echo
	$(XFST) -e "read lexc < $< " \
		-e "save stack   $@ " \
		-stop


clean:
	@rm -rf \
		../bin/* \
		../../tmp \
		$(GTLANG)-lex-xmlsrc.txt
