////  ContentView.swift
//  Cookcademy
//
//  Created by Patricia Carlos on 07/06/23.
//  
//

import SwiftUI

struct RecipesListView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesListView()
    }
}
