<!-- Подключаем шапку сайта -->
%system getOuterContent('./tpls/content/header.inc.tpl')%
    <table id="content">
      <tr>
        <td class="left">
          <h1 class="header" umi:element-id="%pid%" umi:field-name="h1">
            <!-- Подключаем заголовки -->
            %header%</h1>
          <div umi:element-id="%pid%" umi:field-name="content">
			<!-- Обработка ошибок -->
			%system listErrorMessages()%
            <!-- Выводим контент на страницу -->
            %content%
          </div>
        </td>
        <td class="right">
          <!-- Выводим три последние новости из раздела '/news1/' (Новости) по шаблону /tpls/news/news.tpl и игнорируем номер текущей страницы -->
          %news lastlist('/news1/', 'news', '3', '1')%
          <!-- Выводим пять последних сообщений блога по порядку используя шаблон /tpls/blogs/page.tpl -->
          %blogs list_messages('page', '0', '5')%
        </td>
      </tr>
<!-- Подлючаем футер -->
%system getOuterContent('./tpls/content/footer.inc.tpl')%
