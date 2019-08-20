<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="udata[@method='captcha'][url]">
		<table>
			<tr>
				<td width="200">* Введите текст на картинке</td>
				<td>
					<img alt="Циферки" title="Циферки" src="{url}{@random_string}" id="captcha_img" />
					<div style="margin-bottom:5px;">
						<span	style="border-bottom:1px dashed; cursor:pointer;"
								onclick="var d = new Date(); jQuery('#captcha_img').attr('src', '/captcha.php?reset&amp;' + d.getTime());">
							<xsl:text>обновить текст</xsl:text>
						</span>
					</div>
					<input type="text" style="width: 100px;" class="textinputs" name="captcha" id="sys_captcha" />
				</td>
			</tr>
		</table>
	</xsl:template>

</xsl:stylesheet>