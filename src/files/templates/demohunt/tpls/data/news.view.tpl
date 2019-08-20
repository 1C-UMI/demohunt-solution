<?php
$FORMS = [];
$FORMS['img_file'] = <<<END
%system makeThumbnail('%filepath%', '400', 'auto', 'news')%
END;

?>
