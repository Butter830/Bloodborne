declare option saxon:output "method=html";


<html>
    <head>
      <title>Consumables</title>
      <link type="text/css" href="Item_Master_Style.css" rel="stylesheet" />
    </head>
    
    <body>
    
            
            <table>
            <tr><th></th>
<th><u>Item Name</u></th><th><u>Description</u></th></tr>
            {
                     let $main := collection("../xml/")
                     let $consumableItem:= $main//consumableItem[.//itemName]
            let $consumableItems := $main//consumableItem/itemName

             for $item in $consumableItems
let $consumableItem-description := $item/following-sibling::description
           for $items in $consumableItem-description
order by $item
return
<tr><td><img src="images/{$item!string()!replace(., ' ', '_')}.jpg" alt="THE" width="200"/>
</td><td><b>{$item!string()}</b> </td><td>{$items!string()}</td></tr>
 }
        </table>
       
  
        
        
    </body>
</html>