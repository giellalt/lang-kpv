<?xml version="1.0"?>
<!--+
    | 
    | The parameter: the path to the collection of XML-files to compile
    | Usage: java -Xmx2048m net.sf.saxon.Transform -it main collect-dict-parts.xsl dir=DIR
    | 
    +-->

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:strip-space elements="*"/>
  <xsl:output method="xml"
	      encoding="UTF-8"
	      omit-xml-declaration="no"
	      indent="yes"/>
  
  <xsl:param name="dir" select="'default'"/>

  <xsl:template match="/" name="main">
    <xsl:text>
</xsl:text>
    <dict>
      <xsl:copy-of select="collection(concat($dir, '?select=*.xml'))/dict/entry"/>
    </dict>
  </xsl:template>
  
</xsl:stylesheet>
