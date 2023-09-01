//
//  RecipeData.swift
//  Cookcademy
//
//  Created by User on 24/08/23.
//

import Foundation

class RecipeData: ObservableObject { // monitors @Published var chagnges
    @Published var recipes = Recipe.testRecipes // monitors the model changes
    
    func recipes(for category: MainInformation.Category) -> [Recipe] {
        var filteredRecipes = [Recipe]()
        for recipe in recipes {
            if recipe.mainInformation.category == category {
                filteredRecipes.append(recipe)
            }
        }
        return filteredRecipes
    }
}
