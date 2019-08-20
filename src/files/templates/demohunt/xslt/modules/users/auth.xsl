<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet	version="1.0"
					xmlns="http://www.w3.org/1999/xhtml"
					xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
					xmlns:date="http://exslt.org/dates-and-times"
					xmlns:udt="http://umi-cms.ru/2007/UData/templates"
					xmlns:xlink="http://www.w3.org/TR/xlink"
					exclude-result-prefixes="xsl date udt xlink">

	<!-- Здесь выводится список страниц. -->

	<xsl:template match="result[@module = 'users'][@method = 'auth']">
		<h1 class="header">
			<!-- Подключаем заголовки -->
			<xsl:value-of select="@header" />
		</h1>
		<xsl:apply-templates select="document('udata://users/auth/')/udata" />
	</xsl:template>

	<xsl:template match="udata[@module = 'users'][@method = 'auth']">
		<xsl:choose>
			<xsl:when test="user_id">
				<div id="auth_default">
				<p><strong>Добро пожаловать, <xsl:value-of select="user_name" /> (<xsl:value-of select="user_login" />)</strong></p>
				<p>
					<a class="blue" href="/users/logout/">Выйти</a> <br />
					<a class="blue" href="/users/settings/">Перейти в персональный раздел</a>
				</p>
			</div>
			</xsl:when>
			<xsl:otherwise>
				<form method="post" action="/users/login_do/">
					<div><label for="login"><strong>Логин:</strong></label></div>
					<div><input type="text" value="" class="textinputs" name="login" id="login"/></div>
					<div><label for="password"><strong>Пароль:</strong></label></div>
					<div><input type="password" value="" class="textinputs" name="password" id="password"/></div>
					
					<div><input type="submit" value="Вход"/></div>
					<input type="hidden" value="/users/login/" name="from_page" style="display:none;"/>
				</form>
				<p>Если Вы еще не зарегистрированы на сайте, Вы можете <a class="sub" href="/users/registrate/">зарегистрироваться</a>.</p>
				<p>Если Вы забыли пароль, Вы можете <a class="sub" href="/users/forget/">воспользоваться сервисом восстановления пароля</a>.</p>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="udata[@module = 'users'][@method = 'auth']" mode="main">
		<xsl:param name="demo"/>
		<xsl:choose>
			<xsl:when test="user_id">
				<div id="auth_right">
					<p><strong>Добро пожаловать, <xsl:value-of select="user_name" /> (<xsl:value-of select="user_login" />)</strong></p>
					<ul>
						<li>
							<p>
								<a href="#" title="" id="on_edit_in_place" class="link_transfer_class">Включить быстрое редактирование</a>
							</p>
						</li>
						<li>
							<p>
								<a href="/admin/" title="" class="link_transfer_class">Перейти в администрирование</a>
							</p>
						</li>
					</ul>
					<p>
						<a href="/users/logout/" style="margin-right:10px;">Выйти</a>
						<a href="/users/settings/">Перейти в персональный раздел</a>
					</p>
				</div>
			</xsl:when>
			<xsl:otherwise>
				<form method="post" action="/users/login_do/" id="auth_right">
					<div>
						<label>
							<xsl:choose>
								<xsl:when test="$demo=1">
									<input type="text" value="demo" class="textinputs" name="login" id="login" />
								</xsl:when>
								<xsl:otherwise>
							<input type="text" value="" class="textinputs" name="login" id="login" />
								</xsl:otherwise>
							</xsl:choose>
							<strong>Логин:</strong>
						</label>
					</div>
					<div>
						<label>
							<xsl:choose>
								<xsl:when test="$demo=1">
									<input type="password" value="demo" class="textinputs" name="password" id="password"/>
								</xsl:when>
								<xsl:otherwise>
							<input type="password" value="" class="textinputs" name="password" id="password"/>
								</xsl:otherwise>
							</xsl:choose>
							<strong>Пароль:</strong>
						</label>
					</div>
					<div>
						<label class="forget_passward">
							<a href="/users/forget/" class="sub">Забыли пароль?</a>
						</label>
						<label class="forget_passward">
							<a class="sub" href="/users/registrate/">Регистрация</a>
						</label>
						<input type="submit" class="textinputs" value="Вход" />
					</div>
					<input type="hidden" value="{$url}" name="from_page" />
				</form>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>