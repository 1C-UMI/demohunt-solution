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

	<xsl:template match="result[@module = 'blogs20'][@method = 'post']">
		<h1 class="header" xmlns:umi="umi" umi:element-id="{$pId}" umi:field-name="h1">
			<!-- Подключаем заголовки -->
			<xsl:value-of select="//property[@name = 'h1']/value" />
		</h1>
		<div id="blog_items">
			<div class="blog_item">
				<div class="blog_header">
					<span xmlns:umi="umi" umi:element-id="{$pId}" umi:field-name="publish_time">Добавлено <xsl:apply-templates select="document(concat('udata://system/convertDate/',//property[@name = 'publish_time']/value/@unix-timestamp,'/d.m.Y/'))/udata" /> |</span> 
					<span xmlns:umi="umi" umi:element-id="{$pId}" umi:field-name="tags"><xsl:apply-templates select="//property[@name = 'tags']/value" mode="post_tags" /></span>
				</div>
				<!-- Выводим содержимое поста -->
				<div xmlns:umi="umi" umi:element-id="{$pId}" umi:field-name="content">
					<xsl:value-of select="//property[@name = 'content']/value" disable-output-escaping="yes" />
				</div>
			</div>
			<a name="subitems"></a>
			<h4>Комментарии:</h4>
			<!-- Выводим комментарии по шаблону /xsltTpls/modules/blogs20/commentsList.xsl -->
			<xsl:apply-templates select="document(concat('udata://blogs20/commentsList/',$pId,'/'))/udata" />
			<hr /><a name="comment_add" />
			<!-- Выводим форму добавления комментария -->
			<xsl:choose>
				<xsl:when test="document('udata://blogs20/checkAllowComments/')/udata = '1'">
					<form id="comment_add_form" name="frm_addblogmsg" method="post" action="/blogs20/commentAdd/{$pId}/">
						<table>
							<tr><td>* Заголовок комментария:<a name="additem">&#160;</a><br /><input type="text" name="title" style="width: 350px;" class="textinputs" /></td></tr>
							<!-- Если пользователь не зарегистрирован -->
							<xsl:if test="not($user_reg)">
								<tr><td>* Ваш ник:<br /><input type="text" name="nick" style="width: 350px;" /></td></tr>
								<tr><td>Ваш email:<br /><input type="text" name="email" style="width: 350px;" /></td></tr>
							</xsl:if>
							<tr><td>* Текст комментария:<br /><textarea name="content" style="width: 350px; height: 120px;"></textarea></td></tr>
							<xsl:apply-templates select="document('udata://system/captcha/')/udata" />
							<tr><td>* Поля, отмеченные звездочкой, являются обязательными для заполнения:</td></tr>
							<tr><td><input type="submit" value="Добавить комментарий" /></td></tr>
						</table>
					</form>
				</xsl:when>
				<xsl:otherwise>
					Для того, чтобы добавить коментарий, авторизируйтесь.
					<xsl:apply-templates select="document('udata://users/auth/')/udata" />
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>

	<xsl:template match="value" mode="post_tags">
		&#160;<a href="/blogs20/postsByTag/{.}"><xsl:value-of select="." /></a>
	</xsl:template>

</xsl:stylesheet>