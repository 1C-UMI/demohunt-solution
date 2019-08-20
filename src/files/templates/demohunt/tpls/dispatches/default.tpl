<?php
$FORMS = [];
/*
$FORMS['subscribe_unregistred_user'] = <<<END
	<form method="post" name="sbs_frm" enctype="multipart/form-data" action="%pre_lang%/dispatches/subscribe_do/">
		<table>
			<tr>
				<td>
					*E-mail:<br />
					<input type="text" value="" name="sbs_mail" />
				</td>
			</tr>
			<tr>
				<td>
					Фамилия:<br />
					<input type="text" value="" name="sbs_lname" />
				</td>
			</tr>
			<tr>
				<td>
					Имя:<br />
					<input type="text" value="" name="sbs_fname" />
				</td>
			</tr>
			<tr>
				<td>
					Отчество:<br />
					<input type="text" value="" name="sbs_father_name" />
				</td>
			</tr>
			<tr>
				<td>
					Пол:<br />
					<select name="sbs_gender">
						<option></option>
						%sbs_genders%
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="Ok" />
				</td>
			</tr>
		</table>
	</form>
END;

$FORMS['subscribe_registred_user'] = <<<END
	<form method="post" name="sbs_frm" enctype="multipart/form-data" action="%pre_lang%/dispatches/subscribe_do/">
		<table>
			<tr>
				<td>Вы подписаны на рассылки:</td>
			</tr>
			<tr>
				<td>%subscriber_dispatches%</td>
			</tr>
			<tr>
				<td><input type="submit" value="Ok" /></td>
			</tr>
		</table>
	</form>
END;
*/

$FORMS['subscribe_unregistred_user'] = <<<END
	<form method="post" name="sbs_frm" enctype="multipart/form-data" action="%pre_lang%/dispatches/subscribe_do/">
		<table>
			<tr>
        <td>
          Подписка на новости:
        </td>
      </tr>
			<tr>
        <td>
          <input name="sbs_mail" type="text" size="18" value="Введите e-mail" onfocus="if(this.value == 'Введите e-mail') { this.value = ''; }" onblur="if(this.value == '') { this.value = 'Введите e-mail' } " />
          <a href="javascript: document.forms['sbs_frm'].submit();" >подписаться</a>
        </td>
      </tr>
		</table>
	</form>
END;

$FORMS['subscribe_registred_user'] = <<<END
	<form method="post" name="sbs_frm" enctype="multipart/form-data" action="%pre_lang%/dispatches/subscribe_do/">
		<table>
			<tr>
        <td>
				  Вы подписаны на рассылки:<br />
          %subscriber_dispatches%
			  </td>
      </tr>
			<tr>
        <td>
          <a href="javascript: document.forms['sbs_frm'].submit();" >ок</a>
			  </td>
      </tr>
    </table>
	</form>
END;

$FORMS['subscriber_dispatches'] = <<<END
	<table>
		%rows%
	</table>
END;

$FORMS['subscriber_dispatch_row'] = <<<END
	<tr>
		<td>
			<input type="checkbox" %checked% name="subscriber_dispatches[]" value="%disp_id%" />
			<span>%disp_name%</span>
		</td>
	</tr>
END;

$FORMS['subscribe_confirm'] = <<<END
<p>Доброго времени суток!</p>
<p>Вы подписались на рассылку.</p>
<p>Если вы не хотите ее получать, перейдите по этой ссылке: <a href="%unsubscribe_link%">%unsubscribe_link%</a></p>
END;

$FORMS['subscribe_confirm_subject'] = "Подписка на рассылку";

$FORMS['subscribe_guest_alredy_subscribed'] = <<<END
<p>Такой адрес уже есть в нашем списке. <a href="%unsubscribe_link%">Хотите отписаться?</a></p>
END;

?>
