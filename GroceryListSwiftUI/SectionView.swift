//
//  SectionView.swift
//  GroceryListSwiftUI
//
//  Created by JoshRhee on 3/10/22.
//

import SwiftUI

struct SectionView: View {
    let groceryListItem: GroceryListItem
    
    @State var text: String = ""
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Section Name...")) {
                    HStack {
                        TextField("Enter section name...", text: $text)
                    }
                }
                
                Section {
                    
                }
            }
        }
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(groceryListItem: GroceryListItem(/*...*/))
    }
}
