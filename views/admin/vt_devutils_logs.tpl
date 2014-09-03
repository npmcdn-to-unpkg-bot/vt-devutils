[{include file=$oViewConf->getModulePath("vt-devutils","views/admin/vt_devutils__header.tpl")}]
<ul class="column small-block-grid-1 [{if $errLog}]large-block-grid-2[{/if}]">
    <li class="log">
        <div class="icon-bar five-up">
            <h2 class="icon-bar-title">shop exceptions</h2>
            <a href="[{ $oViewConf->getSelfFncLink("clearExceptionLog")}]"   class="item" title="clear exception log">
                <i class="fa fa-trash-o"></i>
                <label>clear log</label>
            </a>
            <a href="[{ $oViewConf->getSelfFncLink("restartExceptionLog")}]" class="item">
                <i class="fa fa-scissors"></i>
                <label>backup & restart</label>
            </a>
        </div>
        [{if $exLog}]
            <dl class="accordion" id="exceptionlog" data-accordion>
                [{foreach from=$exLog item=ex name=exlog}]
                    <dd class="accordion-navigation">
                        <a href="#exception[{$smarty.foreach.exlog.iteration}]">[{$ex->header}]</a>
                        <div id="exception[{$smarty.foreach.exlog.iteration}]" class="content [{if $smarty.foreach.exlog.first}]active[{/if}]">
                            <pre>[{$ex->text}]</pre>
                        </div>
                    </dd>
                [{/foreach}]
            </dl>
        [{/if}]
    </li>

    [{if $errLog}]
        <li class="log">
            <div class="icon-bar five-up">
                <h2 class="icon-bar-title">webserver errors</h2>
                <a href="[{ $oViewConf->getSelfFncLink("clearErrorLog")}]"   class="item" title="clear exception log">
                    <i class="fa fa-trash-o"></i>
                    <label>clear log</label>
                </a>
                <a href="[{ $oViewConf->getSelfFncLink("restartErrorLog")}]" class="item">
                    <i class="fa fa-scissors"></i>
                    <label>backup & restart</label>
                </a>
            </div>
            [{if $errLog}]
                <table>
                    <tbody>
                    [{foreach from=$errLog item=log}]
                    <tr>
                        <th>[{$log->date}]</th>
                        <th>[{$log->type}]</th>
                        <th class="text-right">[{$log->client}]</th>
                    </tr>
                    <tr class="[{$log->type}]">
                        <td colspan="3">[{$log->text}]</td>
                    </tr>
                    [{/foreach}]
                    </tbody>
                </table>
            [{/if}]
        </li>
    [{/if}]

    [{if $SqlLog}]
        <li class="log">
            <h2 class="text-center">MySQL log</h2>
            <table class="table table-striped">
                …
            </table>
            [{$SqlLog}]
        </div>
    [{/if}]
    [{if $MailLog}]
        <li class="log">
            <h2>mail log</h2>
            <hr/>
            [{$MailLog}]
        </li>
    [{/if}]
</ul>

[{include file=$oViewConf->getModulePath("vt-devutils","views/admin/vt_devutils__footer.tpl")}]
