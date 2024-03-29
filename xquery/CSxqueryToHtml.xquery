declare option saxon:output "method=html";


<html>
    <head>
       <title>The Items of Bloodborne</title>
    </head>
    
    <body>
    <h1>The Items of Bloodborne</h1>
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
<tr><td><img src="images/AoE.jpg" alt="Augur of Ebrietas"/>
</td><td><b>{$item}</b> </td><td>{$items}</td></tr>
 }
        </table>
       
        
        
        
    </body>
</html>