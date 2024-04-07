declare option saxon:output "method=html";


<html>
    <head>
      
    </head>
    
 <body>
   <table>
            <tr><th></th>
<th><u>Item Name</u></th></tr>
            {
                     let $main := collection("../xml/")
                     let $toolItem := $main//itemName

             for $item in $toolItem
      
order by $item
return
<tr><td><img src="images/{$item!string()!replace(., ' ', '_')}.jpg" alt="Augur of Ebrietas" width="100"/></td>
<td><b>{$item!string()}</b> </td></tr>
 }
        </table>
        </body>
</html>