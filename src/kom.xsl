<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html"/>

<xsl:template match="dict">
<html>
 <body>
  <xsl:apply-templates/>
 </body>
</html>
</xsl:template>
<!--
<xsl:template match="pretext">
 <p>
  <xsl:apply-templates/>
 </p>
</xsl:template> -->

<xsl:template match="entry">
 <p>
  <xsl:apply-templates />
 </p>
</xsl:template>

<xsl:template match="lemma">
 <b>
  <xsl:apply-templates/>
 </b>
</xsl:template>

<xsl:template match="contlex"/>

<xsl:template match="POS">
 <sup><b><i><small>
  <xsl:apply-templates/>
 </small></i></b></sup>
</xsl:template>
<!--
<xsl:template match="stemcomm">
  <xsl:apply-templates/>
</xsl:template> -->

<xsl:template match="stem">
 <i>
<!--  (<xsl:apply-templates/>~ )-->
 </i>
</xsl:template>

<xsl:template match="article">
<!--  <b>fi: </b>-->
  <xsl:apply-templates select="FIN"/>
  <xsl:apply-templates select="EG"/>
  <!--
   <xsl:if test="not([last()])">
    <xsl:text>;</xsl:text>
   </xsl:if> -->
</xsl:template>

<xsl:template match="FIN">
  <xsl:apply-templates/>
</xsl:template>

<!--
<xsl:template match="transgroup/trans">
  <xsl:apply-templates/>
  <xsl:if test="not([last()])">, </xsl:if>
</xsl:template>

<xsl:template match="comment">
 <xsl:text>(</xsl:text>
  <xsl:apply-templates/>
 <xsl:text>)</xsl:text>
</xsl:template>-->

<xsl:template match="EG">
  <br/>&#x20;<b>Esim.: </b>
  <xsl:apply-templates select="KOMI"/> =>
  <xsl:apply-templates select="FIN"/>
</xsl:template>

<xsl:template match="KOMI">
 <i>
  <xsl:apply-templates/>
 </i>
</xsl:template>

<xsl:template match="FIN">
  <xsl:apply-templates/>
</xsl:template>

</xsl:stylesheet>
