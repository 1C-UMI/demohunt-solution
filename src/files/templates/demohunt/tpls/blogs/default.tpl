<?php
$s_blogs_JSToCheckForm = <<<END
	 <script type="text/javascript">
	 	function blogs_checkFrmToAdd(oForm) {
	 		var bPermit = true;
	 		//
	 		var arrFields = oForm.elements;
	 		var i = 0;
	 		for (i=0; i<arrFields.length; i++) {
				var theFld = arrFields[i];
				var sName = theFld.name;
	 			if (sName === 'title' || sName === 'message' || sName === 'author_nick') {
	 				var sValue = theFld.value;
	 				if (!sValue.length) {
	 					bPermit = false;
	 					break;
	 				}
	 			}
	 		}
	 		//
	 		if (!bPermit) alert("%blogs::LBL_TPL_NEEDFILLREQFIELDS%");
	 		//
	 		return bPermit;
	 	}
	 </script>
END;

$FORMS = [];
// вывода блога и списка его постов макросом %blog%
// блок оформления для содержимого страницы типа "Блог"
$FORMS['blogmessages_itemslent'] = <<<END
<div id="blog_items">
  {$s_blogs_JSToCheckForm}
	%err_message%
  <!--%parent%-->
	%children%
	%system numpages(%total%, %per_page%)%
	<!--%form_to_add%-->
</div>
END;

// %parent% - карточка самого блога
$FORMS['blogmessages_parentitem'] = <<<END
<p>
  Дата создания: %system convertDate(%publish_time%, 'd.m.Y H:i')%</strong>%link_to_remove_item% | приватность: %ttl_privacy%<br />
	Автор блога: %users viewAuthor(%author_id%)%<br />
	Назание: %header%<br />
	Описание: %content%<br />
	%blogs::LBL_TPL_OFTHEMESSAGES%: %blogs countSubitems(%id%)% %link_to_add_item%
</p>
END;

// == %tags% blocks for %parent% :
$FORMS['blogmessages_partags_empty'] = "";
$FORMS['blogmessages_partags'] = "Тэги: %items%";
$FORMS['blogmessages_partag'] = "<a href=\"%module_http_path%/tag_messages/%tag_urlencoded%\">%tag%</a>";
$FORMS['blogmessages_partagseparator'] = ", ";

// %children% - как формировать каждый пост
$FORMS['blogmessages_lentitem'] = <<<END
<div class="blog_item">
  <div class="blog_header">
    <a class="aitems" href="%link%" umi:element-id="%id%" umi:field-name="name"><strong>%header%</strong></a>
    <span umi:element-id="%id%" umi:field-name="publish_time">Добавлено %system convertDate(%publish_time%, 'd.m.Y')% |</span> 
    <span umi:element-id="%id%" umi:field-name="tags">%tags%</span>
  </div>
  <div umi:element-id="%id%" umi:field-name="content">
    %content%
  </div>
  <div class="comments">
    <a href="%link%#subitems">Комментарии (%blogs countSubitems(%id%, 100)%)</a> | <a href="%link%#additem">Комментировать</a>
  </div>
</div>	
END;

// %tags% blocks for %blogmessages_lentitem% :
$FORMS['blogmessages_itemtags_empty'] = "";
$FORMS['blogmessages_itemtags'] = "Тэги: %items%";
$FORMS['blogmessages_itemtag'] = "<a href=\"%module_http_path%/tag_messages/%tag_urlencoded%\">%tag%</a>";
$FORMS['blogmessages_itemtagseparator'] = ", ";

// %form_to_add% (обрабатывается в blogmessages_itemslent)
// для добавления поста к своему блогу
$FORMS['form_to_add_message'] = <<<END
<hr/>
<form name="frm_addblogmsg" method="post" action="%module_http_path%/post/%parent_id%/" onsubmit="return blogs_checkFrmToAdd(this);">
  <table>
    <tr>
      <td>
        * %blogs::LBL_TPL_MESSAGETITLE%:<a name="additem">&nbsp;</a><br />
        <input type="text" name="title" style="width: 350px;" />
			</td>
    </tr>
    <tr>
      <td>
        * %blogs::LBL_TPL_MESSAGETEXT%:<br />
				<textarea name="message" style="width: 350px; height: 120px;"></textarea>
			</td>
    </tr>
    <tr>
      <td>
        %blogs::LBL_TPL_PRIVACY%:<br />
				%input_privacy%
			</td>
    </tr>
    <tr>
      <td>
        * %blogs::LBL_TPL_REQFIELDSWARNING%:
			</td>
    </tr>
    <tr>
      <td>
			  %blogs::LBL_TPL_MESSAGETAGS%:<br />
				<input name="tags" style="width: 350px;" />
		  </td>
    </tr>
    <tr>
      <td>
			  <input type="submit" value="%blogs::LBL_TPL_ADDMESSAGE%" />
		  </td>
    </tr>
  </table>
</form>
END;

// если приватность не позволяет (т.е. всем, кроме владельца и супервайзеров)
$FORMS['form_to_add_message_denied'] = "";

// %link_to_add_item% - обрабатывается в %parent%
// ссылка типа "добавить сообщение к блогу" (видима только владельцу блога)
$FORMS['link_to_add_message'] = <<<END
| <a href="%link%#additem">%blogs::LBL_TPL_ADDMESSAGE%</a>
END;

// "добавить сообщение к блогу" для всех остальных
$FORMS['link_to_add_message_denied'] = "";

// для вывода поста блога и списка его комментов макросом %blog_message%
// блок оформления для содержимого страницы типа "Сообщение блога"
$FORMS['blogmsgcomments_itemslent'] = <<<END
<div id="blog_items">
	{$s_blogs_JSToCheckForm}
	%err_message%
	%parent%
	<a name="subitems"></a>
  <h4>Комментари:</h4>
	%children%
	%system numpages(%total%, %per_page%, 'default')%
	%form_to_add%
</div>
END;

// %parent% - карточка самого сообщения
$FORMS['blogmsgcomments_parentitem'] = <<<END
<div class="blog_item">
  <div class="blog_header">
    <span umi:element-id="%id%" umi:field-name="publish_time">Добавлено %system convertDate(%publish_time%, 'd.m.Y')% |</span> 
    <span umi:element-id="%id%" umi:field-name="tags">%tags%</span>
  </div>
  <div umi:element-id="%id%" umi:field-name="content">
    %content%
  </div>
</div>
END;

// %tags% blocks for %parent%
$FORMS['blogmsgcomments_partags_empty'] = "";
$FORMS['blogmsgcomments_partags'] = "Тэги: %items%";
$FORMS['blogmsgcomments_partag'] = "<a href=\"%module_http_path%/tag_messages/%tag_urlencoded%\">%tag%</a>";
$FORMS['blogmsgcomments_partagseparator'] = ", ";

// %children% - как формировать каждый коммент
$FORMS['blogmsgcomments_lentitem'] = <<<END
<p><strong umi:element-id="%id%" umi:field-name="publish_time">%system convertDate(%publish_time%, 'd.m.Y в H:i')%</strong> | 
%users viewAuthor(%author_id%)%
%link_to_remove_item%<br />
<div umi:element-id="%id%" umi:field-name="content">%content%</div>
%link_to_add_item%
<div class="subitems">%subitems%</div>
</p>
END;

// %form_to_add% (обрабатывается в blogmsgcomments_itemslent)
// для добавления коммента к посту своего блога
$FORMS['form_to_add_comment_blogowner'] = <<<END
<hr/>
	<form name="frm_addblogmsg" method="post" action="%module_http_path%/post/%parent_id%/" onsubmit="return blogs_checkFrmToAdd(this);">
		<table>
			<tr>
        <td>
				  * %blogs::LBL_TPL_COMMENTTITLE%:<a name="additem">&nbsp;</a><br />
				  <input type="text" name="title" style="width: 350px;" />
			  </td>
      </tr>
      <tr>
        <td>
				  * %blogs::LBL_TPL_COMMENTTEXT%:<br />
				  <textarea name="message" style="width: 350px; height: 120px;"></textarea>
				</td>
      </tr>
      <tr>
        <td>
				  %blogs::LBL_TPL_PRIVACY%:<br />
				  %input_privacy%
        </td>
      </tr>
      <tr>
        <td>
				  * %blogs::LBL_TPL_REQFIELDSWARNING%:
			  </td>
      </tr>
      <tr>
        <td>
				  <input type="submit" value="%blogs::LBL_TPL_ADDCOMMENT%" />
		  	</td>
      </tr>
    </table>
  </form>
END;

// для добавления коммента к посту зарегистрированным пользователем
$FORMS['form_to_add_comment_user'] = <<<END
<hr/>
	<form name="frm_addblogmsg" method="post" action="%module_http_path%/post/%parent_id%/" onsubmit="return blogs_checkFrmToAdd(this);">
		<table>
			<tr>
        <td>
				  * %blogs::LBL_TPL_COMMENTTITLE%:<a name="additem">&nbsp;</a><br />
				  <input type="text" name="title" style="width: 350px;" />
			  </td>
      </tr>
      <tr>
        <td>
				  * %blogs::LBL_TPL_COMMENTTEXT%:<br />
				  <textarea name="message" style="width: 350px; height: 120px;"></textarea>
				</td>
      </tr>
      <tr>
        <td>
				  * %blogs::LBL_TPL_REQFIELDSWARNING%:
			  </td>
      </tr>
      <tr>
        <td>
				  <input type="submit" value="%blogs::LBL_TPL_ADDCOMMENT%" />
			  </td>
      </tr>
		</table>
	</form>
END;

// для добавления коммента к посту незарегистрированным пользователем
$FORMS['form_to_add_comment_guest'] = <<<END
<hr/>
	<form name="frm_addblogmsg" method="post" action="%module_http_path%/post/%parent_id%/" onsubmit="return blogs_checkFrmToAdd(this);">
		<table>
			<tr>
        <td>
				  * %blogs::LBL_TPL_COMMENTTITLE%:<a name="additem">&nbsp;</a><br />
				  <input type="text" name="title" style="width: 350px;" class="textinputs" />
			  </td>
      </tr>
      <tr>
        <td>
				  * %blogs::LBL_TPL_YOURNICK%:<br />
				  <input type="text" name="author_nick" style="width: 350px;" />
			  </td>
      </tr>
      <tr>
        <td>
				  %blogs::LBL_TPL_YOUREMAIL%:<br />
				  <input type="text" name="author_email" style="width: 350px;" />
			  </td>
      </tr>
      <tr>
        <td>
				  * %blogs::LBL_TPL_COMMENTTEXT%:<br />
				  <textarea name="message" style="width: 350px; height: 120px;"></textarea>
			  </td>
      </tr>
      <tr>
        <td>
				  %system captcha('default')%
			  </td>
      </tr>
      <tr>
        <td>
				  * %blogs::LBL_TPL_REQFIELDSWARNING%:
			  </td>
      </tr>
      <tr>
        <td>
				  <input type="submit" value="%blogs::LBL_TPL_ADDCOMMENT%" />
			  </td>
      </tr>
		</table>
	</form>
END;

// если приватность не позволяет
$FORMS['form_to_add_comment_denied'] = "";

// %link_to_add_item% - обрабатывается в %parent%
// ссылка типа "добавить комментарий" - для владельца блога
$FORMS['link_to_add_comment_blogowner'] = <<<END
<a href="%link%#additem">Комментировать</a>
END;

// ссылка типа "добавить комментарий" - для авторизованных
$FORMS['link_to_add_comment_user'] = <<<END
<a href="%link%#additem">Комментировать</a>
END;

// ссылка типа "добавить комментарий" - для гостей
$FORMS['link_to_add_comment_guest'] = <<<END
<a href="%link%#additem">Комментировать</a>
END;

// ссылка типа "добавить комментарий" - если приватность не позволяет
$FORMS['link_to_add_comment_denied'] = "";

// для вывода коммента и его подкомментариев макросом %blog_comment%
// блок оформления для содержимого страницы типа "Комментарий к сообщению"
$FORMS['blogcmntcomments_itemslent'] = <<<END
<div id="blog_items">
  {$s_blogs_JSToCheckForm}
	%err_message%
	%toppost%
  <!--%parent%-->
	%children%
	%system numpages(%total%, %per_page%)%
	%form_to_add%
</div>
END;

// == %toppost% верхнее сообщение (пост) для подветки комментов
$FORMS['blogcmntcomments_toppost'] = <<<END
<div class="blog_item">
  <div class="blog_header">
    <span umi:element-id="%id%" umi:field-name="publish_time">Добавлено %system convertDate(%publish_time%, 'd.m.Y')% |</span> 
    <span umi:element-id="%id%" umi:field-name="tags">%tags%</span>
  </div>
  <div umi:element-id="%id%" umi:field-name="content">
    %content%
  </div>
</div>
END;

// == %tags% blocks for %toppost% :
$FORMS['blogcmntcomments_posttags_empty'] = "";
$FORMS['blogcmntcomments_posttags'] = "Тэги: %items%";
$FORMS['blogcmntcomments_posttag'] = "<a href=\"%module_http_path%/tag_messages/%tag_urlencoded%\">%tag%</a>";
$FORMS['blogcmntcomments_posttagseparator'] = ", ";

// == %parent% - комментарий, который корень подветки
$FORMS['blogcmntcomments_parentitem'] = <<<END
<p><strong>%system convertDate(%publish_time%, 'd.m.Y в H:i')%</strong> | 
%users viewAuthor(%author_id%)%
%link_to_remove_item%<br />
%content%<br />
%link_to_add_item%
<div class="subitems">%subitems%</div>
</p>
END;

// %children% - список комментариев подветки
$FORMS['blogcmntcomments_lentitem'] = <<<END
<p><strong>%system convertDate(%publish_time%, 'd.m.Y в H:i')%</strong> | 
%users viewAuthor(%author_id%)%
%link_to_remove_item%<br />
<div umi:element-id="%id%" umi:field-name="content">%content%</div>
%link_to_add_item%
<div class="subitems">%subitems%</div>
</p>
END;

// %form_to_add% (обрабатывается в blogcmntcomments_itemslent)
// для добавления подкоммента к комменту своего блога
$FORMS['form_to_add_subcomment_blogowner'] = <<<END
<hr/>
	<form name="frm_addblogmsg" method="post" action="%module_http_path%/post/%parent_id%/" onsubmit="return blogs_checkFrmToAdd(this);">
		<table>
			<tr>
        <td>
				  * %blogs::LBL_TPL_COMMENTTITLE%:<a name="additem">&nbsp;</a><br />
				  <input type="text" name="title" style="width: 350px;" />
			  </td>
      </tr>
      <tr>
        <td>
				  * %blogs::LBL_TPL_COMMENTTEXT%:<br />
				  <textarea name="message" style="width: 350px; height: 120px;"></textarea>
			  </td>
      </tr>
      <tr>
        <td>
				  %blogs::LBL_TPL_PRIVACY%:<br />
				  %input_privacy%
			  </td>
      </tr>
      <tr>
        <td>
				  * %blogs::LBL_TPL_REQFIELDSWARNING%:
			  </td>
      </tr>
      <tr>
        <td>
				  <input type="submit" value="%blogs::LBL_TPL_ADDCOMMENT%" />
  			</td>
      </tr>
		</table>
	</form>
END;

// для добавления подкоммента к комменту зарегистрированным пользователем
$FORMS['form_to_add_subcomment_user'] = <<<END
<hr/>
	<form name="frm_addblogmsg" method="post" action="%module_http_path%/post/%parent_id%/" onsubmit="return blogs_checkFrmToAdd(this);">
		<table>
			<tr>
        <td>
				  * %blogs::LBL_TPL_COMMENTTITLE%:<a name="additem">&nbsp;</a><br />
				  <input type="text" name="title" style="width: 350px;" />
			  </td>
      </tr>
      <tr>
        <td>
				  * %blogs::LBL_TPL_COMMENTTEXT%:<br />
				  <textarea name="message" style="width: 350px; height: 120px;"></textarea>
			  </td>
      </tr>
      <tr>
        <td>
				  * %blogs::LBL_TPL_REQFIELDSWARNING%:
			  </td>
      </tr>
      <tr>
        <td>
				  <input type="submit" value="%blogs::LBL_TPL_ADDCOMMENT%" />
			  </td>
      </tr>
		</table>
	</form>
END;

// для добавления подкоммента к комменту незарегистрированным пользователем
$FORMS['form_to_add_subcomment_guest'] = <<<END
<hr/>
	<form name="frm_addblogmsg" method="post" action="%module_http_path%/post/%parent_id%/" onsubmit="return blogs_checkFrmToAdd(this);">
		<table>
			<tr>
        <td>
				  * %blogs::LBL_TPL_COMMENTTITLE%:<a name="additem">&nbsp;</a><br />
				  <input type="text" name="title" style="width: 350px;" />
			  </td>
      </tr>
      <tr>
        <td>
				  * %blogs::LBL_TPL_YOURNICK%:<br />
				  <input type="text" name="author_nick" style="width: 350px;" />
			  </td>
      </tr>
      <tr>
        <td>
				  %blogs::LBL_TPL_YOUREMAIL%:<br />
				  <input type="text" name="author_email" style="width: 350px;" />
			  </td>
      </tr>
      <tr>
        <td>
				  * %blogs::LBL_TPL_COMMENTTEXT%:<br />
				  <textarea name="message" style="width: 350px; height: 120px;"></textarea>
			  </td>
      </tr>
      <tr>
        <td>
				  %system captcha('default')%
			  </td>
      </tr>
      <tr>
        <td>
				  * %blogs::LBL_TPL_REQFIELDSWARNING%:
			  </td>
      </tr>
      <tr>
        <td>
				  <input type="submit" value="%blogs::LBL_TPL_ADDCOMMENT%" />
			  </td>
      </tr>
		</table>
	</form>
END;
// если приватность не позволяет
$FORMS['form_to_add_subcomment_denied'] = "";

// == %link_to_add_item% - обрабатывается в %parent%
// ссылка типа "добавить комментарий" - для владельца блога
$FORMS['link_to_add_subcomment_blogowner'] = <<<END
<a href="%link%#additem">Комментировать</a>
END;

// ссылка типа "добавить комментарий" - для авторизованных
$FORMS['link_to_add_subcomment_user'] = <<<END
<a href="%link%#additem">Комментировать</a>
END;

// ссылка типа "добавить комментарий" - для гостей
$FORMS['link_to_add_subcomment_guest'] = <<<END
<a href="%link%#additem">Комментировать</a>
END;

// ссылка типа "добавить комментарий" - если приватность не позволяет
$FORMS['link_to_add_subcomment_denied'] = "";

// == %link_to_add_item% - обрабатывается в %children%'ах, которые посты
// ссылка типа "добавить комментарий к данному посту" - для владельца блога
$FORMS['cardlink_to_add_comment_blogowner'] = <<<END
<a href="%link%#additem">Комментировать</a>
END;

// ссылка типа "добавить комментарий к данному посту" - для авторизованных
$FORMS['cardlink_to_add_comment_user'] = <<<END
<a href="%link%#additem">Комментировать</a>
END;

// ссылка типа "добавить комментарий к данному посту" - для гостей
$FORMS['cardlink_to_add_comment_guest'] = <<<END
<a href="%link%#additem">Комментировать</a>
END;

// ссылка типа "добавить комментарий к данному посту" - если приватность не позволяет
$FORMS['cardlink_to_add_comment_denied'] = <<<END
<a href="%link%#additem">Комментировать</a>
END;

// == %link_to_add_item% - обрабатывается в %children%'ах, которые комменты
// ссылка типа "добавить комментарий к данному комменту" - для владельца блога
$FORMS['cardlink_to_add_subcomment_blogowner'] = <<<END
<a href="%link%#additem">Комментировать</a>
END;

// ссылка типа "добавить комментарий к данному комменту" - для авторизованных
$FORMS['cardlink_to_add_subcomment_user'] = <<<END
<a href="%link%#additem">Комментировать</a>
END;

// ссылка типа "добавить комментарий к данному комменту" - для гостей
$FORMS['cardlink_to_add_subcomment_guest'] = <<<END
<a href="%link%#additem">Комментировать</a>
END;

// ссылка типа "добавить комментарий к данному комменту" - если приватность не позволяет
$FORMS['cardlink_to_add_subcomment_denied'] = "";

// %link_to_remove_item% - кнопка "удалить"
$FORMS['link_to_remove_item'] = <<<END
 | <a href="%module_http_path%/remove/%id%/">Удалить</a>
END;

// %link_to_edit_item% - кнопка "редактировать" для блога
$FORMS['link_to_edit_blog'] = <<<END
| <a href="%module_http_path%/edit/%id%/">Редактировать</a>
END;

// %link_to_edit_item% - кнопка "редактировать" для сообщения
$FORMS['link_to_edit_message'] = <<<END
| <a href="%module_http_path%/edit/%id%/">Редактировать</a>
END;

// %link_to_edit_item% - кнопка "редактировать" для комментария
$FORMS['link_to_edit_comment'] = <<<END
| <a href="%module_http_path%/edit/%id%/">Редактировать</a>
END;

$FORMS['err_message'] = <<<END
	<div style="border-color:red;border-width:1px;color:red;">
		<strong>%err_title%</strong>:<br/>
		%err_description%
	</div>
END;

// 1. invalid parent id
$FORMS['err_title_1'] = "Can not append Your message";
$FORMS['err_descr_1'] = "invalid parent id";
// 2. invalid parent element
$FORMS['err_title_2'] = "Can not append Your message";
$FORMS['err_descr_2'] = "invalid parent element";
// 3. invalid parent element type
$FORMS['err_title_3'] = "Can not append Your message";
$FORMS['err_descr_3'] = "invalid parent element type";
// 4. access denied by privacy status
$FORMS['err_title_4'] = "Can not append Your message";
$FORMS['err_descr_4'] = "access denied by privacy status";
// 5. invalid captcha
$FORMS['err_title_5'] = "Can not append Your message";
$FORMS['err_descr_5'] = "invalid captcha";
// 5. required fields
$FORMS['err_title_6'] = "Can not append Your message";
$FORMS['err_descr_6'] = "fill all required fields";
?>
