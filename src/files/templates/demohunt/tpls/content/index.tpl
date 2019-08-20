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
        <td class="center">
          <!-- Выводим 3 благодарности из раздела '/gratitude/' (Благодарности) по шаблону /tpls/news/gratitude.tpl и игнорируем номер текущей страницы -->
          %news lastlist('/gratitude/', 'gratitude', '3', '1')%
          <div id="no">
            <!-- Подключаем содержание страницы '/ob_otryade/no/' (Работа за которую мы никогда не возьмемся) -->
            %content insert('/ob_otryade/no/')%
          </div></td>
        <td class="right">
          <!-- Выводим три последние новости из раздела '/news1/' (Новости) по шаблону /tpls/news/news.tpl и игнорируем номер текущей страницы -->
          %news lastlist('/news1/', 'news', '3', '1')%
          <!-- Выводим пять последних сообщений блога по порядку используя шаблон /tpls/blogs/page.tpl -->
          %blogs list_messages('page', '0', '5')%
        </td>
      </tr>
<!-- Подлючаем футер -->
%system getOuterContent('./tpls/content/footer.inc.tpl')%
