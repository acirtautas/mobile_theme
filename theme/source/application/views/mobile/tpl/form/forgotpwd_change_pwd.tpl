[{oxscript include="js/widgets/oxinputvalidator.js" priority=10 }]
[{oxscript add="$('form.js-oxValidate').oxInputValidator();"}]
[{oxscript include="js/libs/modernizr.custom.min.js" priority=10}]
[{oxscript include="js/widgets/oxplaceholderfallback.js" priority=10 }]
[{oxscript add="$('form').oxPlaceholderFallback();"}]
 <form class="js-oxValidate" action="[{ $oViewConf->getSelfActionLink() }]" name="forgotpwd" method="post">
    <div>
        [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
        [{ $oViewConf->getHiddenSid() }]
        [{ $oViewConf->getNavFormParams() }]
        <input type="hidden" name="fnc" value="updatePassword">
        <input type="hidden" name="uid" value="[{ $oView->getUpdateId() }]">
        <input type="hidden" name="cl" value="forgotpwd">
        <input type="hidden" id="passwordLength" value="[{$oViewConf->getPasswordLength()}]">
    </div>
    <ul class="form clear">
        <li [{if $aErrors.oxuser__oxpassword}]class="invalid-field"[{/if}]>
            <input type="password" name="password_new" class="js-oxValidate js-oxValidate_notEmpty js-oxValidate_length js-oxValidate_match textbox" placeholder="[{ oxmultilang ident="PAGE_ACCOUNT_FORGOTPWD_NEWPASSWORD" }]">
            <p class="validation-error">
                <span class="js-oxError_notEmpty">[{ oxmultilang ident="EXCEPTION_INPUT_NOTALLFIELDS" }]</span>
                <span class="js-oxError_length">[{ oxmultilang ident="EXCEPTION_INPUT_PASSTOOSHORT" }]</span>
                <span class="js-oxError_match">[{ oxmultilang ident="EXCEPTION_USER_PWDDONTMATCH" }]</span>
                [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxpassword}]
            </p>
        </li>
        <li [{if $aErrors.oxuser__oxpassword}]class="invalid-field"[{/if}]>
            <input type="password" name="password_new_confirm" class="js-oxValidate js-oxValidate_notEmpty js-oxValidate_length js-oxValidate_match textbox" placeholder="[{ oxmultilang ident="PAGE_ACCOUNT_FORGOTPWD_CONFIRMPASSWORD" }]">
            <p class="validation-error">
                <span class="js-oxError_notEmpty">[{ oxmultilang ident="EXCEPTION_INPUT_NOTALLFIELDS" }]</span>
                <span class="js-oxError_length">[{ oxmultilang ident="EXCEPTION_INPUT_PASSTOOSHORT" }]</span>
                <span class="js-oxError_match">[{ oxmultilang ident="EXCEPTION_USER_PWDDONTMATCH" }]</span>
                [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxpassword}]
            </p>
        </li>
        <li>
            <button class="btn" type="submit" name="save" value="[{ oxmultilang ident="PAGE_ACCOUNT_FORGOTPWD_UPDATEPASSWORD" }]">[{ oxmultilang ident="PAGE_ACCOUNT_FORGOTPWD_UPDATEPASSWORD" }]</button>
        </li>
    </ul>
</form>