{$tvServices = {tv name=servicesList}}

{if $tvServices}

    {$servicesList = explode('||', $tvServices)}

    {$params = [
        'where' => [
            'id:IN' => $servicesList
        ]
    ]}

    {else}
    {$params = [
        'parent'    => 3,
        'limit'     => 2,
        'sort'      => 'RAND()'
    ]}

{/if}

{processor action="site/web/resources/getdata" ns="modxsite" params=$params assign=result}

{if $result.success && $result.count > 0}
    <div class="grid widget__services section--service">
        {foreach $result.object as $object}
            <div class="grid__cell s12 m12 l12">
                <div class="card-wrapper">
                    <div class="card card--service">
                        <div class="card-content">
                            <span class="card-title"><a href="{$object.uri}">{$object.pagetitle}</a></span>
                            <p>{$object.tvs.shortDescription.value} <a href="{$object.uri}">Подробнее</a></p>
                        </div>
                        <div class="card-action left-align">
                            <span class="service--cost">Стоимость: {if $object.tvs.startCost.value == 1}от {/if}{$object.tvs.cost.value|default:0|number_format:0:",":" "} руб</span>
                            <a data-service-title="{$object.pagetitle}" data-service-start-cost="{$object.tvs.startCost.value|default:0}" data-service-cost="{$object.tvs.cost.value|default:0}" href="#modal-service" class="btn waves-effect waves-light right modal-trigger">Заказать</a>
                        </div>
                    </div>
                </div>
            </div>
        {/foreach}
    </div>
{/if}