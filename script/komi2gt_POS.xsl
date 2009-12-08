<xsl:stylesheet version="2.0" 
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:myFn="http://whatever">
  
  <xsl:output method="text"/>
  
  <xsl:function name="myFn:mapPOS">
    <xsl:param name="pos"/>

	<xsl:if test="(normalize-space($pos)='A')">
	  <xsl:text>a</xsl:text>
	</xsl:if>

	<xsl:if test="(normalize-space($pos)='ADV')">
	  <xsl:text>adv</xsl:text>
	</xsl:if>

	<xsl:if test="(normalize-space($pos)='ADVROOT')">
	  <xsl:text>adv</xsl:text>
	</xsl:if>

	<xsl:if test="(normalize-space($pos)='SUPERL')">
	  <xsl:text>superl</xsl:text>
	</xsl:if>

	<xsl:if test="(normalize-space($pos)='GER')">
	  <xsl:text>adv</xsl:text>
	</xsl:if>

	<xsl:if test="(normalize-space($pos)='CONJ')">
	  <!-- What about cs? -->
	  <xsl:text>cc</xsl:text>
	</xsl:if>

	<xsl:if test="(normalize-space($pos)='ADVERSATIVE')">
	  <xsl:text>advers</xsl:text>
	</xsl:if>

	<xsl:if test="(normalize-space($pos)='NEG')">
	  <xsl:text>neg</xsl:text>
	</xsl:if>

	<xsl:if test="(normalize-space($pos)='N')">
	  <xsl:text>n</xsl:text>
	</xsl:if>
	
	<xsl:if test="(normalize-space($pos)='ABSTR')">
	  <xsl:text>abstr</xsl:text>
	</xsl:if>

	<xsl:if test="(normalize-space($pos)='PROP')">
	  <xsl:text>prop</xsl:text>
	</xsl:if>

	<xsl:if test="(normalize-space($pos)='NUM')">
	  <xsl:text>num</xsl:text>
	</xsl:if>

	<xsl:if test="(normalize-space($pos)='ORD')">
	  <xsl:text>ord</xsl:text>
	</xsl:if>

	<xsl:if test="(normalize-space($pos)='IDIOM')">
	  <xsl:text>xxx</xsl:text>
	</xsl:if>

	<xsl:if test="(normalize-space($pos)='INTERJ')">
	  <xsl:text>i</xsl:text>
	</xsl:if>

	<xsl:if test="(normalize-space($pos)='QUANT')">
	  <xsl:text>quant</xsl:text>
	</xsl:if>

	<xsl:if test="(normalize-space($pos)='PART')">
	  <xsl:text>pcle</xsl:text>
	</xsl:if>

	<xsl:if test="(normalize-space($pos)='ONOM')">
	  <xsl:text>xxx</xsl:text>
	</xsl:if>

	<xsl:if test="(normalize-space($pos)='POSTP')">
	  <xsl:text>po</xsl:text>
	</xsl:if>
	
	<xsl:if test="(normalize-space($pos)='V')">
	  <xsl:text>v</xsl:text>
	</xsl:if>

	<xsl:if test="(normalize-space($pos)='DUR')">
	  <xsl:text>dur</xsl:text>
	</xsl:if>

	<xsl:if test="(normalize-space($pos)='FREQ')">
	  <xsl:text>xxx</xsl:text>
	</xsl:if>

	<xsl:if test="(normalize-space($pos)='INST')">
	  <xsl:text>xxx</xsl:text>
	</xsl:if>

	<xsl:if test="(normalize-space($pos)='VDER')">
	  <xsl:text>v</xsl:text>
	</xsl:if>

	<xsl:if test="(normalize-space($pos)='VNEG')">
	  <xsl:text>v</xsl:text>
	</xsl:if>

	<xsl:if test="(normalize-space($pos)='PRON')">
	  <xsl:text>pron</xsl:text>
	</xsl:if>

	<xsl:if test="(normalize-space($pos)='DEM')">
	  <xsl:text>dem</xsl:text>
	</xsl:if>

	<xsl:if test="(normalize-space($pos)='INDEF')">
	  <xsl:text>indef</xsl:text>
	</xsl:if>

	<xsl:if test="(normalize-space($pos)='INTER')">
	  <xsl:text>interr</xsl:text>
	</xsl:if>

	<xsl:if test="(normalize-space($pos)='PERS')">
	  <xsl:text>pers</xsl:text>
	</xsl:if>

	<xsl:if test="(normalize-space($pos)='Q')">
	  <xsl:text>xxx</xsl:text>
	</xsl:if>

	<xsl:if test="(normalize-space($pos)='REFL')">
	  <xsl:text>refl</xsl:text>
	</xsl:if>

 	<xsl:if test="(normalize-space($pos)='REL')">
	  <xsl:text>rel</xsl:text>
	</xsl:if>
	
  </xsl:function>
  
</xsl:stylesheet>