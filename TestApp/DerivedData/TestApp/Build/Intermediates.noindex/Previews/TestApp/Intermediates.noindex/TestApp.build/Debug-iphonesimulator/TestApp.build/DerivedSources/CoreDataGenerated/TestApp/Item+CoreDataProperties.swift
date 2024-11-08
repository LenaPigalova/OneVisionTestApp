//
//  Item+CoreDataProperties.swift
//  
//
//  Created by Пигалова Елена on 05/11/24.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var descript: String?
    @NSManaged public var id: String?
    @NSManaged public var name: String?

}

extension Item : Identifiable {

}
