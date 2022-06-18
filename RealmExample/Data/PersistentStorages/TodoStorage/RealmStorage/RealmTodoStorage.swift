//
//  RealmTodoStorage.swift
//  RealmExample
//
//  Created by Jaewon on 2022/06/18.
//

import Foundation
import RealmSwift

final class RealmTodoStorage {
    
    let realm = try! Realm()
}

extension RealmTodoStorage: TodoStorage {
    
    func save(todoItem item: TodoItem) {
        try! realm.write {
            realm.add(item)
        }
    }
    
    func fetchAllTodoList(_ completion: @escaping (Result<[TodoItem], Error>) -> Void) {
        let todoList = realm.objects(TodoItem.self)
        completion(.success(todoList.map{ $0 }))
    }
}
