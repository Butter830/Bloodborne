declare option saxon:output "method=html";
declare variable $main := collection("../xml/");
declare variable $xspacer := 10;
declare variable $yspacer := 25;

<html>
    <head>
        <title>Item Count</title>
    </head>
    
    <body>
        <h1><u>Item Count in Bloodborne</u></h1>
        <svg xmlns="http://www.w3.org/2000/svg" width="1300" height="1100" viewBox="0 0 1100 1300">
    <g transform="translate(-125,10)">
   
    {
    let $items := $main//Q{}lore//*[name()="holyChaliceItem" or name()="weapon"or name()="attire"or name()="caryllRunes"or name()="onlineItem" or name()="keyItem"or name()="chaliceRitualMaterials"or name()="toolItem"or name()="consumableItem"or name()="spellItem"or name()="weaponBuffItem"] 
 
let $itemTypes := $items/name()=>distinct-values()
for $itemType at $pos in $itemTypes
let $itemCount := count($items[./name() = $itemType])
let $itemName := $itemType
        return
                <g>
                <text x="-120" y="{$pos * $yspacer + 5}" font-family="sans-serif" font-size="12px" fill="black">{$itemName}</text>
                <line x1="0" y1="{$pos * $yspacer}" x2="{$itemCount * $xspacer}" y2="{$pos * $yspacer}" stroke="Red" stroke-width="15"/>
                <text x="{$itemCount * $xspacer + 10}" y="{$pos * $yspacer + 5}" font-family="sans-serif" font-size="12px" fill="black">{$itemCount}</text>

                <line x1="0" y1="0" x2="0" y2="{max($pos +1) * $yspacer}" stroke="black" stroke-width="2"/>
                </g>
        }
        </g></svg>
        
        </body></html>