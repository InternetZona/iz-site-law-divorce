{extends file="tpl/index.tpl"}

{block name=page}

    <div class="page__main-box">
        <div class="header-wrapper">
            {include file="blocks/header.tpl"}
            {include file="blocks/navbar.tpl"}
        </div>

        {block name=content}
            <div class="container">
                <h1>
                    {field name=pagetitle}
                </h1>
                <div class="page__content">
                    {field name=content}
                </div>
            </div>
        {/block}
    </div>

    {include file="blocks/footer.tpl"}
    {include file="blocks/modals.tpl"}
    {include file="blocks/scripts.tpl"}

{/block}
