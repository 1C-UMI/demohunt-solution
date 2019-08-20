<?php
$FORMS = [];
$FORMS['comments_block'] = <<<COMMENT_BLOCK
<p></p>
<h3>Комментарии</h3>
<a name="comments"></a>
%lines%
%system numpages(%total%, %per_page%, 'default')%
<br />
%add_form%
COMMENT_BLOCK;

$FORMS['comments_block_line'] = <<<COMMENT_LINE_USER
<a name="%id%"></a>
<p><b>%num%.</b> <b>%title%</b> - %users viewAuthor(%author_id%)%<br />
<i>%system convertDate(%publish_time%, 'Y-m-d в H:i')%</i></p>
<p>%message%</p>
COMMENT_LINE_USER;

$FORMS['comments_block_add_user'] = <<<ADD_FORM_USER
<form method="post" action="%action%">
<table>
	<tr>
		<td>
			Заголовок комментария:<br />
			<input type="text" name="title" style="width:350px;" />
		</td>
	</tr>
	<tr>
		<td>
			Текст комментария:<br />
			<textarea id="message" name="comment" style="width: 350px; height: 120px;"></textarea>
		</td>
	</tr>
	<tr>
		<td>
			%smiles%
		</td>
	</tr>
	<tr>
		<td>
			<input type="submit" value="Добавить комментарий" />
		</td>
	</tr>
</table>
</form>
ADD_FORM_USER;

$FORMS['comments_block_add_guest'] = <<<ADD_FORM_GUEST
<form method="post" action="%action%">
<table>
	<tr>
		<td>
			Заголовок комментария:<br />
			<input type="text" name="title" style="width: 350px;" />
		</td>
	</tr>

	<tr>
		<td>
			Ваш ник:<br />
			<input type="text" name="author_nick" style="width: 350px;" />
		</td>
	</tr>

	<tr>
		<td>
			Ваш e-mail:<br />
			<input type="text" name="author_email" style="width: 350px;" />
		</td>
	</tr>

	<tr>
		<td>
			Текст комментария:<br />
			<textarea name="comment" style="width: 350px;height:120px"></textarea>
		</td>
	</tr>
	<tr>
		<td>
			%system captcha('default')%
		</td>
	</tr>
	<tr>
		<td>
			%smiles%
		</td>
	</tr>
	<tr>
		<td>
			<input type="submit" value="Добавить комментарий" />
		</td>
	</tr>
</table>
</form>
ADD_FORM_GUEST;

$FORMS['smiles'] = <<<END
<p>
	<a href="#" onclick="javascript: forum_insert_smile(this); return false;"><img src="/images/forum/smiles/1.gif" alt="1"></a>
	<a href="#" onclick="javascript: forum_insert_smile(this); return false;"><img src="/images/forum/smiles/2.gif" alt="2"></a>
	<a href="#" onclick="javascript: forum_insert_smile(this); return false;"><img src="/images/forum/smiles/3.gif" alt="3"></a>
	<a href="#" onclick="javascript: forum_insert_smile(this); return false;"><img src="/images/forum/smiles/4.gif" alt="4"></a>
	<a href="#" onclick="javascript: forum_insert_smile(this); return false;"><img src="/images/forum/smiles/5.gif" alt="5"></a>
	<a href="#" onclick="javascript: forum_insert_smile(this); return false;"><img src="/images/forum/smiles/6.gif" alt="6"></a>
	<a href="#" onclick="javascript: forum_insert_smile(this); return false;"><img src="/images/forum/smiles/7.gif" alt="7"></a>
	<a href="#" onclick="javascript: forum_insert_smile(this); return false;"><img src="/images/forum/smiles/8.gif" alt="8"></a>
	<a href="#" onclick="javascript: forum_insert_smile(this); return false;"><img src="/images/forum/smiles/9.gif" alt="9"></a>
	<a href="#" onclick="javascript: forum_insert_smile(this); return false;"><img src="/images/forum/smiles/10.gif" alt="10"></a>
	<a href="#" onclick="javascript: forum_insert_smile(this); return false;"><img src="/images/forum/smiles/11.gif" alt="11"></a>
	<a href="#" onclick="javascript: forum_insert_smile(this); return false;"><img src="/images/forum/smiles/12.gif" alt="12"></a>
	<a href="#" onclick="javascript: forum_insert_smile(this); return false;"><img src="/images/forum/smiles/13.gif" alt="13"></a>
	<a href="#" onclick="javascript: forum_insert_smile(this); return false;"><img src="/images/forum/smiles/14.gif" alt="14"></a>
	<a href="#" onclick="javascript: forum_insert_smile(this); return false;"><img src="/images/forum/smiles/15.gif" alt="15"></a>
	<a href="#" onclick="javascript: forum_insert_smile(this); return false;"><img src="/images/forum/smiles/16.gif" alt="16"></a>
	<a href="#" onclick="javascript: forum_insert_smile(this); return false;"><img src="/images/forum/smiles/17.gif" alt="17"></a>
	<a href="#" onclick="javascript: forum_insert_smile(this); return false;"><img src="/images/forum/smiles/18.gif" alt="18"></a>
	<a href="#" onclick="javascript: forum_insert_smile(this); return false;"><img src="/images/forum/smiles/19.gif" alt="19"></a>
	<a href="#" onclick="javascript: forum_insert_smile(this); return false;"><img src="/images/forum/smiles/20.gif" alt="20"></a>
</p>
END;

?>
