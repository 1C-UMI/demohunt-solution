<?php

$FORMS = [];

$FORMS['view_block_empty'] = <<<END

END;



$FORMS['view_block'] = <<<END


					<div class="item">

						<table border="0">
							<tr>
								<td style="vertical-align:top;">
									%data getProperty(%id%, 'photo', 'preview_image')%
								</td>
								<td style="padding-left: 15px; vertical-align:top;">
									<a href="%link%" class="title">%name%</a>
									%data getProperty(%id%, 'price', 'catalog_preview')%
									%data getPropertyGroup(%id%, 'short_info', 'catalog_preview')%
								</td>
							</tr>
						</table>


						<div style="clear: both; margin-top: 10px; padding-bottom: 10px;">
							%eshop addtobasket(%id%)%
							| <a href="%pre_lang%/eshop/addToCompare/%id%/" rel="nofollow">Добавить к сравнению</a>
							| <a href="%link%#comments" >Комментарии (%comments countComments(%id%)%)</a>
						</div>
					</div>

END;

?>
