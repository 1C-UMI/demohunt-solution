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

	<xsl:template match="udata[@module = 'news'][@method = 'lastlist']" mode="gratitude">
		<xsl:if test="count(//item) &gt; '2'">
			<div class="header_gratitude"> / <a href="{archive_link}">все благодарности</a></div>
		</xsl:if>
		<div id="gratitude">
			<h1 class="header">Благодарности</h1>
			<xsl:apply-templates select="//item" mode="gratitude" />
		</div>
	</xsl:template>

	<xsl:template match="item" mode="gratitude">
		<xsl:variable name="anons_pic" select="document(concat(@xlink:href,'.anons_pic'))//value" />
		<dl>
			<dt class="gratitude_foto" xmlns:umi="umi" umi:element-id="{@id}" umi:field-name="name">
				<xsl:apply-templates select="document(concat('udata://system/makeThumbnail/(',string($anons_pic/@path),')/60/auto/'))/udata" />
				<xsl:apply-templates />
			</dt>
			<dd class="gratitude_text" xmlns:umi="umi" umi:element-id="{@id}" umi:field-name="anons"> 
				<xsl:value-of select="document(concat(@xlink:href,'.anons'))//value" disable-output-escaping="yes" /> 
				<a href="{@link}">>></a>
			</dd>
		</dl>
	</xsl:template>

	<xsl:template match="udata[@module = 'news'][@method = 'lastlist']" mode="news">
		<xsl:if test="count(//item) &gt; '3'">
			<div class="header_news"> / <a href="{archive_link}">все новости</a></div>
		</xsl:if>
		<h1 class="header">Новости</h1>
		<ul class="news">
			<xsl:apply-templates select="//item" mode="news" />
		</ul>
	</xsl:template>

	<xsl:template match="item" mode="news">
		<li>
			<div xmlns:umi="umi" umi:element-id="{@id}" umi:field-name="publish_time">
				<img src="/templates/demohunt/images/li.png" width="10" height="6" alt="-" />
				<xsl:apply-templates select="document(concat('udata://system/convertDate/',@publish_time,'/d.m.Y/'))/udata" />
			</div>
			<a href="{@link}" xmlns:umi="umi" umi:element-id="{@id}" umi:field-name="name">
				<xsl:apply-templates />
			</a>
			<p xmlns:umi="umi" umi:element-id="{@id}" umi:field-name="anons">
				<xsl:value-of select="document(concat(@xlink:href,'.anons'))//value" disable-output-escaping="yes" /> 
				<a href="{@link}">>></a>
			</p>
		</li>
	</xsl:template>

	<xsl:template match="udata[@module = 'news'][@method = 'lastlist']" mode="news_page">
		<ul class="news">
			<xsl:apply-templates select="//item" mode="news_page" />
		</ul>
		<xsl:apply-templates select="document('udata://system/numpages/')/udata">
			<xsl:with-param name="numpages" select="ceiling(total div per_page)" />
		</xsl:apply-templates>
	</xsl:template>

	<xsl:template match="item" mode="news_page">
		<li>
			<span xmlns:umi="umi" umi:element-id="{@id}" umi:field-name="publish_time">
				<xsl:apply-templates select="document(concat('udata://system/convertDate/',@publish_time,'/d.m.Y/'))/udata" />
			</span>
			<a href="{@link}" xmlns:umi="umi" umi:element-id="{@id}" umi:field-name="name">
				<xsl:apply-templates />
			</a>
			<p xmlns:umi="umi" umi:element-id="{@id}" umi:field-name="anons">
				<xsl:value-of select="document(concat(@xlink:href,'.anons'))//value" disable-output-escaping="yes" /> 
				<a href="{@link}">>></a>
			</p>
		</li>
	</xsl:template>

</xsl:stylesheet>