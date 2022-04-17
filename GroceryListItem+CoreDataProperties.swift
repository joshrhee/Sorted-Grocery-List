//
//  GroceryListItem+CoreDataProperties.swift
//  GroceryListSwiftUI
//
//  Created by 이상준 on 4/16/22.
//
//

import Foundation
import CoreData


extension GroceryListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GroceryListItem> {
        return NSFetchRequest<GroceryListItem>(entityName: "GroceryListItem")
    }

//    @NSManaged public var createdAt: Date?
    @NSManaged public var groceryName: String?
//    @NSManaged public var sectionName: String?
    @NSManaged public var timestamp: Date?
    @NSManaged public var sectionListItem: NSSet?
    
    public var unwrappedName: String {
        groceryName ?? "Unkown name"
    }
    
    public var sectionListArray: [SectionListItem] {
        let sectionListSet = sectionListItem as? Set<SectionListItem> ?? []
        
        return sectionListSet.sorted {
            $0.unwrappedName < $1.unwrappedName
        }
    }

}

// MARK: Generated accessors for sectionListItem
extension GroceryListItem {

    @objc(addSectionListItemObject:)
    @NSManaged public func addToSectionListItem(_ value: SectionListItem)

    @objc(removeSectionListItemObject:)
    @NSManaged public func removeFromSectionListItem(_ value: SectionListItem)

    @objc(addSectionListItem:)
    @NSManaged public func addToSectionListItem(_ values: NSSet)

    @objc(removeSectionListItem:)
    @NSManaged public func removeFromSectionListItem(_ values: NSSet)

}

extension GroceryListItem : Identifiable {

}
