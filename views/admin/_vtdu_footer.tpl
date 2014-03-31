<script src="[{$oViewConf->getModuleUrl("vt-devutils","out/js/jquery-1.9.1.js")}]"></script>
<script src="[{$oViewConf->getModuleUrl("vt-devutils","out/js/bootstrap.min.js")}]"></script>
<script src="[{$oViewConf->getModuleUrl("vt-devutils","out/js/jquery.noty.js")}]"></script>
<script src="[{$oViewConf->getModuleUrl("vt-devutils","out/js/jquery.noty.center.js")}]"></script>
<script src="[{$oViewConf->getModuleUrl("vt-devutils","out/js/jquery.noty.default.js")}]"></script>
<script type="text/javascript">
    $(document).ready(function () {

        [{if $scripts}][{$scripts}][{/if}]
    });
</script>


</body>
</html>