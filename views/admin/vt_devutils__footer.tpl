<script src="//cdn.jsdelivr.net/foundation/5.3.0/js/vendor/jquery.js"></script>
<script src="//cdn.jsdelivr.net/angular.all/1.3.0-beta.13/angular-all.min.js"></script>
<script src="//cdn.jsdelivr.net/foundation/5.3.0/js/foundation.min.js"></script>
<script src="//cdn.jsdelivr.net/jquery.wookmark/1.4.5/jquery.wookmark.min.js"></script>
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

    $(".fa-refresh").on("click",function() { $(this).addClass("fa-spin"); });

</script>
[{ oxscript }]
</body>
</html>