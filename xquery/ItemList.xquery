declare option saxon:output "method=html";


<html>
    <head>
       <title>Item List</title>
      <link type="text/css" href="Item_Master_Style.css" rel="stylesheet" />
   <div class="header"><h1>Bloodborne Item Finder</h1>
         <h4>Item List</h4>
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
   
    <marquee direction="right" SCROLLAMOUNT="25"> 
<img src="images/walking.gif" width="80" height="80" alt="Walking Guy" />

</marquee>
    <marquee direction="left" behavior="alternate" speed="100%" BGCOLOR="Red" SCROLLDELAY="0"
          SCROLLAMOUNT="10" >
        Let the Blood Flow in the Streets and Collect all the Items in the Game!
    </marquee>
        <font
            size="+10"><b><u>Item Checklist</u></b></font>
        <p> Keep track of all the items you have and find the <i>items you need!</i> </p>
    </head>
    <h4><a id="top"></a></h4>
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
        <h4><a id="top"></a></h4>
    </body>
</html>