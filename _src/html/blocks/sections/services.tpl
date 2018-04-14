{assign var=params value=[
    'parent'    => 3,
    'cache' => true
]}
{processor action="site/web/resources/getdata" ns="modxsite" params=$params assign=result}

{if $result.success && $result.count > 0}

    <div class="section-wrapper">
        <section id="services" class="section grey-lighten section--service section--style-zigzag no-bottom-margin">
            <div class="container">
                <div class="section__title section__title--styled">
                    <span>Услуги</span>
                </div>
                <div class="section__content">
                    <div class="grid no-bottom-margin">
                        {foreach $result.object as $object}
                            <div class="grid__cell s12 l6">
                                <div class="card-wrapper">
                                    <div class="card card--service">
                                        <div class="card-content">
                                            <span class="card-title"><a href="{$object.uri}">{$object.pagetitle}</a></span>
                                            <p>{$object.introtext} <a href="{$object.uri}">Подробнее</a></p>
                                        </div>
                                        <div class="card-action left-align">
                                            <a data-service-id="{$object.id}" href="#modal-service" class="btn waves-effect waves-light right modal-trigger">Заказать</a>
                                            <span class="action--text">Стоимость: </span><span class="service--cost">{if $object.tvs.startCost.value == 1}от {/if}{$object.tvs.cost.value|default:0|number_format:0:",":" "} руб</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                    </div>
                </div>
            </div>
        </section>
    </div>
{/if}