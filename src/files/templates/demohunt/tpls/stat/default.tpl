<?php
$FORMS = [];
$FORMS['tags_block'] = <<<END
<p>
  %lines%
</p>
END;

$FORMS['tags_block_line'] = <<<END
<font style="font-size: +%font_size%pt;>%tag%</font> %separator%
END;
$FORMS['tags_separator'] = ", ";
?>
