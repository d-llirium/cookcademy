//
//  ModifyMainInformationView.swift
//  Cookcademy
//
//  Created by User on 01/11/23.
//

import SwiftUI

struct ModifyMainInformationView: View {
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    @Binding var mainInformation: MainInformation // is wrapped with @Binding which means this view does not own it.
    
    var body: some View {
        Form {
            TextField("Recipe Name", text: $mainInformation.name)
                .listRowBackground(listBackgroundColor)
            TextField("Author", text: $mainInformation.author)
                .listRowBackground(listBackgroundColor)
            Section(
                header: Text("Description")
            ) {
                TextEditor(text: $mainInformation.description)
                    .listRowBackground(listBackgroundColor)
            }
            Picker(selection:  $mainInformation.category,label:
                    HStack {
                        Text("Category")
                        Spacer()
                        Text(mainInformation.category.rawValue)
                    }
            ) {
                ForEach(MainInformation.Category.allCases, id:  \.self) { category in
                    Text(category.rawValue)
                }
            }
            .listRowBackground(listBackgroundColor)
            .pickerStyle(MenuPickerStyle())
        }
        .foregroundColor(listTextColor)
    }
}

struct ModifyMainInformationView_Previews: PreviewProvider {
    @State static var mainInfo = MainInformation() // @State recipe to act as that binding.
    static var previews: some View {
        ModifyMainInformationView(mainInformation: $mainInfo)
    }
}
