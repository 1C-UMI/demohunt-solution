<?php
$FORMS = [];
$FORMS['search_form'] = <<<END
	<form method="get" name="search" action="%pre_lang%/search/search_do/">
		<input type="text" name="search_string" value="Поиск" /> <a href="javascript:document.search.submit()">Искать</a>
	</form>
END;
?>
