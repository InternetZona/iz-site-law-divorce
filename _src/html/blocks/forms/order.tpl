{$key = rand()}
<form name="order" class="form form--order">
    <input type="hidden" name="action" value="form">
    <input type="hidden" name="service" value="{field name=id}">
    <div class="row">
        <div class="input-field col s12">
            <input id="name-{$key}" type="text" name="username">
            <label for="name-{$key}">Ваше имя</label>
        </div>
        <div class="input-field col s12 m6 l12">
            <input id="email-{$key}" type="email" name="email" class="require-group">
            <label for="email-{$key}">Электронная почта</label>
        </div>
        <div class="input-field col s12 m6 l12">
            <input id="phone-{$key}" type="tel" name="phone" class="require-group">
            <label for="phone-{$key}">Телефон</label>
        </div>
        <div class="input-field col s12">
            <textarea id="comment-{$key}" class="materialize-textarea" name="comment"></textarea>
            <label for="comment-{$key}">Комментарий</label>
        </div>
        <div class="input-field col s12">
            <p>
                <label>
                    <input type="checkbox" class="filled-in" name="confirm" value="1"/>
                    <span class="small">Даю согласие на использование, обработку и хранение персональных данных.</span>
                </label>
            </p>
        </div>
    </div>
    <div class="center-align">
        <button type="submit" class="btn waves-effect waves-light">Отправить</button>
    </div>
</form>