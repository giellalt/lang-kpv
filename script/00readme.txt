Steps from the old komi-lex.xml to a content- and poswise separation:

1. flatten the dictionary (result file is "out_my_kom-lex.xml")
java -Xmx2048m net.sf.saxon.Transform -it main grouped_sorted/getRidOfGroups.xsl toIndent=../my_kom-lex.xml

2. split dictionary by pos (result dir ist xml_out) 
java -Xmx2048m net.sf.saxon.Transform -it main split_kom-dict_pos.xsl file=out_my_kom-lex.xml

3. split the pos files by content
java -Xmx2048m net.sf.saxon.Transform -it main split_by_content_kom-dict.xsl inDir=xml_out

The result is the working files for the dictionary is the following strcture: 

~/gtsvn/kt/kom/src>ll split_cont_pos
total 0
drwxr-xr-x  27 cipriangerstenberger  staff   918 14 sep 09:50 empty
drwxr-xr-x  42 cipriangerstenberger  staff  1428 14 sep 02:07 eng_fin
drwxr-xr-x  42 cipriangerstenberger  staff  1428 14 sep 02:07 eng_only
drwxr-xr-x  42 cipriangerstenberger  staff  1428 14 sep 02:07 fin_only







