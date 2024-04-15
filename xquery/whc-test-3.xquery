declare option saxon:output "method=text";
declare variable $main := collection("../xml/");
declare variable $linefeed := "&#10;";  
declare variable $tab := "&#9;";

 let $locations:= $main//Q{}location
    for $location at $pos in $locations
    let $location-name :=$location/data(@lamp)=>distinct-values()
       group by $location-name
       let $itemCount:= $location[./data(@lamp)=$location-name]=>count()
    order by $itemCount descending
    
    return concat($location-name, $tab, $itemCount, $linefeed)