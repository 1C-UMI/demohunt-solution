<?php
$FORMS = [];
$FORMS['registrate_block'] = <<<REGISTRATE
<form action="%pre_lang%/users/registrate_do/" method="post" enctype="multipart/form-data">
<table>
	<tr>
		<td width="200">
			Логин:
		</td>
		<td>
			<input type="text" name="login" />
		</td>
	</tr>
	<tr>
		<td>
			Пароль:
		</td>
		<td>
			<input type="password" name="password" value="" />
		</td>
	</tr>
	<tr>
		<td>
			Подтверждение пароля:
		</td>
		<td>
			<input type="password" name="password_confirm" value="" />
		</td>
	</tr>
	<tr>
		<td>
			E-mail:
		</td>
		<td>
			<input type="text" name="email" value="" />
		</td>
	</tr>
	%data getCreateForm(%type_id%, 'users', 'short_info more_info')%
	<!-- %data getcreateform(%type_id%, 'userpic', 'userpic')% -->
	<!-- %eshop discountCardEditForm('default')% -->
</table>
	%system captcha()%
<input type="hidden" name="template" value="default" />
<p><input type="submit" value="Зарегистрироваться" /></p>
</form>
REGISTRATE;

$FORMS['settings_block'] = <<<REGISTRATE
<form action="%pre_lang%/users/settings_do/" method="post" enctype="multipart/form-data">
	<input type="hidden" name="csrf" value="%csrf%" />
	<table>
	<tr>
		<td>
			Логин:
		</td>
		<td>
			<input type="text" value="%login%" disabled="disabled" />
		</td>
	</tr>
	<tr>
		<td>
			Пароль:
		</td>
		<td>
			<input type="password" name="password" value="" />
		</td>
	</tr>
	<tr>
		<td>
			Подтвердите пароль:
		</td>
		<td>
			<input type="password" name="password_confirm" value="" />
		</td>
	</tr>
	<tr>
		<td>
			E-mail:
		</td>
		<td>
			<input type="text" name="email" value="%e-mail%" class="textinputs" />
		</td>
	</tr>
	%data getEditForm(%user_id%, 'users', 'short_info more_info')%
	<!-- %eshop discountCardEditForm('default')% -->
	%blogs userBlogs('default')%
</table>
<p><input type="submit" value="Сохранить изменения" /></p>
</form>
REGISTRATE;

$FORMS['registrate_done_block'] = <<<END
Регистрация прошла успешно. На ваш e-mail отправлено письмо с инструкциями по активации аккаунта.
END;

$FORMS['registrate_done_block_without_activation'] = <<<END
Регистрация прошла успешно.
END;

$FORMS['registrate_done_block_error'] = <<<END
Регистрация завершилась неудачей. Проверьте правильность заполнения всех полей.
END;

$FORMS['registrate_done_block_user_exists'] = <<<END
Пользователь с таким именем уже существует. Попробуйте выбрать другое.
END;

$FORMS['activate_block'] = <<<END
<p>Аккаунт активирован.</p>
END;

$FORMS['mail_registrated_subject'] = "Регистрация на сайте %domain%";

$FORMS['activate_block_failed'] = <<<END
<p>Неверный код активации.</p>
END;

$FORMS['mail_registrated'] = <<<MAIL
	<p>
		Здравствуйте, %lname% %fname% %father_name%, <br />
		Вы зарегистрировались на сайте <a href="http://%domain%">%domain%</a>.
	</p>
	<p>
		Логин: %login%<br />
		Пароль: %password%
	</p>
	<p>
		<div class="notice">
			Чтобы активировать Ваш аккаунт, необходимо перейти по ссылке, либо скопировать ее в адресную строку браузера:<br />
			<a href="%activate_link%">%activate_link%</a>
		</div>
	</p>
MAIL;

$FORMS['mail_registrated_subject_noactivation'] = "Регистрация на сайте %domain%";

$FORMS['mail_registrated_noactivation'] = <<<MAIL
	<p>
		Здравствуйте, %lname% %fname% %father_name%, <br />
		Вы зарегистрировались на сайте <a href="http://%domain%">%domain%</a>.
	</p>
	<p>
		Логин: %login%<br />
		Пароль: %password%
	</p>
MAIL;

$FORMS['mail_admin_registrated'] = <<<END
<p>Зарегистрировался новый пользователь "%login%".</p>
END;

$FORMS['mail_admin_registrated_subject'] = "Зарегистрировался новый пользователь";

?>
