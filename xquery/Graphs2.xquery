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
      
<div>
<p>Blood/Church/Hunter Frequency in Bloodborne Item Guide. 
<br/>
        This Graph is based on the more common words in the Bloodborne Item List.</p>
             <svg xmlns="http://www.w3.org/2000/svg" width="1000" height="400" viewBox="0 0 1100 800" style="border">
    <g transform="translate(-100,0)">
            
            {
    let $words := $main//lore/string()=>string-join()=>lower-case()
    let $words-cleaned := replace($words, '[,|"|!|\.|(|)|\?|;|\[|\]]+', ' ') => normalize-space()
    let $words-separate := tokenize($words-cleaned, '\s')
    for $w in distinct-values($words-separate)
    for $words-seperate at $pos in $w
    let $count := count($words-separate[. = $w])
    where $count >3
    order by $count descending
    
    return
                <g>
                <text x="-350" y="{$pos * $yspacer + 5}" font-family="sans-serif" font-size="40px" fill="black">{$count}</text>
                <line x1="20" y1="{$pos * $yspacer}" x2="{$w * $xspacer}" y2="{$pos * $yspacer}" stroke="orange" stroke-width="35"/>
                <text x="{$w * $xspacer + 10}" y="{$pos * $yspacer + 5}" font-family="sans-serif" font-size="40px" fill="black">{$count}</text>

                <line x1="20" y1="0" x2="20" y2="{max($pos +1) * $yspacer}" stroke="black" stroke-width="2"/>
                </g>
        }
        </g></svg>
        

</div>
        <h4><a href="#top">Back to the top</a></h4> 

</body>
</html>