declare option saxon:output "method=html";
declare variable $main := collection("../xml/");
declare variable $xspacer := 14;
declare variable $yspacer := 50;

<html>
    <head>
      
        <link type="text/css" href="Item_Master_Style.css" rel="stylesheet" />  <title>Item Count</title>
    </head>
    
    <body>
        <h1><u>Item Count in Bloodborne</u></h1>
        <p>This shows just the sheer amount of <em>Items</em> within the game as a fun visual aid!</p>
        <p></p>
        <svg xmlns="http://www.w3.org/2000/svg" width="1000" height="400" viewBox="0 0 1100 800" style="border">
    <g transform="translate(-120,10)">
   
    {
    let $items := $main//Q{}lore//*[name()="holyChaliceItem" or name()="weapon"or name()="attire"or name()="caryllRunes"or name()="onlineItem" or name()="keyItem"or name()="chaliceRitualMaterials"or name()="toolItem"or name()="consumableItem"or name()="spellItem"or name()="weaponBuffItem"] 
 
let $itemTypes := $items/name()=>distinct-values()
for $itemType at $pos in $itemTypes
let $itemCount := count($items[./name() = $itemType])
let $itemName := $itemType
        return
                <g>
                <text x="-320" y="{$pos * $yspacer + 5}" font-family="sans-serif" font-size="30px" fill="black">{$itemName}</text>
                <line x1="-25" y1="{$pos * $yspacer}" x2="{$itemCount * $xspacer}" y2="{$pos * $yspacer}" stroke="orange" stroke-width="35"/>
                <text x="{$itemCount * $xspacer + 10}" y="{$pos * $yspacer + 5}" font-family="sans-serif" font-size="30px" fill="black">{$itemCount}</text>

                <line x1="-25" y1="0" x2="-25" y2="{max($pos +1) * $yspacer}" stroke="black" stroke-width="2"/>
                </g>
        }
        </g></svg>
        <p> Analysis of Item numbers</p>
        </body></html>