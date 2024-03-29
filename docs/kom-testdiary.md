# Test results for the morphology and lexicon files

This document documents the testing of the parser and disambiguator.
Background info and test plan is found in the [test plan
document.](docu-kom-testplan.html)What is found here is an overview of
what has been tested, both vocabulary testing, testing of the
disambiguator, and testing of the morphological analysis.

## Test results for morphology and lexicon

### Vocabualry testing

The following table records recall for word forms in various texts. Here
we measure coverage of the vocabulary, by recording all word forms that
are not recognised.

    ---------------------------------------------------
    wikipedia.txt (Single Wikipedia article)
    Test    Wftot Wf-tkn %-recall Tytot  Wf-typ %-recall
    090824   82       52   63.4 %    61      32   52.4 %
    110101   82       63   76.8 %    61      42   68.9 %

    tsypanov.txt 
    Test     Wftot Wf-tkn %-recall Tytot  Wf-typ %-recall
    090824    2950   1577    53.4%   850     184   21.6%
    090824    2950   2221    75.3%   850     276   32.5%  Deleted %^Inf in xfst file

    kv.wikipedia.org dump (including much Russian text, and text by non-natives)
    Test    Wftot Wf-tkn %-recall Tytot  Wf-typ %-recall
    090824 135743  68696   50.6%  21640   5306    24.5%
    090825 135805  69575   51.2%  19980   5317    26.3%  After better formatting
    090827 135805  71299   52.5%  19980   5364    26.8%  After palatal mark reordering
    ----------------------------------------------------

#### Explaining the table

Lower token than type percentage indicates that the parser misses common
words more often than seldom ones.

Lower type than token percentage (which is the case) indicates that the
parser is good at the core vocabulary, but has

Each text is given a separate section in the table, ordered
chronologically, with the oldest test case (Test 1) at the bottom. The
first line of each section gives the name of the file (note: the files
of the test cases 2 and 3 are so changed that these two test cases are
closed). Each line represents a test run. The first colum gives the test
date (in the format ddmmyy), the second (WFtot) the total number of
words in the file question, the third (Wf-tkn) the number of recognised
word form tokens, and the percentage compared to the total. The next
columns does the same for wordform types (cf. below for the commands
used to calculate the numbers).

    -------------------------------------------------------------------------
    Wftot:
    cat filename | preprocess | wc -l

    Non_recognised_wf:
    cat filename | preprocess | lookup -flags mbTT -utf8 bin/kom.fst \
     | grep '\?' | grep -v CLB | wc -l

    Wf-tkn = Wftot - Non_recognised_wf

    %-recall = Wf-tkn * 100 / Wftot
    -------------------------------------------------------------------------
    Tytot (Total number of wordform types):
    cat filename | preprocess | sort | uniq | wc -l

    Non_recognised_wt (Number of non-analysed wordform types:
    cat filename | preprocess | sort | uniq |
    lookup -flags mbTT -utf8 bin/kom.fst | grep '\?' | grep -v CLB | wc -l

    Wf-typ (Number of recognised wordform types)
    Wf-typ = Tytot - Non_recognised_wt

    %-recall = Wf-typ * 100 / Tytot
    -------------------------------------------------------------------------
