{$key = rand()}
<div class="section__title section__title--styled margin30"><span>Задать вопрос юристу</span></div>
<form name="feedback" class="form form--feedback">
    <input type="hidden" name="action" value="form">
    <div class="row">
        <div class="input-field col s12">
            <textarea id="comment-{$key}" class="materialize-textarea" name="comment"></textarea>
            <label for="comment-{$key}">Вопрос</label>
        </div>
        <div class="input-field col s12 l6">
            <input id="email-{$key}" type="email" name="email" class="require-group">
            <label for="email-{$key}">Электронная почта</label>
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
        <button type="submit" class="btn waves-effect waves-light">Задать вопрос</button>
    </div>
</form>