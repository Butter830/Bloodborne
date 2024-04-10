declare option saxon:output "method=html";


<html>
    <head>
      
    <marquee> Check off what you found and discover what else there is!</marquee>
    <marquee direction="right" behavior="alternate"
           >
        Let Blood Flow the Streets and Collect all the Items in the Game!
    </marquee>
        <font
            size="+10"><b><u>Item Checklist</u></b></font>
        <p> Keep track of all the items you have and find the <i>items you need!</i> </p>
    </head>
    
    <body>
        
        <table>
            <tr><th></th>
                <th><u>
                        <font
                            size="+2"><i><b>Item Name</b></i></font></u></th></tr>
            
            {
                let $main := collection("../xml/")
                let $items := $main//itemName
                
                for $item in $items
                    
                    order by $item
                return
                    
                    <tr><td><img
                                src="images/{$item ! string() ! replace(., ' ', '_')}.jpg"
                                alt="{$item}"
                                width="200"/></td>
                        <td><label
                                class="container">
                                <input
                                    type="checkbox"
                                    />
                                <span
                                    class="checkmark"></span>
                            </label><font
                                size="+1"><b>{$item ! string()}
                                </b></font>
                        </td>
                    </tr>
            }
        </table>
    </body>
</html>