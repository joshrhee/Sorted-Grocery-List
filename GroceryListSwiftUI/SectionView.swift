//
//  SectionView.swift
//  GroceryListSwiftUI
//
//  Created by JoshRhee on 3/10/22.
//

import SwiftUI

struct SectionView: View {
    let groceryListItem: GroceryListItem
    
    @Environment(\.managedObjectContext) var context
    
    @FetchRequest(fetchRequest: GroceryListItem.getAllSectionNames())
    var sectionNameItems: FetchedResults<GroceryListItem>
    
    @State var sectionName: String = ""
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Section Name...")) {
                    HStack {
                        TextField("Enter section name...", text: $sectionName)
                        
                        Button(action: {
                            
                            if !sectionName.isEmpty {
                                let newItem = GroceryListItem(context: context)
                                newItem.sectionName = sectionName
                                
                                do {
                                    try context.save()
                                } catch {
                                    print("Debug: Button action error is ", error)
                                }
                                
                                // Reseting to empty textfield when save button is clicked
                                sectionName = ""
                                
                            }
                            
                        }, label: {
                            Text("Save")
                        })
                    }
                }
                
                // MARK: - Section name list
                
                Section {
                    ForEach(sectionNameItems) { groceryListItem in
                        VStack(alignment: .leading) {
                            
                            
                            if groceryListItem.sectionName != nil {
                                Text(groceryListItem.sectionName!).font(.headline)
                            }
                                
                            
                        }
                    }
                    .onDelete(perform: { indexSet in
                        guard let index = indexSet.first else {
                            return
                        }
                        let itemToDelete = sectionNameItems[index]
                        context.delete(itemToDelete)
                        
                        do {
                            try context.save()
                        } catch {
                            print("Debug: .onDelete error is: ", error)
                        }
                    })
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
