# Komi-Zyrian documentation

[![Maturity](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fgiellalt%2Flang-kpv%2Fgh-pages%2Fmaturity.json)](https://giellalt.github.io/MaturityClassification.html)
![Lemma count](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fgiellalt%2Flang-kpv%2Fgh-pages%2Flemmacount.json)
[![License](https://img.shields.io/github/license/giellalt/lang-kpv)](https://github.com/giellalt/lang-kpv/blob/main/LICENSE)
[![Issues](https://img.shields.io/github/issues/giellalt/lang-kpv)](https://github.com/giellalt/lang-kpv/issues)
[![Build Status](https://divvun-tc.giellalt.org/api/github/v1/repository/giellalt/lang-kpv/main/badge.svg)](https://github.com/giellalt/lang-kpv/actions)

This page documents the work on the [Komi-Zyrian language model](http://github.com/giellalt/lang-kpv). 

The lexicon is full-sized (it contains approximately 60000 
entries + 120 000 aspectual verbs), and the analyser 
is in use in a morphologically enriched Komi dictionary and a
spellchecker in beta version. 

The analyser is built in cooperation between FU-lab in
Syktyvkar, Giellatekno and Divvun at UiT in Norway, and
AKU in Helsinki.

# Project documentation

* Generation of: [paradigms](http://giellatekno.uit.no/cgi/p-kpv.eng.html)
  / [text](http://giellatekno.uit.no/cgi/d-kpv.eng.html)
* [Grammatical tags](docu-grammartags.eng.md)  ~ [грамматические теги](docu-grammartags.rus.md)
* [Lexicon](docu-lex.eng.md)  ~ [Lexicon (ru)](docu-lex.rus.md)
- [Makefile](docu-makefile.eng.md) - [Makefile (ru)](docu-makefile.rus.md)
- [Preprocessor](docu-preprocessor.eng.md) - [Preprocessor (ru)](docu-preprocessor.rus.md)
- [Testplan](docu-testplan.eng.md) - [Testplan (ru)](docu-testplan.rus.md)
- [Usage](docu-usage.eng.md) - [Usage (ru)](docu-usage.rus.md)
- [Xfst](docu-xfst.eng.md) - [Xfst (ru)](docu-xfst.rus.md)

## Meetings ~ Митинг

* 2017:
    - [21.3.](meetings/170321.md)
    - [23.9.](meetings/170923.md)

## Using the analyser ~ Использование анализатора

TBW.

##  Testing ~ Тестирование

* [Test diary ~ Дневник испытаний](kom-testdiary.md)
* [Test plan](docu-kom-testplan.md)

##  Old documentation - Старая документация

* [Status quo 2016](docu-statusquo.eng.md) ~ [Статус-кво 2016](docu-statusquo.rus.md)

# In-source documentation

Below is an autogenerated list of documentation pages built from structured comments in the source code. All pages are also concatenated and can be read as one long text [here](kpv.md).

* `src/`
    * `cg3/`
        * [disambiguator.cg3](src-cg3-disambiguator.cg3.html) ([src](https://github.com/giellalt/lang-kpv/blob/main/src/cg3/disambiguator.cg3))
        * [functions-ikpd.cg3](src-cg3-functions-ikpd.cg3.html) ([src](https://github.com/giellalt/lang-kpv/blob/main/src/cg3/functions-ikpd.cg3))
        * [functions.cg3](src-cg3-functions.cg3.html) ([src](https://github.com/giellalt/lang-kpv/blob/main/src/cg3/functions.cg3))
    * `fst/`
        * `morphology/`
            * `affixes/`
                * [adjectives.lexc](src-fst-morphology-affixes-adjectives.lexc.html) ([src](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/affixes/adjectives.lexc))
                * [adpositions.lexc](src-fst-morphology-affixes-adpositions.lexc.html) ([src](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/affixes/adpositions.lexc))
                * [adverbs.lexc](src-fst-morphology-affixes-adverbs.lexc.html) ([src](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/affixes/adverbs.lexc))
                * [conjunctors.lexc](src-fst-morphology-affixes-conjunctors.lexc.html) ([src](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/affixes/conjunctors.lexc))
                * [interjections.lexc](src-fst-morphology-affixes-interjections.lexc.html) ([src](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/affixes/interjections.lexc))
                * [nouns.lexc](src-fst-morphology-affixes-nouns.lexc.html) ([src](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/affixes/nouns.lexc))
                * [particles.lexc](src-fst-morphology-affixes-particles.lexc.html) ([src](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/affixes/particles.lexc))
                * [pronouns.lexc](src-fst-morphology-affixes-pronouns.lexc.html) ([src](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/affixes/pronouns.lexc))
                * [propernouns.lexc](src-fst-morphology-affixes-propernouns.lexc.html) ([src](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/affixes/propernouns.lexc))
                * [quantifiers.lexc](src-fst-morphology-affixes-quantifiers.lexc.html) ([src](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/affixes/quantifiers.lexc))
                * [symbols.lexc](src-fst-morphology-affixes-symbols.lexc.html) ([src](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/affixes/symbols.lexc))
                * [verbs.lexc](src-fst-morphology-affixes-verbs.lexc.html) ([src](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/affixes/verbs.lexc))
            * [phonology.twolc](src-fst-morphology-phonology.twolc.html) ([src](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/phonology.twolc))
            * [root.lexc](src-fst-morphology-root.lexc.html) ([src](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/root.lexc))
            * `stems/`
                * [acronyms.lexc](src-fst-morphology-stems-acronyms.lexc.html) ([src](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/stems/acronyms.lexc))
                * [adjectives-russian-like_newwords.lexc](src-fst-morphology-stems-adjectives-russian-like_newwords.lexc.html) ([src](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/stems/adjectives-russian-like_newwords.lexc))
                * [adjectives_newwords.lexc](src-fst-morphology-stems-adjectives_newwords.lexc.html) ([src](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/stems/adjectives_newwords.lexc))
                * [adverbs_newwords.lexc](src-fst-morphology-stems-adverbs_newwords.lexc.html) ([src](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/stems/adverbs_newwords.lexc))
                * [dialect_lexicon.lexc](src-fst-morphology-stems-dialect_lexicon.lexc.html) ([src](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/stems/dialect_lexicon.lexc))
                * [exceptions.lexc](src-fst-morphology-stems-exceptions.lexc.html) ([src](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/stems/exceptions.lexc))
                * [nouns_newwords.lexc](src-fst-morphology-stems-nouns_newwords.lexc.html) ([src](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/stems/nouns_newwords.lexc))
                * [propernouns_newwords.lexc](src-fst-morphology-stems-propernouns_newwords.lexc.html) ([src](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/stems/propernouns_newwords.lexc))
                * [verbs_newwords.lexc](src-fst-morphology-stems-verbs_newwords.lexc.html) ([src](https://github.com/giellalt/lang-kpv/blob/main/src/fst/morphology/stems/verbs_newwords.lexc))
        * `phonetics/`
            * [txt2ipa.xfscript](src-fst-phonetics-txt2ipa.xfscript.html) ([src](https://github.com/giellalt/lang-kpv/blob/main/src/fst/phonetics/txt2ipa.xfscript))
        * [phonology-old.xfscript](src-fst-phonology-old.xfscript.html) ([src](https://github.com/giellalt/lang-kpv/blob/main/src/fst/phonology-old.xfscript))
        * `transcriptions/`
            * [transcriptor-abbrevs2text.lexc](src-fst-transcriptions-transcriptor-abbrevs2text.lexc.html) ([src](https://github.com/giellalt/lang-kpv/blob/main/src/fst/transcriptions/transcriptor-abbrevs2text.lexc))
* `tools/`
    * `grammarcheckers/`
        * [grammarchecker.cg3](tools-grammarcheckers-grammarchecker.cg3.html) ([src](https://github.com/giellalt/lang-kpv/blob/main/tools/grammarcheckers/grammarchecker.cg3))
    * `tokenisers/`
        * [tokeniser-disamb-gt-desc.pmscript](tools-tokenisers-tokeniser-disamb-gt-desc.pmscript.html) ([src](https://github.com/giellalt/lang-kpv/blob/main/tools/tokenisers/tokeniser-disamb-gt-desc.pmscript))
        * [tokeniser-gramcheck-gt-desc.pmscript](tools-tokenisers-tokeniser-gramcheck-gt-desc.pmscript.html) ([src](https://github.com/giellalt/lang-kpv/blob/main/tools/tokenisers/tokeniser-gramcheck-gt-desc.pmscript))
        * [tokeniser-tts-cggt-desc.pmscript](tools-tokenisers-tokeniser-tts-cggt-desc.pmscript.html) ([src](https://github.com/giellalt/lang-kpv/blob/main/tools/tokenisers/tokeniser-tts-cggt-desc.pmscript))