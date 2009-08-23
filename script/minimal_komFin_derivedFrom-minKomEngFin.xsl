<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<dict xmlns:fn="http://www.w3.org/2005/02/xpath-functions">
<xsl:choose>
<xsl:when test="//entry/lemma">
  <xsl:for-each select="//entry">
    <xsl:sort select="lemma"/>

	<xsl:if test="article[ENG/text()] and 	article[FIN/text()]">

<entry>
<lemma>
<xsl:value-of select="lemma"/>
</lemma>
<xsl:if test="stem[text()]">
<stem>
<xsl:value-of select="stem"/>
</stem>
</xsl:if>
<pos>
<xsl:value-of select="POS"/>
</pos>
<xsl:for-each select="article">
<article>

  <fin><xsl:value-of select="FIN"/></fin>
  <xsl:if test="EG">
    <ex>
      <komi><xsl:value-of select="EG/KOMI"/></komi>
      <fin><xsl:value-of select="EG/FIN"/></fin>
    </ex>
</xsl:if>

</article>
</xsl:for-each>

</entry>
	</xsl:if>

	</xsl:for-each>
</xsl:when>
</xsl:choose>
</dict>
</xsl:template>



</xsl:stylesheet>
<!-- This select the entries that have both English and Finnish translations in the article

-->
