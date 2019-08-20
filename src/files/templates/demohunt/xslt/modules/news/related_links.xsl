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

	<xsl:template match="udata[@module = 'news'][@method = 'related_links']">
		<xsl:if test="items">
			<p>
				<p>Ссылки по теме:</p>
				<ul>
					<xsl:apply-templates select="//item" mode="related_links" />
				</ul>
			</p>
		</xsl:if>
	</xsl:template>

	<xsl:template match="item" mode="related_links">
		<!-- Выводим ссылку по теме -->
		<xsl:variable name="publish_time" select="document(concat(@xlink:href,'.publish_time'))/udata/property/value/@unix-timestamp" />
		<li><a href="{@link}"><xsl:apply-templates /> (<xsl:apply-templates select="document(concat('udata://system/convertDate/',$publish_time,'/d.m.Y/'))/udata" />)</a></li>
	</xsl:template>

</xsl:stylesheet>