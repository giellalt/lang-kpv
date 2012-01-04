This file contains Cip's observations made
en passant during the quick compilation of the
kom2rus webdict.

1. empty t-elements:
working_files>grep '<t></t>' *.xml | sort | uniq -c | sort -nr
 550 N_kom-lex.xml:          <tg xml:lang="ru"><t></t></tg>
 299 V_kom-lex.xml:          <tg xml:lang="ru"><t></t></tg>
  13 POSTP_kom-lex.xml:          <tg xml:lang="ru"><t></t></tg>

2. unbalanced brackets that should be corrected problably by Jaska:


POSTP_kom-lex.xml:1193:          <tg xml:lang="ru"><t><i>(употр. тж. с опред. суф. в указат. значении:</i></t></tg>

  <entry>
    <lemma>бокиын</lemma>

    <stem>боки</stem>

    <contlex>PO-INE</contlex>

    <pos>POSTP-SPAT</pos>

    <e>
      <mg>
        <m>
          <head></head>

          <tg xml:lang="ru"><t><i>(употр. тж. с опред. суф. в указат. значении:</i></t></tg> <<<=== HERE!!!
        </m>

        <xg>
          <x>бокиад, бокиас</x>

          <xtg xml:lang="ru"><xt>) на стороне, не дома</xt></xtg>                            <<<=== HERE!!!

          <xtg xml:lang="ru"><xt> в людях</xt></xtg>
        </xg>

and in N_kom-lex.xml:
N_kom-lex.xml:30496:          <tg xml:lang="ru"><t>бита </t><re>для игры в бабки)</re></tg>
N_kom-lex.xml:33121:          <tg xml:lang="ru"><t>Бурка </t><re>кличка бурой лошади)</re></tg>
N_kom-lex.xml:196538:          <tg xml:lang="ru"><field>бот.</field><t>а) вид папоротника</t></tg>

