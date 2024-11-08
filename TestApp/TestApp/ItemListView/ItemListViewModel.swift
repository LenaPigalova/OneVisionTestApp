//
//  ItemListViewModel.swift
//  TestApp
//
//  Created by Пигалова Елена on 06/11/24.
//

import Foundation

class ItemListViewModel {

    func getItems() {
        ApiClient.getItemList { result in
            switch result {
            case .success(let itemList):
                CoreDataManager.shared.addItemList(itemList)
            case .failure(let error):
                print(error)
            }
        }
    }

    func addItem(item: NetworkItem) {
        ApiClient.addItem(item: item) { result in
            switch result {
            case .success(let networkItem):
                CoreDataManager.shared.addItem(item: networkItem)
            case .failure(let error):
                CoreDataManager.shared.addItem(item: item)
                print(error)
            }
        }
    }
}
