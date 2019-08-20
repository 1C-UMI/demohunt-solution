<?php
$FORMS = [];
$FORMS['answer_mail_subj'] = <<<MAIL_USER_SBJ
[#%ticket%] Ответ на Ваш вопрос
MAIL_USER_SBJ;

$FORMS['answer_mail'] = <<<MAIL_USER
Здравствуйте, 
<p>Ответ на Ваш вопрос Вы можете прочитать по следующему адресу:<br />
<a href="%question_link%">%question_link%</a><p />
<hr />
С уважением, <br />
Администрация сайта <b>%domain%</b>
MAIL_USER;

?>
