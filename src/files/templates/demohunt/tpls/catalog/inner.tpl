<?php

$FORMS = [];

$FORMS['category_block'] = <<<END


					<div id="rubricator" class="block">
						<h2>%h1%</h2>
						<ul>
							%lines%
						</ul>
					</div>

END;


$FORMS['category_block_empty'] = <<<END

END;


$FORMS['category_block_line'] = <<<END
						<li><a href="%link%" umi:element-id="%id%" umi:field-name="name">%text%</a></li>

END;


?>
