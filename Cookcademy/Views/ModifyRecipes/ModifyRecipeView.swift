//
//  ModifyRecipeView.swift
//  Cookcademy
//
//  Created by User on 21/09/23.
//

import SwiftUI

struct ModifyRecipeView: View {
    @Binding var recipe: Recipe // recipe is wrapped with @Binding which means this view does not own it.
    var body: some View {
        Button("Fill in the recipe with test data.") {
            recipe.mainInformation = MainInformation(
                name: "test",
                description: "test",
                author: "test",
                category: .breakfast)
            recipe.directions = [
                Direction(description: "test",
                          isOptional: false)
            ]
            recipe.ingredients = [
                Ingredient( name: "test",
                            quantity: 1.0,
                            unit: .none)
            ]
        }
    }
}

struct ModifyRecipeView_Previews: PreviewProvider {
    @State static var recipe = Recipe() // @State recipe to act as that binding.
    static var previews: some View {
        ModifyRecipeView(recipe: $recipe)
    }
}
