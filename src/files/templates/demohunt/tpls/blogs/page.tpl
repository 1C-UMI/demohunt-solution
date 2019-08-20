<?php
$FORMS = [];
$FORMS['lmessages_lent_empty'] = <<<END
END;

$FORMS['lmessages_lent'] = <<<END
<div class="header_blog"> /
  <a href="%content get_page_url(23046)%">перейти в блог</a>
</div>
<h1 class="header">Блог</h1>
<ul id="blog">
  %rows%
</ul>          
END;

$FORMS['lmessages_lentitem'] = <<<END
<li>
  <a href="%link%" umi:element-id="%id%" umi:field-name="name">%header%</a>
  <span umi:element-id="%id%" umi:field-name="publish_time">Добавлено %system convertDate(%publish_time%, 'd.m.Y')%</span>
</li>
END;

?>
