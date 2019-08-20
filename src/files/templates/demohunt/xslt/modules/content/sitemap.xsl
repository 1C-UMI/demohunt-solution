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

	<xsl:template match="result[@module = 'content'][@method = 'sitemap']">
		<h1 class="header">
			<!-- Подключаем заголовки -->
			<xsl:value-of select="@header" />
		</h1>
		<xsl:apply-templates select="document('udata://content/sitemap/')/udata" />
	</xsl:template>

	<xsl:template match="udata[@module = 'content'][@method = 'sitemap']">
		<xsl:apply-templates select="items" />
	</xsl:template>

	<xsl:template match="items">
		<xsl:param name="element-id" select="'0'" />
		<ul xmlns:umi="umi" umi:element-id="{$element-id}" umi:module="content" umi:method="menu">
			<xsl:apply-templates select="item" />
		</ul>
	</xsl:template>

	<xsl:template match="item">
		<li>
			<a xmlns:umi="umi" href="{@link}" umi:element-id="{@id}" umi:field-name="name"><xsl:value-of select="@name" /></a>
			<xsl:apply-templates select="items">
				<xsl:with-param name="element-id" select="@id" />
			</xsl:apply-templates>
		</li>
	</xsl:template>

</xsl:stylesheet>