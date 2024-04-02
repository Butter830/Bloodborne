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
                     let $attire:= $main//attire[.//attireName]
            let $attires := $main//attire/attireName

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