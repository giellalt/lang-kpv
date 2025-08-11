# Komi-Zyrian language model documentation

All doc-comment documentation in one large file.

---

# src-cg3-disambiguator.cg3.md 


# Komi disambiguator

## Delimiters 

Sentence delimiters are: "<.>" "<!>" "<?>" "<...>" "<¶>" sent

## Tags and sets 

### Beginning and end of sentence	
BOS
EOS

### Miscellanous

CmpTest
Err
вӧлі Sg3

### Parts of speech tags
N
V
A
Adv
CC
CS
Inter
Pron
Num
Pcle
Clt
Po
Dem
Deg
Qnt
Prop

### Derivation tags
Ex/A (former adj)
Ex/N
Ex/Num
Ex/V
Ex/WORD
VCar
DerTag
AspDerTag

### Verbal categories
Prs
Fut
Fut1
Imprt
Prt1
Prt2
Prf
PrfIpf
HstPrf
PluPrf
HstPluPrf
Ind
Imp
Cond
Opt

Sg1
Sg2
...

Nominal categories
Sg
Pl
Nom
Gen
Abl
Dat
Com 
Cns
...

### Verb sets
VNEG (all Neg verbs)

VFIN

ASKI (tomorrow set)

NOT-PRL (have no homograph Prolative pairs set)

* **NoDerIfPossible** removes all derivations

* **Dem** selects Dem if N Nom to the right

* **NoFinalCC** removes CC if competing Pcle and sentence-final
* **NoABBR** removes ABBR for competing CC

* * *

<small>This (part of) documentation was generated from [src/cg3/disambiguator.cg3](https://github.com/giellalt/lang-kpv/blob/main/src/cg3/disambiguator.cg3)</small>

---

# src-cg3-functions-ikpd.cg3.md 



* Sets for POS sub-categories

* Sets for Semantic tags

* Sets for Morphosyntactic properties

* * *

<small>This (part of) documentation was generated from [src/cg3/functions-ikpd.cg3](https://github.com/giellalt/lang-kpv/blob/main/src/cg3/functions-ikpd.cg3)</small>

---

# src-cg3-functions.cg3.md 



* Sets for POS sub-categories

* Sets for Semantic tags

* Sets for Morphosyntactic properties

* Sets for verbs

- V is all readings with a V tag in them, REAL-V should
be the ones without an N tag following the V.  
The REAL-V set thus awaits a fix to the preprocess V ... N bug.

* The set COPULAS is for predicative constructions

* NP sets defined according to their morphosyntactic features

* The PRE-NP-HEAD family of sets

These sets model noun phrases (NPs). The idea is to first define whatever can
occur in front of the head of the NP, and thereafter negate that with the
expression **WORD - premodifiers**.

The set **NOT-NPMOD** is used to find barriers between NPs.
Typical usage: ... (*1 N BARRIER NPT-NPMOD) ...
meaning: Scan to the first noun, ignoring anything that can be
part of the noun phrase of that noun (i.e., "scan to the next NP head")

* Miscellaneous sets

* Border sets and their complements

* Syntactic sets

These were the set types.

## HABITIVE MAPPING

* **hab1** 

* **hab2** 

* **hab3** (<hab> @ADVL>) for hab-actor and hab-case; if leat to the right, and Nom to the right of leat. Lots of restrictions.

* **habNomLeft** 

* **hab4** 	

* **hab6** 

* **hab7** 

* **hab8** This is not HAB
* **hab5**  This is not HAB

* **habDain** (<hab> @ADVL>) for (Pron Dem Pl Loc) if leat followed by Nom to the right

* **habGen** (<hab> @<ADVL) hab for Gen; if Gen is located in the end of the sentence and Nom is sentence initial

* **spred<obj** (@SPRED<OBJ) for Acc; the object of an SPRPED. Not to be mistaken with OPRED. If SPRED is to the left, and copulas is to the left of it. Nom or Hab are found sentence initially.

* **Hab<spred** (@<SPRED) for Nom; if copulas, goallut or jápmit is FMAINV and habitive or human Loc is found to the left. OR: if Ill or @Pron< followed by HAB are found to the left.

* **Hab>Advlcase<spred** (<ext> @<SUBJ) for Nom; it allows adverbials with Ill/Loc/Com/Ess to be found inbetween HAB and <ext>.

* **Nom>Advlcase<spred** (<ext> @<SUBJ) for Nom; it allows adverbials with Ill/Loc/Com/Ess to be found inbetween Nom and <ext> @<SUBJ.

* **<spred** (<ext> @<SUBJ) for Nom; if copulas to the left, and some kind of adverb, N Loc, time related word or Po to the left of it. OR: if Ill or @Pron< to the left, followed by copulas and the before mentioned to the left of copulas. 

* **<spred** (<ext> @<SUBJ) for Nom, but not for Pers. To the left boahtit or heaŋgát as MAINV, and futher to the left is some kind of place related word, or time related word

* **<spredQst1** (<ext> @<SUBJ) for Nom in a typically question sentence; if A) Hab, some kind of place word, Po or Nom to the left, and Qst followed by copulas to the left. B) same as a, only the Qst-pcle is attached to copulas. C) Qst to the left, with copulas to its left, but not if two Nom:s are found somewhere to the right. D) copulas to the left, and BOS to the left. E) Loc or Ill to the left, and Loc or Hab to the left of this, Qst and copulas to the left. F) Num @>N to the left, Hab, some kind of place word, Po or Nom to the left, and Qst followed by copulas to the left. NOTE) for all these rules; human, Loc or Sem/Plc not allowed to the right.

* **<spredQst2** (@<SPRED) for Nom; in a typically question sentence; differs from <spredQst1 by not beeing as restricted to the right. Though you are not allowed to be Pers or human.

* **Nom<spredQst** (@<SPRED) for Nom; in a typically question sentence. Differs from <spredQst2 by letting Nom be found between SPRED and copulas

* **<spred** (@<SPRED) for A Nom or N Nom if; the subject Nom is on the same side of copulas as you: on the right side of copulas

* **<spredVeara** (@<SPRED) for veara + Nom; if genitive immediately to the right, and intransitive mainverb to the right of genitive

* **leftCop<spred** (@<SPRED) for Nom; if copulas is the main verb to the left, and there is no Ess found to the left of cop (note that Loc is allowed between target and cop). OR: if you are Coll or Sem/Group with copulas to your left. 

* **<spredLocEXPERIMENT** (@<SPRED) for material Loc; if you are to the right of copulas, and the Nom to the left of copulas is not a hab-actor

* **NumTime** (@<SPRED) for A Nom

* **<spredSg** (@<SPRED) for Sg Nom	

* **<spredPg** (@<SPRED) for Pl Nom	

* **<spred** (@<SPRED) for Nom; if copulas to the left, and Nom or sentence boundary to the left of copulas. First one to the right is EOS.

* **<spred** (@<SPRED) for N Ess

* **spredEss>** (@SPRED>) for N Ess; if copulas to the right of you, and if an NP with nom-case first one to your left.

* **HABSpredSg>** (@SPRED>) for Nom; if habitive first one to the left, followed by copulas.

* **GalleSpred>** (@SPRED>) for Num Nom; if sentence initial

* **spredSgMII>** (@SPRED>)

* **r492>** (@SPRED>) for Interr Gen; consisting only of negations. You are not allowed to be MII. You are not allowed to have an adjective or noun to yor right. You are not allowed to have a verb to your right; the exception beeing an aux.

* **AdjSpredSg>** (@SPRED>) for A Sg Nom; if copulas to the right, but not if A or @<SPRED are found to the right of copulas

* **SpredSg>Hab** (@SPRED>) for Nom; if you are sentence initial, copulas is located to the right, and there is a habitive to the right of copulas

* **Spred>SubjInf** (@SPRED>) for Nom; if copulas to the right, and the subject of copulas is an Inf to the right

* **spredCoord** (@<SPRED) coordination for Nom; only if there already is a SPRED to the left of CNP. Not if there is some kind of comparison involved.

* **subj>Sgnr1** (@SUBJ>) for Nom Sg, including Indef Nom if; VFIN + Sg3 or Pl3 to the right (VFIN not allowed to the left) 

* **subj>Du** (@SUBJ>) for dual nominatives, including Coll Nom. VFIN + Du3 to the right. 
* **subj>Pl** (@SUBJ>) for plural nominatives, including Coll and Sem/Group. VFIN + Pl3 to the right.

* **subj>Pl** (@SUBJ>) for plural nominatives

* **subj>Sgnr2** (@SUBJ>) for Nom Sg; if VFIN + Sg3 to the right.

* **<subjSg** (@<SUBJ) for Nom Sg; if VFIN Sg3 or Du2 to the left (no HAB allowed to the left).

* **f<advl** (@-F<ADVL) for infinite adverbials

* **f<advl** (@-F<ADVL) for infinite adverbials

* **s-boundary=advl>** (@ADVL>) for ADVL that resemble s-booundaries. Mainverb to the right.

* **-fobj>** (@-FOBJ>) for Acc 

* **-fobj>** (@-FOBJ>) for Acc

* **advl>mainV** (@ADVL>) if; finite mainverb not found to the left, but the finite mainverb is found to the right.

* **<advl** (@<ADVL) if; finite mainverb found to the left. Not if a comma is found immediately to the left and a finite mainverb is located somewhere to the right of this comma.

* **<advlPoPr** (@<ADVL) if mainverb to the left.
* **advlPoPr>** (@<ADVL) if mainverb to the right.

* **advlEss>** (@<ADVL) for weather and time Ess, if FMAINV to the left.

* **advl>inbetween** (@ADVL>) for Adv; if inbetween two sentenceboundaries where no mainverb is present.

* **comma<advlEOS** (@<ADVL) if; comma found to the left and the finite mainverb to the left of comma. To the right is the end of the sentence.

* **advlBOS>** (@ADVL>) if; you are N Ill and found sentnece initially. First one to your right is a clause.

* **<advlPoEOS** (@<ADVL) for Po; if you are found at the very end of a sentence. A mainverb is needed to the right though.

* **cleanupILL<advl** (@<ADVL) for N Ill if; there are no boundarysymbols to your left, if you arent already @N< OR @APP-N<, and no mainverb is to yor left.

* **<opredAAcc** (@<OPRED) for A Acc; if an other accusative to the left, and a transtive verb to the left of it. OR: if a transitive verb to the left, and an accusative to the left of it.

### sma object

* **<advlEss** (@<ADVL) for ESS-ADVL if; FMAINV to the left
* **<spredEss** (@<SPRED) for N Ess if; FMAINV to the left is intransitive or bargat

## SUBJ MAPPING - leftovers

## OBJ MAPPING - leftovers

## HNOUN MAPPING

* **cleanupILL<advl** (@<ADVL) for N Ill if; there are no boundarysymbols to your left, if you arent already @N< OR @APP-N<, and no mainverb is to yor left.

* **cleanupPo** (@ADVL) for Po: This rule tags all Po:s as ADVL if they haven't gotten a tag somewhere along the way.

* **cleanupPr** (@ADVL) for Po: This rule tags all Pr:s as ADVL if they haven't gotten a tag somewhere along the way.

###  **therestX** adds @X to all what is left, often errouneus disambiguated forms

* * *

<small>This (part of) documentation was generated from [src/cg3/functions.cg3](https://github.com/giellalt/lang-kpv/blob/main/src/cg3/functions.cg3)</small>

---

# src-fst-morphology-affixes-adjectives.lexc.md 

# Adjective inflection
----
Komi (Zyrian) adjectives compare.

Continuation lexicon has been assigned according to <pos/> content

* LEXICON A_PARAGOGIC-В/Л  юмов:юмо юмолӧсь
Singular predicative 

* * *

<small>This (part of) documentation was generated from [src/fst/morphology/affixes/adjectives.lexc](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/affixes/adjectives.lexc)</small>

---

# src-fst-morphology-affixes-adpositions.lexc.md 

# Postposition inflection
----

Komi postpositions inflect for direction.

Prep lexica

Postp lexica 

This contlex allows for relational word which, otherwise, are open 
to extensive declension

* **LEXICON POSTP1  **
these are: 

аддза, бӧрті, бокиті, боксянь, дырйи, йитӧдын, 
кузя, ног, ньылыд, паныдӧн, пӧлӧн, пыдди, пыр, понда, 
ради, уліті, выліті, вывті, вомас, вомӧн
пӧвст

* **LEXICON PO-SPAT_  **
these are: 

аддза, бӧрті, бокиті, боксянь, дырйи, йитӧдын, 
кузя, ног, ньылыд, паныдӧн, пӧлӧн, пыдди, пыр, понда, 
ради, уліті, выліті, вывті, вомас, вомӧн
пӧвст

* * *

<small>This (part of) documentation was generated from [src/fst/morphology/affixes/adpositions.lexc](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/affixes/adpositions.lexc)</small>

---

# src-fst-morphology-affixes-adverbs.lexc.md 

# Adverb inflection
----
Komi adverbs inflect for direction.

LEXICON ADV-DEG_  depricate ADV-ADA_ and Ad-ATAG

LEXICON ADV-MANNER_ 

LEXICON ADV-NEG_ 

LEXICON GER_ 

* **LEXICON ADV-SPAT  **
these are adverbs in spatial cases
and they probably are equivalent in morphology to postpositions

* * *

<small>This (part of) documentation was generated from [src/fst/morphology/affixes/adverbs.lexc](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/affixes/adverbs.lexc)</small>

---

# src-fst-morphology-affixes-conjunctors.lexc.md 

# Conjunctors
----
Komi conjunctors

LEXICON CC_ 

LEXICON CS_ 

LEXICON CS_DIAL 

LEXICON CONJ_ 

* * *

<small>This (part of) documentation was generated from [src/fst/morphology/affixes/conjunctors.lexc](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/affixes/conjunctors.lexc)</small>

---

# src-fst-morphology-affixes-interjections.lexc.md 

# Interjections
----
Komi Interjections

LEXICON INTERJ_ 

LEXICON INTERJ-CONATIVE_ 

LEXICON INTERJ-FORMULAIC_ 

* * *

<small>This (part of) documentation was generated from [src/fst/morphology/affixes/interjections.lexc](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/affixes/interjections.lexc)</small>

---

# src-fst-morphology-affixes-nouns.lexc.md 


# Noun morphological lexica 

* **LEXICON Vocative**

* **LEXICON Noun1-IS_PTC-OM** is to provide deverbal nouns with +Der/ӧм tags

* **LEXICON Noun1-IS_PTC-AN**

* **LEXICON Noun1-IS_PTC-YSJ**

Basic nouns.

The lexicon for basic nouns is ` N_ `

This should be phased out 2013-05-07

subsequent Cns vs Vow
* LEXICON N_PARAGOGIC  
* LEXICON NMN_PARAGOGIC  

* LEXICON N-RELAT_PARAGOGIC-V/L  ныв:ны нылыс

* LEXICON N_PARAGOGIC-V/L  ныв:ны нылыс
* LEXICON NMN_PARAGOGIC-V/L  ныв:ны нылыс

* LEXICON N_PARAGOGIC-J  ав:ав авйыс
* LEXICON NMN_PARAGOGIC-J  ав:ав авйыс

* LEXICON N_PARAGOGIC-K  пос:пос поскыс
* LEXICON NMN_PARAGOGIC-K  пос:пос поскыс

* LEXICON N_PARAGOGIC-M  зон:зон зонмыс
* LEXICON NMN_PARAGOGIC-M  зон:зон зонмыс

* LEXICON N_PARAGOGIC-T  зеп:зеп зептыс
* LEXICON NMN_PARAGOGIC-T  зеп:зеп зептыс

* LEXICON N_END-IN-DD1  гадь:гад гаддьыс
* LEXICON NMN_END-IN-DD1  автомобиль:автомобил автомобильыс

* LEXICON N_END-IN-DDZ  кыдз:кыд
* LEXICON NMN_END-IN-DDZ  кыдз:кыд

* LEXICON N_END-IN-LL1  моль:мол молльӧ
* LEXICON NMN_END-IN-LL1  моль:мол молльӧ

* LEXICON N-RELAT_END-IN-J  абай:аба абайыс
* LEXICON N_END-IN-J  абай:аба абайыс
* LEXICON N-0_END-IN-J  абай:аба абайыс

* LEXICON N-RELAT_END-IN-Ч/ДЗ  водз:водз
* LEXICON N_END-IN-Ч/ДЗ  водз:водз
* LEXICON NMN_END-IN-Ч/ДЗ  водз:водз

* LEXICON N-RELAT_END-IN-Ь  автомобиль:автомобил автомобильыс
* LEXICON N_END-IN-Ь  автомобиль:автомобил автомобильыс
* LEXICON N-0_END-IN-Ь  автомобиль:автомобил автомобильыс
2015-09-04 change to ь%>яс after xfst rules are removed

## Inflectional lexica

All nouns follow one contlex "N_"
to begin with here is simply a list of all variant
with no more variants beyond:

* **LEXICON CASEPOSSLEX**

SG1

SG2

SG3

PL1

PL2

PL3

SG1
SG2
SG3
PL1
PL2
PL3

SG1
SG2
SG3
PL1
PL2
PL3

SG1

SG2

SG3

PL1

PL2

PL3

## Case

+Der/а+Adv:%>а K ;

* * *

<small>This (part of) documentation was generated from [src/fst/morphology/affixes/nouns.lexc](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/affixes/nouns.lexc)</small>

---

# src-fst-morphology-affixes-particles.lexc.md 

# Particles
----
Komi Particles

LEXICON PCLE_ 

LEXICON PCLE_NEG 

LEXICON PcleIntens 

LEXICON ONOM_ 

LEXICON DESCR_ 

* * *

<small>This (part of) documentation was generated from [src/fst/morphology/affixes/particles.lexc](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/affixes/particles.lexc)</small>

---

# src-fst-morphology-affixes-pronouns.lexc.md 

# Pronominal morphology                           

## Closed class personal pronouns
LEXICON PRONOUN-TYPES 

* **LEXICON PERS** 
* **ме+Pron+Pers+Sg1: PERS-SG1 ;** ...

* **LEXICON PERS-SG1** 

* **LEXICON PERS-PL1**

* **LEXICON PERS-SG2**

* **LEXICON PERS-PL2** 

* **LEXICON PERS-SG3** 

ми мийӧ The 1st and 2nd persons have Oblique case stem strategies
that differ from the 3rd person: 
ті тійӧ nämä ovat aivan eri asioita
сы сійӧ tosin joskus 

* **LEXICON PERS-PL3**

* **LEXICON perssg**

* **LEXICON persplobl**

* = LEXICON persplobl ас:а 

Tagged in the src/morphology/stems/pronouns.xml file

Word-final cases

* * *

<small>This (part of) documentation was generated from [src/fst/morphology/affixes/pronouns.lexc](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/affixes/pronouns.lexc)</small>

---

# src-fst-morphology-affixes-propernouns.lexc.md 

# Proper noun inflection

Komi proper nouns inflect in the same cases as regular
nouns.

## Temporary lexica

LEXICON ACRON-F 

LEXICON ACRON 

LEXICON PROP-RUS_ 
LEXICON PROP_ 

## Russian type Surnames 

Preparing for the template urj-Cyrl
Beginning 2012-11-15
LEXICON CYRL-CONS_SUR 

LEXICON CYRL-SIBILANT_SUR 

LEXICON CYRL-VOW_SUR 

LEXICON CYRL-A_SUR 

LEXICON CYRL-K_SUR 

LEXICON CYRL-L_SUR 
* :2 PropSur-kal ;  These are foreign Л words

LEXICON CYRL-T_SUR 

* LEXICON PROP_KUDO_SURFEM  giella-shared

LEXICON Deriv-RUS-AN_SURMAL 

Абдеев:Абдеев
LEXICON Deriv-RUS-V_SURMAL 

Багрий:Багр
LEXICON Deriv-RUS-IJ_SURMAL 

LEXICON Deriv-RUS-IN_SURMAL 

Аморский:Аморск
LEXICON Deriv-RUS-KIJ_SURMAL 

LEXICON Deriv-RUS-OJ_SURMAL 

LEXICON Deriv-RUS-YJ_SURMAL 

## PLACE NAMES FROM TEMPLATES 

These are vowel-final stems
They have previously received +Sem/Fem tags

## Male given name for deriving patronyms 
Should this be limited to +Sg? 2015-09-06

Вили:Вил

Андрей:Андре

Ending 2012-11-15

FEMALE NAMES FROM TEMPLATE

## PLACE NAMES FROM TEMPLATES 

* **@U.Cap.Opt@+Sg:@U.Cap.Opt@ DENOMINAL-LOCATIVE-ADJECTIVES ; ** This requires down-casing

* **@U.Cap.Opt@+Sem/Plc+EOLang/KPV+Sg:@U.Cap.Opt@ DENOMINAL-LOCATIVE-ADJECTIVES ; ** This requires down-casing

* * *

<small>This (part of) documentation was generated from [src/fst/morphology/affixes/propernouns.lexc](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/affixes/propernouns.lexc)</small>

---

# src-fst-morphology-affixes-quantifiers.lexc.md 



# Numeral morphological lexica 

This has to be worked on 2012-01-19
LEXICON NUM-CARD_ 

LEXICON CARD 

LEXICON ORD 

LEXICON DET_ 

LEXICON DET_END 

LEXICON NUM-IS_DISTR 

LEXICON QNT_ 

LEXICON NUM-APPR ! 2011-11-03 This will need work

LEXICON CARD-APPR 

## Inflectional lexica 

All nouns follow one contlex "Noun1"
to begin with here is simply a list of all variant
with no more variants beyond:

LEXICON NumCASEPOSSLEX 

LEXICON NumMWN 

## Arabic numerals

* **LEXICON NUM-PREFIXES     **  

* * *

<small>This (part of) documentation was generated from [src/fst/morphology/affixes/quantifiers.lexc](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/affixes/quantifiers.lexc)</small>

---

# src-fst-morphology-affixes-symbols.lexc.md 


# Symbol affixes

Noun_symbols_possibly_inflected 

Noun_symbols_never_inflected 

SYMBOL_connector 

SYMBOL_NO_suff 

SYMBOL_suff (can abbreviations have suffixes? Probably, yes)

* * *

<small>This (part of) documentation was generated from [src/fst/morphology/affixes/symbols.lexc](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/affixes/symbols.lexc)</small>

---

# src-fst-morphology-affixes-verbs.lexc.md 



# Verbal morphology               

## Temporary lexicon

V_ temporary lexicon gives +V+WORK

## Closed class verbs

VERBNEGATIVE 

## Open class verbs

Some Flag diacritic lines are with regexes, other with aligned zeros. We want to migrate to
regexes < … > , for readability reasons (sic!)

IV_ЛОКНЫ 

* **LEXICON V-0_ЛОКНЫ** One verb only, локны:лок

* **LEXICON VR_ШУНЫ** 

IV_ШУНЫ 

* **LEXICON V_ШУНЫ** шуны:шу янӧдны, контролируйтны. Ending in -дны, -тны, -Cны, -Vны.
* **LEXICON V-0_ШУНЫ** шуны:шу янӧдны, контролируйтны. Ending in -дны, -тны, -Cны, -Vны.

* **LEXICON VR_АМНЫ**

IV_АМНЫ 
TV_АМНЫ 

BV_АМНЫ 

* **LEXICON V_АМНЫ** амны:ам Ending in -мны, -жны, -дзны,
* **LEXICON V-0_АМНЫ** амны:ам Ending in -мны, -жны, -дзны,

* **LEXICON V_КЫЙНЫ** кыйны:кы Ending in -йны, 

* **LEXICON V-0_КЫЙНЫ** кыйны:кы Ending in -йны, 

* **LEXICON VR_КУТНЫ**

* **LEXICON V_КУТНЫ** шуны:шу янӧдны, контролируйтны. Ending in -дны, -тны, -Cны, -Vны.
* **LEXICON V-0_КУТНЫ** шуны:шу янӧдны, контролируйтны. Ending in -дны, -тны, -Cны, -Vны.

* **LEXICON V-0_БОСЬТНЫ** шуны:шу янӧдны, контролируйтны. Ending in -дны, -тны, -Cны, -Vны.

* **LEXICON VR_НУАВНЫ** нуавны:нуа

* **LEXICON V_НУАВНЫ** нуавны:нуа
* **LEXICON V-0_НУАВНЫ** нуавны:нуа
Consonant-onset

* **LEXICON VR_АРТАСЬНЫ**

* **LEXICON V_АРТАСЬНЫ** артасьны:артась 
* **LEXICON V-0_АРТАСЬНЫ** артасьны:артась 

* **LEXICON VR_ЛЫДДЬЫНЫ** 

* **LEXICON V_ЛЫДДЬЫНЫ** лыддьыны:лыддь ! ярмыны. Multiple-syllable verb ending in -ыны.
* **LEXICON V-0_ЛЫДДЬЫНЫ** лыддьыны:лыддь ! ярмыны. Multiple-syllable verb ending in -ыны.

* **LEXICON VR_ВОЛЫНЫ** 

* **LEXICON V_ВОЛЫНЫ** волыны:лыддь ! ярмыны. Multiple-syllable verb ending in -ыны.
* **LEXICON V-0_ВОЛЫНЫ** волыны:лыддь ! ярмыны. Multiple-syllable verb ending in -ыны.

## Verb conjugation 

* **LEXICON VerbConj-V**  суф б -- ы 

* **LEXICON VerbConj** суф а

* **LEXICON VerbConj_КЫЙНЫ** суф а

* **LEXICON VerbConj_АМНЫ** суф а

* **LEXICON VerbConj_КУТНЫ** суф а

* **LEXICON Finiteforms** Gives linking vowels for 3 tenses

* **LEXICON Finiteforms_КЫЙНЫ** Gives linking vowels for 3 tenses

* **LEXICON Finiteforms_АМНЫ** Gives linking vowels for 3 tenses

* **LEXICON Finiteforms_КУТНЫ** Gives linking vowels for 3 tenses

## Derivation

* **LEXICON Verb-nyDer** 

* **LEXICON Verb-nyDer-ONSET-CONS** Derivation onset in consonant
verb-to-verb

This is fed by LEXICON V_ШУНЫ, and therefore certain corrections
must be made 2012-01-18

овсьыны
пусьыштлывлыны
босьтчыштлывлыны

* **LEXICON Verb-nyDer-ONSET-VOW** Derivation onset	in vowel

* **LEXICON Verb-nyDer-ONSET-Ы** Derivation onset	in vowel

* **LEXICON Verb-nyDer-ONSET-А** Derivation onset	in vowel
босьтасьны

* **LEXICON Verb-nyDer-ONSET-Я** Derivation onset	in vowel
босьтасьны

verb-to-noun

* **LEXICON VerbDer** 
FIX THIS 2015-09-06
* **VerbDer-ONSET_А/Я ;** 

* **LEXICON VerbDer_КЫЙНЫ**
* **: VerbDer-ONSET_Ӧ ;**
* **: VerbDer-ONSET_Я ;** 
* **: VerbDer-ONSET_И ;**

* **LEXICON VerbDer_КУТНЫ**
* **VerbDer-ONSET_Ӧ ;**
* **VerbDer-ONSET_А ;** 
* **VerbDer-ONSET_І ;**

* **LEXICON VerbDer_АРТАСЬНЫ**
* **: VerbDer-ONSET_Ӧ ;**
* **VerbDer-ONSET_Я ;** 
* **VerbDer-ONSET_И ;**

* **LEXICON VerbDer-ONSET_Ӧ** 

* **LEXICON VerbDer-ONSET_І** 

* **LEXICON VerbDer-ONSET_И** 
* **LEXICON VerbDer-ONSET_И/І** 

* **LEXICON VerbDer-ONSET_А** 
* **LEXICON VerbDer-ONSET_А/Я** 

* **LEXICON VerbDer-ONSET_Я**

вевттьысьыны

бертласьны

* **LEXICON EM** эм:эм. Ending in -ӧсь.

* * *

<small>This (part of) documentation was generated from [src/fst/morphology/affixes/verbs.lexc](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/affixes/verbs.lexc)</small>

---

# src-fst-morphology-phonology.twolc.md 

# Komi Zyrian twol file

This file documents the [phonology.twolc file](http://github.com/giellalt/lang-kpv/blob/main/src/fst/phonology.twolc) 

cf. kpv-phon-old.xfscript
cf. [Rueter 2000](http://www.ling.helsinki.fi/~rueter/Publications/Rueter_in-Permistika-6_2000-154-158.pdf)
Хельсинкиса университетын кыв туялысь Ижкарын Перымса кывъяс симпозиум вылын лыддьӧмтор

## Alphabet, Sets and Definitions

### Letters of the alphabet

* а б в г д е ё ж з и і й к л м н о ӧ п р с т у ф х ц ч ш щ ъ ы ь э ю я 
* А Б В Г Д Е Ё Ж З И І Й К Л М Н О Ӧ П Р С Т У Ф Х Ц Ч Ш Щ Ъ Ы Ь Э Ю Я 
* %^к2:к %^л2:л %^м2:м %^т2:т %^ь2:ь 
* %^И2:и 
* %{иі%}:и	 for soft and hard
* %{иі%}:і	 for soft and hard
* %{ая%}:а	 for soft and hard
* %^V1:ӧ        for reduplicated vowel
* %^V1:а %^V1:э %^V1:о %^V1:у 

### Triggers
* %^Close:0	 Close syllable, this triggers final consonant drop, seen in word-final position and before consonant
* %^C2V:0        Consonant v to vowel

### Boundary symbols

*  %>  morpheme boundary мун%>ны
* hash # word boundary
*  %- 
*  «   мед«ічӧт
*  »    удж»ал»ышт

Diacritics

### Sets

Vowel
* Vow =  а е ё и і о ӧ у ы э ю я 
*        А Е Ё И У О Ӧ У Ы Э Ю Я ; 

Palatal Vowel
Cns-initial vowels
* PalVow = е ё ю я 
*          Е Ё Ю Я ; 

All non-vowels, consonants and hard and soft signs
* Cns =  б в г д ж з й к л м н п р с т ф х ц ч ш щ ъ ь 
*        Б В Г Д Ж З Й К Л М Н П Р С Т Ф Х Ц Ч Ш Щ Ъ Ь 
*        к2 л2 м2 т2 ь2 ; 

All non-vowels with exception of soft sign
* CnsNotSoft =  б в г д ж з й к л м н п р с т ф х ц ч ш щ ъ 
*               Б В Г Д Ж З Й К Л М Н П Р С Т Ф Х Ц Ч Ш Щ Ъ 
*        	      к2 л2 м2 т2 ь2 ; 
All consonants followed by Cyrillic и
* CnsBeforeCyri = б в г ж й к м п р ф х ч ш щ 
*               	Б В Г Ж Й К М П Р Ф Х Ч Ш Щ 
*               	к2 м2 т2 ; 

All but z consonants that can be followed by either і or и
* PairedCnsNoZ =  д л н с т 
*                 Д Л Н С Т 
*        	        л2 т2 ; 

Letters
*  Letter = Vow Cns ; 

Dummy
* Dummy =  %^Inf %^PATR %^FEM ; 

### Definitions

No definitions

## Rules

### Rules connected to L/V alternations 

**Rule: The famous L/V** changes л to в betweeen vowel and the ^Close symbol

**Rule: The famous L/V goes Izhva** where л goes to its preceeding vowel (except a) before ^C2V.

**Rule: Vowel lengthening а:о я:ё** for the ^C2V context

**Rule: The ӧ/V as in унаан**
* *уна%>%^V1н*
* *уна%>ан*

### Rules for paragogic consonants

**Rule: Paragogic consonant deletion**

**Rule: Paragogic т deletion and tripple т** between Cns and ^Close
* *Блатт%>тӧг*
* *Блат0%>тӧг*

### Other consonant deletion rules

**Rule: Paragogic т deletion and tripple т**

**Rule: Paragogic т deletion and tripple т**

**Rule: jDeletion after vowel**

**Rule: j to hard sign after consonant**
* *кывй%>%{ая%}#*
* *кывъ%>я#*
* *кӧсй%>%{ая%}#*
* *кӧсъ%>я#*
* *пышй>{ая}с>ны*
* *пышъ>яс>ны*

**Rule: l deletion ALSO tripple letter**
* *металл%>лӧн*
* *метал0%>лӧн*

**Rule: d deletion**

### Vowel Palatalisation rules

**Rule: а 2 я, о 2 ё, у 2 ю**
* *вой%>%{ая%}с*
* *во0%>яс*
* *озй%>%{ая%}с*
* *озъ%>яс*
* *ворссь%>%{ая%}#*
* *ворсс0%>я#*
картопель+Sg+Ine+PxSg3
* *картопель%>%{ая%}с*
* *картопел0%>яс*
картопель+Pl+Nom
* *картопель%>ъяс*
* *картопель%>0яс*

**Rule: %{иі%} 2 і**

**Rule: %{иі%} 2 и**
* *ворссь%>%{иі%}#*
* *ворсс0%>и#*
* *ло%>%{иі%}#*
* *ло%>и#*
* *шу%>%{иі%}с*
* *шу%>ис*
* *вай%>%{иі%}с*
* *вай%>ис*

### Rules for soft and hard sign

**Rule: Soft Sign Deletion**

* *велӧдысь%>сянь*
* *велӧдыс0%>сянь*
* *велӧдысь%>сьыс*
* *велӧдыс0%>сьыс*
* ★*гос0%>сянь* (is not standard language)
* ★*госъ%>сянь* (is not standard language)
* *пас%>сянь*
* *пас%>сянь*
* *пас%^ь2%>сянь*
* *пась%>сянь*

**Rule: Hard Sign Deletion**
* *вой%>ъяс*
* *вой%>0яс*
* *выль%>ъяс*
* *выль%>0яс*
* *коми%>ъяс*
* *коми%>0яс*
* *автобус%>ъяс*
* *автобус%>ъяс*
* ★*автобус%>ъяс* (is not standard language)
* ★*автобус%>0яс* (is not standard language)

**Rule: Hard Sign Palatalization**
* *виддз%^Close%>ъяс*
* *вид0з0%>ьяс*

### Other rules

To do: Look at a more logical ordering

**Rule: No triple letters** deletes the middle consonant in Cx Cx > Cx sequences
* *класс%>сянь*
* *клас0%>сянь*

**Rule: IClitic**

клуб+N+Sg+Err/Dial+Ill **club/kerho**
* *клуб%>э*
* *клуб%>еx*

**Rule: Disallow l to vowel after other than l**

* * *

<small>This (part of) documentation was generated from [src/fst/morphology/phonology.twolc](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/phonology.twolc)</small>

---

# src-fst-morphology-root.lexc.md 


# Multichar\_Symbols and *Root* lexicon for Komi

Check these:

## Analysis symbols
* **+WORK** to mark intermediate solutions

The morphological analyses of wordforms for the Komi-Zyrian
language are presented in this system in terms of the following symbols.
(It is highly suggeste   d to follow existing standards when adding new tags).

### The parts-of-speech tags
* **+A**:  adjective  кывберд   прилагательное
* **+Adp**:  adposition (prepositio, postposition)     
* **+Adv**:  adverb    урчитан            наречие
* **+CS**:  subordinating conjunction      XX   подчинительный союз
* **+CC**:  coordinating conjunction      XX   сочинительный союз
* **+Det**:  determiner  XX   XX
* **+Interj**:  interjection   междометтьӧ   междометие
* **+N**:  noun      эмакыв    - существительное
* **+Num**:  numeral      лыдакыв   числительное
* **+Pcle**:  particle      кывтор   частица
* **+Po**:  postposition   кывбӧр   послелог
* **+Pr**:  preposition   XX   предлог
* **+Pron**:  pronoun   нимвежтас   местоимение
* **+Qnt**:  Quantifier   ХХ   XX
* **+V**:  verb      кадакыв   глагол

### Subtags

#### Adverb subtags

* **+Ideoph** These are ideophonic descriptors used to modify the verb --  вырк ливтясь "**flit** and it flew off"
* **+Deg** Degree depricate AdA
* **+Manner** with reference to type of adverb
* **+Mult** multiplicative, i.e. iterations
* **+Spat** spatial
* **+Temp** temporal
* **+Parenthetic** parenthetical phrase
* **+Presentational** 

#### Interjections
**+Formulaic** = expressions such as аттьӧ, ало, ... 
**+Conative** Used for calling animals, for example брысь, баль-баль, ...

#### Nouns
* **+Prop** proper
* **+CollN** used with paired nouns **collective nouns**
* **+Relat** relational noun: выв, ув

####  Pronouns
* **+Dem**:  demonstrative
* **+Indef**:  indefinite
* **+Interr**:  interrogative
* **+Pers**:  personal
* **+Recipr**:  reciprocal
* **+Refl**:  reflexive
* **+Rel**:  relative
* **+Poss**:  possessive

#### Nominals are inflected for Number and Case

#### Number
* **+Sg**  singular
* **+Pl**  plural
* **+Du** for pronoun.

#### Case

A category of case in Komi can be identified as:

*  **+Acc** accusative ZERO керан
*  **+Acc1** accusative -ӧс керан
*  **+Acc3** accusative -сӧ керан
*  **+Abl** ablative case -лысь босьтан
*  **+Apr** approximative -лань матыстчан
    - **+AprEgr** approximative egressive -ланьсянь матысь ылыстчан
    - **+AprEla** approximative elative -ланьысь матысь петан
    - **+AprIll** approximative illative -ланьӧ матӧ матыстчан
    - **+AprIne** approximative inessive -ланьын матыс ина
    - **+AprPrl** approximative prolative -ланьӧд маті вуджан
    - **+AprTer** approximative terminative -ланьӧдз матіӧдз воан
    - **+AprTra** approximative translative -ланьті маті вуджан
*  **+Car** caritive -тӧг торйӧдан
*  **+Cns** consecultative -ла могман
*  **+Com** Comitative -кӧд ӧтвывтан
*  **+Cmpr** Comparative case form -ся ӧткодялан
*  **+Cmpl**  Postposition complement
*  **+Dat** dative case -лы сетан
*  **+Egr** egressive -сянь ылыстчан
*  **+Ela** elative -ысь петан
*  **+Gen** genitive case -лӧн асалан
*  **+Ill** illative -ӧ пыран
*  **+Ine** inessive -ын ина
*  **+Ins** instrumental -ӧн керанторъя
*  **+Nom** nominative case нимтан
*  **+Prl** prolative -ӧд вуджан
*  **+Tra** translative -ті вуджан
*  **+Ter** Terminative -ӧдз матыстчан
*  **+Voc** Vocative ??
*  **+Abs** Absolute = +Sg+Nom

#### Possessive suff
* **+PxSg1 +PxSg2 +PxSg3 +PxPl1 +PxPl2 +PxPl3** 
* **+Px1 +Px2 +Px3**
* **+So/CP** segment ordering: case, person
* **+So/PC** segment ordering: person, case

#### The comparative forms are:
* **+Comp** джык
* **+Superl** 

#### Numeral tags:
* **+Attr +Card** 
* **+Ord** 
* **+Iter**  Iterative form expressing number of times
* **+Tot** 
* **+Arab +Rom** 
* **+Coll** 

#### Quantifiers (numerals)

* **+Appr**:  Approximative numeral кавто-колмо, колмошка *two or three*   NB! do not confuse with Komi case +Apr
* **+AssocColl**:  -ne- ; avide-
* **+Assoc**:  +мезть
* **+Card**:  cardinal + NCard
* **+ZeroColl**:  Zero collective кодныс
* **+Distr**:  Distributive
* **+Iter: Iterative form expressing number of consecutive times; kpv**:  `кыкысь`
* **+Mult: Multiplicative adverbs number of times; kpv**:  `кык пӧв`
* **+Coord**:  Coordinates, i.e. 65˚36′8,30″ in numerals.lexc
* **+Cop**:  this is for copula complement predicate position with pl in -ӧсь depricated Pred

#### Verb tags
* **+Ind +Prs +Prt1 +Prt2 +Fut +Imprt** tense
* **+Sg1 +Sg2 +Sg3 +Pl1 +Pl2 +Pl3 +Du1** person тэа-меа
* **+1 +2 +3**  Final мед ог _so that I/we won't_ 2019-04-06
* **+Inf** 
* **+Ger**  Gerund This is used with derivations
* **+ConNeg +Neg** 
* **+VAbess** тӧм Participle verbal adjective, see also Der/Abe
* **+VCar** тӧг Gerund
* **+VTer** тӧдз Gerund
* **+Final**  мог, мон, моз 'so that I won't'
* **+TV** 
* **+IV**
* **+Aux** 

#### Other tags
* **+ABBR +ACR** 
* **+Acron** 
* **+Symbol** = independent symbols in the text stream, like £, €, ©
Special symbols are classified with:
* **+CLB +PUNCT +LEFT +RIGHT +MIDDLE** 
* **+Multi** Special multiword units are analysed with:
* **+Guess** 

#### Question and Focus particles:
* **+Qst**
* **+Foc** 
* **+Clt/И**  This comes at the end of a word -и or after vowels (some authors use -й)
* **+Clt** 
* **+Qst/A** 
* **+Qst/Oe** 
* **+Clt/тӧ** 
* **+Clt/сӧ**
* **+Clt/Kodj** adjectival phrase
* **+Clt/Moz** adverbial clause

* **+Hom1** 
* **+Hom2** 
* **+Intens** 

### Tags distinguishing different versions of the same lemma (before POS)
* **+v1**
* **+v2**
* **+v3**
* **+v4**
* **+v5**
* **+v6**
* **+v7**
* **+v8**
* **+v9**
* **+v10**
* **+v11**
* **+v12**
* **+v13**
* **+v14**
* **+v15**
* **+v16**
* **+v17**
* **+v18**
* **+v19**
* **+v20**
* **+v21**
* **+v22**
* **+v23**
* **+v24**

#### Usage tags:
* **+Err/Orth** 
* **+Err/Orth-colloq** colloquial form for patronymic
* **+Err/Orth-no-paragogic-j** 
* **+Err/Orth-no-paragogic-k** 
* **+Err/Orth-no-paragogic-m** 
* **+Err/Orth-no-paragogic-t** 
* **+Err/Orth-l-in-v** followed by vowel, yet v
* **+Err/Orth-l-to-v-in-new** 
* **+Err/Orth-l-to-vowel-lengthening** 
* **+Err/Orth-l-retenstion** 

* **+Err/Dial** e.g. тэг instead of тӧг
* **+Err/Lex** substandard, not in normative fst, no  normative lemma помсьыны
* **+Use/-Spell** 
* **+Use/SpellNoSugg** 
* **+Use/PMatch** means that the following is only used in the analyser feeding the disambiguator
* **+Use/-PMatch** Do not include in fst's made for hfst-pmatch
* **+Use/NG** This is used for minimizing excess generation in apertium kpv-koi
* **+Use/GC** – **only** retained in the HFST Grammar Checker disambiguation analyser
* **+Use/-GC** – **never** retained in the HFST Grammar Checker disambiguation analyser

* +URL * For tagging URLs

#### Dialect features
* **+Dial/л** 
* **+Dial/в** 

#### Check these Where do these come from source
* **+Src/F** foreign source apparently 2015-09-08
* **+Dim** diminutive for verbs -ышт- (there might be a better term)
* **+Dimin** diminutive for nouns -тор-
* **+NonHum** look at this and place somewhere

Semantic tags to help disambiguation & synt. analysis: (before POS)
Borrowed from main/langs/sme/src/morphology/root.lexc

### Semantic tags

* **+Sem/Act** Activity
* **+Sem/Amount** Amount
* **+Sem/Ani** Animate
* **+Sem/Aniprod** Animal Product
* **+Sem/Body** Bodypart
* **+Sem/Body-abstr** siellu, vuoig?a, jierbmi
* **+Sem/Build** Building
* **+Sem/Build-part** Part of Bulding, like the closet
* **+Sem/Cat** Category
* **+Sem/Clth** Clothes
* **+Sem/Clth-jewl** Jewelery
* **+Sem/Clth-part** part of clothes, boallu, sávdnji...
* **+Sem/Ctain** Container
* **+Sem/Ctain-abstr** Abstract container like bank account
* **+Sem/Ctain-clth**
* **+Sem/Curr** Currency like dollár, Not Money
* **+Sem/Dance** Dance
* **+Sem/Dir** Direction like GPS-kursa
* **+Sem/Domain** Domain like politics, reindeerherding (a system of actions)
* **+Sem/Drink** Drink
* **+Sem/Dummytag** Dummytag
* **+Sem/Edu** Educational event
* **+Sem/Event** Event
* **+Sem/Feat** Feature, like Árvu
* **+Sem/Feat-phys** Physiological feature, ivdni, fárda
* **+Sem/Feat-psych** Psychological feauture
* **+Sem/Feat-measr** Psychological feauture
* **+Sem/Fem** Female name
* **+Sem/Food** Food
* **+Sem/Food-med** Medicine
* **+Sem/Furn** Furniture
* **+Sem/Game** Game
* **+Sem/Geom** Geometrical object
* **+Sem/Group** Animal or Human Group
* **+Sem/Hum** Human
* **+Sem/Hum-abstr** Human abstract
* **+Sem/Ideol** Ideology
* **+Sem/Lang** Language
* **+Sem/Mal** Male name
* **+Sem/Mat** Material for producing things
* **+Sem/Measr** Measure
* **+Sem/Money** Has to do with money, like wages, not Curr(ency)
* **+Sem/Obj** Object
* **+Sem/Obj-clo** Cloth
* **+Sem/Obj-cogn** Cloth
* **+Sem/Obj-el** (Electrical) machine or apparatus
* **+Sem/Obj-ling** Object with something written on it
* **+Sem/Obj-rope** flexible ropelike object
* **+Sem/Obj-surfc** Surface object
* **+Sem/Org** Organisation
* **+Sem/Part** Feature, oassi, bealli
* **+Sem/Perc-cogn** Cognative perception
* **+Sem/Perc-emo** Emotional perception
* **+Sem/Perc-phys** Physical perception
* **+Sem/Perc-psych** Physical perception
* **+Sem/Plant** Plant
* **+Sem/Plant-part** Plant part
* **+Sem/Plc** Place
* **+Sem/Plc-abstr** Abstract place
* **+Sem/Plc-elevate** Place
* **+Sem/Plc-line** Place
* **+Sem/Plc-water** Place
* **+Sem/Pos** Position (as in social position job)
* **+Sem/Process** Process
* **+Sem/Prod** Product
* **+Sem/Prod-audio** Audio product
* **+Sem/Prod-cogn** Cognition product
* **+Sem/Prod-ling** Linguistic product
* **+Sem/Prod-vis** Visual product
* **+Sem/Rel** Relation
* **+Sem/Route** Name of a Route
* **+Sem/Rule** Rule or convention
* **+Sem/Semcon** Semantic concept
* **+Sem/Sign** Sign (e.g. numbers, punctuation)
* **+Sem/Sport** Sport
* **+Sem/State**
* **+Sem/State-sick** Illness
* **+Sem/Substnc** Substance, like Air and Water
* **+Sem/Sur** Surname
* **+Sem/Symbol** Symbol
* **+Sem/Time** Time
* **+Sem/Tool** Prototypical tool for repairing things
* **+Sem/Tool-catch** Tool used for catching (e.g. fish)
* **+Sem/Tool-clean** Tool used for cleaning
* **+Sem/Tool-it** Tool used in IT
* **+Sem/Tool-measr** Tool used for measuring
* **+Sem/Tool-music** Music instrument
* **+Sem/Tool-write** Writing tool
* **+Sem/Txt** Text (girji, lávlla...)
* **+Sem/Veh** Vehicle
* **+Sem/Wpn** Weapon
* **+Sem/Wthr** The Weather or the state of ground
* **+Sem/Year**
* **+Sem/Sur-Fem** Surname female
* **+Sem/Sur-Mal** Surname male
* **+Sem/Ant**  Anthroponym
* **+Sem/Ant-Fem**  Anthroponym female
* **+Sem/Ant-Mal**  Anthroponym male
* **+Sem/Patr**  Patronym
* **+Sem/Patr-Fem**  Patronym female
* **+Sem/Patr-Mal**  Patronym male

#### Multiple Semantic tags:
* **+Sem/Ant_Fem** 
* **+Sem/Ant_Mal** 
* **+Sem/Patr-Маl** 
* **+Sem/Event_Plc**  сёянін
* **+Sem/Hum_Prof**  profession, capacity doctor, tractor driver 

### Derivation

Derivations are classified under the morphophonetic form of the suffix, the
source and target part-of-speech.

#### Dertags

* **+Der/xxx** 
* **+Der**  In front of every derivation to make it   possible to target derivations as a class e.g. in regular expressions etc 
* **+Der/La** 
* **+Der/Ан**  Process Participle +AN
* **+Der/Ана** Process Participle +ANA, Gerund or participle according to context (with...)
* **+Der/Анаа**  adverb derived from participle (+ANA) +ANAA
* **+Der/чӧж**  +CHOZH
* **+Der/тӧг** 
* **+Der/Abe** тӧм should take +A, see also +VAbess
* **+Der/Patr** patronymics in Russian
* **+Instr** 
* **+NomAct**
* **+Der/NomAct**  +Event
* **+Der/NomAg** 
* **+Duration**
* **+Der/иг**
* **+Der/Ig**
* **+Der/IgKezhlo**
* **+Der/IgKosta**
* **+Der/IgKosti**
* **+Der/IgMoz** %{иі%}гмоз
* **+Der/IgonMoz** %{иі%}гӧнмоз
* **+Der/IgSor** %{иі%}гсор
* **+Der/IgTyr** %{иі%}гтыр
* **+Der/IgTyrji** %{иі%}гтырйи
* **+Der/IgTyrja** %{иі%}гтыръя
* **+Der/IgChozh**%{иі%}гчӧж
* **+Der/ысь**
* **+ActPrsPtc** 
* **+PrsPrc**
* **+PrsPtc** 
* **+PastPtc** 
* **+Der/кості**  +KOSTI
* **+Der/коста**  +KOSTA
* **+Der/кежлӧ**  +KEZHLO
* **+Der/мысь**  +MYS
* **+Der/мысьт**  +MYST
* **+Der/сор**  = +SOR
* **+Der/тыр**  = +TYR
* **+Der/тырйи**  = +TYRJI
* **+Der/тыръя**  = +TYRJA
* **+Der/мӧн**  = +MON
* **+Der/мӧнъя**  = Ӧнія коми кыв. 2000: 399-403
* **+Der/ӧмӧн**  = +OMON !Ӧнія коми кыв. 2000: 425

Declaring adjectival derivations
Noun phrase modifiers are generally considered derivational 

#### More dertags (TODO: sort/group)
*  **+MAbe** abessive modifier -тӧм 
*  **+MLoc** locative modifier са -
*  **+MHab** habeo modifier а -
*  **+MTmp** temporal modifier ся -
* **+Der/ProprietiveMod** = +Der/APrior  Denominal prioritive adjective Der/а
* **+Der/PrivMod** = тӧм
* **+Der/а** 
* **+Der/са** 
* **+Der/ся** 
* **+Der/Иник** 
* **+Der/Ин** 
* **+Der/увса** 
* **+Der/сайса** 
* **+Der/пӧвстса** 
* **+Der/костса** 
* **+Der/бердса** 
* **+Der/бӧрса** 
* **+Der/весьтса** 
* **+Der/водзса** 
* **+Der/вывса** 
* **+Der/гӧгӧрса** 
* **+Der/дорса** 
* **+Loc** LocMod, IneMod Быд во шедӧдӧны бур успеваемость Воркута да Инта каръясса, Прилузскӧй да Княжпогостскӧй районъясса школаяс.
* **+LocMod** move to Loc
* **+CompMod** 
* **+Der/тӧм**  used with nouns and followed by +AbeMod
* **+Abe** PrivMod, AbeMod джуджыд анализъястӧм да обобщениеястӧм статьяяс.
* **+PrivMod** move to Abe
* **+Prp** ProprietiveMod, HabObjMod Весиг киясыс тӧдсаӧсь, найӧ мугов рӧмаӧсь, кузь чорыд чуньясаӧсь.
* **+ProprietiveMod** move to Prp
* **+Der/TempMod** TempMod Der/ся но и Ф. В. Плесовскийлысь квайтымынӧд вояссяяссӧ * позьӧ аддзыны сӧмын библиотекаясысь.  Declaring spatial adverb derivations; see also spatial postpositions
* **+Der/ла** 
* **+Der/ладор** 
* **+Der/дор** 
* **+Der/выв** 
* **+Der/тор** 
* **+MWN**  check! used once, should it be +Der/MWN?, Well, yes.
* **+Der/MWN** 
* **+Der/мед**  Superlative
* **+Der/сюрӧ +Der/кӧ**  !Declaring Indefinite Pronoun derivations
* **+Der/моз** +MOZ  diminishing, kind of, sort of
* **+Der/кодь** diminishing, kind of, sort of
* **+Der/лун**  adjective-to-noun
* **+Der/ӧм**  verb-to-noun   !Declaring Indefinite Pronoun derivations the combinatory +Event preceding the NP-final noun

#### Declaring Deverbal derivations of verbs
* **+Der/л** 
* **+Der/лы** 
* **+Der/ывлы** 
* **+Der/ышт** 
* **+Der/лывлы** 
* **+Der/сь**  This only occurs following a vowel in an yny-stem 2017-09-19+Der/сь
* **+Der/сьы**  2017-09-19+Der/ч ! This appears to be a variant of +Der/сьы; it follows plosives
* **+Der/чы**  This appears to be a variant of +Der/сьы; it follows plosives
* **+Der/ал** 
* **+Der/овт** 
* **+Der/ась** 
* +Der/N Noun derived with conversion from noun, conversion but not ZERO
* +Der/A Adjective derivated from Noun or Verb
* +Der/Adv Adverb derivated from Adjective

#### Tags for Ethymological Origin marking. This has initially used used with proper nouns
* **+EOLang/BXR** 
* **+EOLang/CHM** 
* **+EOLang/KOI** 
* **+EOLang/KOM** 
* **+EOLang/KPV** 
* **+EOLang/MHR** 
* **+EOLang/MRJ** 
* **+EOLang/MDF** 
* **+EOLang/MYV** 
* **+EOLang/RUS** 
* **+EOLang/YRK** 

### Morphophonology

To represent phonologic variations in word forms we use the following
symbols in the lexicon files:

#### Archiphonemes

* **{aä}**:  Vowel alternating symbol
* **{oö}**:  Vowel alternating symbol 
* **{uü}**:  Vowel alternating symbol
* **%^к2 %^л2 %^м2 %^т2 %^ь2 %^К2 %^Л2 %^М2 %^Т2 %^Ь2 %^И2**
* **%^V1       ** for reduplicated vowel унаӧн > унаан
* **%>**  suffix border
* **%{иі%}**:  for soft and hard
* **%{ая%}**:  for soft and hard

#### Triggers to control variation
* **{front}**:  Vowel change triggers
* **{back}**:  Vowel change triggers
* **%^Close** Close syllable, this triggers final consonant drop, seen in word-final position and before consonant
* **%^C2V   ** Consonant v to vowel, Izhva ныы, ооны

#### Valency tags, i.e. tags assigned to verbs for denoting their arbuments

* **+%<acc%>** accusative
* **+%<ela%>** elative -ысь
* **+%<ins%>** instrumental -ӧн
* **+%<inf_ны%>** infinitive in -ны
* **+%<po_вылӧ%>** postposition вылӧ
* **+%<sub_мый%>** subordinate clause in мый/that

### Symbols that need to be escaped on the lower side (towards twolc):

* »
* «
* \> (written with square brackets, see the root.lexc file)
* < (written with square brackets, see the root.lexc file)

## Flag diacritics

We have manually optimised the structure of our lexicon using following
flag diacritics to restrict morhpological combinatorics - only allow compounds
with verbs if the verb is further derived into a noun again:

| Flags | Explanation 
| ----- | ----------- 
|  **@P.NeedNoun.ON@** | (Dis)allow compounds with verbs unless nominalised
|  **@D.NeedNoun.ON@** | (Dis)allow compounds with verbs unless nominalised
|  **@C.NeedNoun@** | (Dis)allow compounds with verbs unless nominalised

Two flags copied from sme

| Flags | Explanation 
| ----- | ----------- 
|  **@P.Pmatch.Loc@** | Used on multi-token analyses; tell hfst-tokenise/pmatch where in the form/analysis the token should be split.
|  **@P.Pmatch.Backtrack@** | Used on single-token analyses; tell hfst-tokenise/pmatch to backtrack by reanalysing the substrings before and after this point in the form (to find combinations of shorter analyses that would otherwise be missed)

### Compunding

#### Tags
* **+Cmp**
*  +Cmp/Serial used with serial verbs
* **+Cmp/SplitR** 

#### Flags 

For languages that allow compounding, the following flag diacritics are needed
to control position-based compounding restrictions for nominals. Their use is

handled automatically if combined with +CmpN/xxx tags. If not used, they will
do no harm.

| Flags | Explanation 
| ----- | ----------- 
| **@P.CmpFrst.FALSE@** | Require that words tagged as such only appear first
| **@D.CmpPref.TRUE@** | Block such words from entering ENDLEX
| **@P.CmpPref.FALSE@** | Block these words from making further compounds
| **@D.CmpLast.TRUE@** | Block such words from entering R
| **@D.CmpNone.TRUE@** | Combines with the next tag to prohibit compounding
| **@U.CmpNone.FALSE@** | Combines with the prev tag to prohibit compounding
| **@P.CmpOnly.TRUE@** | Sets a flag to indicate that the word has passed R
| **@D.CmpOnly.FALSE@** | Disallow words coming directly from root.

Use the following flag diacritics to control downcasing of derived proper
nouns (e.g. Finnish Pariisi -> pariisilainen). See e.g. North Sámi for how to use
these flags. There exists a ready-made regex that will do the actual down-casing
given the proper use of these flags.

| Flags | Explanation 
| ----- | ----------- 
| **@U.Cap.Obl@** | Always capital letter for names: Deatnu.
| **@U.Cap.Opt@** | Allowing downcasing of derived names: deatnulasj.

| Flags | Explanation 
| ----- | ----------- 
| **@U.CONJ-VAL.TV@** | Flags used with serial verbs: VAL = Valence
| **@U.CONJ-VAL.IV@** | Flags used with serial verbs: VAL = Valence
| **@U.CONJ-INF.YES@** |  INF = Infinitive
| **@U.CONJ-INF.NO@** |  INF = Infinitive
| **@U.CONJ-TX.FUT@** |  TX = tense
| **@U.CONJ-TX.PRES@** |  TX = tense
| **@U.CONJ-TX.PRET1@** |  TX = tense
| **@U.CONJ-TX.PRET2@** |  TX = tense
| **@U.CONJ-GER.IG@** |  GER = gerund
| **@U.CONJ-GER.VCAR@** |  GER = VCar тӧг
| **@U.CONJ-GER.VCARMoz@** |  GER = VCar тӧгмоз
| **@U.CONJ-GER.VMON@** |  GER = VMon мӧн
| **@U.CONJ-GER.VTER@** |  GER = VTer тӧдз
| **@U.CONJ-MX.IND@** | MX = mood
| **@U.CONJ-MX.IMP@** | MX = mood
| **@U.CONJ-CONNEG.YES@** | CONNEG = negation
| **@U.CONJ-CONNEG.NO@** | CONNEG = negation
| **@U.CONJ-NX.PL@** | NX = number
| **@U.CONJ-NX.SG@** | NX = number
| **@U.CONJ-POSS.1@** | POSS = possessive, person 1
| **@U.CONJ-POSS.2@** | POSS = possessive 2
| **@U.CONJ-POSS.3@** | POSS = possessive 3
| **@U.CONJ-POSS.2ACC@** | POSS = possessive etc.
| **@U.CONJ-POSS.3ACC@** | POSS = possessive
| **@U.CONJ-PX.1@** | PX = person
| **@U.CONJ-PX.2@** | PX = person
| **@U.CONJ-PX.3@** | PX = person
| **@C.CONJ-VAL@** | Removal
| **@C.CONJ-INF@** | Removal
| **@C.CONJ-TX@** | Removal
| **@C.CONJ-MX@** | Removal
| **@C.CONJ-GER@** | Removal
| **@C.CONJ-CONNEG@** | Removal
| **@C.CONJ-NX@** | Removal
| **@C.CONJ-PX@** | Removal
| **@C.CONJ-POSS@** | Removal
| **@P.PossPx.Sg1@** | FLAGS USED WITH COLLECTIVE NOUNS
| **@P.PossPx.Sg2@** | FLAGS USED WITH COLLECTIVE NOUNS
| **@P.PossPx.Sg3@** | FLAGS USED WITH COLLECTIVE NOUNS
| **@P.PossPx.Pl1@** | FLAGS USED WITH COLLECTIVE NOUNS
| **@P.PossPx.Pl2@** | FLAGS USED WITH COLLECTIVE NOUNS
| **@P.PossPx.Pl3@** | FLAGS USED WITH COLLECTIVE NOUNS
| **@U.PossPx.Sg1@** | FLAGS USED WITH COLLECTIVE NOUNS
| **@U.PossPx.Sg2@** | FLAGS USED WITH COLLECTIVE NOUNS
| **@U.PossPx.Sg3@** | FLAGS USED WITH COLLECTIVE NOUNS
| **@U.PossPx.Pl1@** | FLAGS USED WITH COLLECTIVE NOUNS
| **@U.PossPx.Pl2@** | FLAGS USED WITH COLLECTIVE NOUNS
| **@U.PossPx.Pl3@** | FLAGS USED WITH COLLECTIVE NOUNS
| **@D.PossPx@** | FLAGS USED WITH COLLECTIVE NOUNS
| **@C.PossPx@** | FLAGS USED WITH COLLECTIVE NOUNS
| **@U.DECL-NX.SG@** | number
| **@U.DECL-NX.PL@** | number
| **@R.DECL-NX.PL@** | number
| **@U.DECL-CX.ABE@** | unify case
| **@U.DECL-CX.ABL@** | unify case
| **@U.DECL-CX.ACC@** | unify case
| **@U.DECL-CX.APR@** | unify case
| **@U.DECL-CX.APRINE@** | unify case
| **@U.DECL-CX.APRILL@** | unify case
| **@U.DECL-CX.APRELA@** | unify case
| **@U.DECL-CX.APREGR@** | unify case
| **@U.DECL-CX.APRPRL@** | unify case
| **@U.DECL-CX.APRTRA@** | unify case
| **@U.DECL-CX.APRTER@** | unify case
| **@U.DECL-CX.CAR@** | unify case
| **@U.DECL-CX.CMP@** | unify case
| **@U.DECL-CX.CNS@** | unify case
| **@U.DECL-CX.COM@** | unify case
| **@U.DECL-CX.DAT@** | unify case
| **@U.DECL-CX.EGR@** | unify case
| **@U.DECL-CX.ELA@** | unify case
| **@U.DECL-CX.GEN@** | unify case
| **@U.DECL-CX.ILL@** | unify case
| **@U.DECL-CX.INE@** | unify case
| **@U.DECL-CX.INS@** | unify case
| **@U.DECL-CX.NOM@** | unify case
| **@U.DECL-CX.PRL@** | unify case
| **@U.DECL-CX.TRA@** | unify case
| **@U.DECL-CX.TER@** | unify case
| **@U.DECL-DX.INDEF@** | declension type
| **@U.DECL-DX.PX@** | declension type
| **@C.DECL-NX@** | Removal
| **@C.DECL-DX@** | Removal
| **@C.DECL-CX@** | Removal
| **@U.Cap.Obl@** | Allowing downcasing of derived names: deatnulasj
| **@U.Cap.Opt@** | Allowing downcasing of derived names: deatnulasj

## Lexicon Root

The word forms in Komi (Zyrian) language start from the lexeme roots of basic
word classes, or optionally from prefixes:
* SUBSTANDARDS ;  temporary solution
* adjectives ; 
* kom-adjectives-russian-like ; 
* adpositions ; 
* adverbs ; 
* conjunctors ; 
* descriptives ; 
* determiners ; 
* gerunds ; 
* interjections ; 
* nouns ; 
* numerals ; 
* particles ; 
* pronouns ; 
* propernouns-malenames-cyrillic ; 
* propernouns-malesurnames-cyrillic ; 
* propernouns-toponyms-Russian ; 2019-10-30 Cyrillic
* @U.Cap.Obl@ propernouns-toponyms-Komi ;  toponyms - always uppercase
* @U.Cap.Opt@ propernouns-toponyms-Komi ;  toponyms - allow downcasing for adj derivation
* propernouns ; 
* quantifiers ; 
* subjunctors ; 
* verbs-A2M ; 
* verbs-N2END ; 
* VERBNEGATIVE ;  affixes/verbs.lexc
* PRONOUN-TYPES ;  in affixes/pronouns.lexc 2019-04-06
* Abbreviation ; 
* Acronym ; 
* kpv-Acronym ; 
* Punctuation ; 
* Symbols ; 
* EXCEPTIONS ; 
* dialect_lexicon ; 
* urj-Cyrl-ProperNouns ; ! Testing 2015-09-06
* A_NEWWORDS ; 
* ADV_NEWWORDS ; 
* N_NEWWORDS ; 
* @U.Cap.Obl@ PROP_NEWWORDS ; 
* @U.Cap.Opt@ PROP_NEWWORDS ; 
* V_NEWWORDS ; 

### Lexica without morphology !

Absolute forms
ABS_
пу керка
выль керка

### Compounding

R

Serial-Verbs

### Lexica called End, whatever they are 

ABBR-IS_ADV

ABBR-IS_N

### Clitics 

K

WordEnd

WordEnd-2

SPAT-COMPARATIVE

COMPARATIVE

SUBSTANDARDS

## Endlex

Lexicon ENDLEX
And this is the ENDLEX of everything:

@D.CmpOnly.FALSE@@D.CmpPref.TRUE@@D.NeedNoun.ON@ # ;
The `@D.CmpOnly.FALSE@` flag diacritic is ued to disallow words tagged
with +CmpNP/Only to end here.
The `@D.NeedNoun.ON@` flag diacritic is used to block illegal compounds.

* * *

<small>This (part of) documentation was generated from [src/fst/morphology/root.lexc](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/root.lexc)</small>

---

# src-fst-morphology-stems-acronyms.lexc.md 



## Acronym inflection

* * *

<small>This (part of) documentation was generated from [src/fst/morphology/stems/acronyms.lexc](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/stems/acronyms.lexc)</small>

---

# src-fst-morphology-stems-adjectives-russian-like_newwords.lexc.md 

This is where new words are added as lexc entries before they are 
added to the xml source files.
важ:важ A_ "(eng) /(fin)/(rus) " ;

ADD ADJECTIVES BELOW

* * *

<small>This (part of) documentation was generated from [src/fst/morphology/stems/adjectives-russian-like_newwords.lexc](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/stems/adjectives-russian-like_newwords.lexc)</small>

---

# src-fst-morphology-stems-adjectives.lexc.md 



colors
from Syktyvkar

* * *

<small>This (part of) documentation was generated from [src/fst/morphology/stems/adjectives.lexc](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/stems/adjectives.lexc)</small>

---

# src-fst-morphology-stems-adjectives_newwords.lexc.md 

This is where new words are added as lexc entries before they are 
added to the xml source files.
важ+A:важ A_ "(eng) /(fin)/(rus) " ;

ADD ADJECTIVES BELOW

* * *

<small>This (part of) documentation was generated from [src/fst/morphology/stems/adjectives_newwords.lexc](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/stems/adjectives_newwords.lexc)</small>

---

# src-fst-morphology-stems-adverbs_newwords.lexc.md 

This is where new words are added as lexc entries before they are 
added to the xml source files.
важын:важын ADV_ "(eng) /(fin)/(rus) " ;

ADD ADVERBS BELOW

* * *

<small>This (part of) documentation was generated from [src/fst/morphology/stems/adverbs_newwords.lexc](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/stems/adverbs_newwords.lexc)</small>

---

# src-fst-morphology-stems-dialect_lexicon.lexc.md 



Hypothetical dialect forms with е/э 2021-03-15

* * *

<small>This (part of) documentation was generated from [src/fst/morphology/stems/dialect_lexicon.lexc](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/stems/dialect_lexicon.lexc)</small>

---

# src-fst-morphology-stems-exceptions.lexc.md 

Exceptions are quite strange word-forms. the ones that do not fit anywhere 
else. This file contains all enumerated word forms that cannot reasonably be
created from lexical data by regular inflection. Usually there should be next
to none exceptions, it's always better to have a paradigm that covers only
one or few words than an exception since these will not work nicely with e.g.
compounding scheme or possibly many end applications.

The pair verb овны-вывны conjugates in more forms than are attested for 
the single verb вывны:

* овны-вывны examples:*
* *олан-вылан:* `овны-вывны+V+Ind+Prs+Sg2`

### VERBS WITH FIRST PRETERITE THIRD PERSON WITHOUT с IN NORM 

### SPECIAL VERB FORM FOR VERBAL TERMINATIVE OF ЛОКНЫ 

### REDUPLICATED ADVERBS

### SUPERLATIVE ADVERBS

### SUPERLATIVE ADJECTIVES

### ADJECTIVES NOT YET ADDED TO DICTIONARY DATABANK

### VOCATIVE EXPRESSIONS

### PROPER NOUNS NOT YET ADDED TO DICTIONARY DATABANK

* * *

<small>This (part of) documentation was generated from [src/fst/morphology/stems/exceptions.lexc](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/stems/exceptions.lexc)</small>

---

# src-fst-morphology-stems-nouns_newwords.lexc.md 

This is where new words are added as lexc entries before they are
added to the xml source files.
чери+N:чери N_ "(eng) fish/(fin) kala|fisu/(rus) рыба" ;

ADD NOUNS BELOW

* * *

<small>This (part of) documentation was generated from [src/fst/morphology/stems/nouns_newwords.lexc](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/stems/nouns_newwords.lexc)</small>

---

# src-fst-morphology-stems-propernouns_newwords.lexc.md 

This is where new words are added as lexc entries before they are 
added to the xml source files.
Абъячой+N+Prop+Sem/Plc:Абъячой PROP_ "(eng) fish/(fin) /(rus)" ;

ADD NOUNS BELOW

* * *

<small>This (part of) documentation was generated from [src/fst/morphology/stems/propernouns_newwords.lexc](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/stems/propernouns_newwords.lexc)</small>

---

# src-fst-morphology-stems-verbs_newwords.lexc.md 

This is where new words are added as lexc entries before they are
added to the xml source files.
воны+V:во V_ "(eng) /(fin)/(rus) " ;

test:test V_ "(eng) /(fin) /(rus) " ;
ADD VERBS BELOW

* * *

<small>This (part of) documentation was generated from [src/fst/morphology/stems/verbs_newwords.lexc](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/stems/verbs_newwords.lexc)</small>

---

# src-fst-phonetics-txt2ipa.xfscript.md 



retroflex plosive, voiceless			t`  ʈ	    0288, 648 (` = ASCII 096)
retroflex plosive, voiced			d`	ɖ		0256, 598
labiodental nasal					F 	ɱ		0271, 625
retroflex nasal						n` 	ɳ		0273, 627
palatal nasal						J 	ɲ		0272, 626
velar nasal							N 	ŋ		014B, 331
uvular nasal							N\	ɴ		0274, 628
	
bilabial trill						B\ 	ʙ		0299, 665
uvular trill							R\ 	ʀ		0280, 640
alveolar tap							4	ɾ		027E, 638
retroflex flap						r` 	ɽ		027D, 637
bilabial fricative, voiceless		p\ 	ɸ		0278, 632
bilabial fricative, voiced			B 	β		03B2, 946
dental fricative, voiceless			T 	θ		03B8, 952
dental fricative, voiced				D 	ð		00F0, 240
postalveolar fricative, voiceless	S	ʃ		0283, 643
postalveolar fricative, voiced		Z 	ʒ		0292, 658
retroflex fricative, voiceless		s` 	ʂ		0282, 642
retroflex fricative, voiced			z` 	ʐ		0290, 656
palatal fricative, voiceless			C 	ç		00E7, 231
palatal fricative, voiced			j\ 	ʝ		029D, 669
velar fricative, voiced	        	G 	ɣ		0263, 611
uvular fricative, voiceless			X	χ		03C7, 967
uvular fricative, voiced				R 	ʁ		0281, 641
pharyngeal fricative, voiceless		X\ 	ħ		0127, 295
pharyngeal fricative, voiced			?\ 	ʕ		0295, 661
glottal fricative, voiced			h\	ɦ		0266, 614

alveolar lateral fricative, vl.		K 
alveolar lateral fricative, vd.		K\

labiodental approximant				P (or v\) 
alveolar approximant					r\ 
retroflex approximant				r\` 
velar approximant					M\

retroflex lateral approximant		l` 
palatal lateral approximant			L 
velar lateral approximant			L\
Clicks

bilabial								O\	(O = capital letter) 
dental								|\
(post)alveolar						!\ 
palatoalveolar						=\ 
alveolar lateral						|\|\
Ejectives, implosives

ejective								_>	e.g. ejective p		p_>
implosive							_<	e.g. implosive b	b_<
Vowels

close back unrounded					M
close central unrounded 				1 
close central rounded				} 
lax i								I 
lax y								Y 
lax u								U

close-mid front rounded				2 
close-mid central unrounded			@\ 
close-mid central rounded			8 
close-mid back unrounded				7

schwa	ə							@

open-mid front unrounded				E 
open-mid front rounded				9
open-mid central unrounded			3 
open-mid central rounded				3\ 
open-mid back unrounded				V 
open-mid back rounded				O

ash (ae digraph)						{ 
open schwa (turned a)				6

open front rounded					& 
open back unrounded	        		A 
open back rounded					Q
Other symbols

voiceless labial-velar fricative		W 
voiced labial-palatal approx.		H 
voiceless epiglottal fricative		H\ 
voiced epiglottal fricative			<\ 
epiglottal plosive					>\

alveolo-palatal fricative, vl. 		s\ 
alveolo-palatal fricative, voiced	z\ 
alveolar lateral flap				l\ 
simultaneous S and x					x\ 
tie bar								_
Suprasegmentals

primary stress						" 
secondary stress						% 
long									: 
half-long							:\ 
extra-short							_X 
linking mark							-\
Tones and word accents

level extra high						_T 
level high							_H
level mid							_M 
level low							_L 
level extra low						_B
downstep								! 
upstep								^	(caret, circumflex)

contour, rising						 
contour, falling						_F 
contour, high rising					_H_T 
contour, low rising					_B_L 

contour, rising-falling				_R_F 
(NB Instead of being written as diacritics with _, all prosodic 
marks can alternatively be placed in a separate tier, set off 
by < >, as recommended for the next two symbols.)
global rise						<R> 
global fall						<F>
Diacritics						
									
voiceless						_0	(0 = figure), e.g. n_0
voiced							_v 
aspirated						_h 
more rounded						_O	(O = letter) 
less rounded						_c 
advanced							_+
retracted						_-
centralized						_" 
syllabic							=	(or _=) e.g. n= (or n_=) 
non-syllabic						_^ 
rhoticity						`
									
breathy voiced					_t 
creaky voiced					_k
linguolabial						_N 
labialized						_w 
palatalized						'	(or _j) e.g. t' (or t_j) 
velarized						_G 
pharyngealized					_?\
									
dental							_d 
apical							_a 
laminal							_m
nasalized						~	(or _~) e.g. A~ (or A_~) 
nasal release					_n
lateral release					_l 
no audible release				_}

velarized or pharyngealized		_e 
velarized l, alternatively		5 
raised							_r 
lowered							_o 
advanced tongue root				_A 
retracted tongue root			_q

* * *

<small>This (part of) documentation was generated from [src/fst/phonetics/txt2ipa.xfscript](https://github.com/giellalt/lang-kpv/blob/main/src/fst/phonetics/txt2ipa.xfscript)</small>

---

# src-fst-phonology-old.xfscript.md 



Definition section !
================== !

Defining Vowel

Defining Palatal Vowel

Defining Consonants

Defining non-soft consonants

Defining consonants before Cyrillic і                  

Defining letters

Defining flags

Defining boundaries

Defining diacritics

Defining dummy

Rule section !
============ !

stopping ы -> 0 2011-01-26
LET's remember that this should only affect verb forms
That means the surface vowels я а и і ӧ
Wrong results тӧд where тыӧд should be
Wrong на should be ныа
Absence of "ы" vowel
"ы" vowel is present before

* * *

<small>This (part of) documentation was generated from [src/fst/phonology-old.xfscript](https://github.com/giellalt/lang-kpv/blob/main/src/fst/phonology-old.xfscript)</small>

---

# src-fst-transcriptions-transcriptor-abbrevs2text.lexc.md 



We describe here how abbreviations are in Komi-Zyrian are read out, e.g.
for text-to-speech systems.

For example:

* s.:syntynyt # ;  
* os.:omaa% sukua # ;  
* v.:vuosi # ;  
* v.:vuonna # ;  
* esim.:esimerkki # ; 
* esim.:esimerkiksi # ; 

* * *

<small>This (part of) documentation was generated from [src/fst/transcriptions/transcriptor-abbrevs2text.lexc](https://github.com/giellalt/lang-kpv/blob/main/src/fst/transcriptions/transcriptor-abbrevs2text.lexc)</small>

---

# tools-grammarcheckers-grammarchecker.cg3.md 


K O M I   G R A M M A R   C H E C K E R

# DELIMITERS

# TAGS AND SETS

### Beginning and end of sentence	
BOS
EOS

### Miscellanous

CmpTest
Err

### Parts of speech tags
N
V
A
Adv
CC
CS
Inter
Pron
Num
Pcle
Clt
Po
Dem
Qnt
Prop

### Derivation tags
Ex/A (former adj)
Ex/N
Ex/Num
Ex/V
Ex/WORD
DerTag

### Verbal categories
Prs
Fut
Fut1
Imprt
Prt1
Prt2
Prf
PrfIpf
HstPrf
PluPrf
HstPluPrf
Ind
Imp
Cond
Opt

Sg1
Sg2
...

Nominal categories
Sg
Pl
Nom
Gen
Abl
Dat
Com 
Cns
...

PPUNCT 
PUNCT
¶

### Verb sets
VNEG (all Neg verbs)

VFIN

ASKI (tomorrow set)

### Grammarchecker sets

* * *

<small>This (part of) documentation was generated from [tools/grammarcheckers/grammarchecker.cg3](https://github.com/giellalt/lang-kpv/blob/main/tools/grammarcheckers/grammarchecker.cg3)</small>

---

# tools-tokenisers-tokeniser-disamb-gt-desc.pmscript.md 

# Tokeniser for kpv

Usage:
```
$ make
$ echo "ja, ja" | hfst-tokenise --giella-cg tokeniser-disamb-gt-desc.pmhfst
$ echo "Juos gorreválggain lea (dárbbašlaš) deavdit gáibádusa boasttu olmmoš, man mielde lahtuid." | hfst-tokenise --giella-cg tokeniser-disamb-gt-desc.pmhfst
$ echo "(gáfe) 'ja' ja 3. ja? ц jaja ukjend \"ukjend\"" | hfst-tokenise --giella-cg tokeniser-disamb-gt-desc.pmhfst
$ echo "márffibiillagáffe" | hfst-tokenise --giella-cg tokeniser-disamb-gt-desc.pmhfst
```

Pmatch documentation:
<https://github.com/hfst/hfst/wiki/HfstPmatch>

Characters which have analyses in the lexicon, but can appear without spaces
before/after, that is, with no context conditions, and adjacent to words:
* Punct contains ASCII punctuation marks
* The symbol after m-dash is soft-hyphen `U+00AD`
* The symbol following {•} is byte-order-mark / zero-width no-break space
`U+FEFF`.

Whitespace contains ASCII white space and
the List contains some unicode white space characters
* En Quad U+2000 to Zero-Width Joiner U+200d'
* Narrow No-Break Space U+202F
* Medium Mathematical Space U+205F
* Word joiner U+2060

Apart from what's in our morphology, there are
1. unknown word-like forms, and
2. unmatched strings
We want to give 1) a match, but let 2) be treated specially by
`hfst-tokenise -a`
Unknowns are made of:
* lower-case ASCII
* upper-case ASCII
* select extended latin symbols
* extended cyrillic
ASCII digits
* select symbols
* Combining diacritics as individual symbols,
* various symbols from Private area (probably Microsoft),
so far:
* U+F0B7 for "x in box"

## Unknown handling
Unknowns are tagged ?? and treated specially with `hfst-tokenise`
hfst-tokenise --giella-cg will treat such empty analyses as unknowns, and
remove empty analyses from other readings. Empty readings are also
legal in CG, they get a default baseform equal to the wordform, but
no tag to check, so it's safer to let hfst-tokenise handle them.

Finally we mark as a token any sequence making up a:
* known word in context
* unknown (OOV) token in context
* sequence of word and punctuation
* URL in context

* * *

<small>This (part of) documentation was generated from [tools/tokenisers/tokeniser-disamb-gt-desc.pmscript](https://github.com/giellalt/lang-kpv/blob/main/tools/tokenisers/tokeniser-disamb-gt-desc.pmscript)</small>

---

# tools-tokenisers-tokeniser-gramcheck-gt-desc.pmscript.md 

# Grammar checker tokenisation for kpv

Requires a recent version of HFST (3.10.0 / git revision>=3aecdbc)
Then just:
```
$ make
$ echo "ja, ja" | hfst-tokenise --giella-cg tokeniser-disamb-gt-desc.pmhfst
```

More usage examples:
```
$ echo "Juos gorreválggain lea (dárbbašlaš) deavdit gáibádusa boasttu olmmoš, man mielde lahtuid." | hfst-tokenise --giella-cg tokeniser-disamb-gt-desc.pmhfst
$ echo "(gáfe) 'ja' ja 3. ja? ц jaja ukjend \"ukjend\"" | hfst-tokenise --giella-cg tokeniser-disamb-gt-desc.pmhfst
$ echo "márffibiillagáffe" | hfst-tokenise --giella-cg tokeniser-disamb-gt-desc.pmhfst
```

Pmatch documentation:
<https://github.com/hfst/hfst/wiki/HfstPmatch>

Characters which have analyses in the lexicon, but can appear without spaces
before/after, that is, with no context conditions, and adjacent to words:
* Punct contains ASCII punctuation marks
* The symbol after m-dash is soft-hyphen `U+00AD`
* The symbol following {•} is byte-order-mark / zero-width no-break space
`U+FEFF`.

Whitespace contains ASCII white space and
the List contains some unicode white space characters
* En Quad U+2000 to Zero-Width Joiner U+200d'
* Narrow No-Break Space U+202F
* Medium Mathematical Space U+205F
* Word joiner U+2060

Apart from what's in our morphology, there are
1) unknown word-like forms, and
2) unmatched strings
We want to give 1) a match, but let 2) be treated specially by hfst-tokenise -a
* select extended latin symbols
* select symbols
* various symbols from Private area (probably Microsoft),
so far:
* U+F0B7 for "x in box"

TODO: Could use something like this, but built-in's don't include šžđčŋ:

Simply give an empty reading when something is unknown:
hfst-tokenise --giella-cg will treat such empty analyses as unknowns, and
remove empty analyses from other readings. Empty readings are also
legal in CG, they get a default baseform equal to the wordform, but
no tag to check, so it's safer to let hfst-tokenise handle them.

Finally we mark as a token any sequence making up a:
* known word in context
* unknown (OOV) token in context
* sequence of word and punctuation
* URL in context

* * *

<small>This (part of) documentation was generated from [tools/tokenisers/tokeniser-gramcheck-gt-desc.pmscript](https://github.com/giellalt/lang-kpv/blob/main/tools/tokenisers/tokeniser-gramcheck-gt-desc.pmscript)</small>

---

# tools-tokenisers-tokeniser-tts-cggt-desc.pmscript.md 

# TTS tokenisation for smj

Requires a recent version of HFST (3.10.0 / git revision>=3aecdbc)
Then just:
```sh
make
echo "ja, ja" \
| hfst-tokenise --giella-cg tokeniser-disamb-gt-desc.pmhfst
```

More usage examples:
```sh
echo "Juos gorreválggain lea (dárbbašlaš) deavdit gáibádusa \
boasttu olmmoš, man mielde lahtuid." \
| hfst-tokenise --giella-cg tokeniser-disamb-gt-desc.pmhfst
echo "(gáfe) 'ja' ja 3. ja? ц jaja ukjend \"ukjend\"" \
| hfst-tokenise --giella-cg tokeniser-disamb-gt-desc.pmhfst
echo "márffibiillagáffe" \
| hfst-tokenise --giella-cg tokeniser-disamb-gt-desc.pmhfst
```

Pmatch documentation:
<https://kitwiki.csc.fi/twiki/bin/view/KitWiki/HfstPmatch>

Characters which have analyses in the lexicon, but can appear without spaces
before/after, that is, with no context conditions, and adjacent to words:
* Punct contains ASCII punctuation marks
* The symbol after m-dash is soft-hyphen `U+00AD`
* The symbol following {•} is byte-order-mark / zero-width no-break space
`U+FEFF`.

Whitespace contains ASCII white space and
the List contains some unicode white space characters
* En Quad U+2000 to Zero-Width Joiner U+200d'
* Narrow No-Break Space U+202F
* Medium Mathematical Space U+205F
* Word joiner U+2060

Apart from what's in our morphology, there are
1) unknown word-like forms, and
2) unmatched strings
We want to give 1) a match, but let 2) be treated specially by hfst-tokenise -a
* select extended latin symbols
* select symbols
* various symbols from Private area (probably Microsoft),
so far:
* U+F0B7 for "x in box"

TODO: Could use something like this, but built-in's don't include šžđčŋ:

Simply give an empty reading when something is unknown:
hfst-tokenise --giella-cg will treat such empty analyses as unknowns, and
remove empty analyses from other readings. Empty readings are also
legal in CG, they get a default baseform equal to the wordform, but
no tag to check, so it's safer to let hfst-tokenise handle them.

Needs hfst-tokenise to output things differently depending on the tag they get

* * *

<small>This (part of) documentation was generated from [tools/tokenisers/tokeniser-tts-cggt-desc.pmscript](https://github.com/giellalt/lang-kpv/blob/main/tools/tokenisers/tokeniser-tts-cggt-desc.pmscript)</small>
