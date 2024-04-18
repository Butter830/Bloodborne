declare option saxon:output "method=html";
declare variable $main := collection("../xml/?select=*.xml");
declare variable $xspacer := 20;
declare variable $yspacer := 70;

<html>
<head><title></title></head>
<body>
<svg xmlns="http://www.w3.org/2000/svg" width="800" height="400"  viewBox="0 0 1500 2000" style="border">
    <g transform="translate(-500,-10)"> {
    let $locations := $main//Q{}location/data(@lamp)=>distinct-values()
    for $location at $pos in $locations
    let $item-count := $main//Q{}location[data(@lamp)=$location]=>count()
    order by $item-count descending
    return
                <g>
                <text x="-450" y="{$pos * $yspacer + 5}" font-family="sans-serif" font-size="30px" fill="black">{$location}</text>
                <line x1="-25" y1="{$pos * $yspacer}" x2="{$item-count * $xspacer}" y2="{$pos * $yspacer}" stroke="orange" stroke-width="50"/>
                <text x="{$item-count * $xspacer + 10}" y="{$pos * $yspacer + 5}" font-family="sans-serif" font-size="30px" fill="black">{$item-count}</text>

                <line x1="-25" y1="0" x2="-25" y2="{max($pos +1) * $yspacer}" stroke="black" stroke-width="2"/>
                </g>
        }
        </g></svg></body></html>