#!/usr/bin/perl -w
#
# svn copied from smi-smj-conversion.pl
# Convert names in the URJ-CYRL propernoun lexicon to myv when developed.
# $Id$

use strict;
use utf8;

while(<>) {
	# Continuation lexicon substitutions:
	s/л\ +CYRL-CONS_SUR\ +\"Z\"\ *\;/л\ CYRL-Л_SUR\ \"Z\"\ \;/g ;
#	s/ C-FI-NEN/nen LONDON/g ;
#	s/SUND/BERN/g ;
#	s/HEIM/BERN/g ;
#	s/NIKOSIIJA/ACCRA/g ;
#	s/SIJTE/ACCRA/g ;
#	s/BALAK/ANAR/g ;
#	s/HAWAII/ACCRA/g ;
#	s/SKANIK/SULLOT/g ;
#
#	# SME escape char deletion:
#	s/j9/j/g ;
#	s/7 / /g ;
#	s/8 / /g ;
#	s/9 / /g ;
#
#	# SMJ escape char insertion:
#	s/ss /ss9 /g ;
#	s/st /st9 /g ;
#
#	# Substitutions due to orthographic differences between SMJ and SME:
#	s/t:(.*)h /t:$1d9 /g ;
#	s/čč/ttj/g ;
#	s/Č/Tj/g ;
#	# Andreevič -> Andreevitj:
#	s/^(.*)č /$1tj:$1t9j /g ;
#	s/č/tj/g ;
#	s/šž/sjtj/g ;
#	s/Šž/Sjtj/g ;
#	s/šš/ssj/g ;
#	s/žž/dtj/g ;
#	s/Š/Sj/g ;
#	s/š/sj/g ;
#	s/ž/dj/g ;
#	# j->i || Vow i .* : .* Vow _ ; Heaika:Heajka -> Heaika:Heaika. But Majken 	
#	s/([ÁAEIOUaáeiou])i(.*):(.*)([ÁAEIOUaáeiou])j/$1i$2:$3$4i/g ;
#
#	my $line = $_;
#
#	# Special treatment of æ in SMJ:
#	if ($line =~ /æ/) {
#			# Replace space in multipart names temporarily with $.
#		$line =~ s/% /\$/g;
#		
#		$line =~ s/^\s+//;
#		
#		my ($word, $rest) = split (/\s+/, $line, 2);
#		$word =~ s/\$/% /g;
#		if ($line !~ /\:/) {
#			( my $int_word = $word )     =~ s/æ/æ9/g;
#			$int_word =~ s/ä/ä9/g;
#			$line = $word . ":" . $int_word . " " . $rest;
#		}
#		else {
#			my ($upper, $lower) = split(/\:/, $word);
#			( my $int_word = $lower )     =~ s/æ/æ9/g;
#			$int_word =~ s/ä/ä9/g;
#			$line = $upper . ":" . $int_word . " " . $rest;
#		}
#	}
	print $line;
}

