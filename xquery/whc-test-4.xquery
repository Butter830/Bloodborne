declare option saxon:output "method=html";
declare variable $main := collection("../xml/?select=*.xml");
declare variable $xspacer := 14;
declare variable $yspacer := 50;

<html>
<head><title>fill in title</title></head>
<body>
<svg xmlns="http://www.w3.org/2000/svg" width="1000" height="400"  style="border">
    <g transform="translate(120,10)"> {
    let $locations := $main//Q{}location/data(@lamp)=>distinct-values()
    for $location at $pos in $locations
    let $item-count := $main//Q{}location[data(@lamp)=$location]=>count()
    order by $item-count descending
    return
    <text>{concat($location, ": ", $pos, "; ", $item-count)}</text>
    
    }
        </g></svg></body></html>