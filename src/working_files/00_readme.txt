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



3. superfluous brackets in the re-element lead to doubled brackets in the webdict:

dics>grep '((' kom-rus-lr-trie.xml | wc -l
      44


                <r>((о муке, снеге, песке и т.п.)) крупный</r>
        <r>1. в середину, в центр чего-л.; среди, посреди чего-л. 2. ((к какому-л. времени; в какое-л. время)) к чему-л.; на 3. под</r>
        <r>((о масти лошадей)) чалый, серый с примесью шерсти другого цвета</r>
        <r>1. ((о масти лошади)) серый 2. седой</r>
                <r>((пристав)) становой</r>
        <r>1. весь, все, всё 2. ((вместе, в полном составе) (употр. тж. с опред.-притяж. суф.)) все 3.  4. весь, полный, без изъятия, целиком 5. все, всех; всё, что имеется</r>
        <r>1. подранок; ((о дичи, о зверях)) подраненный 2. неисправный, негодный 3. страдающий недержанием мочи</r>
        <r>((об ушах)) настороженный, приподнятый</r>
        <r>((о конопле)) волокнистый</r>
        <r>1. пустой; порожний 2. ((о животных)) яловая, не стельная, не жерёбая 3. ((о зерне)) щуплый; ((о колосьях)) тощий 4. наполнение, заполнение; наполненный; заполненный 5. заметание; заметённый; занесённый 6. заваливание; заваленный 7. выполнение; выполненный 8. набивка, набивание 9. наводнение 10. доливание; долитый</r>
        <r>1.  2. ((мера, площадь)) на</r>
        <r>((о хвосте)) спущенный</r>

4. even empty meaning groups still there??? WHY? I checked it based on the existence of t-elements!
    <r>1.  2. ((мера, площадь)) на</r>
   
