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
    @NSManaged var sectionName: String?
}

extension GroceryListItem {
    static func getAllGroceryNames() -> NSFetchRequest<GroceryListItem> {
        let request: NSFetchRequest<GroceryListItem> =
        GroceryListItem.fetchRequest() as! NSFetchRequest<GroceryListItem>
        
        let sort = NSSortDescriptor(key: "groceryName", ascending: true)
        request.sortDescriptors = [sort]
        
        return request
    }
    
    static func getAllSectionNames() -> NSFetchRequest<GroceryListItem> {
        let request: NSFetchRequest<GroceryListItem> =
        GroceryListItem.fetchRequest() as! NSFetchRequest<GroceryListItem>
        
        let sort = NSSortDescriptor(key: "sectionName", ascending: true)
        request.sortDescriptors = [sort]
        
        return request
    }
}
