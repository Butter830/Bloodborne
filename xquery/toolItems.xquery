declare option saxon:output "method=html";


<html>
    <head>
       <title>Tool Items</title>
      <link type="text/css" href="Item_Master_Style.css" rel="stylesheet" />
   <div class="header"><h1>Bloodborne Mastersheet</h1>
         <h4>Ultimate Cheat Sheet</h4>
        </div><div class="topnav">
         <h4><a href="attireItems.html">Attire</a></h4>
         <h4><a href="buffItems.html">Buffs</a></h4>
         <h4><a href="consumableItems.html">Consumables</a></h4>
         <h4><a href="holyChalices.html">Holy Chalices</a></h4>
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
    
        <h2>Tool items found in Yharnam</h2>
        <p>The Beasts of the night flood the streets of Yharnam, spilling the blood of its citzens. As the moon hangs high above the city what tools will use to set the Beasts to rest, good hunter? </p>
        <p><u>{let $main := collection("../xml/")
        let $t := " Tool"
        let $toolItem := $main//toolItem[.//itemName]
let $toolItems := $main//toolItem/itemName
let $toolItem-count := $toolItems => count()
        
               return (concat ("There are ", $toolItem-count, " total items considered",$t,"s at the disposal of the hunters in Bloodborne."))  
            }</u></p>
                     
 <p>
</p>
            
            <table>
            <tr><th></th>
<th><u>Item Name</u></th><th><u>Description</u></th></tr>
            {
                     let $main := collection("../xml/")
                     let $toolItem := $main//toolItem[.//itemName]
            let $toolItems := $main//toolItem/itemName

             for $item in $toolItems
let $toolItem-description := $item/following-sibling::description
           for $items in $toolItem-description
order by $item
return
<tr><td><img src="images/{$item!string()!replace(., ' ', '_')}.jpg" alt="Augur of Ebrietas" width="200"/>
</td><td><b>{$item!string()}</b> </td><td>{$items!string()}</td></tr>
 }
        </table>
       
  
        <h4><a href="Bloodborne_Mastersheet.html">Bloodborne Mastersheet</a></h4>
        
    </body>
</html>