//
//  RecipeCategoryGridView.swift
//  Cookcademy
//
//  Created by User on 28/08/23.
//

import SwiftUI

struct RecipeCategoryGridView: View {
    private var recipeData = RecipeData()
    
    var body: some View {
        NavigationView {
            LazyVGrid(columns: [GridItem()], content: {
                ForEach(MainInformation.Category.allCases,
                        id: \.self) { category in
                    Text(category.rawValue) //  displays the raw values in a Text in a single column
                        .font(.title)
                }
            })
            .navigationTitle("Categories")
        }
    }
}

struct RecipeCategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCategoryGridView()
    }
}
