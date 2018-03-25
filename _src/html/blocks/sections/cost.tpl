<div class="card card--alert">
    <div class="card-content">
        <div class="row" style="margin:0;">
            <div class="col s12 l9">
                <span>Стоимость: <span>{if {tv name=startCost} == 1}от {/if}{{tv name=cost}|default:0|number_format:0:",":" "}</span> рублей</span>
            </div>
            <div class="col s12 l3">
                <a href="#order" class="btn scrollable">Заказать</a>
            </div>
        </div>
    </div>
</div>