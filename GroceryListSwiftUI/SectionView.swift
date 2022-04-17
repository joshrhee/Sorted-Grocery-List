//
//  SectionView.swift
//  GroceryListSwiftUI
//
//  Created by JoshRhee on 3/10/22.
//

import SwiftUI

struct SectionView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @StateObject var grocery: GroceryListItem
    @State private var sectionName: String = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("Section name", text: $sectionName)
                    .textFieldStyle(.roundedBorder)
                Button(action: addSection) {
                    Label("", systemImage: "plus")
                }
            }.padding()
            
            List {
                ForEach(grocery.sectionsArray) { section in
                    Text(section.unwrappedName)
                }.onDelete(perform: deleteSection)
            }
        }.navigationTitle("Sections")
    }
    
    private func addSection() {
        withAnimation {
            let newSection = SectionListItem(context: viewContext)
            newSection.sectionName = sectionName
            
            grocery.addToSectionListItem(newSection)
            PersistenceController.shared.saveContext()
        }
    }
    
    private func deleteSection(at offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                let section = grocery.sectionsArray[index]
                viewContext.delete(section)
                PersistenceController.shared.saveContext()
            }
        }
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = PersistenceController.preview.container.viewContext
        let newGrocery = GroceryListItem(context: viewContext)
        newGrocery.groceryName = "Kroger"
        
        let section1 = SectionListItem(context: viewContext)
        section1.sectionName = "Fruit"
        
        let section2 = SectionListItem(context: viewContext)
        section2.sectionName = "Meat"
        
        newGrocery.addToSectionListItem(section1)
        newGrocery.addToSectionListItem(section2)
        
        
        return SectionView(grocery: newGrocery)
            .environment(\.managedObjectContext,
                          PersistenceController.preview.container.viewContext)
    }
}
