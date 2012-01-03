This file contains Cip's observations made
en passant during the quick compilation of the
kom2rus webdict.

1. empty t-elements:
working_files>grep '<t></t>' *.xml | sort | uniq -c | sort -nr
 550 N_kom-lex.xml:          <tg xml:lang="ru"><t></t></tg>
 299 V_kom-lex.xml:          <tg xml:lang="ru"><t></t></tg>
  13 POSTP_kom-lex.xml:          <tg xml:lang="ru"><t></t></tg>

2. unbalanced brackets that should be corrected problably by Jaska:

Why?  For instance here:

Is the correct form 'шкврень' or 'шкворень'?
  <entry>
    <lemma>болт</lemma>
    <e>
      <mg MNo="1">
        <m>
          <head></head>
          <tg xml:lang="ru"><t>шкв(рень, шв(рень</t></tg>
        </m>
        <xg>
          <x>телега болт</x>
          <xtg xml:lang="ru"><xt>шкворень телеги</xt></xtg>
        </xg>
      </mg>

In the N_kom-lex:
grep -n '<t>' N_kom-lex.xml | grep '</t>' | grep '(' | grep -v ')' | less
25979:          <tg xml:lang="ru"><t>з(болонь</t></tg>
26097:          <tg xml:lang="ru"><t>шкв(рень, шв(рень</t></tg>
167107:          <tg xml:lang="ru"><t>к(злы для распиловки дров</t></tg>
195278:          <tg xml:lang="ru"><t>ст(рица</t></tg>
197761:          <tg xml:lang="ru"><t>конопатка, коноп(чение</t></tg>
266411:          <tg xml:lang="ru"><t>пара <com>(костюм</com></t></tg>
277551:          <tg xml:lang="ru"><t>родившая <i>(о кошке, собаке и диких животных</i></t></tg>
388773:          <tg xml:lang="ru"><t>многое, б(льшее</t></tg>
388775:          <tg xml:lang="ru"><t>б(льшая часть</t></tg>
404496:          <tg xml:lang="ru"><t>личинка насекомого <com>(в воде</com></t></tg>
406087:          <tg xml:lang="ru"><t>пар(ние</t></tg>
406133:          <tg xml:lang="ru"><t>пар(ние</t></tg>
409257:          <tg xml:lang="ru"><t>(достигнутый</t></tg>

In POSTP_kom-lex:
POSTP_kom-lex.xml:1193:          <tg xml:lang="ru"><t><i>(употр. тж. с опред. суф. в указат. значении:</i></
t></tg>

In the V_kom-lex:
grep -n '<t>' V_kom-lex.xml | grep '</t>' | grep '(' | grep -v ')' | less
11801:          <tg xml:lang="ru"><t>поставить, опрокинуть н(бок</t></tg>
11829:          <tg xml:lang="ru"><t>накрениться н(бок, опрокинуться н(бок</t></tg>
12873:          <tg xml:lang="ru"><t>глухо звучать</t><re>о металлическом б(тале</re></tg>
189616:          <tg xml:lang="ru"><t>заниматься коноп(чением</t></tg>
191201:          <tg xml:lang="ru"><t>собрать, ск(чить, сложить в костры</t><re>на подсеках, расчистках</re></tg>
410768:          <tg xml:lang="ru"><t>сказать (чур(</t></tg>



