import UIKit

var str = "Hello playground"
let tutorialTeam = 56
let editorialTeam = 23
var totalTeam = tutorialTeam + editorialTeam

totalTeam += 1

let tutorialTeamInferred = 56
let tutorialTeamExplicit: Int = 56

let priceIntInferred = -19
let priceIntExplicit:Int = -19

let priceInferred = -19.99
let priceExplicit:Double = -19.99

let priceFloatInferred = 19.99
let priceFloatExplicit:Float = 19.99

let onSaleInferred = true
let onSaleExplicit:Bool = false

let nameInferred = "Whoopie Cushion"
let nameExplicit:String = "Whoopie Cushion"

if (onSaleInferred) {
  println("\(nameInferred) on sale for \(priceInferred)!")
} else {
  println("\(nameInferred) at regular price: \(priceInferred)!")
}

var shoppingListExplicit = [String]()
shoppingListExplicit = ["Eggs","Milk"]
//var shoppingExplicit [String] = ["Eggs","Milk"]

var shoppingList = ["Eggs","Milk"]
println("The shopping list contains \(shoppingList.count) items.")
shoppingList.append("Flour")
shoppingList += "Baking Powder"
shoppingList += ["Chocolate Spread","Cheese","Butter"]
var firstItem = shoppingList[0]
shoppingList[0] = "Six eggs"
//shoppingList[0...3] = ["Banana","Apple"]
shoppingList

shoppingList += ["Baking Powder"]
//shoppingList now contains 4 items
shoppingList += ["Chocolate Spread","Cheese","Butter"]
//shoppingList now contains 7 items
shoppingList.insert("Maple syrub", atIndex: 0)
//shoppingList now contains 7 items
//"Maple syrub" is now the first item in the list
shoppingList.append("Flour")
//shoppingList now contains 3 items,and somone is making pancakes
shoppingList += ["Baking Powder"]
firstItem = shoppingList[0]
//firstitem is equal to "Eggs"
shoppingList[4...6]  = ["Banana","Apple"]
//shoppingList now contains 6 items
shoppingList