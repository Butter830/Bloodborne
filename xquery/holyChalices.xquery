declare option saxon:output "method=html";


<html>
    <head>
      
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
</html>