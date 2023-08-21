//
//  ListViewModel.swift
//  ParaCha
//
//  Created by Anita Saragih on 24/05/23.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itemsKey: String = "items_list"
    init() {
        getItems()
    }
    func getItems() {
//        let newItems = [
//            ItemModel(title: "First Task", isCompleted: false),
//            ItemModel(title: "Second Task", isCompleted: true),
//            ItemModel(title: "Third Task", isCompleted: false),
//    ]
//        items.append(contentsOf: newItems)
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey)
        else {return}
        guard
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data) else {return}
        self.items = savedItems
    }
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet, targetIndex: Int) {
        items.move(fromOffsets: from, toOffset: targetIndex)
    }
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
