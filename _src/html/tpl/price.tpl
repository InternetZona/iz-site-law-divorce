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
        {/if}

    </div>
{/block}