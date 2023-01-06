////  Recipe.swift
//  CookCademy
//
//  Created by Patricia Carlos on 05/01/23.
//  
//

import Foundation

struct Recipe: Identifiable
{
    var id = UUID()
    
    var mainInformation: MainInformation
    var ingredients: [ Ingredient ]
    var directions: [ Direction ]
    
    init(
        mainInformation: MainInformation,
        ingredients: [ Ingredient ],
        directions: [ Direction ]
    ) {
        self.mainInformation = mainInformation
        self.ingredients = ingredients
        self.directions = directions
    }
    
    init()
    {
        self.init(
            mainInformation: MainInformation(
                name: "",
                description: "",
                author: "",
                category: .breakfast
            ),
            ingredients: [],
            directions: []
        )
    }
}

struct MainInformation
{
    var name: String
    var description: String
    var author: String
    var category: Category
    
    // since it conforms to CaseIterable, you can get all of the cases by using .allcases.
    // .rawValue = String
    enum Category: String, CaseIterable
    {
        case breakfast = "Breakfast"
        case lunch = "Lunch"
        case dinner = "Dinner"
        case dessert = "Dessert"
    }
}

struct Ingredient
{
    var name: String
    var quantity: Double
    var unit: Unit // Ounces, Grams, Cups, Tablespoons, Teaspoons, None
    
    var description: String
    {
        // eturning a formatted String from a Double. The %g String Format Specifier suppresses any trailing zeros. If you had "1.10000", it would turn your number to "1.1". This functionality allows you to guarantee that the numbers are printed in a readable way. https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Strings/Articles/formatSpecifiers.html
        let formattedQuantity = String(
            format: "%g",
            quantity
        )
        switch unit
        {
        case .none:
            let formattedName = quantity == 1 ? name : "\(name)s"
            return "\(formattedQuantity) \(formattedName)"
        default:
            if quantity == 1
            {
                return "1 \(unit.singularName) \(name)" // drops the last char , S
            } else {
                return "\(formattedQuantity) \(unit.rawValue) \(name)"
            }
        }
    }
    
    // since it conforms to CaseIterable, you can get all of the cases by using .allcases.
    // .rawValue = String
    enum Unit: String, CaseIterable
    {
        case oz = "Ounces"
        case g = "Grams"
        case cups = "Cups"
        case tbs = "Tablespoons"
        case tsp = "Teaspoons"
        case none = "No units"
        
        var singularName: String
        {
            String(
                // dropLast dorps the last char on the String
                rawValue.dropLast()
            )
        }
    }
}

struct Direction
{
    var description: String
    var isOptional: Bool
}
