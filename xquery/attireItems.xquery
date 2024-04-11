declare option saxon:output "method=html";


<html>
    <head>
      <title>Attire</title>
      <link type="text/css" href="Item_Master_Style.css" rel="stylesheet" />
    </head>
    
    <body>
    
            
            <table>
            <tr><th></th>
<th><u>Item Name</u></th><th><u>Description</u></th></tr>
            {
                     let $main := collection("../xml/")
                     let $attire:= $main//attire[.//itemName]
            let $attires := $main//attire/itemName

             for $item in $attires
let $attire-description := $item/following-sibling::description
           for $items in $attire-description
order by $item
return
<tr><td><img src="images/{$item!string()!replace(., ' ', '_')}.jpg" alt="THE" width="200"/>
</td><td><b>{$item!string()}</b> </td><td>{$items!string()}</td></tr>
 }
        </table>
       
  
        
        
    </body>
</html>