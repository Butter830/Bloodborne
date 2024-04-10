declare option saxon:output "method=html";
declare variable $main := collection("../xml/");
declare variable $xspacer := 10;
declare variable $yspacer := 25;

<html>
    <head>
        <title>Item Count</title>
    </head>
    
    <body>
        <h1><u>Item Count in Bloodborne</u></h1>
        <svg xmlns="http://www.w3.org/2000/svg" width="1000" height="1000" viewBox="0 0 1000 1000">
    <g transform="translate(150,100)">
   
    {
    let $items := $main//Q{}lore//*[./name()="caryllRune" or ./name()="weapon" or ./name()="holyChaliceItem"] (:whc: extend thsi to include whatever elements you do want, leave out the ones you don't:)
let $itemTypes := $items/name()=>distinct-values()
for $itemType at $pos in $itemTypes
let $itemCount := count($items[./name() = $itemType])
let $itemName := $itemType
        return
                <g>
                <text x="-75" y="{$pos * $yspacer + 5}" font-family="sans-serif" font-size="12px" fill="black">{concat($itemCount, $itemName)}</text>
                <line x1="0" y1="{$pos * $yspacer}" x2="{$itemCount * $xspacer}" y2="{$pos * $yspacer}" stroke="Red" stroke-width="15"/>

                <line x1="0" y1="0" x2="0" y2="{max($pos +1) * $yspacer}" stroke="black" stroke-width="2"/>
                </g>
        }
        </g></svg>
        
        </body></html>