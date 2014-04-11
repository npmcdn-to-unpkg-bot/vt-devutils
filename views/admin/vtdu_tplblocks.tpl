[{include file=$oViewConf->getModulePath("vt-devutils","views/admin/_vtdu_header.tpl")}]
<div class="container">

    [{foreach from=$oView->getTplBlocks() key="module" item="blocks"}]

    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">[{$module}]</h4>
        </div>
        <div class="panel-body">
            <form action="" methid="POST" class="inline-form">
            <table class="table table-striped">
                <colgroup>
                    <col width="200" />
                    <col width="220" />
                    <col width="220" />
                    <col width="*" />
                    <col width="25" />
                </colgroup>
                <thead>
                <tr>
                    <th>module</th>
                    <th>template</th>
                    <th>block</th>
                    <th colspan="2">file</th>
                </tr>
                </thead>
                <tbody>
                [{foreach from=$blocks item="block"}]
                <tr>
                    <td rel="oxmodule">[{$block->oxmodule}]</td>
                    <td rel="oxtemplate">[{$block->oxtemplate}]</td>
                    <td rel="oxblockname">[{$block->oxblockname}]</td>
                    <td rel="oxfile"><input type="text" name="" value="[{$block->oxfile}]" readonly/></td>
                    <td></td>
                </tr>
                [{/foreach}]
                </tbody>
            </table>
            </form>
        </div>
    </div>

    [{/foreach}]

</div>
[{include file=$oViewConf->getModulePath("vt-devutils","views/admin/_vtdu_footer.tpl")}]

