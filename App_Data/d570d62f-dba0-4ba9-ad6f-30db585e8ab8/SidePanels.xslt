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

  <xsl:if test="string-length($currentPage/contentPanels) > 0">

    <xsl:variable name="nodeIds" select="umbraco.library:Split($currentPage/contentPanels,',')" />
  <xsl:if test="count($nodeIds/value) > 0">
    <ul id="rightPanel">
      <xsl:for-each select="$nodeIds/value">
        <li>
          <xsl:value-of disable-output-escaping="yes" select="umbraco.library:RenderTemplate(current()/.,umbraco.library:GetXmlNodeById(current()/.)/@template)"/>
        </li>
      </xsl:for-each>
    </ul>
  </xsl:if>
  </xsl:if>

</xsl:template>

</xsl:stylesheet>