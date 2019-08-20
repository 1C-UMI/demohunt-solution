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

	<xsl:template match="udata[@module = 'blogs20'][@method = 'commentsList']">
		<xsl:apply-templates select="items" mode="commentsList" />
		<xsl:apply-templates select="document(concat('udata://system/numpages/',total,'/',per_page,'///3/'))/udata">
			<xsl:with-param name="numpages" select="ceiling(total div per_page)" />
		</xsl:apply-templates>
	</xsl:template>

	<xsl:template match="items" mode="commentsList">
		<xsl:apply-templates select="item" mode="commentsList" />
	</xsl:template>

	<xsl:template match="subcomments" mode="commentsList">
		<xsl:apply-templates select="item" mode="commentsList" />
	</xsl:template>

	<xsl:template match="item" mode="commentsList">
		<p>
			<strong xmlns:umi="umi" umi:element-id="{@cid}" umi:field-name="publish_time" umi:delete="delete"><xsl:value-of select="php:function('date', 'd.m.Y в H:i', string(publish_time))" /></strong> | 
			<xsl:apply-templates select="document(concat('uobject://',author_id,'.user_id'))//item" mode="autorComments" />
			<xsl:value-of select="document(concat('uobject://',author_id,'.nickname'))//value" />
			<!--<xsl:apply-templates select="document(concat('udata://blogs20/placeControls/',@cid,'/'))/udata/controls" mode="placeControls" />-->
		</p>
		<div xmlns:umi="umi" umi:element-id="{@cid}" umi:field-name="content"><xsl:value-of select="content" disable-output-escaping="yes" /></div>
		<xsl:if test="document('udata://blogs20/checkAllowComments/')/udata = '1'"><a href="#comment_add" onclick="javascript:setCommentParent({@cid});">Комментировать</a></xsl:if>
		<div class="subitems"><xsl:apply-templates select="subcomments" mode="commentsList" /></div>
	</xsl:template>

	<xsl:template match="item" mode="autorComments">
		<xsl:value-of select="document(concat(@xlink:href,'.lname'))//value" />
		<xsl:value-of select="document(concat(@xlink:href,'.fname'))//value" />
		(<xsl:value-of select="document(concat(@xlink:href,'.login'))//value" />)
	</xsl:template>

	<xsl:template match="controls" mode="placeControls">
		<!-- <a href="{edit/@link}" style="text-decoration:none;">
			<img src="/images/cms/blogs20/comment_edit.png" alt="Редактировать этот комментарий" title="Редактировать этот комментарий" style="border:0;" />
		</a> 
		| <a href="{delete/@link}">Удалить</a>-->
	</xsl:template>

</xsl:stylesheet>