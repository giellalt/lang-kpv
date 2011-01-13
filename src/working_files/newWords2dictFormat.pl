#!/usr/bin/perl -w
use utf8 ;

while (<>)

{
#This is for common nouns
#from newCommonNouns.txt
#CSV format:
#lemma,stem,N
s/^([^,]*),([^,]*),(N)/\n\ \ \<entry\>\n\ \ \ \ \<lemma\>$1\<\/lemma\>\<stem\>$2\<\/stem\>\n\ \ \ \ \<contlex\>Noun1\<\/contlex\>\n\ \ \ \ \<pos\>$3\<\/pos\>\n\ \ \ \ \<article\>\n\ \ \ \ \ \ \<eng\>\n\ \ \ \ \ \ \ \ \<choice\>\n\ \ \ \ \ \ \ \ \ \ \<variant\ \/\>\n\ \ \ \ \ \ \ \ \<\/choice\>\n\ \ \ \ \ \ \<\/eng\>\n\ \ \ \ \ \ \<fin\>\n\ \ \ \ \ \ \ \ \<choice\>\n\ \ \ \ \ \ \ \ \ \ \<variant\ \/\>\n\ \ \ \ \ \ \ \ \<\/choice\>\n\ \ \ \ \ \ \<\/fin\>\n\ \ \ \ \<\/article\>\n\ \ \<\/entry\>/g ;

#This is for verbs
#from newVerbs.txt
#CSV format:
#stem,V1 
s/^([^,]*)(л),V1/\n\ \ \<entry\>\n\ \ \ \ \<lemma\>$1вны\<\/lemma\>\<stem\>$1$2\<\/stem\>\n\ \ \ \ \<contlex\>Verb1\<\/contlex\>\n\ \ \ \ \<pos\>V\<\/pos\>\n\ \ \ \ \<article\>\n\ \ \ \ \ \ \<eng\>\n\ \ \ \ \ \ \ \ \<choice\>\n\ \ \ \ \ \ \ \ \ \ \<variant\ \/\>\n\ \ \ \ \ \ \ \ \<\/choice\>\n\ \ \ \ \ \ \<\/eng\>\n\ \ \ \ \ \ \<fin\>\n\ \ \ \ \ \ \ \ \<choice\>\n\ \ \ \ \ \ \ \ \ \ \<variant\ \/\>\n\ \ \ \ \ \ \ \ \<\/choice\>\n\ \ \ \ \ \ \<\/fin\>\n\ \ \ \ \<\/article\>\n\ \ \<\/entry\>/g ;

#stem,V2
s/^([^,]*),V2/\n\ \ \<entry\>\n\ \ \ \ \<lemma\>$1ны\<\/lemma\>\<stem\>$1\<\/stem\>\n\ \ \ \ \<contlex\>Verb2\<\/contlex\>\n\ \ \ \ \<pos\>V\<\/pos\>\n\ \ \ \ \<article\>\n\ \ \ \ \ \ \<eng\>\n\ \ \ \ \ \ \ \ \<choice\>\n\ \ \ \ \ \ \ \ \ \ \<variant\ \/\>\n\ \ \ \ \ \ \ \ \<\/choice\>\n\ \ \ \ \ \ \<\/eng\>\n\ \ \ \ \ \ \<fin\>\n\ \ \ \ \ \ \ \ \<choice\>\n\ \ \ \ \ \ \ \ \ \ \<variant\ \/\>\n\ \ \ \ \ \ \ \ \<\/choice\>\n\ \ \ \ \ \ \<\/fin\>\n\ \ \ \ \<\/article\>\n\ \ \<\/entry\>/g ;


#stem,V3 (without ыны)
s/^([^,]*),V3/\n\ \ \<entry\>\n\ \ \ \ \<lemma\>$1ыны\<\/lemma\>\<stem\>$1ы\<\/stem\>\n\ \ \ \ \<contlex\>Verb3\<\/contlex\>\n\ \ \ \ \<pos\>V\<\/pos\>\n\ \ \ \ \<article\>\n\ \ \ \ \ \ \<eng\>\n\ \ \ \ \ \ \ \ \<choice\>\n\ \ \ \ \ \ \ \ \ \ \<variant\ \/\>\n\ \ \ \ \ \ \ \ \<\/choice\>\n\ \ \ \ \ \ \<\/eng\>\n\ \ \ \ \ \ \<fin\>\n\ \ \ \ \ \ \ \ \<choice\>\n\ \ \ \ \ \ \ \ \ \ \<variant\ \/\>\n\ \ \ \ \ \ \ \ \<\/choice\>\n\ \ \ \ \ \ \<\/fin\>\n\ \ \ \ \<\/article\>\n\ \ \<\/entry\>/g ;



print ;
}
