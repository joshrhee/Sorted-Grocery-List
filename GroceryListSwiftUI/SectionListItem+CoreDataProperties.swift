//
//  SectionListItem+CoreDataProperties.swift
//  GroceryListSwiftUI
//
//  Created by JoshRhee on 3/26/22.
//
//

import Foundation
import CoreData
import SwiftUI


extension SectionListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SectionListItem> {
        return NSFetchRequest<SectionListItem>(entityName: "SectionListItem")
    }

    @NSManaged public var sectionName: String?
    @NSManaged public var itemName: String?
    
    public var unwrappedSectionName: String {
        sectionName ?? "Unknown sectionName"
    }
    
    public var unwrappedItemName: String {
        itemName ?? "Unknown sectionName"
    }

}

extension SectionListItem : Identifiable {

}
