//
//  GroceryListItem.swift
//  GroceryListSwiftUI
//
//  Created by JoshRhee on 3/8/22.
//

import Foundation
import CoreData

class GroceryListItem: NSManagedObject, Identifiable {
    @NSManaged var groceryName: String?
    @NSManaged var createdAt: Date?
}

extension GroceryListItem {
    static func getAllToDoListItems() -> NSFetchRequest<GroceryListItem> {
        let request: NSFetchRequest<GroceryListItem> =
        GroceryListItem.fetchRequest() as! NSFetchRequest<GroceryListItem>
        
        let sort = NSSortDescriptor(key: "groceryName", ascending: true)
        request.sortDescriptors = [sort]
        
        return request
    }
}
