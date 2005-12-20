# This is a makefile that builds the Komi morphological parser
# *****************************************************************

# Search for prerequisites from the bin-directory.
SHELL = /bin/sh
.SUFFIXES:

lg = kom

VPATH=../bin
LEXS = $(patsubst %,%-$(lg)-lex.txt,$(shell perl ../script/xml2lexc --pos_list --lex_file=kom-lex.xml))

cur-dir   := $(shell pwd)
bin-dir   := $(subst src,bin,$(cur-dir))


# This is a preliminary file that builds a Komi Sami parser based upon
# xfst and not twolc.

# Here we build the final generator , an inverted transducer of the analyzer.
# It is dependent upon kom.save

ikom.fst: ../bin/ikom.fst
../bin/ikom.fst: ../bin/kom.fst
	@echo
	@echo "*** Building the inverse ikom.fst ***"
	@echo
	@printf "load ../bin/kom.save \n\
	invert net \n\
	save stack ../bin/ikom.fst \n\
	quit \n" > ../../tmp/ikom-fst-script
	@xfst -utf8 < ../../tmp/ikom-fst-script
	@rm -f ../../tmp/ikom-fst-script


# This goal is to build the final analyser. It depends on all the files.

kom.fst: ../bin/kom.fst
../bin/kom.fst: ../bin/kom.save ../bin/caseconv.fst ../bin/tok.fst 
	@echo
	@echo "*** Building kom.fst ***" ;
	@echo
	@printf "read regex [[@\"../bin/kom.save\"] .o. \
	[@\"../bin/caseconv.fst\"]] ; \n\
	save stack ../bin/kom.fst \n\
	quit \n" > ../../tmp/kom-fst-script
	@xfst -utf8 < ../../tmp/kom-fst-script
	@rm -f ../../tmp/kom-fst-script



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
	@xfst -utf8 < ../../tmp/caseconv-script
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
	@xfst -utf8 < ../../tmp/tok-script
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
	@xfst -utf8 < ../../tmp/kom-save-script
	@rm -f ../../tmp/kom-save-script


kom-lex.save: ../bin/kom-lex.save
../bin/kom-lex.save: kom-lex.txt noun-kom-morph.txt verb-kom-morph.txt \
	pron-kom-morph.txt closed-kom-lex.txt all-kom-lex
	@echo
	@echo "*** Building kom-lex.save ***" ;
	@echo
	printf "compile-source $(addprefix ../bin/,$(LEXS)) $(subst all-kom-lex,,$^) \n\
	save-source ../bin/kom-lex.save \n\
	quit \n" > ../../tmp/kom-lex-save-script
	@lexc -utf8 < ../../tmp/kom-lex-save-script
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
	@xfst -utf8 < ../../tmp/xfst-kom-script
	@rm -f ../../tmp/xfst-kom-script


# Call the xml2lexc script, in order to build the lexc lexicon files.

all-kom-lex: kom-lex.xml
	@echo
	@echo "*** Building komi lexicons ***" ;
	@echo
	@perl ../script/xml2lexc --out_dir=$(bin-dir) --lex_file=$<



clean:
	@rm -f ../bin/*.bin ../bin/*.fst ../bin/*.save ../bin/*-lex.txt




# Return to this later

# The first goal is to build kom-lex.save
# This goal depends on a bunch of lexicon files

# This block shal be added to the dependency files below:
#       adj-kom-lex.txt \
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
#	@xfst -utf8 < ../../tmp/kom-fst-script
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
#	@xfst -utf8 < ../../tmp/tag-order-script
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
#	@xfst -utf8 < ../../tmp/kom-raw-save-script
#	@rm -f ../../tmp/kom-raw-save-script
