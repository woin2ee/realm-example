//
//  DefaultTodoRepository.swift
//  RealmExample
//
//  Created by Jaewon on 2022/06/18.
//

import Foundation
import RealmSwift

final class DefaultTodoRepository {
    private var persistentStorage: TodoStorage
    
    init(persistentStorage: TodoStorage = RealmTodoStorage()) {
        self.persistentStorage = persistentStorage
    }
}

extension DefaultTodoRepository: TodoRepository {
    
    func save(todoItem item: TodoItem) {
        persistentStorage.save(todoItem: item)
    }
    
    func bind(behavior: @escaping (Results<TodoItem>) -> Void) -> NotificationToken {
        persistentStorage.bind(behavior: behavior)
    }
}
