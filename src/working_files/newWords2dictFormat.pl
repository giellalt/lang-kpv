#!/usr/bin/perl -w
use utf8 ;

while (<>)

{
#Here are two different parts of speech that can be fed from simple CSV files
#Of course it is not necessary that all the white space be written into the perl
#but this is a simple rough draft.
##
#Using the sort function on Rueter's Mac does a peculiar thing;
#word length and sorting are combined.
#There must be something in preferences to fix that

# I would suggest you rewrite the code to use split() instead - it would make the
# code much clearer, which usually corresponds to fewer bugs.

#This is for common nouns
#from newCommonNouns.txt
#CSV format:
#lemma,stem,N
#журнал,журнал6,N
s/^([^,]*),([^,]*),(N)/
  \<entry\>
    \<lemma\>$1\<\/lemma\>
    \<stem\>$2\<\/stem\>
    \<contlex\>Noun1\<\/contlex\>
    \<pos\>$3\<\/pos\>
    \<article\>
      \<eng\>
        \<choice\>
          \<variant\ \/\>
        \<\/choice\>
      \<\/eng\>
      \<fin\>
        \<choice\>
          \<variant\ \/\>
        \<\/choice\>
      \<\/fin\>
    \<\/article\>
  \<\/entry\>/g ;


#This is for verbs
#from newVerbs.txt
#CSV format:
#Assuming the simplest forms to copy and paste is from 3sg or 3pl
#stem,V1 (-л is given)
#нимтыл,V1
s/^([^,]*)(л),V1/
  \<entry\>
    \<lemma\>$1вны\<\/lemma\>
    \<stem\>$1$2\<\/stem\>
    \<contlex\>Verb1\<\/contlex\>
    \<pos\>V\<\/pos\>
    \<article\>
      \<eng\>
        \<choice\>
          \<variant\ \/\>
        \<\/choice\>
      \<\/eng\>
      \<fin\>
        \<choice\>
          \<variant\ \/\>
        \<\/choice\>
      \<\/fin\>
    \<\/article\>
  \<\/entry\>/g ;

#stem,V2
s/^([^,]*),V2/
  \<entry\>
    \<lemma\>$1ны\<\/lemma\>
    \<stem\>$1\<\/stem\>
    \<contlex\>Verb2\<\/contlex\>
    \<pos\>V\<\/pos\>
    \<article\>
      \<eng\>
        \<choice\>
          \<variant\ \/\>
        \<\/choice\>
      \<\/eng\>
      \<fin\>
        \<choice\>
          \<variant\ \/\>
        \<\/choice\>
      \<\/fin\>
    \<\/article\>
  \<\/entry\>/g ;


#stem,V3 (without ыны)
#волывл,V3
s/^([^,]*),V3/
  \<entry\>
    \<lemma\>$1ыны\<\/lemma\>
    \<stem\>$1ы\<\/stem\>
    \<contlex\>Verb3\<\/contlex\>
    \<pos\>V\<\/pos\>
    \<article\>
      \<eng\>
        \<choice\>
          \<variant\ \/\>
        \<\/choice\>
      \<\/eng\>
      \<fin\>
        \<choice\>
          \<variant\ \/\>
        \<\/choice\>
      \<\/fin\>
    \<\/article\>
  \<\/entry\>/g ;



print ;
}
