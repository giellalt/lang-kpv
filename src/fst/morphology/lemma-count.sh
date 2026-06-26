#!/bin/bash

# For debugging, uncomment this command:
# set -x
# run from lang-ISO: src/fst/morphology/lemma-count.sh .

srcdir=$1

lemmacount=$(grep -h ';' "$srcdir"/src/fst/morphology/stems/*.lexc | wc -l)

echo $lemmacount
