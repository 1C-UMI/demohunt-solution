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

	<xsl:template match="result[@module = 'users'][@method = 'restore']">
		<h1><xsl:value-of select="@header" /></h1>
		<div id="page_auth"><xsl:apply-templates select="document(concat('udata://users/restore/',$param0,'/'))/udata" /></div>
	</xsl:template>

	<xsl:template match="udata[@module = 'users'][@method = 'restore'][@status = 'success']">
		<div>Пароль успешно изменен, на e-mail адрес, указанный при регистрации выслано уведомление.</div>
		<div>
			<p>Логин:	<xsl:value-of select="login" /></p>
			<p>Пароль: <xsl:value-of select="password" /></p>
		</div>
	</xsl:template>

	<xsl:template match="udata[@module = 'users'][@method = 'restore'][@status = 'fail']">
		<div>Невозможно восстановить пароль: неверный код активации.</div>
	</xsl:template>

</xsl:stylesheet>