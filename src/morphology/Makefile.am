## Process this file with automake to produce Makefile.in

## Copyright (C) 2011 Samediggi

## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.

## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.

## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

# Add language-specific flags for hfst-lexc compilation here:
HFST_LEXC_LOCAL_FLAGS=

# Set this to name of lexc file containing Multichar_Symbols and LEXICON Root
GT_LEXC_ROOT=root.lexc

# Set this to the names of all regular lexc source files:
GT_LEXC_SRCS_L1_L2=\
		stems/abbreviations.lexc   \
		stems/acronyms.lexc        \
		stems/exceptions.lexc      \
		stems/punctuation.lexc     \
		stems/adjectives_newwords.lexc              \
		stems/adjectives-russian-like_newwords.lexc \
		stems/adverbs_newwords.lexc                 \
		stems/propernouns_newwords.lexc             \
		stems/nouns_newwords.lexc  \
		stems/verbs_newwords.lexc  \
		affixes/adjectives.lexc    \
		affixes/adpositions.lexc   \
		affixes/adverbs.lexc       \
		affixes/conjunctors.lexc   \
		affixes/interjections.lexc \
		affixes/nouns.lexc         \
		affixes/particles.lexc     \
		affixes/pronouns.lexc      \
		affixes/propernouns.lexc   \
		affixes/quantifiers.lexc   \
		affixes/verbs.lexc


# If you are building an error-detecting L2 analyser, specify the lexc files
# that differ between the regular L1 and the L2 analysers below, in L1 and
# L2 respectively. L2 files must end in "*-L2.lexc". See SME for an example.
L1=

L2=

GT_LEXC_SRCS=\
			$(GT_LEXC_SRCS_L1_L2) \
			$(L1)

GT_LEXC_L2_SRCS=\
			$(GT_LEXC_SRCS_L1_L2) \
			$(L2)

# Set this to the names of all generated lexc files, if any
GENERATED_LEXC_SRCS=\
		generated_files/urj-Cyrl-propernouns.lexc               \
		$(srcdir)/stems/adjectives.lexc                         \
		$(srcdir)/stems/adjectives-russian-like.lexc            \
		$(srcdir)/stems/adpositions.lexc                        \
		$(srcdir)/stems/adverbs.lexc                            \
		$(srcdir)/stems/conjunctors.lexc                        \
		$(srcdir)/stems/descriptives.lexc                       \
		$(srcdir)/stems/gerunds.lexc                            \
		$(srcdir)/stems/interjections.lexc                      \
		$(srcdir)/stems/nouns-deverbal.lexc                     \
		$(srcdir)/stems/nouns.lexc                              \
		$(srcdir)/stems/nouns-russian-homographs.lexc           \
		$(srcdir)/stems/particles.lexc                          \
		$(srcdir)/stems/pronouns.lexc                           \
		$(srcdir)/stems/propernouns-malenames-cyrillic.lexc     \
		$(srcdir)/stems/propernouns-malesurnames-cyrillic.lexc  \
		$(srcdir)/stems/propernouns-toponyms-Komi.lexc  \
		$(srcdir)/stems/propernouns.lexc                        \
		$(srcdir)/stems/quantifiers.lexc                        \
		$(srcdir)/stems/verbs-A2M.lexc                          \
		$(srcdir)/stems/verbs-N2END.lexc

# $(srcdir)/stems/propernouns-malenames-russian-derivable.lexc
# $(srcdir)/stems/propernouns-malesurnames-russian-derivable.lexc
# $(srcdir)/stems/propernouns-toponyms-Russian.lexc
# Set this to the names of all source xml files, if any
GT_XML_SRCS=\
		stems/adjectives.xml                        \
		stems/adjectives-russian-like.xml           \
		stems/adpositions.xml                       \
		stems/adverbs.xml                           \
		stems/conjunctors.xml                       \
		stems/descriptives.xml                      \
		stems/gerunds.xml                           \
		stems/interjections.xml                     \
		stems/nouns-deverbal.xml                    \
		stems/nouns.xml                             \
		stems/nouns-russian-homographs.xml          \
		stems/particles.xml                         \
		stems/pronouns.xml                          \
		stems/propernouns-malenames-cyrillic.xml    \
		stems/propernouns-malesurnames-cyrillic.xml \
		stems/propernouns-toponyms-Komi.xml \
		stems/propernouns.xml                       \
		stems/quantifiers.xml                       \
		stems/verbs-A2M.xml                         \
		stems/verbs-N2END.xml

# stems/propernouns-malenames-russian-derivable.xml
# stems/propernouns-malesurnames-russian-derivable.xml
# stems/propernouns-toponyms-Russian.xml

# Define any additional lexc sources here (compiled on their own):
GT_LOCAL_SRCS=

# Define local xfscripts here:
GT_LOCAL_XFSCRIPT_SRCS=

# Define here any additional sources just included in the distro:
GT_DISTRO_SRCS=

### BEGIN: Local processing: ###

generated_files/urj-Cyrl-propernouns.lexc: \
	$(GTCORE)/giella-shared/urj-Cyrl/src/morphology/stems/urj-Cyrl-propernouns.lexc
	$(AM_V_at)$(MKDIR_P) generated_files
	$(AM_V_CP)cp -f $< $@

### END: Local processing: ###

include $(top_srcdir)/am-shared/src-morphology-dir-include.am

# vim: set ft=automake:
