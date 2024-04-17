declare option saxon:output "method=html";


<html>
    <head>
       <title>Holy Chalices</title>
      <link type="text/css" href="Item_Master_Style.css" rel="stylesheet" />
   <div class="header"><h1>Bloodborne Item Finder</h1>
         <h4>Holy Chalices</h4>
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
      <h4><a id="top"></a></h4>
   </head>
    
    <body>
    
         
            <table>
            <tr><i><font size="+1">Holy Chalices</font></i><th></th>
<th><u>Item Name</u></th><th><u>Description</u></th></tr>
            {
                     let $main := collection("../xml/")
                     let $holyChaliceItem:= $main//holyChaliceItem[.//itemName]
            let $holyChaliceItems := $main//holyChaliceItem/itemName

             for $item in $holyChaliceItems
let $holyChalice-description := $item/following-sibling::description
           for $items in $holyChalice-description
order by $item
return
<tr><td><img src="images/{$item!string()!replace(., ' ', '_')}.jpg" alt="THE" width="200"/>
</td><td><b>{$item!string()}</b> </td><td>{$items!string()}</td></tr>
 }
        </table>
    
 <table>

            <tr> <i><font size="+1">Chalice Materials</font></i><th></th>
<th><u>Item Name</u></th><th><u>Description</u></th></tr>
            {
                     let $main := collection("../xml/")
                     let $holyChaliceItem:= $main//holyChaliceItem[.//itemName]
            let $holyChaliceItems := $main//holyChaliceItem/itemName

             for $item in $holyChaliceItems
let $holyChalice-description := $item/following-sibling::description
           for $items in $holyChalice-description
order by $item
return
<tr><td><img src="images/{$item!string()!replace(., ' ', '_')}.jpg" alt="THE" width="200"/>
</td><td><b>{$item!string()}</b> </td><td>{$items!string()}</td></tr>
 }
        </table>      
 
    </body>
    <h4><a href="#top">Back to top</a></h4>
</html>