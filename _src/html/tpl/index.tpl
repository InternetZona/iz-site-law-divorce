<!DOCTYPE html>
<html lang="{config name=cultureKey}">
<head>
    {snippet name="MetaX@MetaX"}
    <title>{field name=longtitle}</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <!-- Core stylesheet file -->
    <link type="text/css" rel="stylesheet" href="{$template_url}css/style.min.css?{filemtime(MODX_BASE_PATH|cat:$template_url|cat:'css/style.min.css')}"  media="screen, projection" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body class="page page--sticky-footer">

    {block name=page}
        {$smarty.block.child}
    {/block}

    <!-- Core javascript file -->
    <script async src="{$template_url}js/app.min.js?{filemtime(MODX_BASE_PATH|cat:$template_url|cat:'js/app.min.js')}"></script>
</body>
</html>