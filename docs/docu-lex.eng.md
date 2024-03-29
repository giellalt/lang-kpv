# Lexicon for the Komi analyser

## The lexicon file format

The Komi lexicon files are used both for dictionary creation and for 
the transducer.

### The interplay between lexicon xml files, derived lexc files and morph files

The main komi file is [kt/kom/src/kom-lex.txt](https://gtsvn.uit.no/langtech/trunk/kt/kom/src/kom-lex.txt). 
It contains the lexicon **Root** (the initial lexicon). In the same src catalogue 
is found the catalogue `working_files`.
(cf. [here](https://gtsvn.uit.no/langtech/trunk/kt/kom/src/working_files) for a look).

During compilation, the entries from the xml files in the dictionary are extracted, and put
in the catalogue `kt/tmp/out/` (two levels up). 

To take an example:

The file [working_files/PRON-PERS_kom-lex.xml](https://gtsvn.uit.no/langtech/trunk/kt/kom/src/working_files/PRON-PERS_kom-lex.xml) has an entry

```
   <entry>
      <lemma>ме</lemma>
      <stem/>
      <contlex>PRON-PERS-SG1-NOM</contlex>
      <pos>PRON-PERS</pos>
      <article>
         <eng>
            <choice>
               <variant>I</variant>
            </choice>
         </eng>
         <fin>
            <choice>
               <variant>minä</variant>
            </choice>
         </fin>
      </article>
   </entry>
```

From this file, the compilation process derives a lexc file to the catalogue
kt/tmp/out. Here, we find a derived file `PRON-PERS_kom-lex.txt`. The first
three lines of that file are:

```
LEXICON PRON-PERS

ме PRON-PERS-SG1-NOM  "I" ;
```

The file-name of the xml file (PRON-PERS) is the name of the continuation lexicon.
Each entry has a **lemma** (here *ме*), and a **stem** (here, the stem is
identical to the lemma). Then comes space, and then the **contlex** (here,
the contlex is *PRON-PERS-SG1-NOM*. The contlex is found in the file
[kt/kom/src/pron-kom-morph.txt](https://gtsvn.uit.no/langtech/trunk/kt/kom/src/pron-kom-morph.txt).

## The lexicon files

The Komi lexicon files are found here (you may have to choose "show source code" in the browser):

* [A-SUPERL_kom-lex.xml](https://gtsvn.uit.no/langtech/trunk/kt/kom/src/working_files/A-SUPERL_kom-lex.xml)
* [ADVROOT_kom-lex.xml](https://gtsvn.uit.no/langtech/trunk/kt/kom/src/working_files/ADVROOT_kom-lex.xml)
* [ADV_kom-lex.xml](https://gtsvn.uit.no/langtech/trunk/kt/kom/src/working_files/ADV_kom-lex.xml)
* [A_kom-lex.xml](https://gtsvn.uit.no/langtech/trunk/kt/kom/src/working_files/A_kom-lex.xml)
* [CONJ_kom-lex.xml](https://gtsvn.uit.no/langtech/trunk/kt/kom/src/working_files/CONJ_kom-lex.xml)
* [IDIOM_kom-lex.xml](https://gtsvn.uit.no/langtech/trunk/kt/kom/src/working_files/IDIOM_kom-lex.xml)
* [INTERJ_kom-lex.xml](https://gtsvn.uit.no/langtech/trunk/kt/kom/src/working_files/INTERJ_kom-lex.xml)
* [NUM_kom-lex.xml](https://gtsvn.uit.no/langtech/trunk/kt/kom/src/working_files/NUM_kom-lex.xml)
* [N_kom-lex.xml](https://gtsvn.uit.no/langtech/trunk/kt/kom/src/working_files/N_kom-lex.xml)
* [NounOBJ.txt](https://gtsvn.uit.no/langtech/trunk/kt/kom/src/working_files/NounOBJ.txt)
* [PART-ONOM_kom-lex.xml](https://gtsvn.uit.no/langtech/trunk/kt/kom/src/working_files/PART-ONOM_kom-lex.xml)
* [PART_kom-lex.xml](https://gtsvn.uit.no/langtech/trunk/kt/kom/src/working_files/PART_kom-lex.xml)
* [POSTP_kom-lex.xml](https://gtsvn.uit.no/langtech/trunk/kt/kom/src/working_files/POSTP_kom-lex.xml)
* [PRON-DEM_kom-lex.xml](https://gtsvn.uit.no/langtech/trunk/kt/kom/src/working_files/PRON-DEM_kom-lex.xml)
* [PRON-INDEF_kom-lex.xml](https://gtsvn.uit.no/langtech/trunk/kt/kom/src/working_files/PRON-INDEF_kom-lex.xml)
* [PRON-INTER_kom-lex.xml](https://gtsvn.uit.no/langtech/trunk/kt/kom/src/working_files/PRON-INTER_kom-lex.xml)
* [PRON-PERS_kom-lex.xml](https://gtsvn.uit.no/langtech/trunk/kt/kom/src/working_files/PRON-PERS_kom-lex.xml)
* [PRON-Q_kom-lex.xml](https://gtsvn.uit.no/langtech/trunk/kt/kom/src/working_files/PRON-Q_kom-lex.xml)
* [PRON-REFL_kom-lex.xml](https://gtsvn.uit.no/langtech/trunk/kt/kom/src/working_files/PRON-REFL_kom-lex.xml)
* [PRON_kom-lex.xml](https://gtsvn.uit.no/langtech/trunk/kt/kom/src/working_files/PRON_kom-lex.xml)
* [PROP_kom-lex.xml](https://gtsvn.uit.no/langtech/trunk/kt/kom/src/working_files/PROP_kom-lex.xml)
* [V-INST_kom-lex.xml](https://gtsvn.uit.no/langtech/trunk/kt/kom/src/working_files/V-INST_kom-lex.xml)
* [V-REFL_kom-lex.xml](https://gtsvn.uit.no/langtech/trunk/kt/kom/src/working_files/V-REFL_kom-lex.xml)
* [VNEG_kom-lex.xml](https://gtsvn.uit.no/langtech/trunk/kt/kom/src/working_files/VNEG_kom-lex.xml)
* [V_kom-lex.xml](https://gtsvn.uit.no/langtech/trunk/kt/kom/src/working_files/V_kom-lex.xml)
* [examples.txt](https://gtsvn.uit.no/langtech/trunk/kt/kom/src/working_files/examples.txt)
