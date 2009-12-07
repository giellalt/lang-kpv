<?xml version="1.0"?>
<!--+
    | Generate lex files from XML (at the moment only for Komi)
    | NB: An XSLT-2.0-processor is needed!
    | Usage: java -Xmx2048m net.sf.saxon.Transform -it main XSLT_SCRIPT file="INPUT-FILE"
    | 
    +-->

<xsl:stylesheet version="2.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:xs="http://www.w3.org/2001/XMLSchema"
		exclude-result-prefixes="xs">
    
  <xsl:strip-space elements="*"/>
  <xsl:output method="text" name="txt"
	      encoding="UTF-8"
	      omit-xml-declaration="yes"
	      indent="no"/>

  <xsl:output method="xml" name="xml"
              encoding="UTF-8"
	      omit-xml-declaration="no"
	      indent="yes"/>


  <xsl:variable name="tab" select="'&#x9;'"/>
  <xsl:variable name="spc" select="'&#x20;'"/>
  <xsl:variable name="nl" select="'&#xA;'"/>
  <xsl:variable name="cl" select="':'"/>
  <xsl:variable name="scl" select="';'"/>
  <xsl:variable name="us" select="'_'"/>
  <xsl:variable name="qm" select="'&#34;'"/>



  <!--   Input file in text format: as parameter -->
  <xsl:param name="file" select="'default.xml'"/>
  <xsl:param name="path" select="'out'"/>
  <xsl:param name="outputDir" select="'out'"/>

  <!-- Patterns for the feature values -->
  <xsl:variable name="of" select="'txt'"/>
  <xsl:variable name="file_name" select="substring-before((tokenize($file, '/'))[last()], '.xml')"/>
  
  <xsl:template match="/" name="main">
    
    <xsl:choose>
      <xsl:when test="doc-available($file)">

	<xsl:variable name="out">
	  <out>	
	    <xsl:for-each select="doc($file)/dict/entry[not(contains(./lemma/text(), $us))]
				  [not(./lemma = preceding::entry/lemma)]">
	      <e>
		<xsl:attribute name="stem">
		  <xsl:value-of select="normalize-space(./stem)"/>
		</xsl:attribute>
		<xsl:attribute name="pos">
		  <xsl:value-of select="normalize-space(./pos)"/>
		</xsl:attribute>
		<xsl:attribute name="cl">
		  <xsl:value-of select="normalize-space(./contlex)"/>
		</xsl:attribute>
		<xsl:attribute name="t">
		  <xsl:value-of select="normalize-space(./article[1]/eng/choice/variant[1])"/>
		</xsl:attribute>
		<xsl:value-of select="normalize-space(./lemma)"/>		
	      </e>
	    </xsl:for-each>
	  </out>
	  
	</xsl:variable>
	
	<xsl:result-document href="{$outputDir}/out_{$file_name}.{$of}" format="{$of}">

	  <xsl:for-each select="$out/out/e">
	    <xsl:value-of select="if (./@stem = '') then concat(., $spc, ./@cl, $spc, $spc, $qm, ./@t, $qm, $spc, $scl, $nl)
				  else concat(., $cl, ./@stem, $spc, ./@cl, $spc, $spc, $qm, ./@t, $qm, $spc, $scl, $nl)"/>
	  </xsl:for-each>
	</xsl:result-document>
	
      </xsl:when>
      <xsl:otherwise>
	<xsl:text>Cannot locate: </xsl:text><xsl:value-of select="$file"/><xsl:text>&#xa;</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


  <xsl:variable name="header">
    <xsl:text>
! ========================================================================== !
!                     A lexicon                           
! ========================================================================== !
!
! Automatically generated from XML
! DO NOT EDIT! 
    </xsl:text>
  </xsl:variable>

</xsl:stylesheet>

