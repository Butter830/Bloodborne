xquery version "3.1";
declare option saxon:output "method=html";
declare option saxon:output "doctype-system=about:legacy-compat";
declare variable $main := collection("../xml/");
declare variable $xspacer := 10;
declare variable $yspacer := 50;


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
      
<div class="content">
<p>Blood/Church/Hunter Frequency in Bloodborne Item Guide. 
<br/>
        This Graph is based on the more common words in the Bloodborne Item List.</p>
             <svg xmlns="http://www.w3.org/2000/svg" width="1000" height="400" viewBox="0 0 1100 800" style="border">
    <g transform="translate(-100,0)">
            
            {
let $words := $main//Q{}lore/string()=>string-join()=>lower-case()
let $words-cleaned := replace($words, '[,|"|!|\.|(|)|\?|;|\[|\]]+', ' ') => normalize-space()
let $words-separate := tokenize($words-cleaned, '\s')
let $bloodTotal := ($words-cleaned ! replace(., "blood", " blood ", "i") ! (tokenize(.)[. = 'blood']) => count())
let $churchTotal := ($words-cleaned ! replace(., "church", " church ", "i") ! (tokenize(.)[. = 'church']) => count())
let $hunterTotal := ($words-cleaned ! replace(., "hunter", " hunter ", "i") ! (tokenize(.)[. = 'hunter']) => count())
let $huntersTotal := ($words-cleaned ! replace(., "hunters", " hunters ", "i") ! (tokenize(.)[. = 'hunters']) => count())
let $oldTotal := ($words-cleaned ! replace(., "old", " old ", "i") ! (tokenize(.)[. = 'old']) => count())
    
   return 
                <g>
               <text x="-350" y="100" font-family="sans-serif" font-size="40px" fill="black">Blood: {$bloodTotal}</text>
                <line x1="0" y1="100" x2="{$bloodTotal}" y2="100" stroke="orange" stroke-width="30"/>
                <text x="-350" y="200" font-family="sans-serif" font-size="40px" fill="black">Church: {$churchTotal}</text>
                <line x1="0" y1="200" x2="{$churchTotal}" y2="200" stroke="black" stroke-width="30"/>
                <text x="-350" y="300" font-family="sans-serif" font-size="40px" fill="black">Hunter: {$hunterTotal}</text>
                <line x1="0" y1="300" x2="{$hunterTotal}" y2="300" stroke="black" stroke-width="30"/>
                <text x="-350" y="400" font-family="sans-serif" font-size="40px" fill="black">Hunters: {$huntersTotal}</text>
                <line x1="0" y1="400" x2="{$huntersTotal}" y2="400" stroke="black" stroke-width="30"/>
                <text x="-350" y="500" font-family="sans-serif" font-size="40px" fill="black">Old: {$oldTotal}</text>
                <line x1="0" y1="500" x2="{$oldTotal}" y2="500" stroke="black" stroke-width="30"/>
                </g>
        }
        </g></svg>
        

</div>
        <h4><a href="#top">Back to the top</a></h4> 

</body>
</html>