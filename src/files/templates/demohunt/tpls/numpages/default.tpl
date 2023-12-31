<?php
$FORMS = [];

/* Здесь номера страниц. Оформление каждого номера берётся из блока pages_item */
$FORMS['pages_block'] = <<<END
<p>
  Страницы: %pages%
</p>
END;

/* Выводим номер страницы */
/* Подключаем разделитель между элементами */
$FORMS['pages_item'] = <<<END
<a href="%link%">%num%</a> 
%quant%
END;

/* Выводим номер страницы, при ее активности */
/* Подключаем разделитель между элементами */
$FORMS['pages_item_a'] = <<<END
<span>%num%</span>  
%quant%
END;

/* Разделитель между номерами страниц */
$FORMS['pages_quant'] = <<<END
 | 
END;

/* Выводим данный блок, если нет ничего для отображения */
$FORMS['pages_block_empty'] = <<<END
END;

?>
