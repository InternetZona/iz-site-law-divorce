{extends file="emails/manager.tpl"}

{block name=message}
    <p>Сообщение от посетителя сайта:</p>
    <p>{$properties.comment|default:'Сообщение отсутствует.'}</p>
{/block}