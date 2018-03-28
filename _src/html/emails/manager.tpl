{extends file="emails/default.tpl"}

{block name=body}

    {block name=message}{/block}

    {block name=sender}
        <p>Данные отправителя:</p>
        <ul style="list-style:none;">
            {if $properties.username}
                <li><strong>Имя отправителя:</strong> {$properties.username}</li>
            {/if}
            {if $properties.phone}
                <li><strong>Телефон:</strong> {$properties.phone}</li>
            {/if}
            {if $properties.email}
                <li><strong>E-mail:</strong> {$properties.email}</li>
            {/if}
        </ul>
    {/block}

{/block}