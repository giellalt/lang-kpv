Steps to group the kom-lex automatically:

1. flaten the current version:
  java -Xmx2048m net.sf.saxon.Transform -it main getRidOfGroups.xsl toIndent=kom-lex.xml
  mv out_kom-lex.xml flat_kom-lex.xml 

2. sort descending wrt. the number of entries in an entry group:
  java -Xmx2048m net.sf.saxon.Transform -it main check_group_lemma.xsl toIndent=flat_kom-lex.xml 
  mv out_group-lemma_flat_kom-lex.xml grouped_sort-by-count_kom-lex.xml

3. sort alphabetically wrt. the Komi alphabet (unfortunately, the feature "case-order": lower-first vs. upper-first
   doesn't take any effect here):
  java -Xmx2048m net.sf.saxon.Transform -it main check_group_lemma.xsl toIndent=flat_kom-lex.xml 
  mv out_group-lemma_flat_kom-lex.xml grouped_sort-by-ABC_kom-lex.xml

To each group tag, I added two attributes: lemma for the current lemma and couter for the number of group entries.
This can be deleted without problems. But one can do easy "grep statistics" with them.

The next step is to check the pos feature and mark whether the group belongs to the
ALL, SOME, or NONE SAME-POS type. This would ease the work with them. 

Total groups:
 ~/gtsvn/kt/kom/src/grouped_sorted>grep '<entryGroup' grouped_sort-by-count_kom-lex.xml | wc -l
   14704
Singletones:
~/gtsvn/kt/kom/src/grouped_sorted>grep '<entryGroup' grouped_sort-by-count_kom-lex.xml | grep 1 | wc -l
   14122

Real groups:
~/gtsvn/kt/kom/src/grouped_sorted>grep '<entryGroup' grouped_sort-by-count_kom-lex.xml | grep -v 1 | wc -l
     582
etc.

Ciprian


