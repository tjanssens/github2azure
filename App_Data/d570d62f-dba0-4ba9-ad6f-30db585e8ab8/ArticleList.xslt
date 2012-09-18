<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#x00A0;"> ]>
<xsl:stylesheet 
  version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:msxml="urn:schemas-microsoft-com:xslt" 
  xmlns:umbraco.library="urn:umbraco.library" xmlns:Exslt.ExsltCommon="urn:Exslt.ExsltCommon" xmlns:Exslt.ExsltDatesAndTimes="urn:Exslt.ExsltDatesAndTimes" xmlns:Exslt.ExsltMath="urn:Exslt.ExsltMath" xmlns:Exslt.ExsltRegularExpressions="urn:Exslt.ExsltRegularExpressions" xmlns:Exslt.ExsltStrings="urn:Exslt.ExsltStrings" xmlns:Exslt.ExsltSets="urn:Exslt.ExsltSets" xmlns:PS.XSLTsearch="urn:PS.XSLTsearch" 
  exclude-result-prefixes="msxml umbraco.library Exslt.ExsltCommon Exslt.ExsltDatesAndTimes Exslt.ExsltMath Exslt.ExsltRegularExpressions Exslt.ExsltStrings Exslt.ExsltSets PS.XSLTsearch ">

<xsl:output method="xml" omit-xml-declaration="yes" />

<xsl:param name="currentPage"/>

<!-- Don't change this but create a 'number' element in your -->
<!-- macro with the alias of 'numberOfItems' -->

  <xsl:variable name="recordsPerPage" select="2" />
  <xsl:variable name="articlePages" select="$currentPage/* [@isDoc and string(umbracoNaviHide) != '1']"/>
  <xsl:variable name="pageNumber" >
    <xsl:choose>
      <xsl:when test="umbraco.library:RequestQueryString('page') &lt;=0 or string(umbraco.library:RequestQueryString('page')) = '' or string(umbraco.library:RequestQueryString('page')) = 'NaN'">0</xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="umbraco.library:RequestQueryString('page')"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="numberOfItems" select="count($articlePages)"/>
  
<xsl:template match="/">

<!-- The fun starts here -->

  <xsl:if test="$numberOfItems &gt; 0">
    <ul id="newsList">
      <xsl:for-each select="$articlePages">
        <xsl:sort select="articleDate" order="descending"/>
        <xsl:if test="position() > $recordsPerPage * number($pageNumber) and   
position() &lt;= number($recordsPerPage * number($pageNumber) +   
$recordsPerPage )">
          <li>
            <h3>
              <a href="{umbraco.library:NiceUrl(@id)}">
                <xsl:value-of select="@nodeName"/>
              </a>
            </h3>
            <p class="articleDate">
              <xsl:value-of select="umbraco.library:FormatDateTime(articleDate,'dd MMMM yyyy')"/>
            </p>
            <p>
              <xsl:value-of select="articleSummary"/>
            </p>
          </li>
        </xsl:if>
      </xsl:for-each>
    </ul>

    <xsl:if test="$numberOfItems > $recordsPerPage">
      <p id="pager">
        <xsl:call-template name="pageNumbers">
          <xsl:with-param name="pageIndex" select="1"/>
        </xsl:call-template>
      </p>
    </xsl:if>
      
  </xsl:if>

</xsl:template>


  <!-- individual links to each page of results for the search -->
  <xsl:template name="pageNumbers">

    <xsl:param name="pageIndex"/>

    <xsl:if test="$pageIndex != 1"> | </xsl:if>
    <xsl:choose>
      <xsl:when test="$pageIndex - 1 = $pageNumber">
        <!-- current page -->
        <strong>
        <xsl:value-of select="$pageIndex"/>
        </strong>
      </xsl:when>
      <xsl:otherwise>
        <!-- other pages -->
        <a>
          <xsl:attribute name="href">
            ?page=<xsl:value-of select="$pageIndex - 1"/>
          </xsl:attribute>
          <xsl:value-of select="$pageIndex"/>
        </a>
      </xsl:otherwise>
    </xsl:choose>

    <xsl:if test="$pageIndex * $recordsPerPage &lt; $numberOfItems">
      <xsl:call-template name="pageNumbers">
        <xsl:with-param name="pageIndex" select="$pageIndex + 1"/>
      </xsl:call-template>
    </xsl:if>

  </xsl:template>

</xsl:stylesheet>