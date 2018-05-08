#!/bin/bash

cat src/morphology/stems/*.lexc | sed -e 's/!.*//' | egrep -v '^[[:space:]]*$' \
      | egrep -v '^LEXICON' | wc -l

