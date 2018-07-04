{extends file="page.tpl"}

{block name=content}
    <section class="section section--info">
        <div class="container">
            <div class="section__grid grid">
                <div class="grid__cell s12 m12 l7 xl8">
                    <h1>{field name=pagetitle}</h1>
                    <div class="section__content page__content">
                        {field name=content}
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

    {include file="blocks/sections/services.tpl"}

    {include file="blocks/sections/price.tpl"}

    <section class="section section--price grey-lighten">
        <div class="container">
            <div class="card z-depth-3">
                <div class="card-content">
                    <div class="table-wrapper">
                        <div class="section__title">Схема работы</div>
                        <div class="grid no-bottom-margin">
                        {tv name=scheme_of_work}
                        </div>
                    </div>
                </div>
            </div>
            </div>
    </section>

    {include file="blocks/sections/aboutus.tpl"}

    <div class="section-wrapper grey-lighten section--form">
        <section class="section section--order section--inverse section--style-doublediagonal">
            <div class="container">
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

    {include file="blocks/sections/testimonials.tpl"}

    {include file="blocks/sections/portfolio.tpl"}

    {include file="blocks/sections/blog.tpl"}

    {include file="blocks/sections/contacts.tpl"}
{/block}

{block name=modals append}
    {include file="blocks/modals/service.tpl"}
{/block}
