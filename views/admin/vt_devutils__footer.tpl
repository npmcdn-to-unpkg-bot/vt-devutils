<script src="[{$oViewConf->getModuleUrl("vt-devutils","out/src/js/jquery-2.1.1.min.js")}]"></script>
<script src="[{$oViewConf->getModuleUrl("vt-devutils","out/src/js/foundation.min.js")}]"></script>
<script src="[{$oViewConf->getModuleUrl("vt-devutils","out/src/js/jquery.wookmark.min.js")}]"></script>
<script type="text/javascript">
    $(document).foundation();

    var options = {
        autoResize: true, // This will auto-update the layout when the browser window is resized.
        container: $('#magicgrid'), // Optional, used for some extra CSS styling
        offset: 0, // Optional, the distance between grid items
        outerOffset: 0, // Optional the distance from grid to parent
        flexibleWidth: (window.innerWidth >= 1300) ? '50%' : '100%' // Optional, the maximum width of a grid item
    };
    var $grid = $('#magicgrid li');
    $grid.wookmark(options);

    $(window).resize(function () {
        var newOptions = {flexibleWidth: (window.innerWidth >= 1300) ? '50%' : '100%'};
        if(newOptions.flexibleWidth != options.flexibleWidth)
        {
            options.flexibleWidth = newOptions.flexibleWidth;
            //console.log(newOptions.flexibleWidth)
            $grid.wookmark(newOptions);
        }
    });

</script>
[{ oxscript }]
</body>
</html>