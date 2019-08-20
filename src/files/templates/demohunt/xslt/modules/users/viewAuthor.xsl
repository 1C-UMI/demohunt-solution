<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet	version="1.0"
					xmlns="http://www.w3.org/1999/xhtml"
					xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
					xmlns:php="http://php.net/xsl"
					xmlns:date="http://exslt.org/dates-and-times"
					xmlns:udt="http://umi-cms.ru/2007/UData/templates"
					xmlns:xlink="http://www.w3.org/TR/xlink"
					extension-element-prefixes="php"
					exclude-result-prefixes="xsl php date udt xlink">

	<xsl:template match="udata[@module = 'users'][@method = 'viewAuthor']">
		<xsl:variable name="avatar" select="document(concat('uobject://',user_id,'.avatar'))/udata/property/value/@path" />
		<dt>
			<div>
				<xsl:choose>
					<xsl:when test="$avatar"><xsl:apply-templates select="document(concat('udata://system/makeThumbnail/(', string($avatar), ')/62/auto'))/udata" /></xsl:when>
					<xsl:otherwise><img height="62" width="62" alt="" src="/templates/demohunt/images/blogs/default_avatar.gif" /></xsl:otherwise>
				</xsl:choose>
			</div>
			<xsl:choose>
				<xsl:when test="user_id">
					<xsl:variable name="blog_link" select="document(concat('udata://blogs20/linkToAuthorBlog/',user_id))/udata" />
					<xsl:choose>
						<xsl:when test="$blog_link != ''">
							<a href="{$blog_link}"><xsl:value-of select="fname" />&#8194;<xsl:value-of select="lname" /></a>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="fname" />&#8194;<xsl:value-of select="lname" />
						</xsl:otherwise>
					</xsl:choose>
					&#8194;(<xsl:value-of select="nickname" />)
				</xsl:when>
				<xsl:otherwise><xsl:value-of select="nickname" /></xsl:otherwise>
			</xsl:choose>
		</dt>
	</xsl:template>

	<xsl:template match="udata[@module = 'users'][@method = 'viewAuthor']" mode="forum">
		<div class="author">
			<xsl:choose>
				<xsl:when test="user_id">
					<xsl:value-of select="fname" />&#8194;<xsl:value-of select="lname" />&#8194;(<xsl:value-of select="nickname" />)
				</xsl:when>
				<xsl:otherwise><xsl:value-of select="nickname" /></xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>

</xsl:stylesheet>