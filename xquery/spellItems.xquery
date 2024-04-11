declare option saxon:output "method=html";


<html>
    <head>
      <title>Spell Items</title>
      <link type="text/css" href="Item_Master_Style.css" rel="stylesheet" />
    </head>
    
    <body>
    
            
            <table>
            <tr><th></th>
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
<tr><td><img src="images/{$item!string()!replace(., ' ', '_')}.jpg" alt="THE" width="200"/>
</td><td><b>{$item!string()}</b> </td><td>{$items!string()}</td></tr>
 }
        </table>
       
  
        
        
    </body>
</html>