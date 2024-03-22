declare option saxon:output "method=text";
let $main := collection("../xml/")

let $attire := $main//attire[.//attireName]
let $attire-count := $attire => count()

let $keyItem := $main//keyItem[.//itemName]
let $keyItem-count := $keyItem => count()

let $toolItem := $main//toolItem[.//itemName]
let $toolItem-count := $toolItem => count()

let $consumableItem := $main//consumableItem[.//itemName]
let $consumableItem-count := $consumableItem => count()

let $spellItem := $main//spellItem[.//itemName]
let $spellItem-count := $spellItem => count()

let $weapon := $main//weapon[.//weaponName]
let $weapon-count := $weapon => count()

let $holyChalices := $main//holyChalices[.//itemName]
let $holyChalices-count := $holyChalices => count()

let $firearm := $main//firearm[.//firearmName]
let $firearm-count := $firearm => count()

let $a := " Attire"
let $c := " Caryll Rune"
let $w := " Weapon"
let $f := " Firearm"
let $h := " Holy Chalices"
let $k := " Key Item"
let $t := " Tool"
(:return (concat ("There are a total of ", $attire-count, " items considered",$a," in Bloodborne."))

This shows the number of of any of the items in the game (only those defined so far)
:)

return (concat ("There are a total of ", $weapon-count, " items considered",$w," in Bloodborne."))