{extends file="page.tpl"}

{block name=content}
    <div class="container">
        <h1>
            {field name=pagetitle}
        </h1>
        <div class="page__content">
            {field name=content}
        </div>

        {$tvPrices = {tv name=prices}|json_decode:true}

        {if is_array($tvPrices)}
            <div class="card">
                <div class="card-content">
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
                                <td>
                                    {if $data.pageId}

                                        <a href="{$modx->makeUrl($data.pageId)}">{$data.name}</a>

                                        {else}

                                        {$data.name}

                                    {/if}
                                </td>
                                <td>{if $data.min}от {/if}{$data.cost|number_format:0:",":" "}</td>
                            </tr>
                        {/foreach}
                        </tbody>
                    </table>
                </div>
            </div>
        {/if}

    </div>
{/block}