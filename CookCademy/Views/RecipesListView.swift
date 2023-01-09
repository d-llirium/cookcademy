////  ContentView.swift
//  CookCademy
//
//  Created by Patricia Carlos on 05/01/23.
//  
//

import SwiftUI

struct RecipesListView: View
{
    /*
     Add the @StateObject wrapper
     so that the view updates when the model changes,
     so it has access to the ViewModel changes
     */
    @StateObject var recipeData = RecipeData()
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    var body: some View
    {
        List
        {
            ForEach( recipes
            ) { recipe in
                NavigationLink( // NavigationLink now connects the RecipeListView to the RecipeDetailView.
                    recipe.mainInformation.name,// name of the recipe is listed
                    destination: RecipeDetailView(  recipe: recipe ) // destination Detail View
                )
            }.listRowBackground( listBackgroundColor )
                .foregroundColor( listTextColor )
        }.navigationTitle( navigationTitle )
    }
}

extension RecipesListView
{
    var recipes: [ Recipe ] { recipeData.recipes }
    
    var navigationTitle: String { "All Recipes" }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        // contains a NavigationView to display the navigationTitle.
        NavigationView
        {
            RecipesListView()
        }
    }
}
