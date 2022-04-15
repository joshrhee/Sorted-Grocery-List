//
//  SectionListItem.swift
//  GroceryListSwiftUI
//
//  Created by JoshRhee on 4/14/22.
//

import Foundation
import CoreData

class SectionListItem: NSManagedObject, Identifiable  {
    @NSManaged var sectionName: String?
}

extension SectionListItem {
    static func getAllToDoListItems() -> NSFetchRequest<SectionListItem> {
        let request: NSFetchRequest<SectionListItem> =
        SectionListItem.fetchRequest() as! NSFetchRequest<SectionListItem>
        
        let sort = NSSortDescriptor(key: "sectionName", ascending: true)
        request.sortDescriptors = [sort]
        
        return request
    }
}
