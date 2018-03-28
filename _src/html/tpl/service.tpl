{extends file="page.tpl"}

{block name=content}
    <div class="section-wrapper">
        <section class="section section--intro">
            <div class="container">
                <div class="grid" style="margin-bottom: 0;">
                    <div class="grid__cell s12 m12 l7 xl8">
                        <h1>{field name=pagetitle}</h1>
                        <div class="section__content">
                            <p>
                                {field name=introtext}
                            </p>
                            {include file="blocks/sections/cost.tpl"}

                        </div>
                    </div>
                    {snippet name="phpthumbof" params=[
                    "input" => "{$template_url}images/peoples/w01.png",
                    "options" => "&w=480&h=640&zc=0&aoe=0&far=0&q=70"
                    ] assign=thumb}
                    <div class="section__cell--bg grid__cell l5 xl4 hide-on-med-and-down" style="background-image:url({$thumb});"></div>
                </div>
            </div>
        </section>
    </div>

    <div class="container">
        <div class="page__content">
            {field name=content}
        </div>
    </div>

    {assign var=params value=[
        'id'    => 7,
        'current'   => true,
        'cache'     => true
    ]}

    {processor action="site/web/resources/getdata" ns="modxsite" params=$params assign=result}

    {if $result.success && $result.count > 0}
        {$tvFeatured = $result.object.tvs.featured.value|json_decode:true|array_slice:-3}

        {if is_array($tvFeatured)}
            <div class="section-wrapper">
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
    {/if}

    <div class="section-wrapper grey-lighten section--form no-bottom-margin">
        <section class="section section--order section--inverse section--style-doublediagonal">
            <div id="order" class="container">
                <div class="row">
                    <div class="col s12 l6">
                        <div class="section__title section__title--left section__title--margined-2">
                            {tv name=titleOrderBlock}
                        </div>
                        <div class="section__content">
                            <div class="page__content">
                                {tv name=descriptionOrderBlock}
                            </div>
                        </div>
                    </div>

                    <div class="col s12 push-l1 l5">
                        <div class="form-wrapper form-wrapper--order-form">
                            {include file="blocks/forms/order.tpl"}
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
{/block}