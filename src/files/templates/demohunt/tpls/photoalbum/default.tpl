<?php
$FORMS = [];
$FORMS['albums_list_block'] = <<<END
<p>
Список альбомов:
<ul>
  %lines%
</ul>
</p>
END;

$FORMS['albums_list_block_empty'] = <<<END
END;

$FORMS['albums_list_block_line'] = <<<END
<li>
	<a href="%link%">%name%</a>
</li>
END;

$FORMS['album_block'] = <<<END
%lines%
%system numpages(%total%, %per_page%)%
END;

$FORMS['album_block_empty'] = <<<END
Фотогалерея пуста.
END;

$FORMS['album_block_line'] = <<<END
<table>
	<tr>
		<td rowspan="2" style="width: 150px;">
			<a href="%link%">
				%data getProperty('%id%', 'photo', 'preview_image')%
			</a>
		</td>
		<td>
			<a href="%link%">
				%name%
			</a>
		</td>
	</tr>
	<tr>
		<td>
			%descr%
		</td>
	</tr>
</table>
<br /><br />
END;

$FORMS['photo_block'] = <<<END
<table>
	<tr>
		<td style="width: 250px;">
			%data getProperty('%id%', 'photo', 'view_image')%
		</td>
		<td>
			<p>Теги: <span>%tags%</span></p>
			<p>%descr%</p>
		</td>
	</tr>
</table>
<p>
	%system getPrevious(%id%)%
	%system getNext(%id%)%
</p>
END;

?>
