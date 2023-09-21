////  ContentView.swift
//  Cookcademy
//
//  Created by Patricia Carlos on 07/06/23.
//  
//

import SwiftUI

struct RecipesListView: View {
    // MARK: - EnvironmentObject
    @EnvironmentObject private var recipeData: RecipeData // By passing an object through the environment, the current view and any children views can access that object
    // RecipeCategoryGridView will hold now hold the recipeData object. Since RecipesListView will be a child view, RecipesListView will access that data through the environment using the @EnvironmentObject property wrapper
    let category: MainInformation.Category // to display that the grid will pass in
    
    @State private var isPresenting = false
    @State private var newRecipe = Recipe()
    
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
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isPresenting = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isPresenting) {
                NavigationView {
                    ModifyRecipeView(recipe: $newRecipe)
                        .toolbar(content: {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Dismiss") {
                                    isPresenting = false
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Add") {
                                    recipeData.recipes.append(newRecipe)
                                    isPresenting = false
                                }
                            }
                        })
                        .navigationTitle("Add a New Recipe")
                }
            }
        }
    }
}


extension RecipesListView {
    private var recipes: [Recipe] {
        recipeData.recipes(for: category)
    }
    private var navigationTitle: String {
        "\(category.rawValue) Recipes"
    }
}
struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RecipesListView(category: .breakfast)
                .environmentObject( RecipeData() )
        }
    }
}
