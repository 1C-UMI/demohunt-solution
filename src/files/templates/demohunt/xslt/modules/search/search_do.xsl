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

	<!-- Здесь выводится список страниц. -->

	<xsl:template match="result[@module = 'search'][@method = 'search_do']">
		<xsl:apply-templates select="document('udata://search/search_do')/udata" mode="search" />
	</xsl:template>

	<xsl:template match="udata" mode="search">
		<h1 class="header">Поиск</h1>
		<div id="search_pages">
			<!-- Подключаем форму поиска -->
			<xsl:apply-templates select="document('udata://search/insert_form')/udata" />
			<xsl:if test="$search_string != ''">
				<xsl:if test="not(items)">
					<!-- Выводим данный блок, если при поиске ничего не было найдено -->
					<p>По вашему запросу <span>&#171;<xsl:value-of select="$search_string" />&#187;</span> ничего не найдено.</p>
				</xsl:if>
				<xsl:apply-templates select="total" mode="search_do" />
				<!-- Подключаем список страниц при постраничном выводе -->
				<xsl:apply-templates select="//item" mode="search_do" />
			</xsl:if>
		</div>
		<p>
			<xsl:apply-templates select="document('udata://system/numpages/')/udata">
				<xsl:with-param name="numpages" select="ceiling(total div per_page)" />
			</xsl:apply-templates>
		</p>
	</xsl:template>

	<xsl:template match="udata[@method='insert_form']">
		<form name="search_pages" method="get" action="/search/search_do/">
			<input type="text" class="search" name="search_string" value="{last_search_string}" onblur="if (!this.value.length) this.value='Поиск';" onfocus="if (this.value == 'Поиск') this.value=''" />
			<input type="submit" class="submit" value="Искать"/>
		</form>
	</xsl:template>

	<xsl:template match="total" mode="search_do">
		<p>По вашему запросу <span>&#171;<xsl:value-of select="$search_string" />&#187;</span> найдено страниц: <xsl:value-of select="." /></p>
	</xsl:template>


	<xsl:template match="item" mode="search_do">
		<xsl:variable name="num" select="position() + $p*(../../per_page)" />
		<!-- Выводим номер, название и описание страницы в результатах поиска -->
		<div class="search_result_block">
			<span><xsl:value-of select="$num" />. </span>
			<a href="{@link}"><xsl:value-of select="@name" /></a>
			<div><xsl:value-of select="." disable-output-escaping="yes" /></div>
		</div>
	</xsl:template>

</xsl:stylesheet>