<?xml version="1.0"?>
<!--+
    | 
    | The parameter: the path to the collection of XML-files to check
    | Usage: java -Xmx2048m net.sf.saxon.Transform -it main THIS_FILE inDir=DIR
    | 
    +-->

<xsl:stylesheet version="2.0" 
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:myFn="http://whatever"
		xmlns:cip="http://fishandcip"
		exclude-result-prefixes="cip myFn">

  <xsl:import href="komi2gt_POS.xsl"/>

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
  <xsl:variable name="outDir" select="'outDir'"/>
  <xsl:variable name="e" select="'xml'"/>



  <xsl:template match="/" name="main">
    <xsl:for-each select="collection(concat($inDir, '?select=*.xml'))">
      <xsl:variable name="file_name" select="substring-before(tokenize(document-uri(.), '/')[last()], '.xml')"/>
      <xsl:variable name="out">
	<r>
	  <xsl:for-each select="./dict/entry[not(contains(./lemma/text(), '_'))][not(./@state)]">
	    <e>
	      <xsl:if test="./@reflemma">
		<xsl:attribute name="reflemma">
		  <xsl:value-of select="./@reflemma"/>
		</xsl:attribute>
	      </xsl:if>
	      <lg>
		<l>
		  <xsl:variable name="pos_cluster" select="tokenize(normalize-space(./pos/text()), '-')"/>
		  
		  <xsl:attribute name="pos">
		    <xsl:value-of select="myFn:mapPOS($pos_cluster[1])"/>
		  </xsl:attribute>
		  
		  <xsl:if test="count($pos_cluster) &gt; 1">
		    <xsl:attribute name="type">
		      <xsl:value-of select="myFn:mapPOS($pos_cluster[2])"/>
		    </xsl:attribute>
		  </xsl:if>

		  <xsl:value-of select="normalize-space(./lemma/text())"/>

		</l>
	      </lg>
	      <xsl:for-each select="./article">
		<mg>
		  <tg>
		    <xsl:for-each select="./*/choice/variant">
		      <xsl:variable name="lng" select="../../local-name()"/>
		      <xsl:if test="$lng = 'eng' or $lng = 'fin'">
			<t>
			  <xsl:attribute name="lang">
			    <xsl:value-of select="$lng"/>
			  </xsl:attribute>
			  <xsl:call-template name="get_normalized_text">
			    <xsl:with-param name="theString" select="normalize-space(.)"/>
			  </xsl:call-template>
			</t>
		      </xsl:if>
		    </xsl:for-each>
		    
<!-- 		    <xsl:for-each select="./fin/choice/variant"> -->
<!-- 		      <xsl:variable name="lng" select="../../local-name()"/> -->
<!-- 		      <t> -->
<!-- 			<xsl:attribute name="lang"> -->
<!-- 			  <xsl:value-of select="'fin'"/> -->
<!-- 			</xsl:attribute> -->
<!-- 			<ggg><xsl:value-of select="$lng"/></ggg> -->
<!-- 			<xsl:value-of select="normalize-space(.)"/> -->
<!-- 		      </t> -->
<!-- 		    </xsl:for-each> -->
		    
		    <xsl:if test="./eg/node()">
		      <xsl:for-each select="./eg">
			<xg>
			  <x>
			    <xsl:value-of select="normalize-space(./komi)"/>
			  </x>
			  <xsl:if test="./eng/choice/variant/node()">
			    <xsl:for-each select="./eng/choice/variant">
			      <xt>
				<xsl:attribute name="lang">
				  <xsl:value-of select="'eng'"/>
				</xsl:attribute>
				<xsl:value-of select="normalize-space(.)"/>
			      </xt>
			    </xsl:for-each>
			  </xsl:if>
			  <xsl:if test="./eng/choice/variant/node()">
			    <xsl:for-each select="./fin/choice/variant">
			      <xt>
				<xsl:attribute name="lang">
				  <xsl:value-of select="'fin'"/>
				</xsl:attribute>
				<xsl:value-of select="normalize-space(.)"/>
			      </xt>
			    </xsl:for-each>
			  </xsl:if>
			</xg>
		      </xsl:for-each>
		    </xsl:if>
		    
		    

		  </tg>
		</mg>
	      </xsl:for-each>
	    </e>
	  </xsl:for-each>
	</r>
      </xsl:variable>

      <!-- output the data into separate files-->
      <xsl:result-document href="{$outDir}/{$file_name}.{$e}" method="{$e}" indent="yes">
	<xsl:copy-of select="$out"/>
      </xsl:result-document>

    </xsl:for-each>
    
  </xsl:template>

  <xsl:template name="get_normalized_text">
    <xsl:param name="theString"/>   
    <xsl:if test="not($theString = '')">
      <xsl:value-of select="$theString"/>
    </xsl:if>
    <xsl:if test="$theString = ''">
      <xsl:value-of select="'xxx'"/>
    </xsl:if>
  </xsl:template>



</xsl:stylesheet>
