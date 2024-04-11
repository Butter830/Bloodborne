declare option saxon:output "method=text";
declare variable $linefeed := "&#10;";
declare variable $tab := "&#9;"; 
let $main := collection("../xml/")

let $attire := $main//attire[.//attireName]
let $attires := $main//attire/attireName
let $attire-count := $attires => count()

(:let $keyItem := $main//keyItem[.//itemName]:)
let $keyItems := $main//keyItem/itemName
let $keyItem-count := $keyItems => count()

let $toolItem := $main//toolItem[.//itemName]
let $toolItems := $main//toolItem/itemName 
let $toolItem-count := $toolItems => count()


(:let $consumableItem := $main//consumableItem[.//itemName]:)
let $consumableItems := $main//consumableItem/itemName
let $consumableItem-count := $consumableItems => count()

(:let $spellItem := $main//spellItem[.//itemName]:)
let $spellItems := $main//spellItem/itemName
let $spellItem-count := $spellItems => count()

(:let $weapon := $main//weapon[.//weaponName]:)
let $weapons := $main//weapon[.//weaponName]
let $weapon-count := $weapons => count()

(:let $holyChalices := $main//holyChalices[.//itemName]:)
let $holyChalices := $main//holyChalices/itemName
let $holyChalices-count := $holyChalices => count()

(:let $firearm := $main//firearm[.//firearmName]:)
let $firearms := $main//firearm/firearmName
let $firearm-count := $firearms => count()

let $a := " Attire"
let $c := " Caryll Rune"
let $w := " Weapon"
let $f := " Firearm"
let $h := " Holy Chalices"
let $k := " Key Item"
let $t := " Tool"
let $con := "consumable Item"

return (concat ("There are a total of ", $attire-count, " items considered",$a," in Bloodborne."))

(:This shows the number of of any of the items in the game (only those defined so far):)



(:
return (concat ("There are a total of ", $toolItem-count, " items considered",$t," in Bloodborne.")) 
:)

(:whc:
Here's the problem. If you look above, you'll see that you defined $toolItems thusly:
let $toolItems := $main//toolItem/itemName
That means that the variable $item actually gets you the itemName element.
The problem is, you then try to call for 
let $toolItem-description := $item//description
...which *is looking for the <description> element INSIDE $item. But $item is the <itemName>
element, and <description> is not inside the <itemName> element. It is a following-sibling:: of 
<itemName>.:)

(:for $item in $toolItem:)
(:  whc: this was your former return line.  :)
(:let $toolItem-description := $item//description:)

(:whc: I changed it to this, which now works  :)
(:let $toolItem-description := $item/following-sibling::description:)


(:return concat($item,"&#xa;",$toolItem-description):)


