<?xml version="1.0"?>
<!--+
    | 
    | compares (ped vs. smenob) and put ped-flags on smenob-entries 
    | Usage: java net.sf.saxon.Transform -it main cfSmeSmj.xsl
    +-->

<xsl:stylesheet version="2.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:xs="http://www.w3.org/2001/XMLSchema"
		xmlns:local="nightbar"
		exclude-result-prefixes="xs local">

  <xsl:strip-space elements="*"/>

  <xsl:output method="xml" name="xml"
              encoding="UTF-8"
	      omit-xml-declaration="no"
	      indent="yes"/>

  
  <!-- Input files -->
  <xsl:param name="toIndent" select="'default.xml'"/>

  <!-- Output files -->
  <xsl:variable name="outputDir" select="'.'"/>
  
  <!-- Patterns for the feature values -->
  <xsl:variable name="output_format" select="'xml'"/>
  <xsl:variable name="e" select="$output_format"/>
  <xsl:variable name="file_name" select="substring-before((tokenize($toIndent, '/'))[last()], '.xml')"/>
  
  
  
  <xsl:template match="/" name="main">
    
    <xsl:choose>
      <xsl:when test="doc-available($toIndent)">

	<xsl:variable name="output">
	  <dict>
	    <xsl:for-each-group select="doc($toIndent)/dict/entry" group-by="./lemma/text()">
	      <!-- 	      <xsl:sort select="count(current-group())" order="descending"/>  -->

	      <xsl:sort select="current-grouping-key()" 
			case-order="lower-first"
			lang="kv"
			order="ascending"/> 
	      
	      <xsl:element name="entryGroup">
		<xsl:attribute name="lemma">
		  <xsl:value-of select="current-grouping-key()"/>
		</xsl:attribute>
		<xsl:attribute name="counter">
		  <xsl:value-of select="count(current-group())"/>
		</xsl:attribute>
		<xsl:for-each select="current-group()">
		  <xsl:copy-of select="."/>
		</xsl:for-each>
	      </xsl:element>
	    </xsl:for-each-group>
	  </dict>
	</xsl:variable>
	
	<!-- indent document -->
	<xsl:result-document href="{$outputDir}/out_group-lemma_{$file_name}.{$e}" format="{$output_format}">
	  <xsl:copy-of select="$output"/>
	</xsl:result-document>

      </xsl:when>
      <xsl:otherwise>
	<xsl:text>Cannot locate: </xsl:text><xsl:value-of select="$toIndent"/><xsl:text>&#xa;</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
</xsl:stylesheet>

