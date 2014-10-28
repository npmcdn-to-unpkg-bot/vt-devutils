[{include file=$oViewConf->getModulePath("vt-devutils","views/admin/vt_devutils__header.tpl")}]
<div class="small-12 column">
    <ul class="small-block-grid-1 large-block-grid-2">
        [{if $aExtensions}]
            <li>
                <h3>extensions</h3>
                <table class="metadata">
                    <thead>
                    <tr>
                        <th>class</th>
                        <th>extension file</th>
                        <th><i class="fa fa-power-off fa-lg"></i></th>
                    </tr>
                    <tbody>
                    [{foreach from=$aExtensions key="class" item="aExtensions"}]
                        <tr>
                            <td colspan="3"><b style="color:#ff4000;">[{$class}]</b></td>
                        </tr>
                        [{foreach from=$aExtensions item="extension"}]
                            <tr>
                                <td></td>
                                <td>[{$extension}]</td>
                                <td>[{if $oView->validateFile($extension)}][{oxmultilang ident="VT_DEVUTILS_MODULE_METADATA_STATUS3"}][{else}][{oxmultilang ident="VT_DEVUTILS_MODULE_METADATA_NOTFOUND"}][{/if}]</td>
                            </tr>
                        [{/foreach}]
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
                        <th>path</th>
                        <th><i class="fa fa-power-off fa-lg"></i></th>
                    </tr>
                    <tbody>
                    [{foreach from=$aFiles key="module" item="aModuleFiles"}]
                        <tr>
                            <td colspan="3"><b style="color:#ff4000;">[{$module}]</b></td>
                        </tr>
                        [{foreach from=$aModuleFiles item="file"}]
                            <tr>
                                <td></td>
                                <td>[{$file}]</td>
                                <td>[{if $oView->validateFile($file)}][{oxmultilang ident="VT_DEVUTILS_MODULE_METADATA_STATUS3"}][{else}][{oxmultilang ident="VT_DEVUTILS_MODULE_METADATA_NOTFOUND"}][{/if}]</td>
                            </tr>
                        [{/foreach}]
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
                    [{foreach from=$aTemplates key="module" item="aModuleTemplates"}]
                        <tr>
                            <td colspan="3"><b style="color:#ff4000;">[{$module}]</b></td>
                        </tr>
                        [{foreach from=$aModuleTemplates item="template"}]
                            <tr>
                                <td></td>
                                <td>[{$template}]</td>
                                <td>[{if $oView->validateFile($template)}][{oxmultilang ident="VT_DEVUTILS_MODULE_METADATA_STATUS3"}][{else}][{oxmultilang ident="VT_DEVUTILS_MODULE_METADATA_NOTFOUND"}][{/if}]</td>
                            </tr>
                        [{/foreach}]
                    [{/foreach}]
                    </tbody>
                </table>
            </li>
        [{/if}]
        [{if $aBlocks}]
            <li>
                <ul class="tabs" data-tab role="tablist">
                    <li class="tab-title active"><a href="#tabsbytemplate"><h3>blocks by template</h3></a></li>
                    <li class="tab-title"><a href="#tabsbymodule"><h3>blocks by module</h3></a></li>
                </ul>
                <div class="tabs-content">
                    <div class="content active" id="tabsbytemplate">
                        <table class="metadata">
                            <thead>
                            <tr>
                                <th>template</th>
                                <th>block / file</th>
                                <th>module</th>
                                <th><i class="fa fa-power-off fa-lg"></i></th>
                            </tr>
                            </thead>
                            <tbody>
                            [{foreach from=$aBlocks item="tplblock"}]
                                <tr>
                                    <td>[{$tplblock->oxtemplate}]</td>
                                    <td>[{$tplblock->oxblockname}]</td>
                                    <td>[{$tplblock->oxmodule}]</td>
                                    <td>[{if $tplblock->oxactive}][{oxmultilang ident="VT_DEVUTILS_MODULE_METADATA_ACTIVE"}][{else}][{oxmultilang ident="VT_DEVUTILS_MODULE_METADATA_INACTIVE"}][{/if}]</td>
                                </tr>
                                <tr></tr>
                                <tr>
                                    <td></td>
                                    <td colspan="2">[{$tplblock->oxfile}]</td>
                                    <td>[{if $oView->validateFile($tplblock->oxfile,$tplblock->oxmodule)}][{oxmultilang ident="VT_DEVUTILS_MODULE_METADATA_STATUS3"}][{else}][{oxmultilang ident="VT_DEVUTILS_MODULE_METADATA_NOTFOUND"}][{/if}]</td>
                                </tr>
                            [{/foreach}]
                            </tbody>
                        </table>
                    </div>
                    <div class="content" id="tabsbymodule">
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

