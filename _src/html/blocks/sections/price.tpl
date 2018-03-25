{assign var=params value=[
    'id'    => 2,
    'cache' => true,
    'current'   => true
]}
{processor action="site/web/resources/getdata" ns="modxsite" params=$params assign=result}

{if $result.success && $result.count > 0}
    {$object = $result.object}

    <section id="{$object.link_attributes}" class="section section--price grey-lighten">
        <div class="container">
            <div class="section__title">Прайс-лист</div>
            <div class="section__content">

                {$tvPrices = $object.tvs.prices.value|json_decode:true}

                {if is_array($tvPrices)}

                    <div class="card z-depth-3">
                        <div class="card-content">
                            <div class="table-wrapper">
                                <table class="bordered highlight">
                                    <thead>
                                    <tr>
                                        <th>Услуга</th>
                                        <th>Цена, руб</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    {foreach $tvPrices as $data}
                                        <tr>
                                            <td>{$data.name}</td>
                                            <td>{if $data.min}от {/if}{$data.cost|number_format:0:",":" "}</td>
                                        </tr>
                                    {/foreach}
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                {/if}

                {include file="blocks/buttons/viewmore.tpl" title="Все цены" uri=$object.uri}

            </div>
        </div>
    </section>
{/if}