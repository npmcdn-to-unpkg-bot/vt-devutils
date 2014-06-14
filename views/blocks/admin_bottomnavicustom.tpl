[{$smarty.block.parent}]
[{if $oViewConf->getActiveClassName() == "module_main" }]
	<form id="devutils" name="devutils" action="[{ $oViewConf->getSelfLink() }]" method="post">
		[{ $oViewConf->getHiddenSid() }]
		<input type="hidden" name="oxid" value="[{ $oModule->getInfo('id') }]">
		<input type="hidden" name="cl" value="[{ $oView->getClassName() }]">
	    <li><button type="submit" name="fnc" style="padding: 0px 6px; margin-top: 0px;" value="resetModuleExtends">reset module extends</button></li>
        <li><button type="submit" name="fnc" style="padding: 0px 6px; margin-top: 0px;" value="resetModuleFiles">reset module files</button></li>
        <li><button type="submit" name="fnc" style="padding: 0px 6px; margin-top: 0px;" value="resetModuleSettings">reset module settings</button></li>
        <li><button type="submit" name="fnc" style="padding: 0px 6px; margin-top: 0px;" value="resetModuleTemplates">reset module templates</button></li>
        <li><button type="submit" name="fnc" style="padding: 0px 6px; margin-top: 0px;" value="resetTemplateBlocks">reset template blocks</button></li>
    </form>
[{/if}]
[{if $message}]<script>console.log("[{$message}]");</script>[{/if}]