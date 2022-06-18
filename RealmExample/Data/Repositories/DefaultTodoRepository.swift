//
//  DefaultTodoRepository.swift
//  RealmExample
//
//  Created by Jaewon on 2022/06/18.
//

import Foundation

final class DefaultTodoRepository {
    private var persistentStorage: TodoStorage
    
    init(persistentStorage: TodoStorage = RealmTodoStorage()) {
        self.persistentStorage = persistentStorage
    }
    
    func changePersistentStorage(to persistentStorage: TodoStorage) {
        self.persistentStorage = persistentStorage
    }
}

extension DefaultTodoRepository: TodoRepository {
    
    func save(todoItem item: TodoItem) {
        persistentStorage.save(todoItem: item)
    }
    
    func fetchAllTodoList(_ completion: @escaping (Result<[TodoItem], Error>) -> Void) {
        persistentStorage.fetchAllTodoList(completion)
    }
}
