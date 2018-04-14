{extends file="page.tpl"}

{block name=content}

    <div class="section-wrapper">
        <section class="section section--intro">
            <div class="container">
                <div class="grid" style="margin-bottom: 0;">
                    <div class="grid__cell s12 m12 l7 xl8">
                        <h1>{field name=pagetitle}</h1>
                        <div class="section__content">
                            <div class="page__content">
                                {field name=content}
                            </div>

                        </div>
                    </div>
                    {snippet name="phpthumbof" params=[
                    "input" => {tv name=image},
                    "options" => "&w=480&h=640&zc=0&aoe=0&far=0&q=70"
                    ] assign=thumb}
                    <div class="section__cell--bg grid__cell l5 xl4 hide-on-med-and-down" style="background-image:url({$thumb});"></div>
                </div>
            </div>
        </section>
    </div>

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