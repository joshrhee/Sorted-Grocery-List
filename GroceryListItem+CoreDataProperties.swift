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

    @NSManaged public var groceryName: String?
    @NSManaged public var sectionListItem: NSSet?
    
    public var unwrappedName: String {
        groceryName ?? "Unknown name"
    }

    public var sectionsArray: [SectionListItem] {
        let sectionSet = sectionListItem as? Set<SectionListItem> ?? []
        
        return sectionSet.sorted {
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
