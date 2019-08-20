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

	<xsl:template match="udata[@module = 'content'][@method = 'menu']" mode="main_menu">
		<ul xmlns:umi="umi" umi:element-id="0" umi:module="content" umi:method="menu">
			<xsl:apply-templates select="//item" mode="main_menu" />
		</ul>
	</xsl:template>

	<xsl:template match="item" mode="main_menu">
		<li>
			<a xmlns:umi="umi" href="{@link}" umi:element-id="{@id}" umi:field-name="name">
				<xsl:if test="@status"><xsl:attribute name="class">act</xsl:attribute></xsl:if>
				<xsl:apply-templates />
			</a>
		</li>
	</xsl:template>

</xsl:stylesheet>