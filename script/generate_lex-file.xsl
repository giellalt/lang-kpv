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

  <!-- parameters -->
  <xsl:param name="file" select="'default.xml'"/>
  <xsl:param name="outDir" select="'out'"/>
  <xsl:param name="inDir" select="'.'"/>
  <xsl:variable name="of" select="'txt'"/>
  <xsl:variable name="debug" select="true()"/>
  
  
  <xsl:template match="/" name="main">
    
<!--     <xsl:choose> -->
<!--       <xsl:when test="doc-available($inputDir)"> -->
	
	<xsl:for-each select="collection(concat($inDir, '?select=*.xml'))">
<!-- 	  <xsl:choose> -->
<!-- 	    <xsl:when test="doc-available(.)"> -->

	      <xsl:variable name="file_name" select="substring-before(tokenize(document-uri(.), '/')[last()], '.xml')"/>
	      
	      <xsl:if test="$debug">
		<xsl:message terminate="no">
		  <xsl:value-of select="concat('-----------------------------------------', $nl)"/>
		  <xsl:value-of select="concat('processing ', $file_name, $nl)"/>
		  <xsl:value-of select="'   ...........'"/>
		</xsl:message>
	      </xsl:if>

	      <xsl:variable name="out">
		<out>	
		  <!-- this might have to be refined: too underspecified as for preceding::lemma-stem combinations -->
		  <xsl:for-each select="./dict/entry[not(contains(./lemma/text(), $us))]
					[not(./lemma = preceding::entry/lemma and ./stem = preceding::entry/stem)]
					[not(./@exclude='fst')]">
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
	      
	      <xsl:if test="$out/out/e">
		<xsl:result-document href="{$outDir}/{$file_name}.{$of}" format="{$of}">
		  <xsl:variable name="lex_name" select="substring-before($file_name, '_')"/>
		  <xsl:value-of select="concat('LEXICON', $spc, $lex_name, $nl, $nl)"/>
		  <xsl:for-each select="$out/out/e">
		    <xsl:value-of select="if (./@stem = '') then concat(., $spc, ./@cl, $spc, $spc, $qm, ./@t, $qm, $spc, $scl, $nl)
					  else concat(., $cl, ./@stem, $spc, ./@cl, $spc, $spc, $qm, ./@t, $qm, $spc, $scl, $nl)"/>
		  </xsl:for-each>
		</xsl:result-document>

		<xsl:if test="$debug">
		  <xsl:message terminate="no">
		    <xsl:value-of select="concat(' ', count($out/out/e), ' entries generated in lexC file ', $outDir, '/', $file_name, '.', $of, $nl)"/>
		    <xsl:value-of select="'-----------------------------------------'"/>
		  </xsl:message>
		</xsl:if>
	      </xsl:if>

	      <xsl:if test="not($out/out/e)">
		<xsl:if test="$debug">
		  <xsl:message terminate="no">
		    <xsl:value-of select="concat(' *** No entries generated for ', $file_name, $of, $nl)"/>
		    <xsl:value-of select="'-----------------------------------------'"/>
		  </xsl:message>
		</xsl:if>
	      </xsl:if>
	      
<!-- 	    </xsl:when> -->
<!-- 	    <xsl:otherwise> -->
<!-- 	      <xsl:text>Cannot locate file: </xsl:text><xsl:value-of select="concat(., 'xml')"/><xsl:text>&#xa;</xsl:text> -->
<!-- 	    </xsl:otherwise> -->
<!-- 	  </xsl:choose> -->
	  
	</xsl:for-each>
	
<!--       </xsl:when> -->
<!--       <xsl:otherwise> -->
<!-- 	<xsl:text>Cannot locate directory: </xsl:text><xsl:value-of select="$inputDir"/><xsl:text>&#xa;</xsl:text> -->
<!--       </xsl:otherwise> -->
<!--     </xsl:choose> -->

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

