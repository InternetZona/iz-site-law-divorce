{extends file="page.tpl"}

{block name=content append}
    <section class="section section--contacts">
        <div class="container">
            <div class="section__content">
                <div class="row">
                    <div class="col s12 m5 xl6">
                        <ul class="list list--contacts">
                            <li class="list__item list__item--icon">
                                <i class="icon-phone"></i>
                                <a href="tel:[[++site.phone:strip]]">[[++site.phone]]</a>
                            </li>
                            <li class="list__item list__item--icon">
                                <i class="icon-mail-alt"></i>
                                <a href="mailto:[[++emailsender]]">[[++emailsender]]</a>
                            </li>
                            <li class="list__item list__item--icon">
                                <i class="icon-location"></i>
                                Адрес офиса
                                <span>[[++site.address]]</span>
                            </li>
                            <li class="list__item list__item--icon">
                                <i class="icon-clock"></i>
                                Время работы
                                <span>[[++site.worktime]]</span>
                            </li>
                        </ul>
                    </div>
                    <div class="col s12 m7 xl6">
                        <div class="form-wrapper">
                            {include file="blocks/forms/feedback.tpl"}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div id="yandex-map" style="height: 400px;" class="no-bottom-margin"></div>
{/block}