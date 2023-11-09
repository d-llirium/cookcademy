//
//  ModifyIngredientsView.swift
//  Cookcademy
//
//  Created by User on 09/11/23.
//

import SwiftUI

struct ModifyIngredientsView: View {
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    @Binding var ingredients: [Ingredient] // ingredients is wrapped with @Binding which means this view does not own it.
    @State private var newIngredient = Ingredient()
    
    var body: some View {
        let addIngredientView = ModifyIngredientView(ingredient: $newIngredient) { ingredient in
            ingredients.append(ingredient)
            newIngredient = Ingredient()
        }
        VStack {
            if ingredients.isEmpty {
                Spacer()
                NavigationLink(
                    "Add the first ingredient",
                    destination: addIngredientView
                )
                    Spacer()
            } else {
                List {
                    ForEach(ingredients.indices, id: \.self) { index in
                        let ingredient = ingredients[index]
                        Text(ingredient.description)
                    }
                    .listRowBackground(listBackgroundColor)
                    NavigationLink(
                        "Add another ingredient",
                        destination: addIngredientView
                    )
                    .listRowBackground(listBackgroundColor)
                    .buttonStyle(PlainButtonStyle())
                }
                .foregroundColor(listTextColor)
            }
        }
    }
}

struct ModifyIngredientsView_Previews: PreviewProvider {
    @State static var emptyIngredients = [Ingredient]()
    
    static var previews: some View {
        NavigationView {
            ModifyIngredientsView(ingredients:  $emptyIngredients)
        }
    }
}
