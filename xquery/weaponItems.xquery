declare option saxon:output "method=html";


<html>
    <head>
    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico?"/>
       <title>Tool Items</title>
      <link type="text/css" href="Item_Master_Style.css" rel="stylesheet" />
   <div class="header"><h1>Bloodborne Item Finder</h1>
         <h4>Weapons</h4>
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
         <h4><a href="graphs.html">Graphs</a></h4>
         <h4><a href="aboutUs.html">About Us</a></h4>
      </div>
   </head>
    
    <body>
<h4><a id="top"></a></h4>
            
            <table>
           <tr><i><b><font size="+2" color="white">Melee Weapons</font></b></i><th></th>
     <p><u>{let $main := collection("../xml/")
        let $t := " Weapons"
        let $toolItem := $main//weapon[.//itemName]
let $toolItems := $main//weapon/itemName
let $toolItem-count := $toolItems => count()
        
               return (concat ("There are a total of ", $toolItem-count,$t, " giving vareity to how Hunters slay the beasts of the night. *Each weapon has 2 forms*"))  
            }</u></p>
<th><u>Item Name</u></th><th><u>Description</u></th></tr>
            {
                     let $main := collection("../xml/")
                     let $weapon:= $main//weapon[.//itemName]
            let $weapons := $main//weapon/itemName

             for $item in $weapons
let $weapon-description := $item/following-sibling::description
           for $items in $weapon-description
order by $item
return
<tr><td><img src="images/{$item!string()!replace(., ' ', '_')}.jpg" alt="{$item}" width="200"/>
</td><td><b>{$item!string()}</b> </td><td>{$items!string()}</td></tr>
 }
        </table>
        <p></p>
       <table>
           <tr><i><b><font size="+2" color="white">Firearms</font></b></i><th></th>
     <p><u>{let $main := collection("../xml/")
        let $t := " Firearms"
        let $toolItem := $main//firearm[.//itemName]
let $toolItems := $main//firearm/itemName
let $toolItem-count := $toolItems => count()
        
               return (concat ("There are a total of ", $toolItem-count,$t, " giving range capabilities to Hunters in the night."))  
            }</u></p>
<th><u>Item Name</u></th><th><u>Description</u></th></tr>
            {
                     let $main := collection("../xml/")
                     let $weapon:= $main//firearm[.//itemName]
            let $weapons := $main//firearm/itemName

             for $item in $weapons
let $weapon-description := $item/following-sibling::description
           for $items in $weapon-description
order by $item
return
<tr><td><img src="images/{$item!string()!replace(., ' ', '_')}.jpg" alt="{$item}" width="200"/>
</td><td><b>{$item!string()}</b> </td><td>{$items!string()}</td></tr>
 }
        </table>
  
        <h4><a href="#top">Back to the top</a></h4>    
        
    </body>
   
</html>