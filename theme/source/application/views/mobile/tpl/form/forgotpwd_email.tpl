<div class="content">
[{oxscript include="js/widgets/oxinputvalidator.js" priority=10 }]
[{oxscript add="$('form.js-oxValidate').oxInputValidator();"}]
    [{oxscript include="js/libs/modernizr.custom.min.js" priority=10}]
[{oxscript include="js/widgets/oxplaceholderfallback.js" priority=10 }]
[{oxscript add="$('form').oxPlaceholderFallback();"}]
<form class="js-oxValidate" action="[{ $oViewConf->getSelfActionLink() }]" name="forgotpwd" method="post">
  [{ $oViewConf->getHiddenSid() }]
  [{ $oViewConf->getNavFormParams() }]
  <input type="hidden" name="fnc" value="forgotpassword">
  <input type="hidden" name="cl" value="forgotpwd">
  <input type="hidden" name="actcontrol" value="forgotpwd">
  <ul class="form clear">
    <li>
        <label>[{ oxmultilang ident="PAGE_ACCOUNT_FORGOTPWD_YOUREMAIL" }]</label>
        <input id="forgotPasswordUserLoginName[{$idPrefix}]" type="email" name="lgn_usr" value="[{$oView->getActiveUsername()}]" class="js-oxValidate js-oxValidate_notEmpty js-oxValidate_email" placeholder="[{ oxmultilang ident="EMAIL_ADDRESS"}]" >
        <p class="validation-error">
            <span class="js-oxError_notEmpty">[{ oxmultilang ident="EXCEPTION_INPUT_NOTALLFIELDS" }]</span>
            <span class="js-oxError_email">[{ oxmultilang ident="EXCEPTION_INPUT_NOVALIDEMAIL" }]</span>
            [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxusername}]
        </p>
    </li>
    <li class="formSubmit">
        <input class="btn" type="submit" value="[{ oxmultilang ident="PAGE_ACCOUNT_FORGOTPWD_REQUESTPWD"}]"/>
    </li>
  </ul>
</form>
  <p>[{ oxmultilang ident="PAGE_ACCOUNT_FORGOTPWD_AFTERCLICK" }]</p>
</div>