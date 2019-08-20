<?php

$FORMS = [];



$FORMS['view_block'] = <<<END
					<div style="float: left; margin: 2px;">
						<p><b><a href="%link%" class="title" umi:element-id="%id%" umi:field-name="name">%name%</a></b></p>
						<div style="margin: 3px;">
							%data getProperty(%id%, 'photo', 'preview_image_home')%
						</div>
						<div>
							<p><b>Цена: <span class="price" umi:element-id="%id%" umi:field-name="price">%price%</span> руб.</b></p>
							%eshop addtobasket(%id%)%
						</div>
						
					</div>

END;

?>
