declare option saxon:output "method=html";
declare variable $main := collection("../xml/");
declare variable $xspacer := 10;
declare variable $yspacer := 50;

<html>
    <head>
    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico?"/>
       <title>Graphs</title>
      <link type="text/css" href="Graphs_Style.css" rel="stylesheet" />
   <div class="header"><h1>Bloodborne Item Finder</h1>
         <h4>Graphs</h4>
        </div><div class="topnav">
        <h4><a href="index.html">Home</a></h4>
         <h4><a href="attireItems.html">Attire</a></h4>
         <h4><a href="buffItems.html">Buffs</a></h4>
         <h4><a href="consumableItems.html">Consumables</a></h4>
         <h4><a href="holyChalices.html">Holy Chalices</a></h4>
         <h4><a href="keyItems.html">Key Items</a></h4> 
         <h4><a href="rune.html">Runes</a></h4>
         <h4><a href="spellItems.html">Spell Items</a></h4>
         <h4><a href="toolItems.html">Tools</a></h4>
         <h4><a href="weapons.html">Weapons</a></h4>
         <h4><a href="itemList.html">Item Checklist</a></h4>
         <h4><a href="graphs.html">Graphs</a></h4>
         <h4><a href="aboutUs.html">About Us</a></h4>
      </div>
      <h4><a id="top"></a></h4>
   </head>
    
    <body>
    <div class="content">
        <u><i><b><font size="+2" color="white">Number of Items in Bloodborne:</font></b></i></u>
        <p>This shows just the sheer amount of <em>Items</em> within the game as a fun visual aid! As you could see attire has more items by more than double of everything else.  </p>
        <p></p>
        <p> <u> Analysis of Item numbers:</u></p>
    <p>Across Bloodborne there are several different types of items and we categorized them as seen below. From the graph there is an obvious difference in the amount of attire items compared to any other item in the game. This can be seen as FromSoft allowing players the ability to role play as whatever character they wish. Furthermore, it allows for different play styles much like the weapons in the game. The graph shows that there are 26 weapons, but in reality, there is double that since each weapon has a transformed state. Looking at the lowest number of items tools and weapon buffs it sparks interest that a game focused on combat would have so few weapon buffs. However, this is because these items directly add attributes to weapons like fire or lightning. While there are consumables that give players increased stats that affect damage of weapons, speed, etc.</p>
        <svg xmlns="http://www.w3.org/2000/svg" width="1000" height="400" viewBox="0 0 1100 800" style="border">
    <g transform="translate(-100,0)">
   
    {
    let $items := $main//Q{}lore//*[name()="holyChaliceItem" or name()="weapon" or name()="firearm"or name()="attire"or name()="caryllRunes"or name()="onlineItem" or name()="keyItem"or name()="chaliceRitualMaterials"or name()="toolItem"or name()="consumableItem"or name()="spellItem"or name()="weaponBuffItem"] 
 
let $itemTypes := $items/name()=>distinct-values()
for $itemType at $pos in $itemTypes
let $itemCount := count($items[./name() = $itemType])
let $itemName := $itemType
        return
                <g>
                <text x="-350" y="{$pos * $yspacer + 5}" font-family="sans-serif" font-size="40px" fill="black">{$itemName}</text>
                <line x1="20" y1="{$pos * $yspacer}" x2="{$itemCount * $xspacer}" y2="{$pos * $yspacer}" stroke="orange" stroke-width="35"/>
                <text x="{$itemCount * $xspacer + 10}" y="{$pos * $yspacer + 5}" font-family="sans-serif" font-size="40px" fill="black">{$itemCount}</text>

                <line x1="20" y1="0" x2="20" y2="{max($pos +1) * $yspacer}" stroke="black" stroke-width="2"/>
                </g>
        }
        </g></svg>
       <p></p>
        <p><u>Analysis of Items Per Location:</u></p>
            <p>Due to the large amount of items and some items being able to be found in multiple locations we were unable to account for all of them. Based of the information we did use, you could see a majority of items fall under the Cathedral Ward, Hunter's Dream, and Hunter's Nightmare. Many of the items found in the game are in stores that can be found in the Hunter's Dream, but due to there being no lamps within due it being a hub area. Furthermore, due to inaccurate location tagging this graph is incomplete as of now.  </p>
        <svg xmlns="http://www.w3.org/2000/svg" width="800" height="1200"  viewBox="0 0 1300 500" style="border">
    <g transform="translate(400,-600)"> {
    let$xspacers := 10
let $yspacers := 65
    let $locations := $main//Q{}location/data(@lamp)=>distinct-values()
    for $location at $pos in $locations
    let $item-count := $main//Q{}location[data(@lamp)=$location]=>count()
    order by $item-count descending
    return
                <g>
                <text x="-320" y="{$pos * $yspacers+20 }" font-family="sans-serif" font-size="40px" fill="black">{$location!translate(.,"_"," ")}</text>
                <line x1="300" y1="{$pos * $yspacers}" x2="{$item-count * $xspacers+400}" y2="{$pos * $yspacers}" stroke="orange" stroke-width="40"/>
                <text x="{$item-count * $xspacers + 420}" y="{$pos * $yspacers + 5}" font-family="sans-serif" font-size="40px" fill="black">{$item-count}</text>

                <line x1="300" y1="0" x2="300" y2="{max($pos +1) * $yspacers}" stroke="black" stroke-width="2"/>
                </g>
        }
        </g></svg>
        
        <p><u>Analysis on Word Count:</u></p>
        <p>Based off of the word cloud and frequency graph, Hunter is the most used word with 376 times of recurrence. Words like blood, church, old, hunters, beast, rune, etc also repeat for over a hundred times. These words aren't a surprise to be the most common as the game is focused around the Hunters, the Healing Church, and their blood transfusions. It is a shock that old is the top word, but due to the references to the old gods and old blood within the game it's understandable.  </p>
        <p><img src="images/Frequency_Word_Graph.jpg" alt="Frequency_Word_Graph"></img></p>
        <img src="images/Frequency_Word_Cloud.jpg" alt="Frequency_Word_Cloud"></img>
        </div>
        <h4><a href="#top">Back to the top</a></h4>    
       </body>
       </html>