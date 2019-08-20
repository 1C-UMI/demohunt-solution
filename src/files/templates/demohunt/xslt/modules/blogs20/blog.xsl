<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">

	<xsl:template match="result[@module = 'blogs20'][@method = 'blog']">
		<h1 class="header" umi:element-id="{$pId}" umi:field-name="h1">
			<!-- Подключаем заголовки -->
			<xsl:value-of select="//property[@name = 'h1']/value" />
		</h1>
		<xsl:apply-templates select="document(concat('udata://blogs20/postsList/',$pId))/udata" mode="page" />
	</xsl:template>

</xsl:stylesheet>