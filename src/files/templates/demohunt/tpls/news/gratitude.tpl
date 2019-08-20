<?php
$FORMS = [];
$FORMS['lastlist_block'] = <<<END
%archive%
<h1 class="header">Благодарности</h1>
<table id="gratitude">
  %items%
</table><br />
END;

$FORMS['lastlist_item'] = <<<END
<tr>
  <td class="gratitude_foto" umi:element-id="%id%" umi:field-name="name">
    %data getProperty(%id%, 'anons_pic', 'gratitude.anons')%
    %header%
  </td>
  <td class="gratitude_text" umi:element-id="%id%" umi:field-name="anons"> 
      %anons%
      <a href="%link%">>></a>
  </td>
</tr>
END;

$FORMS['lastlist_archive'] = <<<END
<div class="header_gratitude"> /
  <a href="%content get_page_url(23041)%">все благодарности</a>
</div>
END;

?>
