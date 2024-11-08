//
//  CoreDataManager.swift
//  TestApp
//
//  Created by Пигалова Елена on 06/11/24.
//

import Foundation
import CoreData

struct CoreDataManager {
    
    static let shared = CoreDataManager()
    
    private var viewContext = PersistenceController.shared.container.viewContext
    
    func addItemList(_ items: [NetworkItem]) {
        deleteAllItems()
        
        let _:[Item] = items.compactMap { (networkItem) -> Item in
            let item = Item(context: self.viewContext)
            item.name    = networkItem.name
            item.id      = networkItem.id
            item.descript    = networkItem.description
            
            return item
        }
        
        saveContext()
    }
    
    func deleteAllItems() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        do {
            if let all = try viewContext.fetch(request) as? [Item] {
                for catItem in all {
                    viewContext.delete(catItem)
                }
            }
        } catch {
            let nsError = error as NSError
            print("Unresolved error \(nsError), \(nsError.userInfo)")
        }

        saveContext()
    }

    func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                print("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    func addItem(item: NetworkItem) {
        let newItem = Item(context: viewContext)
        newItem.id = "\(Int.random(in: 1..<100))"
        newItem.name = "Item\(String(describing: newItem.id))"
        newItem.descript = "Description for Item\(String(describing: newItem.id))"
        
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            print("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
