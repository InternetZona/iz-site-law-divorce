{extends file="page.tpl"}

{block name=content}
    <div class="container">
        <h1>
            {field name=pagetitle}
        </h1>
        <div class="row">
            <div class="col l8">
                <div class="page__content">
                    {field name=content}
                </div>
            </div>
            <div class="col l4">
                <aside>
                    <div class='h5'>Услуги</div>
                    {include file="blocks/widgets/service.tpl" }
                </aside>
            </div>
        </div>
    </div>
    {include file="blocks/widgets/blog.tpl"}
{/block}

{block name=modals append}
    {include file="blocks/modals/service.tpl"}
{/block}