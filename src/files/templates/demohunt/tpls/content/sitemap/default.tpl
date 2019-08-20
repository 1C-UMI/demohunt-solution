<?php
$FORMS = [];
$FORMS['block'] = <<<END
<ul>
	%items%
</ul>
END;

$FORMS['item'] = <<<END
	<li>
		<a href="%link%">%name%</a>
		%sub_items%
	</li>
END;

?>
