[{include file=$oViewConf->getModulePath("vt-devutils","views/admin/vt_devutils__header.tpl")}]
<div class="container">
    <div class="row log">
        <h1 class="">exception log
            [{if $exLog}]
                <small><a href="[{ $oViewConf->getSelfLink()|oxaddparams:" cl=vtdu_logs&fnc=restartExceptionLog" }]" title="rename log file so the shop will start new one">restart log</a></small>
            [{/if}]
        </h1>
        [{if $exLogMsg}]<p class="text-[{$exLogMsg->type}]">[{$exLogMsg->text}]</p>[{/if}]
        [{if $exLog}]
            <div class="panel-group" id="exceptionlog">
                [{foreach from=$exLog item=ex name=exlog}]
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#exceptionlog" href="#exception[{$smarty.foreach.exlog.iteration}]">
                                    [{$ex->header}]
                                </a>
                            </h4>
                        </div>
                        <div id="exception[{$smarty.foreach.exlog.iteration}]" class="panel-collapse collapse [{if $smarty.foreach.exlog.last}]in[{/if}]">
                            <div class="panel-body">
                                <pre class="pre-scrollable">[{$ex->text}]</pre>
                            </div>
                        </div>
                    </div>
                [{/foreach}]
            </div>
        [{/if}]
    </div>

    [{if $errLog}]
        <div class="row log">
            <h1 class="">webserver error log
                [{if $errLog}]
                    <small><a href="[{ $oViewConf->getSelfLink()|oxaddparams:" cl=vtdu_logs&fnc=restartErrorLog" }]" title="rename log file so the server will start new one">restart log</a></small>
                [{/if}]
            </h1>
            [{if $errLogMsg}]<p class="text-[{$errLogMsg->type}]">[{$errLogMsg->text}]</p>[{/if}]
            [{if $errLog}]
                <table class="table table-bordered table-striped table-condensed">
                    [{foreach from=$errLog item=log}]
                        <tr style="margin-top: 5px;">
                            <th>[{$log->date}]</th>
                            <th>[{$log->type}]</th>
                            <th>[{$log->client}]</th>
                        </tr>
                        <tr class="[{$log->type}]">
                            <td colspan="3">[{$log->text}]</td>
                        </tr>
                    [{/foreach}]
                </table>
            [{/if}]
        </div>
    [{/if}]

    [{if $SqlLog}]
        <div class="col-xs-12 col-md-6 log">
            <h2 class="text-center">MySQL log</h2>
            <table class="table table-striped">
                …
            </table>
            [{$SqlLog}]
        </div>
    [{/if}]
    [{if $MailLog}]
        <div class="col-xs-12 col-md-6 log">
            <h2>mail log</h2>
            <hr/>
            [{$MailLog}]
        </div>
    [{/if}]
</div>

[{include file=$oViewConf->getModulePath("vt-devutils","views/admin/vt_devutils__footer.tpl")}]
