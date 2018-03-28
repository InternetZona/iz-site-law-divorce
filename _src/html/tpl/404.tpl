{extends file="page.tpl"}


{block name=content}
            <div class="container center-align">
                <div class="h1" style="margin-top: 100px;">
                    {field name=pagetitle}
                </div>
                <div class="page__content">
                    {field name=content}
                </div>
                <a href="[[+site_url]]" class="btn btn-large waves-effect">На главную</a>
            </div>
        {/block}