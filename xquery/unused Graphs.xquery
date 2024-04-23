declare variable $files := collection('../xml/?select=*.xml');
declare option saxon:output "method=html";


<html>
    <head>
    <title>Holy Chalice Items</title>
    <link type="text/css" href="Item_Master_Style.css" rel="stylesheet" />
    </head>
    
    <body>
    
         <div class="header"><h1>Bloodborne Mastersheet</h1>
         <h4>Ultimate Cheat Sheet</h4></div>
         
       <div class="topnav">
         <h4><a href="attireItems.html">Attire</a></h4>
         <h4><a href="buffItems.html">Buffs</a></h4>
         <h4><a href="consumableItems.html">Consumables</a></h4>
         <h4><a href="holyChalices.html">Holy Chalices</a></h4>
         <h4><a href="keyItems(NEW).html">Key Items</a></h4> 
         <h4><a href="rune.html">Runes</a></h4>
         <h4><a href="spellItems.html">Spell Items</a></h4>
         <h4><a href="toolItems.html">Tools</a></h4>
         <h4><a href="weapons.html">Weapons</a></h4>
         <h4><a href="#">Item Checklist</a></h4>
         <h4><a href="#">General Trivia</a></h4>
         <h4><a href="#">About</a></h4>
      </div>

<p>
{
let $words := $files//lore/string()=>string-join()=>lower-case()
let $words-cleaned := replace($words, '[,|"|!|\.|(|)|\?|;|\[|\]]+', ' ') => normalize-space()
let $words-separate := tokenize($words-cleaned, '\s')
for $w in distinct-values($words-separate)
let $count := count($words-separate[. = $w])
where $count >2
order by $count descending
return (<b>{$w}</b>, "&#x9;", $count, "&#10;")
}
</p>

</body>
</html>