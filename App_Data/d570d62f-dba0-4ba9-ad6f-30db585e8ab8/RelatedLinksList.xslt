<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#x00A0;">
]>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:msxml="urn:schemas-microsoft-com:xslt"
  xmlns:umbraco.library="urn:umbraco.library" xmlns:Exslt.ExsltCommon="urn:Exslt.ExsltCommon" xmlns:Exslt.ExsltDatesAndTimes="urn:Exslt.ExsltDatesAndTimes" xmlns:Exslt.ExsltMath="urn:Exslt.ExsltMath" xmlns:Exslt.ExsltRegularExpressions="urn:Exslt.ExsltRegularExpressions" xmlns:Exslt.ExsltStrings="urn:Exslt.ExsltStrings" xmlns:Exslt.ExsltSets="urn:Exslt.ExsltSets"
  exclude-result-prefixes="msxml umbraco.library Exslt.ExsltCommon Exslt.ExsltDatesAndTimes Exslt.ExsltMath Exslt.ExsltRegularExpressions Exslt.ExsltStrings Exslt.ExsltSets ">


  <xsl:output method="xml" omit-xml-declaration="yes" indent="yes"/>

  <xsl:param name="currentPage"/>
  <xsl:variable name="rootPage" select="$currentPage/ancestor-or-self::root"/>
  <xsl:variable name="propertyAlias" select="/macro/PropertyAlias"/>
  
  <xsl:template match="/">

    <xsl:variable name="homepage" select="$currentPage/ancestor-or-self::Homepage"/>
    <xsl:variable name="nodeIds" select="umbraco.library:Split($homepage/*[name()=$propertyAlias],',')" />

      <ul class="navigation fc">
        <xsl:for-each select="$nodeIds/value">
        <xsl:variable name="linkNone" select="$rootPage//*[@isDoc][@id = string(current()/.)]"/>
        <xsl:if test="string-length($linkNone/@id)> 0">
        <li>
            <xsl:attribute name="class">
              <xsl:if test="$currentPage/ancestor-or-self::*[@level &gt; 1]/@id = $linkNone/@id">
            <xsl:text>selected</xsl:text>
              </xsl:if>
              <xsl:if test="position() = last()">
                <xsl:text> last</xsl:text>
              </xsl:if>

            </xsl:attribute>

          <xsl:choose>
            <xsl:when test="string-length($linkNone/umbracoUrlAlias) > 0">
              <a href="{$linkNone/umbracoUrlAlias}">
                <xsl:value-of select="$linkNone/@nodeName"/>
              </a>
            </xsl:when>
            <xsl:otherwise>
              <a href="{umbraco.library:NiceUrl($linkNone/@id)}">
                <xsl:value-of select="$linkNone/@nodeName"/>
              </a>
            </xsl:otherwise>
          </xsl:choose>
          
        </li>
        </xsl:if>
      </xsl:for-each>

      </ul>
  </xsl:template>

</xsl:stylesheet>