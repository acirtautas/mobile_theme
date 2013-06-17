[{block name="checkout_payment_trustedshops"}]
    [{if $oView->getTSExcellenceId()}]
        <div id="tsBox">
            <h3 class="block-head" id="tsProtectionHeader">[{ oxmultilang ident="PAGE_CHECKOUT_PAYMENT_TSPROTECTION" }]</h3>
            <div class="etrustlogocol">
            <a href="https://www.trustedshops.com/shop/certificate.php?shop_id=[{$oView->getTSExcellenceId()}]" target="_blank">
              <img src="[{$oViewConf->getImageUrl('trustedshops_m.gif')}]" title="[{ oxmultilang ident="INC_TRUSTEDSHOPS_ITEM_IMGTITLE" }]">
            </a>
            </div>
            <div>
            <input type="checkbox" name="bltsprotection" value="1" [{if $oView->getCheckedTsProductId()}]checked[{/if}]>
            [{assign var="aTsProtections" value=$oView->getTsProtections() }]
            [{if count($aTsProtections) > 1 }]
            <select name="stsprotection">
              [{foreach from=$aTsProtections item=oTsProduct}]
                  [{if $oView->isPaymentVatSplitted() }]
                     <option value="[{$oTsProduct->getTsId()}]" [{if $oView->getCheckedTsProductId() == $oTsProduct->getTsId()}]SELECTED[{/if}]>[{ oxmultilang ident="PAGE_CHECKOUT_PAYMENT_TSPROTECTIONFOR" }] [{ $oTsProduct->getAmount() }] [{ $currency->sign}] ([{ $oTsProduct->getFNettoPrice() }] [{ $currency->sign}] [{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_PLUSTAX1" }] [{ $oTsProduct->getFVatValue() }] [{ $currency->sign}] ) </option>
                  [{else}]
                      <option value="[{$oTsProduct->getTsId()}]" [{if $oView->getCheckedTsProductId() == $oTsProduct->getTsId()}]SELECTED[{/if}]>[{ oxmultilang ident="PAGE_CHECKOUT_PAYMENT_TSPROTECTIONFOR" }] [{ $oTsProduct->getAmount() }] [{ $currency->sign}] ([{ $oTsProduct->getFPrice() }] [{ $currency->sign}] [{ oxmultilang ident="PAGE_CHECKOUT_PAYMENT_INCLUDEVAT" }]) </option>
                  [{/if}]
              [{/foreach}]
            </select>
            [{else}]
                [{assign var="oTsProduct" value=$aTsProtections[0] }]
                [{if $oView->isPaymentVatSplitted() }]
                <input type="hidden" name="stsprotection" value="[{$oTsProduct->getTsId()}]">[{ oxmultilang ident="PAGE_CHECKOUT_PAYMENT_TSPROTECTIONFOR" }] [{ $oTsProduct->getAmount() }] [{ $currency->sign}] ([{ $oTsProduct->getFNettoPrice() }] [{ $currency->sign}] [{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_PLUSTAX1" }] [{ $oTsProduct->getFVatValue() }] [{ $currency->sign}])
                [{else}]
                <input type="hidden" name="stsprotection" value="[{$oTsProduct->getTsId()}]">[{ oxmultilang ident="PAGE_CHECKOUT_PAYMENT_TSPROTECTIONFOR" }] [{ $oTsProduct->getAmount() }] [{ $currency->sign}] ([{ $oTsProduct->getFPrice() }] [{ $currency->sign}] [{ oxmultilang ident="PAGE_CHECKOUT_PAYMENT_INCLUDEVAT" }])
                [{/if}]
            [{/if}]
              <br>
              <br>
                <div class="cms-content">
                    [{oxifcontent ident="oxtsprotectiontext" object="oCont"}]
                        [{$oCont->oxcontents__oxcontent->value}]
                    [{/oxifcontent}]
                </div>
            </div>
            <div class="clear"></div>
        </div>
    [{/if}]
[{/block}]