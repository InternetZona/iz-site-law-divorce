{extends file="emails/manager.tpl"}

{block name=message}
    <p>Заказ услуги от посетителя сайта.</p>
    {if $properties.service}
        {if $object = $modx->getObject('modResource', $properties.service)}
            <ul style="list-style: none;">
                <li><strong>Услуга: </strong>{$object.pagetitle}</li>
            </ul>
        {/if}
    {/if}
    {if $properties.comment}
        <p>Комментарий к заказу:</p>
        <p>{$properties.comment|default:'Сообщение отсутствует.'}</p>
    {/if}
{/block}