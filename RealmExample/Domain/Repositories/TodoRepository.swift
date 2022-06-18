//
//  TodoRepository.swift
//  RealmExample
//
//  Created by Jaewon on 2022/06/18.
//

import Foundation

protocol TodoRepository {
    func save(todoItem item: TodoItem)
    func fetchAllTodoList(_ completion: @escaping (Result<[TodoItem], Error>) -> Void)
}
