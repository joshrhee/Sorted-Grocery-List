//
//  SectionListItem+CoreDataProperties.swift
//  GroceryListSwiftUI
//
//  Created by 이상준 on 4/16/22.
//
//

import Foundation
import CoreData


extension SectionListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SectionListItem> {
        return NSFetchRequest<SectionListItem>(entityName: "SectionListItem")
    }

    @NSManaged public var sectionName: String?
    @NSManaged public var groceryListItem: GroceryListItem?

}

extension SectionListItem : Identifiable {

}
