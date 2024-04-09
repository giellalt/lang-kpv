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
