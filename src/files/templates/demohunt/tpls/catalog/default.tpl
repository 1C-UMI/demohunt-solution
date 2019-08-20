<?php

$FORMS = [];

$FORMS['category'] = <<<END

<p>%descr%</p>
%catalog getCategoryList('default', '%category_id%', 100, 1)%
	%catalog getObjectsList('default', '%category_id%')%

END;


$FORMS['category_block'] = <<<END

<h3>Подразделы</h3>
<ul>
	%lines%
</ul>


END;


$FORMS['category_block_empty'] = <<<END

END;


$FORMS['category_block_line'] = <<<END

<li><a href="%link%"><b>%text%</b></a></li>

END;




$FORMS['objects_block'] = <<<END

<table style="width: 100%;">
	<tr>
		<td>
			%catalog search('%category_id%', 'cenovye_svojstva short_info', 'search')%
		</td>
	</tr>
</table>
<br />
%system numpages(%total%, %per_page%, 'catalog')%
<br />
%lines%

<div style="clear: both;"></div>

<h3>Добавить новый объект каталога</h3>
<form method="post" action="%pre_lang%/catalog/addCatalogObject/%pid%/729/">
	<table cellspacing="1" cellpadding="1" width="100%" border="0">
		<tr>
			<td>
				Название:
			</td>
			
			<td>
				<input type="text" name="title" />
			</td>
		</tr>
		%data getCreateForm(%type_id%, 'users')%
	</table>
	
	<input type="submit" />
</form>


%system numpages(%total%, %per_page%, 'catalog')%

<br /><br />

END;


$FORMS['objects_block_search_empty'] = <<<END

<table style="width: 100%;">
	<tr>
		<td>
			%catalog search('%category_id%', 'cenovye_svojstva short_info', 'search')%
		</td>
	</tr>
</table>

<p>По Вашему запросу ничего не найдено.</p>

END;


$FORMS['objects_block_line'] = <<<END

%catalog viewObject(%id%, 'preview')%


END;



$FORMS['view_block'] = <<<END

%data getProperty(%id%, 'photo', 'catalog_view')%

%data getPropertyGroup(%id%, 'short_info short_params', 'catalog_full')%

<p align="right">%eshop addtobasket(%id%)% (<b>Цена: <span class="price" umi:element-id="%id%" umi:field-name="price">%data getProperty(%id%, 'Price', 'catalog_price')%</span></b>)</p>

<div style="clear: both;"></div>

<div style="margin-top: 20px;">
%data getPropertyGroup(%id%, 'other_proerties imported', 'catalog_full')%
</div>


%data getProperty(%id%, 'opisanie', 'catalog_opisanie')%

<div style="margin-top: 20px;">
	%data getPropertyGroup(%id%, 'recommend imported', 'catalog_full')%
</div>

<div style="clear: both;"></div><br />
%comments insert('%id%')%

END;

?>
