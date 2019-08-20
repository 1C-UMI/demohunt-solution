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

	<xsl:template match="udata[@module = 'blogs20'][@method = 'postsList']" mode="left">
		<xsl:if test="total &gt; '5'">
			<div class="header_blog"> / <a href="{//blog_link}">перейти в блог</a></div>
		</xsl:if>
		<h1 class="header">Блог</h1>
		<ul id="blog">
			<xsl:apply-templates select="items/item" mode="left" />
		</ul>
	</xsl:template>

	<xsl:template match="item" mode="left">
		<li>
			<a href="{post_link}" xmlns:umi="umi" umi:element-id="{@id}" umi:field-name="name"><xsl:value-of select="title" /></a>
			<span xmlns:umi="umi" umi:element-id="{@id}" umi:field-name="publish_time">Добавлено 
				<xsl:apply-templates select="document(concat('udata://system/convertDate/',publish_time,'/d.m.Y/'))/udata" />
			</span>
		</li>
	</xsl:template>

	<xsl:template match="udata[@module = 'blogs20'][@method = 'postsList']" mode="page">
		<div id="blog_items">
			<xsl:apply-templates select="items/item" mode="blog_page" />
		</div>
		<xsl:apply-templates select="document('udata://system/numpages/')/udata">
			<xsl:with-param name="numpages" select="ceiling(total div per_page)" />
		</xsl:apply-templates>
	</xsl:template>

	<xsl:template match="item" mode="blog_page">
		<div class="blog_item">
			<div class="blog_header">
				<a class="aitems" href="{post_link}" xmlns:umi="umi" umi:element-id="{@id}" umi:field-name="name" umi:delete="delete"><strong><xsl:value-of select="title" /></strong></a>
				<span xmlns:umi="umi" umi:element-id="{@id}" umi:field-name="publish_time">Добавлено <xsl:apply-templates select="document(concat('udata://system/convertDate/',publish_time,'/d.m.Y/'))/udata" /> |</span> 
				<span xmlns:umi="umi" umi:element-id="{@id}" umi:field-name="tags"><xsl:apply-templates select="tags/item" mode="tags" /></span>
			</div>
			<div xmlns:umi="umi" umi:element-id="{@id}" umi:field-name="content" umi:delete="delete">
				<xsl:value-of select="cut" disable-output-escaping="yes" />
			</div>
			<div class="comments">
				<a href="{post_link}#subitems">Комментарии (<xsl:value-of select="comments_count" /><xsl:if test="not(comments_count)">0</xsl:if>)</a> | <a href="{post_link}#additem">Комментировать</a>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="item" mode="tags">
		&#160;<a href="{link}"><xsl:value-of select="tag" /></a>
	</xsl:template>

</xsl:stylesheet>