<!DOCTYPE html>
<html lang="en">
<head>
    <title>vt DevUtils 2</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" media="screen" href="[{$oViewConf->getModuleUrl('vt-devutils','out/css/bootstrap.min.css') }]">
    <link rel="stylesheet" media="screen" href="[{$oViewConf->getModuleUrl('vt-devutils','out/css/bootstrap-theme.min.css') }]">
    <link rel="stylesheet" media="screen" href="[{$oViewConf->getModuleUrl('vt-devutils','out/css/vt-devutils.css') }]?[{$smarty.now}]">
</head>
<body>
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
                    <td>modul</td>
                    <td>template</td>
                    <td>block</td>
                    <td colspan="2">file</td>
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

<script src="[{$oViewConf->getModuleUrl("vt-devutils","out/js/jquery-1.9.1.js")}]"></script>
<script src="[{$oViewConf->getModuleUrl("vt-devutils","out/js/bootstrap.min.js")}]"></script>
<script src="[{$oViewConf->getModuleUrl("vt-devutils","out/js/jquery.noty.js")}]"></script>
<script src="[{$oViewConf->getModuleUrl("vt-devutils","out/js/jquery.noty.center.js")}]"></script>
<script src="[{$oViewConf->getModuleUrl("vt-devutils","out/js/jquery.noty.default.js")}]"></script>
<script type="text/javascript">
    $(document).ready(function () {

    });
</script>


</body>
</html>
