# ***************************************************************** #
#   This is a makefile that builds the Komi morphological parser    #
# ***************************************************************** #

# Search for prerequisites from the bin-directory.
SHELL = /bin/sh
.SUFFIXES:

lg = kom

#XMLFILES = kom-lex.xml MaleNicknames4kom-lex.xml Placenames4kom-lex.xml

JV   = java
MF   = -Xmx2048m
EF   = -it main
XSL  = net.sf.saxon.Transform
SCRIPTS     = ../script
COMPDICT    = collect-dict-parts.xsl
SRC    = working_files

VPATH=../bin
#LEXS = $(patsubst %,../bin/%-$(lg)-lex.txt,$(shell perl ../script/xml2lexc --pos_list --lex_file=$(XMLFILES)))
LEXS = $(patsubst %,../bin/%-$(lg)-lex.txt,$(shell perl ../script/xml2lexc --pos_list --lex_file=../bin/kom-lex.xml))


cur-dir   := $(shell pwd)
bin-dir   := $(subst src,bin,$(cur-dir))

XFST = xfst 
#XFST = fst 
LEXC = lexc 

ifeq (victorio.uit.no, $(shell hostname))
XFST = /opt/sami/xerox/c-fsm/ix86-linux2.6-gcc3.4/bin/fst -utf8
LEXC = /opt/sami/xerox/bin/lexc -utf8
TWOLC = /opt/sami/xerox/bin/twolc -utf8
endif

# This is a preliminary file that builds a Komi parser based upon
# xfst and not twolc.

# Here we build the final generator , an inverted transducer of the analyzer.
# It is dependent upon kom.save

ikom.fst: ../bin/ikom.fst
../bin/ikom.fst: ../bin/kom.save ../bin/kom.fst
	@echo
	@echo "*** Building the inverse ikom.fst ***"
	@echo
	@printf "load ../bin/kom.save \n\
	invert net \n\
	save stack ../bin/ikom.fst \n\
	quit \n" > ../../tmp/ikom-fst-script
	$(XFST) < ../../tmp/ikom-fst-script
	@rm -f ../../tmp/ikom-fst-script



# We want an analyzer with Russian tags. It takes the linguistic 
# kom.fst as input and gives us an alternate r-kom.fst

r-kom.fst: ../bin/r-kom.fst
../bin/r-kom.fst: ../bin/kom.fst ../int/tag-rus.fst
	@echo
	@echo "*** Building r-kom.fst, kom.fst with Norwegian tags ***"
	@echo
	@printf "read regex [[@\"../int/tag-rus.fst\"] .o. \
	[@\"../bin/kom.fst\"]] ; \n\
	save stack ../bin/r-kom.fst \n\
	quit \n" > ../../tmp/r-kom-fst-script
	$(XFST) < ../../tmp/r-kom-fst-script
	@rm -f ../../tmp/r-kom-fst-script


# In order to make r-kom.fst we need a binary tag-rus.fst
# This goal depends on tag-rus.regex

tag-rus.fst: ../int/tag-rus.fst
../int/tag-rus.fst: tag-rus.regex
	@echo
	@echo "*** Building tag-rus.fst ***" ;
	@echo
	@printf "read regex < tag-rus.regex \n\
	save stack ../int/tag-rus.fst \n\
	quit \n" > ../../tmp/kom-tag-rus-script
	$(XFST) < ../../tmp/kom-tag-rus-script
	@rm -f ../../tmp/kom-tag-rus-script


# This goal is to build the final analyser. It depends on all the files.

kom.fst: ../bin/kom.fst
../bin/kom.fst: ../bin/kom.save ../bin/caseconv.fst ../bin/tok.fst ../../../gt/common/bin/spellrelax.fst
	@echo
	@echo "*** Building kom.fst ***" ;
	@echo
	@printf "read regex [[@\"../bin/kom.save\"] .o. \
	[@\"../bin/caseconv.fst\"] .o. \
	[@\"../../../gt/common/bin/spellrelax.fst\"]] ; \n\
	save stack ../bin/kom.fst \n\
	quit \n" > ../../tmp/kom-fst-script
	$(XFST) < ../../tmp/kom-fst-script
	@rm -f ../../tmp/kom-fst-script


# This goal is to allow for Scandinavian ä/æ and ö/ø mix
spellrelax: spellrelax.fst
spellrelax.fst: ../../../gt/common/bin/spellrelax.fst
../../../gt/common/bin/spellrelax.fst: ../../../gt/common/src/spellrelax.regex
	@echo
	@echo "*** Building spellrelax.fst ***" ;
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
	@echo "*** Building caseconv.fst ***" ;
	@echo
	@printf "read regex < case.regex \n\
	save stack ../bin/caseconv.fst \n\
	quit \n" > ../../tmp/caseconv-script
	$(XFST) < ../../tmp/caseconv-script
	@rm -f ../../tmp/caseconv-script


# Another goal is to build a preprocessor.This goal depends on tok.txt

tok.fst: ../bin/tok.fst
../bin/tok.fst: tok.txt
	@echo
	@echo "*** Building the tokenizer tok.fst ***" ;
	@echo
	@printf "source tok.txt \n\
	save stack ../bin/tok.fst \n\
	quit \n" > ../../tmp/tok-script
	$(XFST) < ../../tmp/tok-script
	@rm -f ../../tmp/tok-script


kom.save: ../bin/kom.save
../bin/kom.save: ../bin/xfst-kom.bin ../bin/kom-lex.save
	@echo
	@echo "*** Building the parser kom.save ***"
	@echo
	@printf "read regex [[@\"../bin/kom-lex.save\"] .o. \
	[@\"../bin/xfst-kom.bin\"]] ; \n\
	save stack ../bin/kom.save \n\
	quit \n" > ../../tmp/kom-save-script
	$(XFST) < ../../tmp/kom-save-script
	@rm -f ../../tmp/kom-save-script


kom-lex.save: 
kom-lex.save: ../bin/kom-lex.save
../bin/kom-lex.save: kom-lex.txt noun-kom-morph.txt verb-kom-morph.txt \
pron-kom-morph.txt punct-kom-lex.txt num-kom-morph.txt $(LEXS) kom-lex.xml
	@echo
	@echo "*** Building kom-lex.save ***" ;
	@echo
	printf "compile-source $^ \n\
	save-source ../bin/kom-lex.save \n\
	quit \n" > ../../tmp/kom-lex-save-script
	$(LEXC) < ../../tmp/kom-lex-save-script
	rm -f ../../tmp/kom-lex-save-script



# The second goal is to build xfst-kom.bin
# This goal depends on xfst-kom.txt

xfst-kom.bin: ../bin/xfst-kom.bin
../bin/xfst-kom.bin: xfst-kom.txt
	@echo
	@echo "*** Building xfst-kom.bin ***" ;
	@echo
	@printf "source xfst-kom.txt \n\
	save stack ../bin/xfst-kom.bin \n\
	quit \n" > ../../tmp/xfst-kom-script
	$(XFST) < ../../tmp/xfst-kom-script
	@rm -f ../../tmp/xfst-kom-script



# Call the xml2lexc script, in order to build the lexc lexicon files.
#../bin/%-kom-lex.txt: kom-strip.xml
../bin/%-kom-lex.txt: ../bin/kom-lex.xml
	@echo
	@echo "*** Building komi lexicons ***" ;
	@echo
	@perl ../script/xml2lexc --out_dir=$(bin-dir) --lex_file=$<


# Compile the dictionary xml-file by unifing the individual pos-files
../bin/kom-lex.xml: $(SRC)

	@echo
	@echo "*** Generating the kom-lex.xml file ***"
	@echo
	$(JV) $(MF) $(XSL) $(EF) $(SCRIPTS)/$(COMPDICT) dir=../src/$< > $@
	@echo
	@echo "*** Generating the kom-lex.xml file ***"
	@echo



# does nsot work.
# intension: get a pipeline.
#kom-strip.xml: kom-lex.xml
#	@grep -v yGroup kom-lex.xml > kom-strip.xml

clean:
	@rm -f ../bin/*.bin ../bin/*.fst ../bin/*.save ../bin/*-lex.txt ../bin/*-lex.xml




# Return to this later

# The first goal is to build kom-lex.save
# This goal depends on a bunch of lexicon files

# This block shal be added to the dependency files below:
#	adj-kom-lex.txt \
#	adv-kom-lex.txt \
#	pron-kom-lex.txt \
#	punct-kom-lex.txt \
#	cc-kom-lex.txt cs-kom-lex.txt interj-kom-lex.txt pp-kom-lex.txt \

# This block shall be added to the printf compile source statement below.
#	adj-kom-lex.txt \
#	adv-kom-lex.txt \
#	pron-kom-lex.txt \
#	pp-kom-lex.txt punct-kom-lex.txt \
#	cc-kom-lex.txt cs-kom-lex.txt interj-kom-lex.txt  \n\

# Here I build kom.save, with the tags ordered.

#kom.save: ../bin/kom.save
#../bin/kom.save: ../bin/kom-raw.save ../bin/tag-order.fst 
#	@echo
#	@echo "*** Building kom.save ***" ;
#	@echo
#	@printf "read regex [[@\"../bin/kom-raw.save\"] .o. \
#	[@\"../bin/tag-order.fst\"]] ; \n\
#	save stack ../bin/kom.save \n\
#	quit \n" > ../../tmp/kom-fst-script
#	$(XFST) < ../../tmp/kom-fst-script
#	@rm -f ../../tmp/kom-fst-script



# The second goal is to build the tag-order.fst file
# This goal depends on tag-order.regex

#tag-order.fst: ../bin/tag-order.fst
#../bin/tag-order.fst: tag-order.regex
#	@echo
#	@echo "*** Building tag-order.fst ***" ;
#	@echo
#	@printf "read regex < tag-order.regex \n\
#	save stack ../bin/tag-order.fst \n\
#	quit \n" > ../../tmp/tag-order-script
#	$(XFST) < ../../tmp/tag-order-script
#	@rm -f ../../tmp/tag-order-script


#kom.save: ../bin/kom-raw.save
#../bin/kom-raw.save: ../bin/xfst-kom.bin ../bin/kom-lex.save
#	@echo
#	@echo "*** Building the parser kom-raw.save ***"
#	@echo
#	@printf "read regex [[@\"../bin/kom-lex.save\"] .o. \
#	[@\"../bin/xfst-kom.bin\"]] ; \n\
#	save stack ../bin/kom-raw.save \n\
#	quit \n" > ../../tmp/kom-raw-save-script
#	$(XFST) < ../../tmp/kom-raw-save-script
#	@rm -f ../../tmp/kom-raw-save-script
