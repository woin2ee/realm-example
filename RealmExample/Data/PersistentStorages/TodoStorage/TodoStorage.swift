//
//  TodoStorage.swift
//  RealmExample
//
//  Created by Jaewon on 2022/06/18.
//

import Foundation
import RealmSwift

protocol TodoStorage {
    func save(todoItem item: TodoItem)
    func bind(behavior: @escaping (Results<TodoItem>) -> Void) -> NotificationToken
}
