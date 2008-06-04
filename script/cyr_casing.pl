#!/usr/bin/perl -w
use encoding 'utf-8';

my $i = 1 ;

while (<>){

if ( /^  <lemma>(.*)/ ) {
	$_ =~ s/^(  <lemma>)(.)([А-ЯЁ]*)<(.*)/$1/;
	}
print;
}


# File to add index to dis rules.
# At present, it
# does not name already named rules

