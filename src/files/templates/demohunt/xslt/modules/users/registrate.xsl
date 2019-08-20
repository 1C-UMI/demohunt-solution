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

	<xsl:template match="result[@module = 'users'][@method = 'registrate']">
		<div>
			<h1 style="margin-right:260px;"><xsl:value-of select="@header" /></h1>
			<xsl:apply-templates select="document('udata://users/registrate/')/udata" />
			<div class="clear" />
		</div>
	</xsl:template>

	<xsl:template match="udata[@module = 'users'][@method = 'registrate']">
		<div id="registrate">
			<form action="/users/registrate_do/" method="post" enctype="multipart/form-data">
				<table>
					<tr>
						<td width="200">Логин:</td>
						<td><input type="text" name="login" style="width:350px;" /></td>
					</tr>
					<tr>
						<td>Пароль:</td>
						<td><input type="password" name="password" value="" style="width:350px;" /></td>
					</tr>
					<tr>
						<td>Подтверждение пароля:</td>
						<td><input type="password" name="password_confirm" value="" style="width:350px;" /></td>
					</tr>
					<tr>
						<td>E-mail:</td>
						<td><input type="text" name="email" value="" style="width:350px;" /></td>
					</tr>
					<xsl:apply-templates select="document('udata://data/getCreateForm/users-user')/udata/group[@name = 'short_info' or @name = 'more_info']/field" mode="short_info" />
					<tr><td colspan="2"><xsl:apply-templates select="document('udata://system/captcha')/udata" /></td></tr>
					<tr>
						<td colspan="2">
							<input type="hidden" name="template" value="default" />
							<input type="submit" value="Зарегистрироваться" />
						</td>
					</tr>
				</table>
			</form>
		</div>
	</xsl:template>

	<xsl:template match="field" mode="short_info">
		<xsl:if test="@name">
			<tr>
				<td><xsl:value-of select="@title" /></td>
				<td><input type="text" name="{@input_name}" value="" class="textinputs" style="width:350px;" /></td>
			</tr>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>