////  RecipeData.swift
//  CookCademy
//
//  Created by Patricia Carlos on 06/01/23.
//  
//

import Foundation

// ObservableObject protocol monitors when the @Published property changes
class RecipeData: ObservableObject
{
    // The @Published property wrapper attaches to a property to monitor any changes
    @Published var recipes = Recipe.testRecipes
}
