<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:Stylesheet [
  <!ENTITY nbsp "&#x00A0;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxml="urn:schemas-microsoft-com:xslt" xmlns:umbraco.library="urn:umbraco.library" exclude-result-prefixes="msxml umbraco.library">
  <xsl:output method="xml" omit-xml-declaration="yes"/>
  <xsl:param name="currentPage"/>

  <xsl:variable name="CssClassName" select="/macro/CssClassName" />
  <xsl:variable name="CssId" select="/macro/CssId" />

  <xsl:variable name="StopLevel" select="/macro/StopLevel" />
  <xsl:variable name="StartLevel" select="/macro/StartLevel" />

  <xsl:template match="/">
      <xsl:call-template name="Navigation">
        <xsl:with-param name="childNodes" select="$currentPage/ancestor-or-self::*[@isDoc][@level=($StartLevel)]/* [@isDoc][not(name()='Article')][not(umbracoNaviHide=1)]" />
      </xsl:call-template>
  </xsl:template>

  <xsl:template name="Navigation">
    <xsl:param name="childNodes"/>
    <xsl:choose>
    <xsl:when test="count($childNodes) > 0">
      <ul>
        <xsl:if test="$CssId !=''">
          <xsl:attribute name="id">
            <xsl:value-of select="$CssId" />
          </xsl:attribute>
        </xsl:if>
        <xsl:if test="$CssClassName !=''">
          <xsl:attribute name="class">
            <xsl:value-of select="$CssClassName" />
          </xsl:attribute>
        </xsl:if>

        <xsl:for-each select="$childNodes">
          <xsl:call-template name="SubMenu"/>
        </xsl:for-each>
      </ul>
    </xsl:when>
      <xsl:otherwise>
        &nbsp;
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


  <xsl:template name="SubMenu">
    <xsl:if test="(umbraco.library:IsProtected(current()/@id, current()/@path) = false() or (umbraco.library:HasAccess(current()/@id, current()/@path) = true() ))">
      <li>
        <xsl:attribute name="class">

          <xsl:if test="$currentPage/ancestor-or-self::*[@isDoc]/@id = current()/@id">
            <xsl:text>selected </xsl:text>
          </xsl:if>

          <xsl:if test="position() = 1">
            <xsl:text>first </xsl:text>
          </xsl:if>

          <xsl:if test="position() = last()">
            <xsl:text>last</xsl:text>
          </xsl:if>
        </xsl:attribute>
        <xsl:choose>
          <xsl:when test="string-length(data[@alias='RedirectUrl']) > 0">
            <a href="{data[@alias='RedirectUrl']}" title="{@nodeName}">
              <xsl:value-of select="@nodeName"/>
            </a>
          </xsl:when>
          <xsl:when test="string-length(data[@alias='RedirectPageId']) > 0">
            <a href="{umbraco.library:NiceUrl(data[@alias='RedirectPageId'])}" title="{@nodeName}">
              <xsl:value-of select="@nodeName"/>
            </a>
          </xsl:when>
          <xsl:otherwise>
            <a href="{umbraco.library:NiceUrl(@id)}" title="{@nodeName}">
              <xsl:value-of select="@nodeName"/>
            </a>
          </xsl:otherwise>
        </xsl:choose>


        <xsl:if test="current()/@level &lt; ($StopLevel) and $currentPage/ancestor-or-self::*[@isDoc]/@id = current()/@id">
          <xsl:if test="count(*[@isDoc][not(data[@alias='umbracoNaviHide']=1)]) > 0">
            <ul>
              <xsl:for-each select="*[@isDoc][not(data[@alias='umbracoNaviHide']=1)]">
                <xsl:sort select="@sortOrder" data-type="number" />
                <xsl:call-template name="SubMenu"/>
              </xsl:for-each>
            </ul>
          </xsl:if>
        </xsl:if>

      </li>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
