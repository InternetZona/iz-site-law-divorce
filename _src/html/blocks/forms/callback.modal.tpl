{$key = rand()}

<form name="feedback" class="form form--feedback">
    <input type="hidden" name="action" value="form">
    <input type="hidden" name="comment" value="Заказ обратного звонка. (Услуга: {field name=pagetitle}).">
    <div class="row">
        <div class="input-field col s12 m6">
            <input id="name-{$key}" type="text" name="username">
            <label for="name-{$key}">Ваше имя</label>
        </div>
        <div class="input-field col s12 m6">
            <input id="phone-{$key}" type="tel" name="phone" class="require-group">
            <label for="phone-{$key}">Телефон</label>
        </div>
        <div class="input-field col s12">
            <p>
                <label>
                    <input type="checkbox" class="filled-in" name="confirm" value="1" />
                    <span class="small">Даю согласие на использование, обработку и хранение персональных данных.</span>
                </label>
            </p>
        </div>
    </div>
    <div class="center-align">
        <button type="submit" class="btn waves-effect waves-light">Отправить</button>
    </div>
</form>