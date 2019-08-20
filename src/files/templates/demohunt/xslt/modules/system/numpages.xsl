<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE local [
	<!ENTITY nbsp   "&#160;">
	<!ENTITY copy   "&#169;">
	<!ENTITY reg    "&#174;">
	<!ENTITY trade  "&#8482;">
	<!ENTITY mdash  "&#8212;">
	<!ENTITY laquo  "&#171;">
	<!ENTITY raquo  "&#187;"> 
	<!ENTITY pound  "&#163;">
	<!ENTITY yen    "&#165;">
	<!ENTITY euro   "&#8364;">
]>

<xsl:stylesheet	version="1.0"
					xmlns="http://www.w3.org/1999/xhtml"
					xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
					xmlns:php="http://php.net/xsl"
					xmlns:date="http://exslt.org/dates-and-times"
					xmlns:udt="http://umi-cms.ru/2007/UData/templates"
					xmlns:xlink="http://www.w3.org/TR/xlink"
					extension-element-prefixes="php"
					exclude-result-prefixes="xsl php date udt xlink">

	<xsl:template match="udata[@module = 'system'][@method = 'numpages']">
		<xsl:param name="numpages" />
		<xsl:variable name="request">
			<xsl:if test="$request-uri != ''">
				<xsl:variable name="request_uri_amp" select="php:function('str_replace', 'amp;', '', string($request-uri))" />
				<xsl:value-of select="concat('&amp;', $request_uri_amp)" />
			</xsl:if>
		</xsl:variable>
		<xsl:variable name="first" select="items/item[position() = 1]" />
		<xsl:variable name="last" select="items/item[position() = last()]" />
		<xsl:if test="$numpages &gt; 1">
			<div class="navigator">
				Страницы:&#160;
				<xsl:if test="$p &gt; 0">
					<a id="toprev" href="?p={$p - 1}{$request}" style="font-size: 10px; text-decoration: none">← Ctrl</a>&#160;
				</xsl:if>
				<xsl:if test="$first &gt; 1">
					<a href="?p=0{$request}">1</a>
					<xsl:choose>
						<xsl:when test="$first = 2">&#160;|&#160;</xsl:when>
						<xsl:otherwise>&#160;...&#160;</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:apply-templates select="items/item" mode="_pages.num">
					<xsl:with-param name="request" select="$request" />
				</xsl:apply-templates>
				<xsl:if test="$last &lt; $numpages">
					<xsl:choose>
						<xsl:when test="($last + 1) = $numpages">&#160;|&#160;</xsl:when>
						<xsl:otherwise>&#160;...&#160;</xsl:otherwise>
					</xsl:choose>
					<a href="?p={$numpages - 1}{$request}"><xsl:value-of select="$numpages"/></a>
				</xsl:if>
				<xsl:if test="$p &lt; $numpages - 1">
					&#160;<a id="tonext" href="?p={$p + 1}{$request}" style="font-size: 10px; text-decoration: none">Ctrl →</a>
				</xsl:if>
			</div>
		</xsl:if>
	</xsl:template>

	<xsl:template match="item" mode="_pages.num">
		<xsl:param name="request"/>
		<xsl:choose>
			<xsl:when test=". = $p + 1">
				<b><xsl:value-of select="."/></b>
			</xsl:when>
			<xsl:otherwise>
				<a href="?p={node() - 1}{$request}"><xsl:value-of select="."/></a>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="position() != last()">&#160;|&#160;</xsl:if>
	</xsl:template>

</xsl:stylesheet>