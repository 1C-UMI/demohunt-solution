<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet	version="1.0"
				xmlns="http://www.w3.org/1999/xhtml"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:php="http://php.net/xsl"
				xmlns:date="http://exslt.org/dates-and-times"
				xmlns:udt="http://umi-cms.ru/2007/UData/templates"
				xmlns:umi="http://www.umi-cms.ru/TR/umi"
				extension-element-prefixes="php"
				exclude-result-prefixes="xsl php date udt">

<xsl:output		method="html"
				encoding="utf-8"
				indent="yes"
				doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
				doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
				cdata-section-elements="script noscript"
				undeclare-namespaces="yes"
				omit-xml-declaration="yes"/>

	<xsl:include href="modules/content/common.xsl" />
	<xsl:include href="modules/news/common.xsl" />
	<xsl:include href="modules/system/common.xsl" />
	<xsl:include href="modules/blogs20/common.xsl" />
	<xsl:include href="modules/search/common.xsl" />
	<xsl:include href="modules/users/common.xsl" />
	<!--xsl:include href="modules/catalog/common.xsl" />
	<xsl:include href="modules/banners/common.xsl" />
	<xsl:include href="modules/vote/common.xsl" />
	<xsl:include href="modules/dispatches/common.xsl" />
	<xsl:include href="modules/eshop/common.xsl" />
	<xsl:include href="modules/custom/common.xsl" />
	<xsl:include href="modules/faq/common.xsl" /-->

	<xsl:variable name="pId" select="/result/@pageId" />
	<xsl:variable name="parentId" select="/result/page/@parentId" />
	<xsl:variable name="parId" select="/result/parents/page[1]/@id" />

	<xsl:variable name="default_page" select="/result/page/@is-default" />
	<xsl:variable name="level" select="count(/result/parents/page)+1" />
	<xsl:variable name="domain" select="/result/@domain" />
	<xsl:variable name="link" select="/result/page/@link" />
	<xsl:variable name="parentLink" select="/result/parents/page[position() = last()]/@link" />
	<xsl:variable name="parLink" select="/result/parents/page[1]/@link" />
	<xsl:variable name="lang" select="/result/@lang" />
	<xsl:variable name="module" select="/result/@module" />
	<xsl:variable name="method" select="/result/@method" />
	<xsl:variable name="request-uri" select="/result/@request-uri" />
	<xsl:variable name="url" select="document('udata://system/getCurrentURI/')/udata" />

	<xsl:param name="user_reg" select="document('udata://users/auth')/udata/user_id" />
	<xsl:param name="user_group" select="document(concat('uobject://',$user_reg))//property[@name = 'groups']/value" />

	<xsl:param name="p" select="0"/>
	<xsl:param name="search_string" />

	<xsl:param name="_err" />

	<xsl:template match="/">
		<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ru" lang="ru">
			<head>
				<title><xsl:value-of select="//result/@title" /></title>
				<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
				<meta name="DESCRIPTION" content="{//result/meta/description}" />
				<meta name="KEYWORDS" content="{//result/meta/keywords}" />
				<link type="text/css" rel="stylesheet" href="/templates/demohunt/css/style.css?{/result/@system-build}" />
				<link type="text/css" rel="stylesheet" href="/templates/demohunt/css/modules.css?{/result/@system-build}" />
				<link rel="canonical" href="http://{concat(result/@domain, result/@request-uri)}"/>
				<xsl:apply-templates select="document('udata://content/includeFrontendResources/')/udata" mode="system_scripts" />
				<xsl:apply-templates select="result" mode="script" />
				<!-- social buttons-->
				<script type="text/javascript" src="https://vk.com/js/api/openapi.js"></script>
				<!-- /social buttons-->
				<script type="text/javascript">
					jQuery(document).ready(function(){
						jQuery('#on_edit_in_place').click(function() {
							uAdmin.eip.swapEditor();
							return false;
						});
					});
				</script>
			</head>
			<body>
				<div id="main">
					<div id="header"><div><a href="/"><img src="/templates/demohunt/images/logo.png" class="png" width="509" height="90" alt="Охотницы за привидениями" /></a></div></div>
					<div id="ms">
						<div id="search">
							<form method="get" name="search" action="/search/search_do/">
								<input type="text" class="search" name="search_string" value="Поиск" onfocus="if (this.value == 'Поиск') this.value=''" onblur="if (!this.value.length) this.value='Поиск';" /> 
								<input type="submit" value="Искать" class="submit"  x-webkit-speech="" speech=""  />
							</form>
						</div>
						<div id="menu">
							<!-- Выводим меню сайта по шаблону /xsltTpls/modules/content/menu.xsl -->
							<xsl:apply-templates select="document('udata://content/menu/')/udata" mode="main_menu" />
						</div>
					</div>
					<div id="page">
						<div id="right">
							<xsl:apply-templates select="document('udata://users/auth/')/udata" mode="main">
								<xsl:with-param name="demo" select="/result/@demo" />
							</xsl:apply-templates>							
							<!-- Выводим три последние новости из раздела 3(Новости) по шаблону /xsltTpls/modules/news/lastlist.xsl и игнорируем номер текущей страницы -->
							<xsl:apply-templates select="document('udata://news/lastlist/(/news1/)//3/1/')/udata" mode="news" />
							<!-- Выводим пять последних сообщений блога по порядку используя шаблон /xsltTpls/modules/blogs20/postsList.xsl -->
							<xsl:apply-templates select="document('udata://blogs20/postsList///5/')/udata" mode="left" />
						</div>
						<div id="content">
							<xsl:if test="$_err">
								<!-- Выводим ошибки используя шаблон /xsltTpls/modules/system/listErrorMessages.xsl -->
								<xsl:apply-templates select="document(concat('udata://system/listErrorMessages/',$_err,''))/udata" />
							</xsl:if>
							<!-- Выводим контент -->
							<xsl:apply-templates select="result" />
							<div class="clear" />
						</div>
						<div class="clear" />
					</div>
					<div id="footer">
						<div class="copyright"> © <xsl:value-of select="document('udata://system/convertDate/now/(Y)')/udata" /> Охотницы за привидениями</div>
						<div class="developer"> Разработано:
							<a rel="nofollow" href="http://www.umi-cms.ru">
								<img src="/templates/demohunt/images/umicms.png" width="89" height="35" alt="UMI.CMS" align="middle" />
							</a>
						</div>
					</div>
				</div>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="result" />

	<xsl:template match="result" mode="script" />

	<xsl:template match="udata" mode="system_scripts">
		<xsl:value-of select="." disable-output-escaping="yes" />
	</xsl:template>

</xsl:stylesheet>
