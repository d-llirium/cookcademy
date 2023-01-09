////  RecipeDetailView.swift
//  CookCademy
//
//  Created by Patricia Carlos on 09/01/23.
//  
//

import SwiftUI

struct RecipeDetailView: View
{
    let recipe: Recipe
    
    var body: some View
    {
        VStack
        {
            HStack
            {
                Text(
                    "Author: \(recipe.mainInformation.author)"
                )
                .font(
                    .subheadline
                )
                .padding()
                
                Spacer()
            }
            HStack
            {
                Text(
                    recipe.mainInformation.description
                )
                .font(
                    .subheadline
                )
                .padding()
                
                Spacer()
            }
            List
            {
                // there is an arrow to expand the list
                Section(
                    header: Text(
                        "Ingredients"
                    ),
                    content: {
                        /*
                         ForEach iterates the recipes and displays them
                         */
                        ForEach(
                            recipe.ingredients.indices,
                            id: \.self
                        ) { index in
                            /*
                             each recipe ingredient is using an id or identifier of \.self to identify unique items. In brief, \.self uses the entire recipe as the identifier.
                             */
                            let ingredient = recipe.ingredients[ index ]
                            Text(
                                ingredient.description
                            )
                        }
                    }
                )
            }
            List
            {
                Section(
                    header: Text(
                        "Directions"
                    ),
                    content: {
                        // ForEach iterates through the recipe’s directions
                        ForEach(
                            recipe.directions.indices,
                            id: \.self
                        ) { index in
                            /*
                             For each of the recipes, there is an HStack that contains Texts displaying the index and description of the direction
                             */
                            let direction = recipe.directions[ index ]
                            HStack
                            {
                                Text(
                                    "\(index + 1). "
                                ).bold()
                                Text(
                                    "\(direction.isOptional ? "(Optional) " : "")"
                                    + "\(direction.description)"
                                    
                                )
                            }
                        }
                    }
                )
            }
        }
        // MARK: - navigation Header
        /*
         Because the preview RecipeDetailView is wrapped in a NavigationView, the navigation title is visible.
         */
        .navigationTitle(
            recipe.mainInformation.name
        )
    }
}

// MARK: - Previews
struct RecipeDetailView_Previews: PreviewProvider
{
    // MARK: - initializes the view
    
    // @State tracks recipe changes
    @State static var recipe = Recipe
        .testRecipes[0]
    
    static var previews: some View
    {
        /*
         If you remove the NavigationView, you will no longer be able to see the navigation title in the preview.
         */
        NavigationView
        {
            /*
             You used the recipe to initialize and display an instance of this view.
             */
            RecipeDetailView(
                recipe: recipe
            )
        }
    }
}
