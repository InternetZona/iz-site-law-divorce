{extends file="page.tpl"}

{block name=content}
    <section class="section section--blog">
        <div class="container">
            <h1>{field name=pagetitle}</h1>
            <div class="section__content">
                {assign var=params value=[
                    'parent'    => $modx->resource->id,
                    'getPage'   => true,
                    'page'      => $smarty.get.page|default:0,
                    'sort'      => 'publishedon',
                    'dir'       => 'DESC'
                ]}

                {processor action="site/web/resources/getdata" ns="modxsite" params=$params assign=result}

                {if $result.success && $result.total > 0}
                    <div class="grid">

                        {foreach $result.object as $object}
                            <div class="grid__cell s12 m6 l4">
                                <div class="card card--blog">
                                    <div class="card-image">
                                        <a href="{$object.uri}" class="center-block">
                                            {snippet name="phpthumbof" params=[
                                                "input" => $object.tvs.image.value,
                                                "options" => "&w=360&h=240&zc=0&aoe=0&far=0&q=70"
                                            ] assign=thumb}
                                            <img src="{$thumb}" class="responsive-img" />
                                        </a>
                                    </div>
                                    <div class="card-content">
                                        <span class="card-title">
                                            <a href="{$object.uri}">{$object.pagetitle}</a>
                                        </span>
                                        <p>{$object.introtext}</p>
                                    </div>
                                </div>
                            </div>
                        {/foreach}

                    </div>

                    <div claas="text-center">
                        [[+page.nav]]
                    </div>

                {/if}
            </div>
        </div>
    </section>
{/block}