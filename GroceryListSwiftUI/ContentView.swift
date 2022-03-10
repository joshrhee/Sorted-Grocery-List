//
//  ContentView.swift
//  GroceryListSwiftUI
//
//  Created by JoshRhee on 3/7/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var context
    
    @FetchRequest(fetchRequest: GroceryListItem.getAllToDoListItems())
    var items: FetchedResults<GroceryListItem>
    
    @State var text: String = ""
    
    var body: some View {
        NavigationView {
            List {

                // Mark: - Grocery name input textfield
                
                Section(header: Text("Grocery Name")) {
                    HStack {
                        TextField("Enter grocery name...", text: $text)
                        
                        Button(action: {
                            
                            if !text.isEmpty {
                                let newItem = GroceryListItem(context: context)
                                newItem.groceryName = text
                                newItem.createdAt = Date()
                                
                                do {
                                    try context.save()
                                } catch {
                                    print("Debug: Button action error is ", error)
                                }
                                
                                // Reseting to empty textfield when save button is clicked
                                text = ""
                                
                            }
                            
                        }, label: {
                            Text("Save")
                        })
                    }
                }
                
                
                // MARK: - Grocery name list
                
                Section {
                    ForEach(items) { groceryListItem in
                        VStack(alignment: .leading) {
                            NavigationLink(destination: SectionView(groceryListItem: groceryListItem)) {
                                
                                if groceryListItem.groceryName != nil {
                                    Text(groceryListItem.groceryName!).font(.headline)
                                }
                                
                            }
                        }
                    }
                    .onDelete(perform: { indexSet in
                        guard let index = indexSet.first else {
                            return
                        }
                        let itemToDelete = items[index]
                        context.delete(itemToDelete)
                        
                        do {
                            try context.save()
                        } catch {
                            print("Debug: .onDelete error is: ", error)
                        }
                    })
                }
            }
            .navigationTitle("Grocery List")
        }
    }
    
//    MARK: - Some Tutorial
    
//    @State private var storeName: String = ""
//
//    var body: some View {
//        NavigationView {
//
//            VStack {
//                TextField("Enter store name", text: $storeName)
//                .font(.title2)
//                .modifier(
//                    customViewModifier(
//                        roundCornes: 6,
//                        startColor: .orange,
//                        endColor: .purple,
//                        textColor: .white
//                    )
//                )
//
//                Button("Save store") {
//
//                }
//                .frame(width: 200)
//                .padding()
//                .foregroundColor(.white)
//                .background(Color.orange)
//                .cornerRadius(40)
//
//                List {
//                    ForEach(0..<20) { store in
//                        Text("List \(store)")
////                        print("List \(store)")
//                    }
//                }
//                .listStyle(PlainListStyle())
//
//            }
//            .padding()
//            .navigationTitle("Grocery")
//
//        }
//    }
    
// MARK: - Original
    
//    @Environment(\.managedObjectContext) private var viewContext
//
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>
//
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//                    } label: {
//                        Text(item.timestamp!, formatter: itemFormatter)
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//            Text("Select an item")
//        }
//    }
//
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}


// MARK: - Some Tutorial

//struct customViewModifier: ViewModifier {
//    var roundCornes: CGFloat
//    var startColor: Color
//    var endColor: Color
//    var textColor: Color
//
//    func body(content: Content) -> some View {
//        content
//            .padding()
//            .background(
//                LinearGradient(
//                    gradient: Gradient(colors: [startColor, endColor]),
//                    startPoint: .topLeading,
//                    endPoint: .bottomTrailing
//                )
//            )
//            .cornerRadius(roundCornes)
//            .padding(3)
//            .foregroundColor(textColor)
//            .overlay(
//                RoundedRectangle(cornerRadius: roundCornes)
//                    .stroke(
//                        LinearGradient(
//                            colors: [startColor, endColor],
//                            startPoint: .topLeading,
//                            endPoint: .bottomTrailing),
//                        lineWidth: 2.5
//                        )
//            )
//            .font(.custom("Open sans", size: 18))
//            .shadow(radius: 10)
//
//    }
//}
