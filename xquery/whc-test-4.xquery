declare option saxon:output "method=html";
declare variable $main := collection("../xml/?select=*.xml");
declare variable $xspacer := 140;
declare variable $yspacer := 100;

<html>
<head><title>fill in title</title></head>
<body>
<svg xmlns="http://www.w3.org/2000/svg" width="1000" height="400" viewBox="0 0 9100 8800" style="border">
    <g transform="translate(1200,100)"> {
    let $locations := $main//Q{}location/data(@lamp)=>distinct-values()
    for $location at $pos in $locations
    let $item-count := $main//Q{}location[data(@lamp)=$location]=>count()
    order by $item-count descending
    return
    <text>{concat($location, ": ", $pos, "; ", $item-count)}</text>
    
    }
        </g></svg></body></html>