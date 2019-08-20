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

	<xsl:template match="result[@module = 'content'][@method = 'content']">
		<xsl:apply-templates select="page" />
	</xsl:template>

	<xsl:template match="page" />

	<xsl:template match="page[@link = '/']">
		<div class="left">
			<h1 class="header" xmlns:umi="umi" umi:element-id="{$pId}" umi:field-name="h1">
				<!-- Подключаем заголовки -->
				<xsl:value-of select="//property[@name = 'h1']/value" />
			</h1>
			<div xmlns:umi="umi" umi:element-id="{$pId}" umi:field-name="content">
				<!-- Выводим контент на страницу -->
				<xsl:value-of select="//property[@name = 'content']/value" disable-output-escaping="yes" />
			</div>
			<div>
				<iframe src="http://www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2FUMI.CMS&amp;width=290&amp;colorscheme=light&amp;show_faces=true&amp;border_color&amp;stream=false&amp;header=false&amp;height=260" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:290px; height: 260px; margin: 10px 0 0;" allowTransparency="true"></iframe>
		</div>
		</div>
		<div class="center">
			<!-- Выводим 3 благодарности из раздела 21043(Благодарности) по шаблону /xsltTpls/modules/news/lastlist.xsl и игнорируем номер текущей страницы -->
			<xsl:apply-templates select="document('udata://news/lastlist/(/gratitude/)//3/1/')/udata" mode="gratitude" />
			<div id="no" xmlns:umi="umi" umi:element-id="23056" umi:field-name="content">
			<div id="no_bg" />
				<!-- Подключаем содержание страницы 23056(Работа за которую мы никогда не возьмемся) -->
				<xsl:value-of select="document('udata://content/insert/(/ob_otryade/no/)/')/udata" disable-output-escaping="yes" />
			</div>
			<!-- VK Widget -->
			<div id="vk_groups" style="margin: 26px 0 0 10px;"></div>
			<script type="text/javascript">
				VK.Widgets.Group("vk_groups", {mode: 0, width: "300", height: "258",}, 23325076);
			</script>
			<!-- /VK Widget -->
		</div>
	</xsl:template>

	<xsl:template match="page[@link != '/']">
		<h1 class="header" xmlns:umi="umi" umi:element-id="{$pId}" umi:field-name="h1">
			<!-- Подключаем заголовки -->
			<xsl:value-of select="//property[@name = 'h1']/value" />
		</h1>
		<div id="text" xmlns:umi="umi" umi:element-id="{$pId}" umi:field-name="content">
			<!-- Выводим контент на страницу -->
			<xsl:value-of select="//property[@name = 'content']/value" disable-output-escaping="yes" />
		</div>
	</xsl:template>

</xsl:stylesheet>