<?php
$FORMS = [];

// блок оформления для содержимого страницы типа "Блог"
$FORMS['blogs_list_block'] = <<<END
<!--
<h2>Блоги</h2>
-->
%lines%
<br /><br />
%system numpages(%total%, %per_page%, 'standart')%

END;

// карточка самого блога
$FORMS['blogs_list_line'] = <<<END
<div style="padding-bottom:40px;">
	<span style="font-size:12pt;"><a href="%link%" style="text-decoration:none;">%title%</a></span><br />
	<div style="padding-bottom: 10px;">
		%description%
	</div>
	%blogs20 viewBlogAuthors(%bid%)%
</div>
END;

$FORMS['blog_author_list_block'] = <<<END
	<img src="/images/cms/blogs20/user.png" alt="Авторы блога" title="Авторы блога" align="left" />
	&nbsp;&nbsp;
	%lines%
END;

$FORMS['blog_author_list_line'] = <<<END
<a href="/users/profile/%user_id%/"><b>%name%</b></a>
END;

$FORMS['posts_list_block_empty'] = <<<END
<h3 style="text-align:center;">Здесь пока пусто</h3>
<p style="text-align:right;">		
	<br />
	<a href="javascript:history.back();">назад</a>
</p>
<br /><br />	
%blogs20 postAdd(%bid%)%
END;

// вывод списка постов
$FORMS['posts_list_block'] = <<<END
<div id="blog_items" style="clear:both;">
	%system listErrorMessages()%
	%lines%
	%system numpages(%total%, %per_page%)%
	<!--%blogs20 postAdd(%bid%)%-->
</div>
END;

// как формировать каждый пост
$FORMS['posts_list_line'] = <<<END
<div class="blog_item">
  <div class="blog_header">
    <a class="aitems" href="%post_link%" umi:element-id="%id%" umi:field-name="name"><strong>%title%</strong></a>
    <span umi:element-id="%id%" umi:field-name="publish_time">Добавлено %system convertDate(%publish_time%, 'd.m.Y')% |</span> 
    <span umi:element-id="%id%" umi:field-name="tags">%tags%</span>
  </div>
  <div umi:element-id="%id%" umi:field-name="content">
    %content%
  </div>
  <div class="comments">
    <a href="%post_link%#subitems">Комментарии (%comments_count%)</a> | <a href="%post_link%#additem">Комментировать</a>
  </div>
</div>
END;

$FORMS['post_cut_link'] = <<<END
<span style="display:block;text-align:right;">[ <a href="%link%">Читать дальше</a> ]</span>
END;

// вывод поста блога и списка его комментов
$FORMS['post_view'] = <<<END
<div id="blog_items">
	%system listErrorMessages()%
	<div class="blog_item">
		<div class="blog_header">
			<span umi:element-id="%pid%" umi:field-name="publish_time">Добавлено %system convertDate(%publish_time%, 'd.m.Y')% |</span> 
			<span umi:element-id="%pid%" umi:field-name="tags">%tags%</span>
		</div>
		<div umi:element-id="%pid%" umi:field-name="content">
			%content%
		</div>
	</div>
	<a name="subitems"></a>
	<h4>Комментарии:</h4>
	%blogs20 commentsList(%pid%)%
	%system numpages(%total%, %per_page%, 'default')%
	%blogs20 commentAdd(%pid%)%
</div>

END;

// блок оформления для содержимого страницы типа "Сообщение блога"
$FORMS['comments_list_block'] = <<<END
<script language="javascript">
<!--
	function setCommentParent(parentId) {
		var form   = document.getElementById('comment_add_form');
		var editor = document.getElementById('comment_editor');
		if(form)
			form.action = '/blogs20/commentAdd/' + parentId + '/';
		if(editor)
			editor.focus();
	}
-->
</script>
%lines%
%system numpages(%total%, %per_page%, 'default')%
END;

// карточка самого сообщения
$FORMS['comments_list_line'] = <<<END
<p><strong umi:element-id="%id%" umi:field-name="publish_time">%system convertDate(%publish_time%, 'd.m.Y в H:i')%</strong> | 
%users viewAuthor(%author_id%)%
%blogs20 placeControls(%cid%)%<br />
<div umi:element-id="%id%" umi:field-name="content">%content%</div>
<a href="#comment_add" onclick="javascript:setCommentParent(%cid%);">Комментировать</a>
<div class="subitems">%subcomments%</div>
</p>
END;

// добавление поста к блогу зарегистрированным пользователем
$FORMS['post_add_form'] = <<<END
<h3>Новое сообщение</h3>
<br />
<form method="post" action="%action%">

%blog_select%

<input type="checkbox" id="visible_for_friends" name="visible_for_friends" style="border:1px solid #ccc;" %visible_for_friends% /> 
<label for="visible_for_friends">Будет видно только друзьям</label><br /><br />

<label for="title">Заголовок</label><br />
<input type="text" id="title" name="title" value="%title%" style="width:100%; border:1px solid #aaa;" /><br />
<span style="color:#777">Заголовок должен отражать содержание сообщения</span><br /><br />

<label for="blg20_content">Текст</label>
<textarea id="blg20_content" name="content" style="width:100%; height:150px; border:1px solid #ccc; overflow: auto;">%content%</textarea><br />
%comments smilePanel('blg20_content')%
<span style="color:#777">Для оформления можно использовать bb-коды</span><br /><br />

<label for="tags">Теги</label><br />
<input type="text" id="tags" name="tags" value="%tags%" style="width:100%; border:1px solid #aaa;" /><br />
<span style="color:#777">Теги разделяются запятыми. Например: <i>осень, фотография, Петербург, UMI</i></span><br /><br />
<input type="hidden" id="post_%id%_draught" name="draught" value="0" />
<br />
<p align="right">
	<input type="button" value="В черновики" onclick="javascript:document.getElementById('post_%id%_draught').value=1;this.form.submit();" /> 
	<input type="submit" value="Опубликовать" />
</p>
</form>
END;

// добавление поста к блогу незарегистрированным пользователем
$FORMS['post_edit_form'] = <<<END
<form method="post" action="%action%">

%blog_select%

<input type="checkbox" id="visible_for_friends" name="visible_for_friends" style="border:1px solid #ccc;" %visible_for_friends% /> 
<label for="visible_for_friends">Будет видно только друзьям</label><br /><br />

<label for="title">Заголовок</label><br />
<input type="text" id="title" name="title" value="%title%" style="width:100%; border:1px solid #aaa;" /><br />
<span style="color:#777">Заголовок должен отражать содержание сообщения</span><br /><br />

<label for="blg20_content">Текст</label>
<textarea id="blg20_content" name="content" style="width:100%; height:150px; border:1px solid #ccc; overflow: auto;">%content%</textarea><br />
%comments smilePanel('blg20_content')%
<span style="color:#777">Для оформления можно использовать bb-коды</span><br /><br />

<label for="tags">Теги</label><br />
<input type="text" id="tags" name="tags" value="%tags%" style="width:100%; border:1px solid #aaa;" /><br />
<span style="color:#777">Теги разделяются запятыми. Например: <i>осень, фотография, Петербург, UMI</i></span><br /><br />
<input type="hidden" id="post_%id%_draught" name="draught" value="0" />
<br />
<p align="right">
	<input type="button" value="В черновики" onclick="javascript:document.getElementById('post_%id%_draught').value=1;this.form.submit();" /> 
	<input type="submit" value="Опубликовать" />
</p>
</form>
END;

$FORMS['blog_choose_block'] = <<<END
<label for="bid">Где публикуем</label><br />
<select id="bid" name="bid" style="width:100%; border:1px solid #aaa;">
	%options%
</select>
<br /><br />
END;

$FORMS['blog_choose_line'] = <<<END
<option value="%bid%" %selected%>%title%</option>
END;

$FORMS['post_control_block'] = <<<END
<div style="display:block;text-align:right;">
	<div style="color:#777;">Управление</div>
	<div style="float:right;text-align:left;">%controls%</div>
</div>
END;

$FORMS['post_control_delete'] = <<<END
<a href="%link%" style="text-decoration:none;">
<div style="width:120px; color: #999; padding:2px;" onmouseover="this.style.backgroundColor='#eee';" onmouseout="this.style.backgroundColor='#fff';">
	<img src="/images/cms/blogs20/post_delete.png" alt="Удалить этот пост" title="Удалить этот пост" style="border:0; vertical-align:middle;" />&nbsp;Удалить
</div>
</a>
END;

$FORMS['post_control_edit'] = <<<END
<a href="%link%" style="text-decoration:none;">
<div style="width:120px; color: #999; padding:2px;" onmouseover="this.style.backgroundColor='#eee';" onmouseout="this.style.backgroundColor='#fff';">
	<img src="/images/cms/blogs20/post_edit.png" alt="Редактировать этот пост" title="Редактировать этот пост" style="border:0; vertical-align:middle;"  />&nbsp;Редактировать
</div>
</a>
END;

$FORMS['comment_control_block'] = <<<END
	%controls%
END;

$FORMS['comment_control_delete'] = <<<END
 | <a href="%link%">Удалить</a>
END;

$FORMS['comment_control_edit'] = <<<END
<!--
<a href="%link%" style="text-decoration:none;">
<img src="/images/cms/blogs20/comment_edit.png" alt="Редактировать этот комментарий" title="Редактировать этот комментарий" style="border:0;" />
</a>
-->
END;

// добавление коммента к посту зарегистрированным пользователем
$FORMS['comment_add_form'] = <<<END
<hr/>
<a name="comment_add" />
<form id="comment_add_form" name="frm_addblogmsg" method="post" action="/blogs20/commentAdd/%parent_id%/">
	<table>
		<tr><td>* Заголовок комментария:<a name="additem">&nbsp;</a><br /><input type="text" name="title" style="width: 350px;" /></td></tr>
		<tr><td>* Текст комментария:<br /><textarea name="content" style="width: 350px; height: 120px;"></textarea></td></tr>
		<tr><td>* Поля, отмеченные звездочкой, являются обязательными для заполнения:</td></tr>
		<tr><td><input type="submit" value="Добавить комментарий" /></td></tr>
	</table>
</form>
END;

// добавление коммента к посту незарегистрированным пользователем
$FORMS['comment_add_form_guest'] = <<<END
<hr/>
<form id="comment_add_form" name="frm_addblogmsg" method="post" action="/blogs20/commentAdd/%parent_id%/">
	<table>
		<tr><td>* Заголовок комментария:<a name="additem">&nbsp;</a><br /><input type="text" name="title" style="width: 350px;" class="textinputs" /></td></tr>
		<tr><td>* Ваш ник:<br /><input type="text" name="nick" style="width: 350px;" /></td></tr>
		<tr><td>Ваш email:<br /><input type="text" name="email" style="width: 350px;" /></td></tr>
		<tr><td>* Текст комментария:<br /><textarea name="content" style="width: 350px; height: 120px;"></textarea></td></tr>
		<tr><td>%system captcha('default')%</td></tr>
		<tr><td>* Поля, отмеченные звездочкой, являются обязательными для заполнения:</td></tr>
		<tr><td><input type="submit" value="Добавить комментарий" /></td></tr>
	</table>
</form>
END;

$FORMS['blod_edit_block'] = <<<END
<div style="display:block;width:100%;margin-top: 40px;">
	<h3>Мои блоги</h3>
	<span style="display:block; margin:20px 20px 20px 20px; font-size:11pt;">
		<a href="/blogs20/draughtsList/" style="color:#777;text-decoration:none;" title="Черновики">
			<img src="/images/cms/blogs20/draught.png" alt="Черновики" title="Черновики" style="border:0;vertical-align:middle;" />
			&#8594;
		</a>
		<a href="/blogs20/draughtsList/" style="color:#777;vertical-align:middle;" title="Черновики">Черновики публикаций</a>		
	</span>
	%lines%
</div>
END;

$FORMS['blog_edit_line'] = <<<END
<div style="padding-top:10px;">
	<h4>%title%</h4>
	<br />
	Ссылка на сайте: <a href="%path%">%path%</a>
	<br /><br />
	<div style="padding-left:15px;">
		<form id="form_%bid%_edit" method="post" action="/blogs20/editUserBlogs/%bid%/">
			<input type="hidden" name="redirect" value="%current_page%" />
			<label for="blog_%bid%_title">Название</label><br />
			<input type="text" id="blog_%bid%_title" name="blog[%bid%][title]" style="width:99%;border:1px solid #ccc;" value="%title%" /><br /><br />			
			<label for="blog_%bid%_description">Описание</label><br />
			<input type="text" id="blog_%bid%_description" name="blog[%bid%][description]" style="width:99%;border:1px solid #ccc;" value="%description%" /><br /><br />
			<label for="blog_%bid%_friendlist">Друзья</label><br />
			<select id="blog_%bid%_friendlist" name="blog[%bid%][friendlist][]" multiple="multiple" style="width:99%;height:100px;border:1px solid #ccc;">%friends%</select><br /><br />	
			
			<span style="display:block;text-align:right;"><input type="submit" value="Сохранить" /></span>
		</form>
	</div>
</div>
END;

$FORMS['blog_new_line'] = <<<END
<div style="padding-top:10px;">
	<h3>Создать новый блог</h3>
	<div style="padding-left:15px;">
		<form id="form_%bid%_edit" method="post" action="/blogs20/editUserBlogs/%bid%/">
			<input type="hidden" name="redirect" value="%current_page%" />
			<label for="blog_%bid%_title">Название</label><br />
			<input type="text" id="blog_%bid%_title" name="blog[%bid%][title]" style="width:99%;border:1px solid #ccc;" value="%title%" /><br /><br />			
			<label for="blog_%bid%_description">Описание</label><br />
			<input type="text" id="blog_%bid%_description" name="blog[%bid%][description]" style="width:99%;border:1px solid #ccc;" value="%description%" /><br /><br />
			<label for="blog_%bid%_friendlist">Друзья</label><br />
			<select id="blog_%bid%_friendlist" name="blog[%bid%][friendlist][]" multiple="multiple" style="width:99%;height:100px;border:1px solid #ccc;">%friends%</select><br /><br />	
			
			<span style="display:block;text-align:right;"><input type="submit" value="Сохранить" /></span>
		</form>
	</div>
</div>
END;

$FORMS['tag_decoration'] = <<<END
<a href="/blogs20/postsByTag/%tag%/">%tag%</a>
END;

?>
