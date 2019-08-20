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

	<xsl:template match="result[@module = 'news'][@method = 'item']">
		<h1 class="header" xmlns:umi="umi" umi:element-id="{$pId}" umi:field-name="h1">
			<!-- Подключаем заголовки -->
			<xsl:value-of select="//property[@name = 'h1']/value" />
		</h1>
		<div id="text" xmlns:umi="umi" umi:element-id="{$pId}" umi:field-name="content">
			<xsl:value-of select="//property[@name = 'content']/value" disable-output-escaping="yes" />
		</div>
		<!-- Здесь выводятся список ссылок по теме. Оформление каждой берётся из шаблона /xsltTpls/modules/news/related_links.xsl -->
		<xsl:apply-templates select="document(concat('udata://news/related_links/',$pId,'/'))/udata" />
	</xsl:template>

</xsl:stylesheet>