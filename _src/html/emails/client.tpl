{extends file="emails/default.tpl"}

{block name=body}

    {block name=message}
        <p>Спасибо за обращение!</p>
        <p>Ваша заявка получена. В ближайшее время с вами свяжется наш юрист.</p>
    {/block}

    {block name=contacts}
        <p>
            ---<br>
            С уважением,<br>
            Компания Юрпрофит</p>
        <ul style="list-style:none; padding: 0; margin: 0;">
            <li>Телефон: 8 495 782-59-83</li>
            <li>Сайт: <a href="https://razvody-urprofit.ru">razvody-urprofit.ru</a></li>
        </ul>
    {/block}

{/block}