<?php
$FORM = [];

/* Здесь выводится список страниц первого уровня. Оформление каждой страницы берётся из блока menu_line_level1 */
$FORMS['menu_block_level1'] = <<<END
<ul umi:element-id="%id%" umi:module="content" umi:method="menu">
  %lines%
</ul>
END;

/* Выводим страницу первого уровня. Оформление активной страницы берется из блока menu_line_level1_a */
/* Подключаем меню второго уровня, используя блок menu_block_level2 */
$FORMS['menu_line_level1'] = <<<END
<li><a href="%link%" umi:element-id="%id%" umi:field-name="name">%text%</a></li> 
%sub_menu% 
END;

/* Выводим страницу первого уровня, при ее активности. */
/* Подключаем меню второго уровня, используя блок menu_block_level2 */
$FORMS['menu_line_level1_a'] = <<<END
<li><a href="%link%" umi:element-id="%id%" umi:field-name="name">%text%</a></li>
%sub_menu%
END;

$FORMS['menu_block_level2'] = <<<END
<ul>
  %lines%
</ul>
END;

$FORMS['menu_line_level2'] = <<<END
<li><a href="%link%">%text%</a></li>
%sub_menu%
END;

$FORMS['menu_line_level2_a'] = <<<END
<li><a href="%link%">%text%</a></li>
%sub_menu%
END;

$FORMS['menu_block_level3'] = <<<END
<ul>
  %lines%
</ul>
END;

$FORMS['menu_line_level3'] = <<<END
<li><a href="%link%">%text%</a></li>
%sub_menu%
END;

$FORMS['menu_line_level3_a'] = <<<END
<li><a href="%link%">%text%</a></li>
%sub_menu%
END;

?>
