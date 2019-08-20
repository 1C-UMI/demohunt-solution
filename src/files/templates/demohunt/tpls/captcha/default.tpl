<?php
$FORMS = [];
$FORMS['captcha'] = <<<CAPTCHA
<table>
  <tr>
	  <td width="200">
	   Введите текст на картинке
    </td>
		<td>
		  <img src="/captcha.php" alt="Циферки" /><br />
			<input type="text" id="%input_id%" name="captcha" class="textinputs" style="width:100px" />
		</td>
	</tr>
</table>
CAPTCHA;

?>
