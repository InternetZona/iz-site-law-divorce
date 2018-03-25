{extends file="page.tpl"}

{block name=content append}
    {$tvFeatured = {tv name=featured}|json_decode:true|array_slice:-3}

    {if is_array($tvFeatured)}
        <div class="section-wrapper no-bottom-margin">
            <section class="section section--style-zigzag" style="margin-bottom: 0;">
                <div class="container">
                    <div class="section__title">
                        Наши преимущества
                    </div>
                    <div class="section__content">
                        {include file="blocks/sections/featured/index.tpl" featured=$tvFeatured}
                    </div>
                </div>
            </section>
        </div>
    {/if}
{/block}