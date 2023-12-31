<?php
/*
Добавление товаров, пересчет корзины без березагруза страницы.
(USED JSON)

Для операций над корзиной заказов можно использовать
системный javascript-обьект umiBasket
Ex: umiBasket.getInstance().addItem($iElementId);

Методы обьекта umiBasket:

(void) addElement(iElementId, iCount)
(void) updateBasket(iCartItemId)
(void) updateCount(iElementId, iCount) 
(void) removeBasketItem(iElementId)

Можно назначить собственные обработчики событий (если не указаны - используются обработчики по умолчанию)

(void) onAfterAddElement (iElementId, iCount) 
(void) onUpdate (oBasketInfo)
(void) onAfterRemoveBasketItem (iElementId)

*/

$FORMS = [];

$FORMS['basket'] = <<<END

	<table id="order_block" border="0" cellspacing="0" cellpadding="0" width="100%" rules="rows">
		<tr class="orow_hat">
			<td>ID</td>
			<td>Наименование</td>
			<td>Цена (руб.)</td>
			<td>Количество</td>
			<td>Итого</td>
			<td>Удалить</td>
		</tr>
		%items%
	</table>
	<br />
	<b>Всего к оплате: <span name="order_total" id="order_total">%order_price%</span> руб.</b>
	<br />

	<form method="post" action="%pre_lang%/eshop/order/">
		%eshop address_choice()%
		%eshop payment(%order_id%)%
		<h2>Комментарии к заказу:</h2>
		<textarea name="customer_comments" style="width:100%; height: 64px; margin-bottom: 10px;"></textarea>
		<input type="submit" value="Оформить заказ" />
		<button name="updateBasket" onclick="javascript:umiBasket.getInstance().updateBasket(); return false;">Обновить</button>

		<input type="hidden" name="from_page" value="%pre_lang%/eshop/basket" />
	</form>

	%eshop user_orders()%


END;

$FORMS['basket_empty'] = <<<END

	<p>Корзина пуста</p>

	%eshop user_orders()%
END;

$FORMS['basket_item'] = <<<END

		<tr id="basketrow_%id%" name="basketrow_%id%">
			<td><span name="citm_%id%_id" id="citm_%id%_id">%id%</span></td>
			<td><a href="%content get_page_url(%id%)%" name="citm_%id%_path" id="citm_%id%_path"><span name="citm_%id%_name" id="citm_%id%_name">%name%</span></a></td>
			<td name="citm_%id%_price" id="citm_%id%_price">%price%</td>
			<td class="orow_count"><input type="text" name="citm_%id%_count" id="citm_%id%_count" onchange="javascript:umiBasket.getInstance().updateCount(%id%, this.value);" value="%count%" maxlength="3" style="width:30px; border:1px sold #CCCCCC;" /></td>
			<td><span name="citm_%id%_price_total" id="citm_%id%_price_total">%price_total%</span></td>
			<td class="orow_remove"><a href="#" name="citm_%id%_remove" id="citm_%id%_remove" onclick="javascript:umiBasket.getInstance().removeBasketItem('%id%'); return false;">X</a></td>
		</tr>

END;

$FORMS['basket_new_item'] = <<<END

		<tr id="basketnewrow" name="basketnewrow" style="display:none">
			<td id="cnewitm_id" name="cnewitm_id"></td>
			<td><a href="#" id="cnewitm_path" name="cnewitm_path"><span id="cnewitm_name" name="cnewitm_name"></span></a></td>
			<td name="cnewitm_price" id="cnewitm_price"></td>
			<td class="orow_count"><input type="text" name="cnewitm_count" id="cnewitm_count" maxlength="3" style="width:30px; border:1px sold #CCCCCC;" /></td>
			<td><span name="cnewitm_price_total" id="cnewitm_price_total"></span></td>
			<td class="orow_remove"><a href="#" name="cnewitm_remove" id="cnewitm_remove">X</a></td>
		</tr>

END;

$FORMS['addtobasket'] = <<<END

	<div name="addtobasket_area_%element_id%" id="addtobasket_area_%element_id%" style="display: inline;">
		<a href="#" onclick="javascript:umiBasket.getInstance().addElement(%element_id%); return false;">Положить в корзину</a>
	</div>

END;


?>
