declare option saxon:output "method=html";
declare variable $main := collection("../xml/");
declare variable $xspacer := 14;
declare variable $yspacer := 50;

<html>
    <head>
      
        <link type="text/css" href="Item_Master_Style.css" rel="stylesheet" />  <title>Item Count</title>
    <div class="header"><h1>Bloodborne Mastersheet</h1>
         <h4>Ultimate Cheat Sheet</h4>
        </div><div class="topnav">
         <h4><a href="attireItems.html">Attire</a></h4>
         <h4><a href="buffItems.html">Buffs</a></h4>
         <h4><a href="consumableItems.html">Consumables</a></h4>
         <h4><a href="keyItems(NEW).html">Key Items</a></h4> 
         <h4><a href="rune.html">Runes</a></h4>
         <h4><a href="spellItems.html">Spell Items</a></h4>
         <h4><a href="toolItems.html">Tools</a></h4>
         <h4><a href="weapons.html">Weapons</a></h4>
         <h4><a href="#">Item Checklist</a></h4>
         <h4><a href="#">General Trivia</a></h4>
         <h4><a href="#">About</a></h4>
      </div>
    </head>
    
    <body>
        <h1><u>Item Count in Bloodborne</u></h1>
        <p>This shows just the sheer amount of <em>Items</em> within the game as a fun visual aid!</p>
        <p></p>
        <svg xmlns="http://www.w3.org/2000/svg" width="1000" height="400" viewBox="0 0 1100 800" style="border">
    <g transform="translate(-120,10)">
   
    {let $locations:= $main/Q{}location/data(@lamp)=>distinct-values()
    for $location at $pos in $locations
    let $itemCount:= $locations[./data(@lamp)=$location]=>count()
    
    (:let $items := $main//Q{}lore//*[name()="Forbidden_Woods" or name()="Vileblood_Queen's_Chamber"or name()="attire"or name()="caryllRunes"or name()="onlineItem" or name()="keyItem"or name()="chaliceRitualMaterials"or name()="toolItem"or name()="consumableItem"or name()="spellItem"or name()="weaponBuffItem"] 
 
let $itemTypes := $items/name()=>distinct-values()
for $itemType at $pos in $itemTypes
let $itemCount := count($items[./name() = $itemType])
let $itemName := $itemType:)
        return
                <g>
                <text x="-320" y="{$pos * $yspacer + 5}" font-family="sans-serif" font-size="30px" fill="black">{$location}</text>
                <line x1="-25" y1="{$pos * $yspacer}" x2="{$itemCount * $xspacer}" y2="{$pos * $yspacer}" stroke="orange" stroke-width="35"/>
                <text x="{$itemCount * $xspacer + 10}" y="{$pos * $yspacer + 5}" font-family="sans-serif" font-size="30px" fill="black">{$itemCount}</text>

                <line x1="-25" y1="0" x2="-25" y2="{max($pos +1) * $yspacer}" stroke="black" stroke-width="2"/>
                </g>
        }
        </g></svg>
        <p> Analysis of Item numbers</p>
        </body></html>