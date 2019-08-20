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

	<xsl:template match="result[@module = 'content'][@method = 'notfound']">
		<h1 class="header">
			<!-- Подключаем заголовки -->
			<xsl:value-of select="@header" />
		</h1>
		<p>Запрошенная Вами страница не найдена. Возможно, мы удалили или переместили ее. Возможно, вы пришли по устаревшей ссылке или неверно ввели адрес. Воспользуйтесь поиском или картой сайта.</p>
		<h2>Карта сайта</h2>
		<xsl:apply-templates select="document('udata://content/sitemap/')/udata" />
	</xsl:template>

</xsl:stylesheet>