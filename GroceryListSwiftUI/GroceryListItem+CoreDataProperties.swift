//
//  GroceryListItem+CoreDataProperties.swift
//  GroceryListSwiftUI
//
//  Created by JoshRhee on 3/26/22.
//
//

import Foundation
import CoreData


extension GroceryListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GroceryListItem> {
        return NSFetchRequest<GroceryListItem>(entityName: "GroceryListItem")
    }

    @NSManaged public var createdAt: Date?
    @NSManaged public var groceryName: String?
    @NSManaged public var timestamp: Date?
    
    public var unwrappedCreatedAt: Date {
        createdAt ?? "Unknown createdAt"
    }
    
    public var unwrappedGroceryName: String {
        groceryName ?? "Unknown groceryName"
    }
        
    public var unwrappedTimestamp: Date {
        timestamp ?? "Unknown timeStamp"
    }
    
    public var groceryNameArray: [GroceryListItem] {
        let set = groceryName as? Set<GroceryListItem> ?? []
        
        return set.sorted {
            $0.w
        }
    }

}

extension GroceryListItem : Identifiable {

}
