<?xml version="1.0"?>
<!--+
    | 
    | get rid of the entryGroup element in the komi dictionary
    | Usage: see below
    +-->

<!-- java -Xmx2048m net.sf.saxon.Transform -it main NAME-OF-THIS-STYLESHEET toIndent=PATH-TO-DICTIONARY  -->
<!-- output is named "out_"INPUTFILE.xml -->


<xsl:stylesheet version="2.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:xs="http://www.w3.org/2001/XMLSchema"
		xmlns:local="nightbar"
		xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
		exclude-result-prefixes="xs local xsi">

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
	    <xsl:copy-of select="doc($toIndent)/dict/*/entry"/> 
	  </dict>
	</xsl:variable>
	
	<!-- indent document -->
	<xsl:result-document href="{$outputDir}/out_{$file_name}.{$e}" format="{$output_format}">
	  <xsl:copy-of select="$output"/>
	</xsl:result-document>

      </xsl:when>
      <xsl:otherwise>
	<xsl:text>Cannot locate: </xsl:text><xsl:value-of select="$toIndent"/><xsl:text>&#xa;</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
</xsl:stylesheet>

