<?php
$FORMS = [];
$FORMS['lastlist_block'] = <<<END
%archive%
<h1 class="header">Новости</h1>
<ul id="news">
  %items%
</ul><br />
END;

$FORMS['lastlist_item'] = <<<END
<li>
  <img src="/templates/demohunt/images/li.png" width="10" height="6" alt="-" />
  <span umi:element-id="%id%" umi:field-name="publish_time">%system convertDate(%publish_time%, 'd.m.Y')%</span> <br />
  <a href="%link%" umi:element-id="%id%" umi:field-name="name">%header%</a>
  <p umi:element-id="%id%" umi:field-name="anons">%anons% <a href="%link%">>></a></p>
</li>
END;

$FORMS['lastlist_archive'] = <<<END
<div class="header_news"> /
  <a href="%content get_page_url(23041)%">все новости</a>
</div>
END;

?>
