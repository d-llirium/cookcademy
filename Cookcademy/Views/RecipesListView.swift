////  ContentView.swift
//  Cookcademy
//
//  Created by Patricia Carlos on 07/06/23.
//  
//

import SwiftUI

struct RecipesListView: View {
    
    @StateObject var recipeData = RecipeData() // updates view when the ViewModel changes
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    var body: some View {
        NavigationStack{
            List {
                ForEach( recipes ) { recipe in
                    NavigationLink(
                        recipe.mainInformation.name,
                        destination: RecipeDetailView(recipe: recipe)
                    )
                }
                .listRowBackground(listBackgroundColor)
                .foregroundColor(listTextColor)
            }
            .navigationTitle(navigationTitle)
        }
    }
}


extension RecipesListView {
    var recipes: [Recipe] {
        recipeData.recipes
    }
    var navigationTitle: String {
        "All Recipes"
    }
}
struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesListView()
    }
}
