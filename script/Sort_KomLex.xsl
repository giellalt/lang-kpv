<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<dict xmlns:fn="http://www.w3.org/2005/02/xpath-functions">
<xsl:choose>
<xsl:when test="//entry/lemma">
  <xsl:for-each select="//entry">
    <xsl:sort select="lemma"/>

<xsl:copy-of select="."/>

  </xsl:for-each>
</xsl:when>
</xsl:choose>
</dict>
</xsl:template>
</xsl:stylesheet>
