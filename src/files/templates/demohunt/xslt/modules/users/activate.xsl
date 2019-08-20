<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet	version="1.0"
				xmlns="http://www.w3.org/1999/xhtml"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:php="http://php.net/xsl"
				xmlns:date="http://exslt.org/dates-and-times"
				xmlns:udt="http://umi-cms.ru/2007/UData/templates"
				xmlns:umi="http://www.umi-cms.ru/TR/umi"
				xmlns:xlink="http://www.w3.org/1999/xlink"
				extension-element-prefixes="php"
				exclude-result-prefixes="xsl php date udt xlink">

	<xsl:template match="result[@module = 'users'][@method = 'activate']">
		<h1><xsl:value-of select="@header" /></h1>
		<xsl:apply-templates select="document(concat('udata://users/activate/',$param0,'/'))/udata" />
	</xsl:template>

	<xsl:template match="udata[@module = 'users'][@method = 'activate']">
		<xsl:choose>
			<xsl:when test="error"><p><xsl:value-of select="error" /></p></xsl:when>
			<xsl:otherwise><xsl:apply-templates select="document('udata://content/redirect/(/users/auth/)/')/udata" /></xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>