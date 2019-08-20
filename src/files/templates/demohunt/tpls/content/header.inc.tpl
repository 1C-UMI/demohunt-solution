<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ru" >
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <link type="text/css" rel="stylesheet" href="/templates/demohunt/css/cms/reload.css" />
    <link type="text/css" rel="stylesheet" href="/templates/demohunt/css/cms/page.css" />
    <!-- Подключаем title, description и keywords -->
    <title>%title%</title>
    <meta name="DESCRIPTION" content="%description%" />
    <meta name="KEYWORDS" content="%keywords%" />
    <link rel="shortcut icon" href="/favicon.ico" />
    <!-- Подключаем панель быстрого редактирования -->
    %content includeFrontendResources()%
    <!-- Подключаем экспорт rss из раздела '/news1/' (Новости) -->
    %data getRssMetaByPath('/news1/')%
    <!-- Подключаем экспорт atom из раздела '/news1/' (Новости) -->
    %data getAtomMetaByPath('/news1/')%
  </head>
  <body>
  <center>
    <div id="header">
      <div>
        <a href="/"><img src="/templates/demohunt/images/logo.png" width="509" height="90" alt="Охотницы за привидениями" /></a>
      </div>
    </div>
    <table class="ms">
      <tr>
        <td id="menu">
          <!-- Выводим меню сайта по шаблону /tpls/content/menu/default.tpl -->
          %menu%
        </td>
        <td id="search">
          <!-- Выводим форму для поиска по шаблону /tpls/search/page.tpl -->
          %search insert_form('page')%
        </td>
      </tr>
    </table>
