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
    
    func bind(behavior: @escaping (Results<TodoItem>) -> Void) -> NotificationToken {
        let todoList = realm.objects(TodoItem.self)
        return todoList.observe { changes in
            switch changes {
            case .initial(let todoList):
                behavior(todoList)
            case .update(let todoList, _, _, _):
                behavior(todoList)
            case .error(let error):
                fatalError(error.localizedDescription)
            }
        }
    }
}
