[{include file=$oViewConf->getModulePath("vt-devutils","views/admin/vt_devutils__header.tpl")}]


[{if $aFiles}]
    <div class="small-12 column">
        <h2>files</h2>
        [{foreach from=$aFiles key="module" item="aModuleFiles"}]
            <div style="width: 40%; margin: 5%; padding: 0; display:inline-block; float:left; clear: none;">
                <h3>[{$module}]</h3>
                <table class="metadata">
                    <thead>
                    <tr>
                        <th>class</th>
                        <th>file</th>
                        <th><i class="fa fa-power-off fa-lg"></i></th>
                    </tr>
                    </thead>
                    <tbody>
                    [{foreach from=$aModuleFiles item="item"}]
                        <tr>
                            <td>[{$item->class}]</td>
                            <td>[{$item->file}]</td>
                            <td>[{if $item->valid}][{oxmultilang ident="VT_DEVUTILS_MODULE_METADATA_STATUS3"}][{else}][{oxmultilang ident="VT_DEVUTILS_MODULE_METADATA_NOTFOUND"}][{/if}]</td>
                        </tr>
                    [{/foreach}]

                    </tbody>
                </table>
            </div>
        [{/foreach}]

    </div>
[{/if}]


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
    <li>

    </li>
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


<div class="row">
    <ul class="tabs" data-tab>
        <li class="tab-title active"><a href="#extends">extendeds</a></li>
        <li class="tab-title"><a href="#files">files</a></li>
        <li class="tab-title"><a href="#templates">templates</a></li>
        <li class="tab-title"><a href="#tplblocks">tplblocks</a></li>
    </ul>
</div>
<div class="row">
    <div class="tabs-content">
        <div class="content active" id="extends">
            <pre>
            [{$oView->getModuleEvents()|var_dump}]
                <hr/>
                <hr/>
                [{$oView->getModuleTemplates()|var_dump}]
                </pre>
        </div>
        <div class="content" id="files">
            <p>Second panel content goes here...</p>
        </div>
        <div class="content" id="templates">
            <p>Third panel content goes here...</p>
        </div>
        <div class="content" id="tplblocks">
            [{foreach from=$oView->getTplBlocks() key="module" item="blocks"}]
                <div class="panel">
                    <h4 class="panel-title">[{$module}]</h4>

                    <form action="" methid="POST" class="inline-form">
                        <table class="metadata">
                            <colgroup>
                                <col width="185"/>
                                <col width="215"/>
                                <col width="*"/>
                                <col width="15"/>
                            </colgroup>
                            <thead>
                            <tr>
                                <th>template</th>
                                <th>block</th>
                                <th colspan="2">file</th>
                            </tr>
                            </thead>
                            <tbody>
                            [{foreach from=$blocks item="block"}]
                                <tr>
                                    <td>[{$block->oxtemplate}]</td>
                                    <td>[{$block->oxblockname}]</td>
                                    <td><input type="text" name="" value="[{$block->oxfile}]" readonly/></td>
                                    <td>x</td>
                                </tr>
                            [{/foreach}]
                            </tbody>
                        </table>
                    </form>
                </div>
            [{/foreach}]
        </div>
    </div>
</div>
[{include file=$oViewConf->getModulePath("vt-devutils","views/admin/vt_devutils__footer.tpl")}]

