//
//  RecipeData.swift
//  Cookcademy
//
//  Created by User on 24/08/23.
//

import Foundation

class RecipeData: ObservableObject { // monitors @Published var chagnges
    @Published var recipes = Recipe.testRecipes // monitors the model changes
}
