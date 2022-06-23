//
//  RealmTodoStorage.swift
//  RealmExample
//
//  Created by Jaewon on 2022/06/18.
//

import Foundation
import RealmSwift

final class RealmTodoStorage {
    
    private var realm: Realm
    
    init() {
        self.realm = try! Realm()
        
        print(realm.configuration.fileURL!)
    }
}

extension RealmTodoStorage: TodoStorage {
    
    func save(todoItem item: TodoItem) {
        try! realm.write {
            realm.add(item)
        }
    }
    
    func update(todoItem item: TodoItem) {
        let items = realm.objects(TodoItem.self)
        guard let targetItem = items.filter({ $0.id.isEqual(item.id) }).first else { return }
        
        try! realm.write {
            targetItem.title = item.title
            targetItem.detail = item.detail
            targetItem.importanceEnum = item.importanceEnum
        }
    }
    
    func bind(behavior: @escaping (Results<TodoItem>) -> Void) -> NotificationToken {
        let items = realm.objects(TodoItem.self)
        return items.observe { changes in
            switch changes {
            case .initial(let items):
                behavior(items)
            case .update(let items, _, _, _):
                behavior(items)
            case .error(let error):
                fatalError(error.localizedDescription)
            }
        }
    }
}
