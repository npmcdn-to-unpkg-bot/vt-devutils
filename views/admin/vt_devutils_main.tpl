[{include file=$oViewConf->getModulePath("vt-devutils","views/admin/vt_devutils__header.tpl")}]
<div class="panel-group" id="accordion">

    <div class="panel panel-default">
        <div class="panel-heading"><h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">clearing cache</a></h4></div>
        <div id="collapseOne" class="panel-collapse collapse in">
            <div class="panel-body">

                <div class="row">
                    <div class="col-xs-6">
                        <a href="[{$oViewConf->getSelfLink()}]&cl=vtdu_be&fnc=clearLang&ajax=1" class="ajax btn btn-block" title="[{oxmultilang ident='vtdu_clearlang'}]" data-toggle="tooltip" data-placement="bottom">
                            <img id="" src="[{$oViewConf->getModuleUrl("vt-devutils","out/icons/clearlang.png")}]"/> lang
                        </a>
                    </div>
                    <div class="col-xs-6">
                        <a href="[{$oViewConf->getSelfLink()}]&cl=vtdu_be&fnc=clearPhp&ajax=1" class="ajax btn btn-block" title="[{oxmultilang ident='vtdu_clearphp'}]" data-toggle="tooltip" data-placement="bottom">
                            <img id="" src="[{$oViewConf->getModuleUrl("vt-devutils","out/icons/clearphp.png")}]"/> php
                        </a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-6">
                        <a href="[{$oViewConf->getSelfLink()}]&cl=vtdu_be&fnc=clearTmp&ajax=1" class="ajax btn btn-block" title="[{oxmultilang ident='vtdu_cleartmp'}]" data-toggle="tooltip">
                            <img id="" src="[{$oViewConf->getModuleUrl("vt-devutils","out/icons/cleartmp.png")}]"/> all
                        </a>
                    </div>
                    <div class="col-xs-6">
                        <a href="[{$oViewConf->getSelfLink()}]&cl=vtdu_be&fnc=clearTpl&ajax=1" class="ajax btn btn-block" title="[{oxmultilang ident='vtdu_clearsmarty'}]" data-toggle="tooltip">
                            <img id="" src="[{$oViewConf->getModuleUrl("vt-devutils","out/icons/clearsmarty.png")}]"/> tpl
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>


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
</div>

<script>
    [{capture assign="scripts"}]
    $("a.ajax").on("click", function (event) {
        event.preventDefault();
        $.get($(this).attr("href"), function (data) {
            generatenoty("information", data);
        });
        $(this).toggleClass("on");
    });
    [{/capture}]
</script>

[{include file=$oViewConf->getModulePath("vt-devutils","views/admin/vt_devutils__footer.tpl")}]