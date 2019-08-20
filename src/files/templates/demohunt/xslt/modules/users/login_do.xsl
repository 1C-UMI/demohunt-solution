<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="result[@module = 'users'][@method = 'login_do']">
		<h1><xsl:value-of select="@header" /></h1>
		<xsl:if test="$user_reg"><p>Вы ввели неверный логин или пароль. Проверьте раскладку клавиатуры, не нажата ли клавиша «Caps Lock» и попробуйте ввести логин и пароль еще раз:</p></xsl:if>
		<xsl:apply-templates select="document('udata://users/auth/')/udata" />
	</xsl:template>

</xsl:stylesheet>