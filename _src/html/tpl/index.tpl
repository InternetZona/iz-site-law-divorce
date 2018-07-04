<!DOCTYPE html>
<html lang="{config name=cultureKey}">
<head>
    {snippet name="MetaX@MetaX"}
    <title>{field name=longtitle}</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <!-- Core stylesheet file -->
    <link type="text/css" rel="stylesheet" href="{$template_url}css/style.min.css?{filemtime(MODX_BASE_PATH|cat:$template_url|cat:'css/style.min.css')}"  media="screen, projection" />
    <link type="text/css" rel="stylesheet" href="{$template_url}css/izstyle.css?{filemtime(MODX_BASE_PATH|cat:$template_url|cat:'css/izstyle.css')}" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body class="page page--sticky-footer">

    {block name=page}
        {$smarty.block.child}
    {/block}

    <div class="scroller">
        <a href="#" class="scroller__item btn-floating btn-large btn-flat btn-small waves-effect waves-light">
            <i class="material-icons">keyboard_arrow_up</i>
        </a>
    <div>

    <!-- Core javascript file -->
    <script async src="{$template_url}js/app.min.js?{filemtime(MODX_BASE_PATH|cat:$template_url|cat:'js/app.min.js')}"></script>
</body>
</html>