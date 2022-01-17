

# Verbal morphology               

## Temporary lexicon

V_ temporary lexicon gives +V+WORK

## Closed class verbs

VERBNEGATIVE 









## Open class verbs

Some Flag diacritic lines are with regexes, other with aligned zeros. We want to migrate to
regexes < … > , for readability reasons (sic!)

IV_ЛОКНЫ 

* **LEXICON V-0_ЛОКНЫлокны:лок** One verb only, локны:лок


* **LEXICON VR_ШУНЫ** 

IV_ШУНЫ 

* **LEXICON V_ШУНЫ-Vны.** шуны:шу янӧдны, контролируйтны. Ending in -дны, -тны, -Cны, -Vны.
* **LEXICON V-0_ШУНЫ-Vны.** шуны:шу янӧдны, контролируйтны. Ending in -дны, -тны, -Cны, -Vны.

* **LEXICON VR_АМНЫ**@CODE@****

IV_АМНЫ 
TV_АМНЫ 

BV_АМНЫ 

* **LEXICON V_АМНЫ-дзны,** амны:ам Ending in -мны, -жны, -дзны,
* **LEXICON V-0_АМНЫ-дзны,** амны:ам Ending in -мны, -жны, -дзны,


* **LEXICON V_КЫЙНЫ** кыйны:кы Ending in -йны, 

* **LEXICON V-0_КЫЙНЫ** кыйны:кы Ending in -йны, 

* **LEXICON VR_КУТНЫ**@CODE@****

* **LEXICON V_КУТНЫ-Vны.** шуны:шу янӧдны, контролируйтны. Ending in -дны, -тны, -Cны, -Vны.
* **LEXICON V-0_КУТНЫ-Vны.** шуны:шу янӧдны, контролируйтны. Ending in -дны, -тны, -Cны, -Vны.


* **LEXICON V-0_БОСЬТНЫ-Vны.** шуны:шу янӧдны, контролируйтны. Ending in -дны, -тны, -Cны, -Vны.


* **LEXICON VR_НУАВНЫнуавны:нуа** нуавны:нуа

* **LEXICON V_НУАВНЫнуавны:нуа** нуавны:нуа
* **LEXICON V-0_НУАВНЫнуавны:нуа** нуавны:нуа
Consonant-onset

* **LEXICON VR_АРТАСЬНЫ**@CODE@****


* **LEXICON V_АРТАСЬНЫ** артасьны:артась 
* **LEXICON V-0_АРТАСЬНЫ** артасьны:артась 

* **LEXICON VR_ЛЫДДЬЫНЫ** 

* **LEXICON V_ЛЫДДЬЫНЫ-ыны.** лыддьыны:лыддь ! ярмыны. Multiple-syllable verb ending in -ыны.
* **LEXICON V-0_ЛЫДДЬЫНЫ-ыны.** лыддьыны:лыддь ! ярмыны. Multiple-syllable verb ending in -ыны.

* **LEXICON VR_ВОЛЫНЫ** 


* **LEXICON V_ВОЛЫНЫ-ыны.** волыны:лыддь ! ярмыны. Multiple-syllable verb ending in -ыны.
* **LEXICON V-0_ВОЛЫНЫ-ыны.** волыны:лыддь ! ярмыны. Multiple-syllable verb ending in -ыны.








## Verb conjugation 

* **LEXICON VerbConj-V**  суф б -- ы 

* **LEXICON VerbConjа** суф а

* **LEXICON VerbConj_КЫЙНЫа** суф а

* **LEXICON VerbConj_АМНЫа** суф а

* **LEXICON VerbConj_КУТНЫа** суф а


* **LEXICON Finiteformstenses** Gives linking vowels for 3 tenses

* **LEXICON Finiteforms_КЫЙНЫtenses** Gives linking vowels for 3 tenses

* **LEXICON Finiteforms_АМНЫtenses** Gives linking vowels for 3 tenses

* **LEXICON Finiteforms_КУТНЫtenses** Gives linking vowels for 3 tenses

































## Derivation


* **LEXICON Verb-nyDer** 

* **LEXICON Verb-nyDer-ONSET-CONSconsonant** Derivation onset in consonant
verb-to-verb

This is fed by LEXICON V_ШУНЫ, and therefore certain corrections
must be made 2012-01-18

овсьыны
пусьыштлывлыны
босьтчыштлывлыны

* **LEXICON Verb-nyDer-ONSET-VOWvowel** Derivation onset	in vowel

* **LEXICON Verb-nyDer-ONSET-Ыvowel** Derivation onset	in vowel

* **LEXICON Verb-nyDer-ONSET-Аvowel** Derivation onset	in vowel
босьтасьны

* **LEXICON Verb-nyDer-ONSET-Яvowel** Derivation onset	in vowel
босьтасьны


verb-to-noun

* **LEXICON VerbDer** 
FIX THIS 2015-09-06
* **VerbDer-ONSET_А/Я ;** 

* **LEXICON VerbDer_КЫЙНЫ**@CODE@****
* **: VerbDer-ONSET_Ӧ ;**@CODE@****
* **: VerbDer-ONSET_Я ;** 
* **: VerbDer-ONSET_И ;**@CODE@****

* **LEXICON VerbDer_КУТНЫ**@CODE@****
* **VerbDer-ONSET_Ӧ ;**@CODE@****
* **VerbDer-ONSET_А ;** 
* **VerbDer-ONSET_І ;**@CODE@****

* **LEXICON VerbDer_АРТАСЬНЫ**@CODE@****
* **: VerbDer-ONSET_Ӧ ;**@CODE@****
* **VerbDer-ONSET_Я ;** 
* **VerbDer-ONSET_И ;**@CODE@****

* **LEXICON VerbDer-ONSET_Ӧ** 



* **LEXICON VerbDer-ONSET_І** 

* **LEXICON VerbDer-ONSET_И** 
* **LEXICON VerbDer-ONSET_И/І** 




* **LEXICON VerbDer-ONSET_А** 
* **LEXICON VerbDer-ONSET_А/Я** 

* **LEXICON VerbDer-ONSET_Я**@CODE@****








вевттьысьыны

бертласьны












* **LEXICON EM-ӧсь.** эм:эм. Ending in -ӧсь.



* * *
<small>This (part of) documentation was generated from [../src/fst/affixes/verbs.lexc](http://github.com/giellalt/lang-kpv/blob/main/../src/fst/affixes/verbs.lexc)</small>