//
//  ModifyRecipeView.swift
//  Cookcademy
//
//  Created by User on 21/09/23.
//

import SwiftUI

struct ModifyRecipeView: View {
    @Binding var recipe: Recipe // recipe is wrapped with @Binding which means this view does not own it.
    
    @State private var selection = Selection.main
    
    var body: some View {
        VStack {
            Picker("Select recipe component", selection: $selection) { // Picker needs a binding to something that represents all of the options
                Text("Main Info").tag(Selection.main)
                Text("Ingredients").tag(Selection.ingredients)
                Text("Directions").tag(Selection.directions)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            switch selection {
            case .main:
                ModifyMainInformationView(mainInformation: $recipe.mainInformation)
            case .ingredients:
                ModifyIngredientsView(ingredients: $recipe.ingredients)
            case .directions:
                Text("Directions Editor")
            }
            Spacer()
        }
    }
    enum Selection {
        case main
        case ingredients
        case directions
    }
}

struct ModifyRecipeView_Previews: PreviewProvider {
    @State static var recipe = Recipe() // @State recipe to act as that binding.
    static var previews: some View {
        ModifyRecipeView(recipe: $recipe)
    }
}
