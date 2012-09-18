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
<xsl:param name="homepage" select="$currentPage/ancestor-or-self::Homepage"/>
  

  <xsl:template match="/">

  <ul class="fc">
    <xsl:if test="string-length($homepage/affiliationImage1) > 0">
      <li>
      <xsl:variable name="image1" select="umbraco.library:GetMedia($homepage/affiliationImage1,0)"/>
      <xsl:choose>
        <xsl:when test="$homepage/affiliationLink1">
          <a href="{$homepage/affiliationLink1}">
            <img src="{$image1/umbracoFile}" alt="{$image1/@nodeName}" />
          </a>
        </xsl:when>
        <xsl:otherwise>
          <img src="{$image1/umbracoFile}" alt="{$image1/@nodeName}" />
        </xsl:otherwise>
      </xsl:choose>
      </li>
    </xsl:if>

    <xsl:if test="string-length($homepage/affiliationImage2) > 0">
      <li>
        <xsl:variable name="image2" select="umbraco.library:GetMedia($homepage/affiliationImage2,0)"/>
        <xsl:choose>
          <xsl:when test="$homepage/affiliationLink2">
            <a href="{$homepage/affiliationLink2}">
              <img src="{$image2/umbracoFile}" alt="{$image2/@nodeName}" />
            </a>
          </xsl:when>
          <xsl:otherwise>
            <img src="{$image2/umbracoFile}" alt="{$image2/@nodeName}" />
          </xsl:otherwise>
        </xsl:choose>
      </li>
    </xsl:if>

    <xsl:if test="string-length($homepage/affiliationImage3) > 0">
      <li>
        <xsl:variable name="image3" select="umbraco.library:GetMedia($homepage/affiliationImage3,0)"/>
        <xsl:choose>
          <xsl:when test="$homepage/affiliationLink3">
            <a href="{$homepage/affiliationLink3}">
              <img src="{$image3/umbracoFile}" alt="{$image3/@nodeName}" />
            </a>
          </xsl:when>
          <xsl:otherwise>
            <img src="{$image3/umbracoFile}" alt="{$image3/@nodeName}" />
          </xsl:otherwise>
        </xsl:choose>
      </li>
    </xsl:if>
  </ul>

</xsl:template>

</xsl:stylesheet>