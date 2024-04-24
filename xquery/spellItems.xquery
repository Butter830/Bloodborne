declare option saxon:output "method=html";
declare option saxon:output "doctype-system=about:legacy-compat";

<html>
    <head>
    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico?"/>
       <title>Spell Items</title>
      <link type="text/css" href="Item_Master_Style.css" rel="stylesheet" />
   <div class="header"><h1>Bloodborne Item Finder</h1>
         <h4>Spells</h4>
        </div><div class="topnav">
        <h4><a href="index.html">Home</a></h4>
         <h4><a href="attireItems.html">Attire</a></h4>
         <h4><a href="buffItems.html">Buffs</a></h4>
         <h4><a href="consumableItems.html">Consumables</a></h4>
         <h4><a href="holyChalices.html">Holy Chalices</a></h4>
         <h4><a href="keyItems.html">Key Items</a></h4> 
         <h4><a href="onlineItems.html">Online Items</a></h4>
         <h4><a href="rune.html">Runes</a></h4>
         <h4><a href="spellItems.html">Spell Items</a></h4>
         <h4><a href="toolItems.html">Tools</a></h4>
         <h4><a href="weapons.html">Weapons</a></h4>
         <h4><a href="itemList.html">Item Checklist</a></h4>
         <h4><a href="Maps.html" target="_blank" rel="noopener noreferrer">Maps</a></h4>
         <h4><a href="graphs.html">Graphs</a></h4>
         <h4><a href="aboutUs.html">About Us</a></h4>
      </div>
   </head>
    <h4><a id="top"></a></h4>
    <body>
    
            
            <table>
            <tr><i><b><font size="+2" color="white">Spells</font></b></i><th></th>
<p><u>{let $main := collection("../xml/")
        let $a := " Spells"
        let $Item := $main//spellItem[.//itemName]
let $Items := $main//spellItem/itemName
let $Item-count := $Items => count()
        
               return (concat ("There are a total of ", $Item-count, $a," giving Hunters eminence power to fight back the beasts of the night."))  
            }</u></p>
                     
 <p>
</p>
<th><u>Item Name</u></th><th><u>Description</u></th></tr>
            {
                     let $main := collection("../xml/")
                     let $spellItem:= $main//spellItem[.//itemName]
            let $spellItems := $main//spellItem/itemName

             for $item in $spellItems
let $spellItem-description := $item/following-sibling::description
           for $items in $spellItem-description
order by $item
return
<tr><td><img src="images/{$item!string()!replace(., ' ', '_')}.jpg" alt="{$item}" width="200"/>
</td><td><b>{$item!string()}</b> </td><td>{$items!string()}</td></tr>
 }
        </table>

    </body>
     <h4><a href="#top">Back to the top</a></h4>    
</html>