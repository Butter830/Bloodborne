declare option saxon:output "method=html";
declare option saxon:output "doctype-system=about:legacy-compat";
declare variable $main := collection("../xml/");
declare variable $xspacer := 10;
declare variable $yspacer := 50;
declare variable $words-cleaned := replace($words, '[,|"|!|\.|(|)|\?|;|\[|\]]+', ' ') => normalize-space();
declare variable $words-separate := tokenize($words-cleaned, '\s');
declare variable $words := $main //lore/string()=>string-join()=>lower-case();  
declare variable $bloodTotal := (//lore/text() ! replace(., "blood", " blood ", "i") ! (tokenize(.)[. = 'blood']) => count());
declare variable $churchTotal := (//lore/text() ! replace(., "church", " church ", "i") ! (tokenize(.)[. = 'church']) => count());
declare variable $hunterTotal := (//lore/text() ! replace(., "hunter", " hunter ", "i") ! (tokenize(.)[. = 'hunter']) => count());

<html>
    <head>
    <title>Second Graphs</title>
    <link type="text/css" href="Graphs_Style.css" rel="stylesheet" />
    </head>
    
    <body>
    
         <div class="header"><h1>Bloodborne Mastersheet</h1>
         <h4>Ultimate Cheat Sheet</h4></div>
         
       <div class="topnav">
         <h4><a href="#">Attire</a></h4>
         <h4><a href="#">Buffs</a></h4>
         <h4><a href="#">Consumables</a></h4>
         <h4><a href="#">Holy Chalices</a></h4>
         <h4><a href="#">Key Items</a></h4> 
         <h4><a href="#">Runes</a></h4>
         <h4><a href="#">Spell Items</a></h4>
         <h4><a href="#">Tools</a></h4>
         <h4><a href="#">Weapons</a></h4>
         <h4><a href="#">Item Checklist</a></h4>
         <h4><a href="#">Maps</a></h4>
         <h4><a href="#">Graphs</a></h4>
         <h4><a href="#">About</a></h4>
      </div>
      
<div>
<p>Blood/Church/Hunter Frequency in Bloodborne Item Guide. 
<br/>
        This Graph is based on the more common words in the Bloodborne Item List.</p>
             <svg xmlns="http://www.w3.org/2000/svg" width="1000" height="400" viewBox="0 0 1100 800" style="border">
    <g transform="translate(-100,0)">
            
            {
    
   
    
   ./return 
                <g>
               <text x="-350" y="{$yspacer + 5}" font-family="sans-serif" font-size="40px" fill="black">{$bloodTotal}</text>
                <line x1="20" y1="{$yspacer}" x2="{$words-cleaned * $xspacer}" y2="{$yspacer}" stroke="orange" stroke-width="35"/>
                <text x="{$words-cleaned * $xspacer + 10}" y="{$yspacer + 5}" font-family="sans-serif" font-size="40px" fill="black">{$churchTotal}</text>
                <line x1="20" y1="0" x2="20" y2="{max(+1) * $yspacer}" stroke="black" stroke-width="2"/>
                <text x="{$words-cleaned * $xspacer + 10}" y="{$yspacer + 5}" font-family="sans-serif" font-size="40px" fill="black">{$hunterTotal}</text>
                <line x1="20" y1="0" x2="20" y2="{max(+1) * $yspacer}" stroke="black" stroke-width="2"/>
                </g>
        }
        </g></svg>
        

</div>
        <h4><a href="#top">Back to the top</a></h4> 

</body>
</html>