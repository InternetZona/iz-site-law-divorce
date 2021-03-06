{assign var=params value=[
'parent'    => 6,
'where'    => [
    'id:!=' => $modx->resource->id
],
'limit'     => 3,
'sort'      => 'publishedon',
'dir'       => 'DESC'
]}

{processor action="site/web/resources/getdata" ns="modxsite" params=$params assign=result}

{if $result.success && $result.count > 0}
    <div class="section-wrapper" style="margin-bottom: 0;">
        <section id="blog" class="section section--blog section--style-zigzag" style="margin-bottom: 0;">
            <div class="container">
                <div class="section__title section__title--styled">
                    <span>Статьи</span>
                </div>
                <div class="section__content">
                    <div class="grid">
                        {$i = -1}
                        {foreach $result.object as $object}
                            <div class="grid__cell s12 m6 l4 {if $i > 0}hide-on-med-and-down{/if}" style="margin-bottom: 20px;">
                                <div class="card card--blog">
                                    <div class="card-image">
                                        <a href="{$object.uri}" class="center-block">
                                            {snippet name="phpthumbof" params=[
                                            "input" => {$object.tvs.image.value},
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
                            {$i = $i + 1}
                        {/foreach}
                    </div>
                </div>

            </div>
        </section>
    </div>
{/if}