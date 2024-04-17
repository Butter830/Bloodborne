declare option saxon:output "method=html";


<html>
    <head>
       <title>Rune Items</title>
      <link type="text/css" href="Item_Master_Style.css" rel="stylesheet" />
   <div class="header"><h1>Bloodborne Item Finder</h1>
         <h4>Runes</h4>
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
         <h4><a href="itemCount.html">Graphs</a></h4>
         <h4><a href="aboutUs.html">About Us</a></h4>
      </div>
   </head>
    
    <body>
    
            
            <table>
            <tr><th></th>
<th><u>Item Name</u></th><th><u>Description</u></th></tr>
            {
                     let $main := collection("../xml/")
                     let $caryllRune:= $main//caryllRunes[.//itemName]
            let $caryllRunes := $main//caryllRunes/itemName

             for $item in $caryllRunes
let $caryllRunes-description := $item/following-sibling::description
           for $items in $caryllRunes-description
order by $item
return
<tr><td><img src="images/{$item!string()!replace(., ' ', '_')}.jpg" alt="THE" width="200"/>
</td><td><b>{$item!string()}</b> </td><td>{$items!string()}</td></tr>
 }
        </table>
       
  
        <h4><a href="Bloodborne_Mastersheet.html">Bloodborne Mastersheet</a></h4>
        
    </body>
</html>