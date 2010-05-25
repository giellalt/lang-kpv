#!/usr/bin/perl -w
use utf8 ;

while (<>)

{

s/vihtta/вит/g ;			 # 5
s/tuvsán/сюрс/g ;			 # 1000
s/tjuot/DELETE/g ;			 
s/tjuohte/сё/g ;			 # 100
s/tjuode/сё/g ;			 # 100 in 200, 300, ..
s/niellje/DELETE/g ;       ### Delete doublet
s/niellja/нёль/g ;			 # 4
s/milliárdda/милярд/g ;		 # 
s/millijåvnnå/миллион/g ;		 # 
s/miljona/милюн/g ;			 # 
s/milijåvnnå/миллион/g ;		 # 
s/låk/дас/g ;				 # -kymmentä in 2-0, 3-0
s/låhke/дас/g ;			 # 
s/låhke#akta#tuvsán/дасӧтисюрс/g ; # 
s/lågev/дас/g ;			 # 20, 30, ..
s/lågenan/дас/g ;			 # teen, in 13, 14, ...
s/gålmmå/куим/g ;			 # 3
s/gáktsa/кӧкъямыс/g ;			 # 8
s/guokta/DELETE/g ;        ### Delete doublet
s/guokta/DELETE/g ;        ### Delete doublet
s/guok/кык/g ;			 # 2 
s/guhtta/квайт/g ;			 # 6
s/gietjav/DELETE/g ;       ### Delete doublet
s/gietja/сизим/g ;			 # 7
s/giehtja/DELETE/g ;       ### Delete doublet
s/duhát/DELETE/g ;         ### Delete doublet
s/aktse/ӧкмыс/g ;		 # 9
s/akta/ӧти/g ;			 # 1

s/^.*DELETE.*$//g ;

print ;
}
