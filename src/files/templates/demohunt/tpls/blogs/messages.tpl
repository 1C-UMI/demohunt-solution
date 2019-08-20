<?php
$FORMS = [];

$FORMS['umsg_itemappended'] = <<<END
New record <a href="%item_path%">%item_name%</a> was appended to your blog <a href="%blog_path%">%blog_name%</a> at the %publish_time%.
END;

$FORMS['umsg_itemappended_frommail'] = <<<END
no-reply@no-reply.ru
END;

$FORMS['umsg_itemappended_fromname'] = <<<END
webmaster
END;

$FORMS['umsg_itemappended_subject'] = <<<END
New blog record appended
END;
?>
