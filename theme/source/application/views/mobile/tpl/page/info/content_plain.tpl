[{capture append="oxidBlock_content"}]
    [{assign var="oContent" value=$oView->getContent()}]
    [{assign var="template_title" value=$oView->getTitle()}]
    [{assign var="tpl" value=$oViewConf->getActTplName()}]
    [{assign var="oxloadid" value=$oViewConf->getActContentLoadId()}]
    <h1 class="pageHead">[{$template_title}]</h1>
    <div class="cms-content">
        [{$oView->getParsedContent()}]
    </div>
    [{ insert name="oxid_tracker" title=$template_title }]
[{/capture}]
[{include file="layout/popup.tpl"}]