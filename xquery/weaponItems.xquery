declare option saxon:output "method=html";


<html>
    <head>
      
    </head>
    
    <body>
    
            
            <table>
            <tr><th></th>
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
<tr><td><img src="images/{$item!string()!replace(., ' ', '_')}.jpg" alt="THE" width="200"/>
</td><td><b>{$item!string()}</b> </td><td>{$items!string()}</td></tr>
 }
        </table>
       
  
        
        
    </body>
</html>