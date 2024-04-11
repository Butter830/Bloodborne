declare option saxon:output "method=html";
declare variable $main := collection("../xml/");
declare variable $xspacer := 10;
declare variable $yspacer := 25;

<html>
    <head>
        <title>Item Count</title>
        <link type="text/css" href="Item_Master_Style.css" rel="stylesheet" />
    </head>
    
    <body>
        <h1><u>Item Count in Bloodborne</u></h1>
        <p>This shows just the sheer amount of <em>Items</em> within the game as a fun visual aid!</p>
        <p></p>

 
<svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%">
    <g transform="translate(150,100)">
    <g>
    <text x="0" y="-5" font-family="sans-serif" font-size="20px" fill="black">Item Frequency in Bloodborne</text>
    </g>
    <g>
{let $items := $main//lore//*[name()="holyChaliceItem" or name()="weapon"or name()="attire"or name()="caryllRunes"or name()="onlineItem" or name()="keyItem"or name()="chaliceRitualMaterials"or name()="toolItem"or name()="consumableItem"or name()="spellItem"or name()="weaponBuffItem"] 

let $itemTypes := $items/name()=>distinct-values()
for $itemType at $pos in $itemTypes
let $itemCount := count($items[./name() = $itemType])
let $itemName := $itemType
return
 <g>
                <text x="-75" y="{$pos * $yspacer + 5}" font-family="sans-serif" font-size="12px" fill="black">{$itemName}</text>
                <line x1="0" y1="{$pos * $yspacer}" x2="{$itemCount * $xspacer}" y2="{$pos * $yspacer}" stroke="Red" stroke-width="15"/>
                <text x="{$itemCount * $xspacer + 10}" y="{$pos * $yspacer + 5}" font-family="sans-serif" font-size="12px" fill="black">{$itemName}</text>
                <line x1="0" y1="0" x2="0" y2="{max($pos +1) * $yspacer}" stroke="black" stroke-width="2"/>
                </g>
        }
        </g>
        </g>
</svg>
</body>
</html>