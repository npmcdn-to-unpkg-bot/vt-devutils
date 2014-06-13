
[{capture assign="header"}][{include file="header.tpl"}][{/capture}]
[{capture assign="inception"}]
    <li class="sep">
        <a href="[{$oViewConf->getSelfLink()}]&cl=navigation&fnc=clearLang&item=header.tpl" class="rc" title="[{oxmultilang ident='vtdu_clearlang'}]">
            <b>lang cache</b>
        </a>
    </li>
    <li class="sep">
        <a href="[{$oViewConf->getSelfLink()}]&cl=navigation&fnc=clearTpl&item=header.tpl" class="rc" title="[{oxmultilang ident='vtdu_clearsmarty'}]">
            <b>tpl cache</b>
        </a>
    </li>
    <li class="sep">
        <a href="[{$oViewConf->getSelfLink()}]&cl=navigation&fnc=clearTmp&item=header.tpl" class="rc" title="[{oxmultilang ident='vtdu_cleartmp'}]">
            <b>full cache</b>
        </a>
    </li>
    [{if $content}]
        <li class="sep">
            <b>[{$content}]</b>
        </li>
    [{/if}]
[{*

        <div class="panel panel-default">
            <div class="panel-heading"><h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">debug settings</a></h4></div>
            <div id="collapseTwo" class="panel-collapse collapse">
                <div class="panel-body">

                    <div id="debugsettings" class="row">
                        [{foreach from=$oView->getDebugSettings() key="key" item="val"}]
                            <div class="col-xs-4">
                                <a href="[{$oViewConf->getSelfLink()}]&cl=vtdu_be&fnc=toggledebugsetting&setting=[{$key}]&ajax=1" class="ajax [{if $val}]on[{/if}]" title="[{oxmultilang ident='SHOP_MODULE_'|cat:$key}]">
                                    <img id="[{$key}]" src="[{$oViewConf->getModuleUrl("vt-devutils","out/icons/")}]debugsetting_[{$key}][{if $val}]_on[{/if}].png"/>
                                </a></div>
                        [{/foreach}]
                    </div>

                </div>
            </div>
        </div>

    *}]
</ul>
[{/capture}]
[{* <li><iframe style="position:absolute; top:0px;" src="[{ $oViewConf->getSelfLink()|replace:'&amp;':'&'|oxaddparams:'cl=vtdu_be'}]"/></iframe></li> *}]
[{$header|replace:"</ul>":$inception}]