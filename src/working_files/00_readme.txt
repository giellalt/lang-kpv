This file contains Cip's observations made
en passant during the quick compilation of the
kom2rus webdict.

1. empty t-elements:
working_files>grep '<t></t>' *.xml | sort | uniq -c | sort -nr
 550 N_kom-lex.xml:          <tg xml:lang="ru"><t></t></tg>
 299 V_kom-lex.xml:          <tg xml:lang="ru"><t></t></tg>
  13 POSTP_kom-lex.xml:          <tg xml:lang="ru"><t></t></tg>

2. unbalanced brackets that should be corrected problably by Jaska:

<comment>
Author: jaska
Date: 2012-01-04 09:15:02 +0100 (gask, 04 ođđj 2012)
New Revision: 52199

Modified:
  trunk/kt/kom/src/working_files/A_kom-lex.xml
Log:
There are two instances of _stray_ parentheses within words: (1) they represent accented letters acute а́ о́, or (2) there are two parentheses within the same word, and they reepresent alternatives. These alternatives are probably not just spelling but semantic differences.
</comment>

@cip: Not quite, what about the following?

N_kom-lex.xml:97097:          <tg xml:lang="ru"><t>неясное, непонятное место ( </t><re>напр., в
N_kom-lex.xml:255116:          <tg xml:lang="ru"><t>пара </t><re>(костюм</re></tg>
N_kom-lex.xml:385082:          <tg xml:lang="ru"><t>личинка насекомого </t><re>(в воде</re></tg>
N_kom-lex.xml:389536:          <tg xml:lang="ru"><t>(достигнутый</t></tg>
POSTP_kom-lex.xml:1193:          <tg xml:lang="ru"><t><i>(употр. тж. с опред. суф. в указат. значении:</i></t></tg>

