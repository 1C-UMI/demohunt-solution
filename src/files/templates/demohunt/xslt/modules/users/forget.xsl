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

	<xsl:template match="result[@module = 'users'][@method = 'forget']">
		<h1><xsl:value-of select="@header" /></h1>
		<div id="page_auth">
			<form method="post" action="/users/forget_do/" id="forget">
			<script>
				<![CDATA[
				jQuery(document).ready(function(){
					jQuery('#forget input:radio').click(function() {
						jQuery('#forget input:text').attr('name', jQuery(this).attr('id'));
					});
				});

				]]>
			</script>
				<div>
				<label>
					<div>
						<input type="radio" id="forget_login" name="choose_forget" checked="checked" />
						<label>Логин</label>
					</div>
				</label>
				<label>
					<span>
						<input type="radio" id="forget_email" name="choose_forget" />
						<label>E-mail</label>
					</span>
				</label>
			</div>
			<div>
				<input type="text" name="forget_login" style="margin:5px 0;" />
			</div>
			<div>
				<input type="submit" class="button" value="Выслать пароль" />
				<div class="clear" />
			</div>
			</form>
		</div>
	</xsl:template>


</xsl:stylesheet>