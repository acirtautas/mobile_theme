[{assign var="dynvalue" value=$oView->getDynValue()}]
<div id="paymentOption_[{$sPaymentID}]" class="payment-option [{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]active-payment[{/if}]">
    <input id="payment_[{$sPaymentID}]" type="radio" name="paymentid" value="[{$sPaymentID}]" [{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]checked="checked"[{/if}] />
    <ul class="form">
        <li>
            <input id="payment_[{$sPaymentID}]_1" class="js-oxValidate js-oxValidate_notEmpty" type="text" size="20" maxlength="64" name="dynvalue[lsbankname]" autocomplete="off" value="[{$dynvalue.lsbankname}]" placeholder="[{oxmultilang ident="PAGE_CHECKOUT_PAYMENT_BANK"}]" />
            <p class="validation-error">
                <span class="js-oxError_notEmpty">[{oxmultilang ident="EXCEPTION_INPUT_NOTALLFIELDS"}]</span>
            </p>
        </li>
        <li>
            <input type="text" class="js-oxValidate js-oxValidate_notEmpty" size="20" maxlength="64" name="dynvalue[lsblz]" autocomplete="off" value="[{$dynvalue.lsblz}]" placeholder="[{oxmultilang ident="PAGE_CHECKOUT_PAYMENT_ROUTINGNUMBER"}]" />
            <p class="validation-error">
                <span class="js-oxError_notEmpty">[{oxmultilang ident="EXCEPTION_INPUT_NOTALLFIELDS"}]</span>
            </p>
        </li>
        <li>
            <input type="text" class="js-oxValidate js-oxValidate_notEmpty" size="20" maxlength="64" name="dynvalue[lsktonr]" autocomplete="off" value="[{$dynvalue.lsktonr}]" placeholder="[{oxmultilang ident="PAGE_CHECKOUT_PAYMENT_ACCOUNTNUMBER"}]" />
            <p class="validation-error">
                <span class="js-oxError_notEmpty">[{oxmultilang ident="EXCEPTION_INPUT_NOTALLFIELDS"}]</span>
            </p>
        </li>
        <li>
            <input type="text" class="js-oxValidate js-oxValidate_notEmpty" size="20" maxlength="64" name="dynvalue[lsktoinhaber]" value="[{if $dynvalue.lsktoinhaber}][{$dynvalue.lsktoinhaber}][{else}][{$oxcmp_user->oxuser__oxfname->value}] [{$oxcmp_user->oxuser__oxlname->value}][{/if}]" placeholder="[{oxmultilang ident="PAGE_CHECKOUT_PAYMENT_ACCOUNTHOLDER2"}]" />
            <p class="validation-error">
                <span class="js-oxError_notEmpty">[{oxmultilang ident="EXCEPTION_INPUT_NOTALLFIELDS"}]</span>
            </p>
        </li>

        [{block name="checkout_payment_longdesc"}]
            [{if $paymentmethod->oxpayments__oxlongdesc->value}]
                <li>
                    <div class="payment-desc">
                        [{$paymentmethod->oxpayments__oxlongdesc->getRawValue()}]
                    </div>
                </li>
            [{/if}]
        [{/block}]
    </ul>
</div>