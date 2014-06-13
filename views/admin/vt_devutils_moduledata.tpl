[{include file=$oViewConf->getModulePath("vt-devutils","views/admin/vt_devutils__header.tpl")}]

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
                [{$oView->getModuleFiles()|var_dump}]
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

