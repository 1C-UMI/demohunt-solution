<?php
$FORMS = [];

/* Здесь выводится список страниц. Оформление каждой страницы берётся из блока element */
$FORMS['navibar'] = <<<NAVIBAR
<p>
  %elements%
</div>
NAVIBAR;

/* Выводим данный блок, если нет ни одной страницы для отображения */
$FORMS['navibar_empty'] = <<<NAVIBAR 
NAVIBAR;

/* Выводим название страницы */
$FORMS['element'] = '<a href="%link%">%text%</a>';

/* Выводим название страницы, при ее активности */ 
$FORMS['element_active'] = "%text%";

/* Разделитель, при выводе названий страниц */ 
$FORMS['quantificator'] = " / ";

?>
