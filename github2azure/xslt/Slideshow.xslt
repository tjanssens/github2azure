<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#x00A0;"> ]>
<xsl:stylesheet 
  version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:msxml="urn:schemas-microsoft-com:xslt"
  xmlns:umbraco.library="urn:umbraco.library" xmlns:Exslt.ExsltCommon="urn:Exslt.ExsltCommon" xmlns:Exslt.ExsltDatesAndTimes="urn:Exslt.ExsltDatesAndTimes" xmlns:Exslt.ExsltMath="urn:Exslt.ExsltMath" xmlns:Exslt.ExsltRegularExpressions="urn:Exslt.ExsltRegularExpressions" xmlns:Exslt.ExsltStrings="urn:Exslt.ExsltStrings" xmlns:Exslt.ExsltSets="urn:Exslt.ExsltSets" 
  exclude-result-prefixes="msxml umbraco.library Exslt.ExsltCommon Exslt.ExsltDatesAndTimes Exslt.ExsltMath Exslt.ExsltRegularExpressions Exslt.ExsltStrings Exslt.ExsltSets ">


<xsl:output method="xml" omit-xml-declaration="yes"/>

<xsl:param name="currentPage"/>

  <xsl:template match="/">

    <xsl:variable name="nodeIds" select="umbraco.library:Split($currentPage/slideshow,',')" />

    <div id="slideshow">
      <ul>
        <xsl:for-each select="$nodeIds/value">
          <li class="rotating-panel fc">
            <xsl:if test="position() > 1">
              <xsl:attribute name="style">display:none;</xsl:attribute>
            </xsl:if>
            <xsl:variable name="slide" select="umbraco.library:GetXmlNodeById(current()/.)"/>
            <img class="fl" alt="{$slide/@nodeName}" src="{$slide/mainImage}"/>
            <div class="">
              <xsl:value-of select="$slide/bodyText" disable-output-escaping="yes"/>
            </div>
          </li>
        </xsl:for-each>
      </ul>
      <ul id="slidePager">
        <xsl:for-each select="$nodeIds/value">
          <li>
            <a href="?position={position()}">
              <xsl:if test="position() = 1">
                <xsl:attribute name="class">selected</xsl:attribute>
              </xsl:if>
              <xsl:value-of select="position()"/>
            </a>
          </li>
        </xsl:for-each>
      </ul>

    </div>

  </xsl:template>

</xsl:stylesheet>