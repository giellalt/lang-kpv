<?xml version="1.0"?>
<!--+
    | 
    | The parameter: the path to the collection of XML-files to check
    | Usage: java -Xmx2048m net.sf.saxon.Transform -it main THIS_FILE inDir=DIR
    | 
    +-->

<xsl:stylesheet version="2.0" 
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:cip="http://fishandcip"
		exclude-result-prefixes="cip">



  <xsl:strip-space elements="*"/>
  <xsl:output method="xml" name="xml"
              encoding="UTF-8"
	      omit-xml-declaration="no"
	      indent="yes"/>

  <xsl:function name="cip:elemHasNoText">
    <xsl:param name="theNode"/>   
    <xsl:for-each select="$theNode">
      <xsl:value-of select="normalize-space(concat('', .))"/>
    </xsl:for-each>
  </xsl:function>

  <xsl:param name="inDir" select="'.'"/>
  <xsl:variable name="outDir" select="'split_cont_pos'"/>
  <xsl:variable name="e" select="'xml'"/>



  <xsl:template match="/" name="main">

    <xsl:for-each select="collection(concat($inDir, '?select=*.xml'))">
      
      <xsl:variable name="file_name" select="substring-before(tokenize(document-uri(.), '/')[last()], '.xml')"/>

      <xsl:variable name="eCheck">

	<eCheck>

	  <empty>
	    <xsl:for-each select="./dict/entry[cip:elemHasNoText(./article/eng) = ''][cip:elemHasNoText(./article/fin) = ''] |
				  ./dict/entry[not(./article/eng/node())][not(./article/fin/node())]">
	      <entry>
		<xsl:attribute name="lemma">
		  <xsl:value-of select="./lemma/text()"/>
		</xsl:attribute>
		
		<xsl:attribute name="art_count">
		  <xsl:value-of select="count(./article)"/>
		</xsl:attribute>

		<xsl:copy-of select="./*"/>
		
	      </entry>
	    </xsl:for-each>
	  </empty>

	  <eng_only>
	    <xsl:for-each select="./dict/entry[not(cip:elemHasNoText(./article/eng) = '')][cip:elemHasNoText(./article/fin) = ''] |
				  ./dict/entry[not(cip:elemHasNoText(./article/eng) = '')][not(./article/fin/node())][./article/eng/node()]">
	      <entry>
		<xsl:attribute name="lemma">
		  <xsl:value-of select="./lemma/text()"/>
		</xsl:attribute>
		
		<xsl:attribute name="art_count">
		  <xsl:value-of select="count(./article)"/>
		</xsl:attribute>

		<xsl:copy-of select="./*"/>
		
	      </entry>
	    </xsl:for-each>
	  </eng_only>

	  <fin_only>
	    <xsl:for-each select="./dict/entry[not(cip:elemHasNoText(./article/fin) = '')][cip:elemHasNoText(./article/eng) = ''] |
				  ./dict/entry[not(cip:elemHasNoText(./article/fin) = '')][not(./article/eng/node())][./article/fin/node()]">


	      <entry>
		<xsl:attribute name="lemma">
		  <xsl:value-of select="./lemma/text()"/>
		</xsl:attribute>
		
		<xsl:attribute name="art_count">
		  <xsl:value-of select="count(./article)"/>
		</xsl:attribute>

		<xsl:copy-of select="./*"/>
		
	      </entry>
	    </xsl:for-each>
	  </fin_only>


	  <eng_fin>
	    <xsl:for-each select="./dict/entry[cip:elemHasNoText(./article/eng[cip:elemHasNoText(following-sibling::fin) != '']) != '']">
	      <entry>
		<xsl:attribute name="lemma">
		  <xsl:value-of select="./lemma/text()"/>
		</xsl:attribute>
		
		<xsl:attribute name="art_count">
		  <xsl:value-of select="count(./article)"/>
		</xsl:attribute>

		<xsl:copy-of select="./*"/>
		
	      </entry>
	    </xsl:for-each>
	  </eng_fin>

	  
	</eCheck>
	

      </xsl:variable>



      <!-- output the data into separate txt-files: pos it the file name descriptor-->
      <xsl:for-each select="$eCheck/eCheck/*">
	<xsl:variable name="theDir" select="name()"/>
	<xsl:result-document href="{$outDir}/{$theDir}/{$file_name}.{$e}" method="{$e}" indent="yes">
	  <dict>
	    <xsl:copy-of select="$eCheck/eCheck/*[name() = $theDir]/entry"/>
	  </dict>
	  <xsl:text>&#xa;</xsl:text>
	</xsl:result-document>
      </xsl:for-each>

    </xsl:for-each>
    
  </xsl:template>



  <xsl:template name="get_normalized_text">
    <xsl:param name="theNode"/>   
    <xsl:for-each select="$theNode">
      <xsl:value-of select="normalize-space(concat('', .))"/>
    </xsl:for-each>
  </xsl:template>



</xsl:stylesheet>
