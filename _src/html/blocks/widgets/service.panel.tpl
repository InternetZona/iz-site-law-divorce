<div class="row">
    <div class="col s12 m6 l4">
        <div class="card card--service-panel">
            <div class="card-content">
                <span class="card-title"><span>{field name=pagetitle}</span></span>
                <p><span class="service--cost text--bold">{if {tv name=startCost} == 1}от {/if}{{tv name=cost}|default:0|number_format:0:",":" "} руб</span></p>
            </div>
            <div class="card-action center-align">
                <a data-service-id="{field name=id}" href="#modal-service" class="btn text--bold waves-effect waves-light modal-trigger">Заказать</a>
            </div>
        </div>
    </div>

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
        {$i = 0}
        {foreach $result.object as $object}
            <div class="col s12 m6 l4 {if !$i}hide-on-med-and-down{/if}">
                <div class="card card--service-panel">
                    <div class="card-content">
                        <span class="card-title"><span>{$object.pagetitle}</span></span>
                        <p><span class="service--cost text--bold">{if $object.tvs.startCost.value == 1}от {/if}{$object.tvs.cost.value|default:0|number_format:0:",":" "} руб</span></p>
                    </div>
                    <div class="card-action center-align">
                        <a data-service-id="{$object.id}" href="#modal-service" class="btn text--bold waves-effect waves-light modal-trigger">Заказать</a>
                    </div>
                </div>
            </div>
            {$i = $i + 1}
        {/foreach}
    {/if}

</div>