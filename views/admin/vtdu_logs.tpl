[{include file=$oViewConf->getModulePath("vt-devutils","views/admin/_vtdu_header.tpl")}]

<div class="row">
    [{if $ExLog}]
    <div class="col-xs-12 col-md-6 log">
        <h2 class="text-center">exception log
            <small><a href="[{ $oViewConf->getSelfLink()|oxaddparams:" cl=vtdu_logs&fnc=restartExceptionLog" }]" title="rename log file so the shop will start new one">restart log</a></small>
        </h2>
        [{if $exLogRestart}]<p class="text-success">[{oxmultilang ident="VTDU_LOGS_EXLOGRESTART"}][{ $exLogRestart }]</p>[{/if}]
        [{if $exLogEmpty}]<p class="text-error">[{oxmultilang ident="VTDU_LOGS_EXLOGEMPTY"}]</p>[{/if}]
        <div class="accordion" id="exceptionlog">
            [{foreach from=$ExLog item=ex name=exlog}]
            <div class="accordion-group">
                <div id="exception[{$smarty.foreach.exlog.iteration}]" class="accordion-body collapse [{if $smarty.foreach.exlog.last}]in[{/if}]">
                    <pre class="accordion-inner">[{$ex->text}]</pre>
                </div>
                <div class="accordion-heading">
                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#exceptionlog" href="#exception[{$smarty.foreach.exlog.iteration}]">
                        [{$ex->header}]
                    </a>
                </div>
            </div>
            [{/foreach}]
        </div>
    </div>
    [{/if}]

    [{if $SrvErrLog}]
    <div class="col-xs-12 col-md-6 log">
        <h2 class="text-center">webserver error log
            <small><a href="[{ $oViewConf->getSelfLink()|oxaddparams:" cl=vtdu_logs&fnc=restartSrvErrLog" }]" title="rename log file so the server will start new one">restart log</a></small>
        </h2>
        [{if $srvErrLogRestart}]<p class="text-success">[{oxmultilang ident="VTDU_LOGS_SRVERRLOGRESTART"}][{ $exLogRestart }]</p>[{/if}]
        [{if $srvErrLogEmpty}]<p class="text-error">[{oxmultilang ident="VTDU_LOGS_SRVERRLOGEMPTY"}]</p>[{/if}]
        <table class="table table-striped table-condensed">
            [{foreach from=$SrvErrLog item=log}]
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


[{include file=$oViewConf->getModulePath("vt-devutils","views/admin/_vtdu_footer.tpl")}]
