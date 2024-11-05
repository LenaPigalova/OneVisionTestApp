@_private(sourceFile: "ContentView.swift") import TeatApp
import CoreData
import SwiftUI
import SwiftUI

extension ContentView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/elena/Documents/программы/OneVisionTestApp/TeatApp/TeatApp/ContentView.swift", line: 86)
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    
#sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: deleteItems(offsets:)) private func __preview__deleteItems(offsets: IndexSet) {
        #sourceLocation(file: "/Users/elena/Documents/программы/OneVisionTestApp/TeatApp/TeatApp/ContentView.swift", line: 62)
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    
#sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: addItem()) private func __preview__addItem() {
        #sourceLocation(file: "/Users/elena/Documents/программы/OneVisionTestApp/TeatApp/TeatApp/ContentView.swift", line: 46)
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    
#sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/elena/Documents/программы/OneVisionTestApp/TeatApp/TeatApp/ContentView.swift", line: 20)
        NavigationView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                    } label: {
                        Text(item.timestamp!, formatter: itemFormatter)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label(__designTimeString("#2209.[2].[2].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.[1].arg[0].value.[0].arg[1].value.[0].arg[0].value", fallback: "Add Item"), systemImage: __designTimeString("#2209.[2].[2].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.[1].arg[0].value.[0].arg[1].value.[0].arg[1].value", fallback: "plus"))
                    }
                }
            }
            Text(__designTimeString("#2209.[2].[2].property.[0].[0].arg[0].value.[1].arg[0].value", fallback: "Select an item"))
        }
    
#sourceLocation()
    }
}

import struct TeatApp.ContentView
import struct TeatApp.ContentView_Previews
