<div class="row">

    {$i = -1}
    {foreach $featured as $data}
        <div class="col s12 m6 l4 {if $i > 0}hide-on-med-only{/if}">
            <div class="card z-depth-0 featured">
                <div class="card-image waves-effect waves-block waves-light">
                    <div class="effect effect__sonar">
                        {snippet name="phpthumbof" params=[
                        "input" => $data.icon,
                        "options" => "&w=150&h=150&zc=1&aoe=0&far=0&q=70"
                        ] assign=thumb}
                        <img class="image image--original image--rounded image--centered" src="{$thumb}">
                    </div>
                </div>
                <div class="card-content card-content--size-xs">
                    <span class="card-title grey-text text-darken-4">{$data.title}</span>
                    <p class="center-align">{$data.description}</p>
                </div>
            </div>
        </div>
        {$i= $i + 1}
    {/foreach}
</div>