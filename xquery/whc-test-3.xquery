declare option saxon:output "method=html";
declare variable $main := collection("../xml/?select=*.xml");
declare variable $linefeed := "&#10;";  
declare variable $tab := "&#9;";
declare variable $xspacer := 14;
declare variable $yspacer := 50;
<html>
<head><title>fill in title</title></head>
<body>
<svg xmlns="http://www.w3.org/2000/svg" width="1000" height="400" viewBox="0 0 1100 800" style="border">
    <g transform="translate(120,10)"> {
let $locations:= $main//Q{}location[./@lamp]
let $distinct-locations := $locations/data(@lamp)=>distinct-values()
    for $dist-location in $distinct-locations
    let $location-name :=$dist-location   (:/data(@lamp)=>distinct-values():)
       group by $location-name
       let $itemCount:= $dist-location[data(@lamp)=$location-name]=>count()
    order by $itemCount descending

    count $pos
    
   (: let $locations := $main//Q{}location
    for $location in $locations
    group by $location-name :=$location/@lamp
    count $pos:)
    
    
    return (:concat($location-name, $tab, $itemCount, $linefeed):)
              <g>
               <text x="-320" y="{$pos * $yspacer + 5}" font-family="sans-serif" font-size="30px" fill="black">{$location-name}</text>
                <line x1="-25" y1="{$pos * $yspacer}" x2="{$itemCount * $xspacer}" y2="{$pos * $yspacer}" stroke="orange" stroke-width="35"/>
                <text x="{$itemCount * $xspacer + 10}" y="{$pos * $yspacer + 5}" font-family="sans-serif" font-size="30px" fill="black">{$itemCount}</text>
                <line x1="-25" y1="0" x2="-25" y2="{max($pos +1) * $yspacer}" stroke="black" stroke-width="2"/> 
                </g>
        }
        </g></svg></body></html>