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

	<xsl:template match="udata[@method = 'makeThumbnail']">
		<xsl:param name="class" />
		<xsl:param name="alt" />
		<xsl:param name="align" />
		<xsl:param name="style" />
			<img src="{src}" width="{width}" height="{height}" alt="{$alt}" title="{$alt}">
				<xsl:if test="$class">
					<xsl:attribute name="class"><xsl:value-of select="$class"/></xsl:attribute>
				</xsl:if>
				<xsl:if test="$align">
					<xsl:attribute name="align"><xsl:value-of select="$align" /></xsl:attribute>
				</xsl:if>
				<xsl:if test="$style">
					<xsl:attribute name="style"><xsl:value-of select="$style" /></xsl:attribute>
				</xsl:if>
			</img>
	</xsl:template>

</xsl:stylesheet>