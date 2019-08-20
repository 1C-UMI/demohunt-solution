<?php
$FORMS = [];
$FORMS['cut_block'] = <<<END
<p style="text-align: center;">%items%</p>
END;

$FORMS['cut_item'] = <<<END
<a href="%link%">%text%</a>
END;

$FORMS['cut_item_a'] = <<<END
<b>%text%</b>
END;

$FORMS['cut_quant'] = <<<END
 | 
END;

$FORMS['cut_toprev'] = <<<END
<a href="%link%">%core_cut_toprev%</a>
END;

$FORMS['cut_tonext'] = <<<END
<a href="%link%">%core_cut_tonext%</a>
END;

$FORMS['cut_tobegin'] = <<<END
<a href="%link%">%core_cut_tobegin%</a>
END;

$FORMS['cut_toend'] = <<<END
<a href="%link%">%core_cut_toend%</a>
END;

$FORMS['cut_tonext_ua'] = <<<END
%core_cut_tonext%
END;

$FORMS['cut_toprev_ua'] = <<<END
%core_cut_toprev%
END;

$FORMS['cut_tobegin_ua'] = <<<END
%core_cut_tobegin%
END;

$FORMS['cut_toend_ua'] = <<<END
%core_cut_toend%
END;

?>
