[{include file=$oViewConf->getModulePath("vt-devutils","views/admin/vt_devutils__header.tpl")}]

<form name="transfer" id="transfer" action="[{ $oViewConf->getSelfLink() }]" method="post">
    [{ $oViewConf->getHiddenSid() }]
    <input type="hidden" name="oxid" value="[{$oModule->getInfo('id')}]">
    <input type="hidden" name="cl" value="module_config">
    <input type="hidden" name="fnc" value="">
    <input type="hidden" name="actshop" value="[{$oViewConf->getActiveShopId()}]">
    <input type="hidden" name="updatenav" value="">
    <input type="hidden" name="editlanguage" value="[{ $editlanguage }]">
</form>
<form name="transfer" id="transfer" action="[{ $oViewConf->getSelfLink() }]" method="post">
    [{ $oViewConf->getHiddenSid() }]
    <input type="hidden" name="oxid" value="[{$oModule->getInfo('id')}]">
    <input type="hidden" name="cl" value="module_config">
    <input type="hidden" name="actshop" value="[{$oViewConf->getActiveShopId()}]">
<ul id="magicgrid">
    [{if $aExtensions}]
        <li>
            <div>
            <h3>extensions <button type="submit" name="fnc" value="resetModuleExtends"><i class="fa fa-refresh"></i></button></h3>
            <table class="metadata">
                <thead>
                <tr>
                    <th>class</th>
                    <th>file</th>
                    <th><i class="fa fa-power-off fa-lg"></i></th>
                </tr>
                </thead>
                <tbody>
                [{foreach from=$aExtensions item="item"}]
                    <tr>
                        <td>[{$item->class}]</td>
                        <td>[{$item->file}][{if !$item->valid}]&nbsp;&nbsp;[{oxmultilang ident="VT_DEVUTILS_MODULE_METADATA_NOTFOUND"}][{/if}]</td>
                        <td>[{oxmultilang ident="VT_DEVUTILS_MODULE_METADATA_STATUS"|cat:$item->status }]</td>
                    </tr>
                [{/foreach}]
                </tbody>
            </table>
            </div>
        </li>
    [{/if}]
    [{if $aFiles}]
        <li>
            <div>
            <h3>files <a href="#"><i class="fa fa-refresh"></i></a></h3>
            <table class="metadata">
                <thead>
                <tr>
                    <th>class</th>
                    <th>file</th>
                    <th><i class="fa fa-power-off fa-lg"></i></th>
                </tr>
                </thead>
                <tbody>
                [{foreach from=$aFiles item="item"}]
                    <tr>
                        <td>[{$item->class}]</td>
                        <td>[{$item->file}][{if !$item->valid}]&nbsp;&nbsp;[{oxmultilang ident="VT_DEVUTILS_MODULE_METADATA_NOTFOUND"}][{/if}]</td>
                        <td>[{oxmultilang ident="VT_DEVUTILS_MODULE_METADATA_STATUS"|cat:$item->status }]</td>
                    </tr>
                [{/foreach}]
                </tbody>
            </table>
            </div>
        </li>
    [{/if}]
    [{if $aTemplates}]
        <li>
            <div>
            <h3>templates <a href="#"><i class="fa fa-refresh"></i></a></h3>
            <table class="metadata">
                <thead>
                <tr>
                    <th>template</th>
                    <th>file</th>
                    <th><i class="fa fa-power-off fa-lg"></i></th>
                </tr>
                </thead>
                <tbody>
                [{foreach from=$aTemplates item="item"}]
                    <tr>
                        <td>[{$item->title}]</td>
                        <td>[{$item->file}][{if !$item->valid}]&nbsp;&nbsp;[{oxmultilang ident="VT_DEVUTILS_MODULE_METADATA_NOTFOUND"}][{/if}]</td>
                        <td>[{oxmultilang ident="VT_DEVUTILS_MODULE_METADATA_STATUS"|cat:$item->status }]</td>
                    </tr>
                [{/foreach}]
                </tbody>
            </table>
            </div>
        </li>
    [{/if}]
    [{if $aBlocks}]
        <li>
            <div>
            <h3>blocks <a href="#"><i class="fa fa-refresh"></i></a></h3>
            <table class="metadata">
                <thead>
                <tr>
                    <th>template</th>
                    <th>block & file</th>
                    <th><i class="fa fa-power-off fa-lg"></i></th>
                </tr>
                </thead>
                <tbody>
                [{foreach from=$aBlocks item="item"}]
                    <tr>
                        <td>[{$item->template}]</td>
                        <td>
                            [{$item->block}]<br/>
                            [{$item->file}][{if !$item->valid}]&nbsp;&nbsp;[{oxmultilang ident="VT_DEVUTILS_MODULE_METADATA_NOTFOUND"}][{/if}]
                        </td>
                        <td>[{oxmultilang ident="VT_DEVUTILS_MODULE_METADATA_STATUS"|cat:$item->status }]</td>
                    </tr>
                [{/foreach}]
                </tbody>
            </table>
            </div>
        </li>
    [{/if}]
</ul>

[{if $aSettings}]
    <div class="small-10 small-offset-1 columns">
            <h3>settings <a href="#"><i class="fa fa-refresh"></i></a></h3>
            <table class="metadata">
                <colgroup>
                    <col width="200"/>
                    <col width="40"/>
                    <col width="*"/>
                    <col width="25"/>
                </colgroup>
                <thead>
                <tr>
                    <th>name</th>
                    <th>type</th>
                    <th>value</th>
                    <th><i class="fa fa-power-off fa-lg"></i></th>
                </tr>
                </thead>
                <tbody>
                [{foreach from=$aSettings item="item"}]
                    <tr>
                        <td valign="top">[{$item->name}]</td>
                        <td valign="top">[{$item->type}]</td>
                        <td>default: [{$item->default}]<br/>value: <span class="has-tip tip-top" data-tooltip data-options="disable_for_touch:true" title="[{$item->value}]">[{$item->value|truncate:"75":"...":true}]</span></td>
                        <td valign="top">[{oxmultilang ident="VT_DEVUTILS_MODULE_METADATA_SETTING_STATUS"|cat:$item->status }]</td>
                    </tr>
                [{/foreach}]
                </tbody>
            </table>
    </div>
[{/if}]
[{include file=$oViewConf->getModulePath("vt-devutils","views/admin/vt_devutils__footer.tpl")}]