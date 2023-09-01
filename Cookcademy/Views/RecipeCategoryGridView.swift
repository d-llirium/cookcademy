//
//  RecipeCategoryGridView.swift
//  Cookcademy
//
//  Created by User on 28/08/23.
//

import SwiftUI

struct RecipeCategoryGridView: View {
    @StateObject private var recipeData = RecipeData() // @StateObject. RecipesCategoryGridView will maintain the state of recipeData and pass recipeData as an environmentObject to the other views
    
    var body: some View {
        let columns = [GridItem(), GridItem()]
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, content: {
                    ForEach(MainInformation.Category.allCases,
                            id: \.self) { category in
                        NavigationLink (
                            destination: RecipesListView(category: category)
                                .environmentObject(recipeData)
                        ) { // RecipeCategoryGridView now navigates to RecipesListView by using a NavigationLink
                            CategoryView(category: category)
                        }
                    }
                })
                .navigationTitle("Categories")
            }
        }
    }
}

struct CategoryView: View {
    let category: MainInformation.Category
    
    var body: some View {
        // The ZStack is refactored into a new structure, CategoryView. Then, CategoryView is instantiated for every category within the ForEach.
        ZStack {
            Image(category.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.35)
            Text(category.rawValue)
                .font(.title)
        }
    }
}

struct RecipeCategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCategoryGridView()
    }
}
