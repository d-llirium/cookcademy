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
            ScrollView {
                LazyVGrid(columns: [GridItem()], content: {
                    ForEach(MainInformation.Category.allCases,
                            id: \.self) { category in
                        ZStack {
                            Image(category.rawValue)
                                .resizable() // forcing the image to fill all available space
                                .aspectRatio(contentMode: .fit) // is set to .fit which forces the content to fit within the ZStack‘s frame
                            Text(category.rawValue) //  displays the raw values in a Text in a single column
                                .font(.title)
                        }
                    }
                })
                .navigationTitle("Categories")
            }
        }
    }
}

struct RecipeCategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCategoryGridView()
    }
}
