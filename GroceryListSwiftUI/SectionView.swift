//
//  SectionView.swift
//  GroceryListSwiftUI
//
//  Created by JoshRhee on 3/10/22.
//

import SwiftUI

struct SectionView: View {
    @Environment(\.managedObjectContext) var context
    
    @FetchRequest(fetchRequest: SectionListItem.getAllToDoListItems())
    var sections: FetchedResults<SectionListItem>
    
    @State var sectionName: String = ""
    
    var body: some View {
        NavigationView {
            List {
                
                // Mark: - Section name input textfield
                
                Section(header: Text("Section Name...")) {
                    HStack {
                        TextField("Enter section name...", text: $sectionName)
                        
                        Button(action: {
                            if !sectionName.isEmpty {
                                let newItem = SectionListItem(context: context)
                                newItem.sectionName = sectionName
                            }
                            
                            do {
                                try context.save()
                            } catch {
                                print("Debug: SectionView button action error: ", error)
                            }
                            
                            sectionName = ""
                        }, label: {
                            Text("Save")
                        })
                    }
                }
                
                // Mark: - section name list
                
                Section {
                    ForEach(sections) { sectionListItem in
                        VStack(alignment: .leading) {
                            if sectionListItem.sectionName != nil {
                                Text(sectionListItem.sectionName!).font(.headline)
                            }
                        }
                    }.onDelete(perform: { indexSet in
                        guard let index = indexSet.first else {
                            return
                        }
                        let itemToDelete = sections[index]

                        context.delete(itemToDelete)
                        
                        do {
                            try context.save()
                        } catch {
                            print("Debug: sections.onDelete error is: ", error)
                        }
                    })
                }
            }
        }
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
