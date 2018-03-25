{assign var=params value=[
    'id'    => 7,
    'current'   => true,
    'cache'     => true
]}

{processor action="site/web/resources/getdata" ns="modxsite" params=$params assign=result}

{if $result.success && $result.count > 0}
    {$object = $result.object}

    <section id="{$object.link_attributes}" class="section section--about">
        <div class="container">
            <div class="section__title section__title--styled">
                <span>{$object.pagetitle}</span>
            </div>
            <div class="section__content">
                {$tvFeatured = $object.tvs.featured.value|json_decode:true|array_slice:-3}

                {if is_array($tvFeatured)}
                    {include file="blocks/sections/featured/index.tpl" featured=$tvFeatured}
                {/if}
            </div>

            {include file="blocks/buttons/viewmore.tpl" title="О нас подробнее" uri=$object.uri}

        </div>
    </section>
{/if}