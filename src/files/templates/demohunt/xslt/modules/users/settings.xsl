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

	<xsl:template match="result[@module = 'users'][@method = 'settings']">
		<h1 style="margin-right:260px;">Регистрационные данные</h1>
		<xsl:if test="not($user_reg)"><div style="margin-bottom:20px;">Для изменения регистрационных данных необходима авторизация.</div></xsl:if>
		<xsl:choose>
			<xsl:when test="$user_reg"><xsl:apply-templates select="document('udata://users/settings/')/udata" /></xsl:when>
			<xsl:otherwise><xsl:apply-templates select="document('udata://users/auth/')/udata" /></xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="udata[@module = 'users'][@method = 'settings']">
		<xsl:variable name="csrf_token" select="/result/@csrf" />

		<form id="form_settings" method="post" action="/users/settings_do/" enctype="multipart/form-data">
			<input type="hidden" name="csrf" value="{$csrf_token}" />
			<table>
				<tr><td colspan="2"><h4>Данные для авторизации</h4></td></tr>
				<xsl:apply-templates select="document(concat('uobject://',user_id))/udata/object" mode="change_data_user" />
				<tr><td colspan="2"><h4>Краткая информация</h4></td></tr>
				<xsl:apply-templates select="document(concat('udata://data/getEditForm/',user_id,'/'))/udata" mode="change_data_user" />
				<tr><td colspan="2"><input type="submit" class="submit" value="Сохранить данные" /></td></tr>
			</table>
		</form>
	</xsl:template>

	<xsl:template match="object" mode="change_data_user">
		<tr>
			<td>Логин</td>
			<td><input type="text" value="{//property[@name = 'login']/value}" disabled="disabled" style="width:350px;" /></td>
		</tr>
		<tr>
			<td>Пароль</td>
			<td><input type="password" name="password" value="" style="width:350px;" /></td>
		</tr>
		<tr>
			<td>Подтверждение пароля</td>
			<td><input type="password" name="password_confirm" value="" style="width:350px;" /></td>
		</tr>
		<tr>
			<td>E-mail</td>
			<td><input type="text" name="email" value="{//property[@name = 'e-mail']/value}" style="width:350px;" /></td>
		</tr>
	</xsl:template>

	<xsl:template match="udata" mode="change_data_user">
		<xsl:apply-templates select="group[@name = 'short_info' or @name = 'more_info']/field" mode="change_data_user" />
	</xsl:template>

	<xsl:template match="field[@type = 'string']" mode="change_data_user">
		<tr>
			<td><xsl:apply-templates select="@title" /></td>
			<td><input type="text" name="{@input_name}" value="{.}" style="width:350px;" /></td>
		</tr>
	</xsl:template>

	<xsl:template match="field[@type = 'img_file']" mode="change_data_user">
		<xsl:variable name="avatar" select="@relative-path" />
		<tr>
			<td><xsl:apply-templates select="@title" /></td>
			<td>
				<input type="file" name="{@input_name}" />
				<xsl:if test="not($avatar) or ($avatar = '')"><img height="57" width="57" alt="" src="/templates/demohunt/images/blogs/default_avatar.gif" /></xsl:if>
				<xsl:apply-templates select="document(concat('udata://system/makeThumbnail/(.', string($avatar), ')/57/auto'))/udata" />
			</td>
		</tr>
	</xsl:template>

</xsl:stylesheet>
