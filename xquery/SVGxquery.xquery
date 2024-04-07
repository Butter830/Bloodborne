declare option saxon:output "method=html";
declare variable $main := collection("../xml/");
declare variable $attires := $main//attire/attireName;
declare variable $attire-count := $attires => count();
declare variable $keyItems := $main//keyItem/itemName;
declare variable $keyItem-count := $keyItems => count();
declare variable $toolItems := $main//toolItem/itemName ;
declare variable $toolItem-count := $toolItems => count();
declare variable $consumableItems := $main//consumableItem/itemName;
declare variable $consumableItem-count := $consumableItems => count();
declare variable $spellItems := $main//spellItem/itemName;
declare variable $spellItem-count := $spellItems => count();
declare variable $weapons := $main//weapon[.//weaponName];
declare variable $weapon-count := $weapons => count();
declare variable $holyChalices := $main//holyChalices/itemName;
declare variable $holyChalices-count := $holyChalices => count();
declare variable $firearms := $main//firearm/firearmName;
declare variable $firearm-count := $firearms => count();
declare variable $a := " Attires";
declare variable $c := " Caryll Runes";
declare variable $w := " Weapons";
declare variable $f := " Firearms";
declare variable $h := " Holy Chalices";
declare variable $k := " Key Items";
declare variable $t := " Tools";
declare variable $con := "Consumable Items";
declare variable $s := "Spell Items";
declare variable $xspacer := 10;
declare variable $yspacer := 25;

<html>
    <head>
        <title>Item Count</title>
    </head>
    
    <body>
        <h1><u>Item Count in Bloodborne</u></h1>
        <p>This shows just the sheer amount of <em>Items</em> within the game as a fun visual aid!</p>
        <p></p>
            <table>

            {
            

<svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%">
    <g transform="translate(150,100)">
    <g>
    <text x="0" y="-5" font-family="sans-serif" font-size="20px" fill="black">Item Frequency in Bloodborne</text>
    </g>
    <g>
        {
            let $a := " Attires"
            for $keyItems at $pos in $keyItem-count
            let $all-items:= $main/lore/*
            return
                <g>
                <text x="-75" y="{$pos * $yspacer + 5}" font-family="sans-serif" font-size="12px" fill="black">{$k}</text>
                <line x1="0" y1="{$pos * $yspacer}" x2="{$keyItem-count * $xspacer}" y2="{$pos * $yspacer}" stroke="Red" stroke-width="15"/>
                <text x="{$keyItem-count * $xspacer + 10}" y="{$pos * $yspacer + 5}" font-family="sans-serif" font-size="12px" fill="black">{$keyItems}</text>
                <line x1="0" y1="0" x2="0" y2="{max($pos +1) * $yspacer}" stroke="black" stroke-width="2"/>
                </g>
        }
        </g>
    </g>
</svg>

}                    {
            

<svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%">
    <g transform="translate(150,0)">
 
    <g>
        {
            let $a := " Attires"
            for $spellItems at $pos in $spellItem-count
            return
                <g>
                <text x="-75" y="{$pos * $yspacer + 5}" font-family="sans-serif" font-size="12px" fill="black">{$s}</text>
                <line x1="0" y1="{$pos * $yspacer}" x2="{$spellItem-count * $xspacer}" y2="{$pos * $yspacer}" stroke="Red" stroke-width="15"/>
                <text x="{$spellItem-count * $xspacer + 10}" y="{$pos * $yspacer + 5}" font-family="sans-serif" font-size="12px" fill="black">{$spellItem-count}</text>
                <line x1="0" y1="0" x2="0" y2="{max($pos +1) * $yspacer}" stroke="black" stroke-width="2"/>
                </g>
        }
        </g>
    </g>
</svg>

}                 
            {
<svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%">
    <g transform="translate(150,-10)">
 
    <g>
        {
            let $a := " Attires"
            for $toolItems at $pos in $toolItem-count
            return
                <g>
                <text x="-75" y="{$pos * $yspacer + 5}" font-family="sans-serif" font-size="12px" fill="black">{$t}</text>
                <line x1="0" y1="{$pos * $yspacer}" x2="{$toolItem-count * $xspacer}" y2="{$pos * $yspacer}" stroke="Red" stroke-width="15"/>
                <text x="{$toolItem-count * $xspacer + 10}" y="{$pos * $yspacer + 5}" font-family="sans-serif" font-size="12px" fill="black">{$toolItem-count}</text>
                <line x1="0" y1="0" x2="0" y2="{max($pos +1) * $yspacer}" stroke="black" stroke-width="2"/>
                </g>
        }
        </g>
    </g>
</svg>

}{
<svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%">
    <g transform="translate(150,100)">
   
    <g>
        {
            let $a := " Attires"
            for $consumableItems at $pos in $consumableItem-count
            return
                <g>
                <text x="-105" y="{$pos * $yspacer + 5}" font-family="sans-serif" font-size="12px" fill="black">{$con}</text>
                <line x1="0" y1="{$pos * $yspacer}" x2="{$consumableItem-count * $xspacer}" y2="{$pos * $yspacer}" stroke="Red" stroke-width="15"/>
                <text x="{$consumableItem-count * $xspacer + 10}" y="{$pos * $yspacer + 5}" font-family="sans-serif" font-size="12px" fill="black">{$consumableItems}</text>
                <line x1="0" y1="0" x2="0" y2="{max($pos +1) * $yspacer}" stroke="black" stroke-width="2"/>
                </g>
        }
        </g>
    </g>
</svg>

}    



        </table>
         
    </body>
</html>