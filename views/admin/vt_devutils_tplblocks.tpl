[{include file=$oViewConf->getModulePath("vt-devutils","views/admin/vt_devutils__header.tpl")}]

<div class="small-12 column">

                        <table class="metadata">
                            <thead>
                            <tr>
                                <th>template</th>
                                <th>block / file</th>
                                <th><i class="fa fa-power-off fa-lg"></i></th>
                            </tr>
                            </thead>
                            <tbody>
                            [{foreach from=$aBlocksByModule key="module" item="aModuleBlocks"}]
                                <tr>
                                    <td colspan="3"><b style="color:#ff4000;">[{$module}]</b></td>
                                </tr>
                                [{foreach from=$aModuleBlocks item="tplblock"}]
                                    <tr>
                                        <td>[{$tplblock->oxtemplate}]</td>
                                        <td>[{$tplblock->oxblockname}]</td>
                                        <td>[{if $tplblock->oxactive}][{oxmultilang ident="VT_DEVUTILS_MODULE_METADATA_ACTIVE"}][{else}][{oxmultilang ident="VT_DEVUTILS_MODULE_METADATA_INACTIVE"}][{/if}]</td>
                                    </tr>
                                    <tr></tr>
                                    <tr>
                                        <td></td>
                                        <td>[{$tplblock->oxfile}]</td>
                                        <td>[{if $oView->validateFile($tplblock->oxfile,$tplblock->oxmodule)}][{oxmultilang ident="VT_DEVUTILS_MODULE_METADATA_STATUS3"}][{else}][{oxmultilang ident="VT_DEVUTILS_MODULE_METADATA_NOTFOUND"}][{/if}]</td>
                                    </tr>
                                [{/foreach}]
                            [{/foreach}]
                            </tbody>
                        </table>
                    </div>
                </div>
            </li>
        [{/if}]
        [{if $aEvents}]
            <li>
                <h3>events</h3>

                <table class="metadata">
                    <thead>
                    <tr>
                        <th>module</th>
                        <th>event</th>
                        <th>function</th>
                    </tr>
                    </thead>
                    <tbody>
                    [{foreach from=$aEvents key="module" item="aModuleEvents"}]
                        [{if $aModuleEvents}]
                        <tr>
                            <td colspan="3"><b style="color:#ff4000;">[{$module}]</b></td>
                        </tr>
                        [{foreach from=$aModuleEvents key="event" item="function"}]
                            <tr>
                                <td></td>
                                <td>[{$event}]</td>
                                <td>[{$function}]</td>
                            </tr>
                        [{/foreach}]
                        [{/if}]
                    [{/foreach}]
                    </tbody>
                </table>
            </li>
        [{/if}]
    </ul>
</div>

[{include file=$oViewConf->getModulePath("vt-devutils","views/admin/vt_devutils__footer.tpl")}]

