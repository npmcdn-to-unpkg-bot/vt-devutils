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
<div class="small-12 column">
    <ul class="small-block-grid-1 large-block-grid-2">
        [{if $aExtensions}]
            <li>
                <h3>extensions</h3>
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
            </li>
        [{/if}]
        [{if $aFiles}]
            <li>
                <h3>files</h3>
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
            </li>
        [{/if}]
        [{if $aTemplates}]
            <li>
                <h3>templates</h3>
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
            </li>
        [{/if}]
        [{if $aBlocks}]
            <li>
                <h3>blocks</h3>
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
            </li>
        [{/if}]
    </ul>
</div>
[{include file=$oViewConf->getModulePath("vt-devutils","views/admin/vt_devutils__footer.tpl")}]