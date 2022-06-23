//
//  MainViewModel.swift
//  RealmExample
//
//  Created by Jaewon on 2022/06/18.
//

import Foundation
import RealmSwift

protocol MainViewModelInput {
    
}

protocol MainViewModelOutput {
    var todoList: Observable<[TodoItemDTO]> { get }
}

protocol MainViewModel: MainViewModelInput, MainViewModelOutput {}

final class DefaultMainViewModel: MainViewModel {
    
    private var todoRepository: TodoRepository
    private var token: NotificationToken?
    
    // MARK: - Output
    
    var todoList: Observable<[TodoItemDTO]> = Observable([])
    
    // MARK: - Init
    
    init(todoRepository: TodoRepository = DefaultTodoRepository()) {
        self.todoRepository = todoRepository
        bindTodoList()
    }
    
    func bindTodoList() {
        self.token = todoRepository.bind(behavior: mapToDTO(by:))
    }
    
    func mapToDTO(by todoList: Results<TodoItem>) {
        self.todoList.value = todoList.map {
            TodoItemDTO.init(
                id: $0.id.stringValue,
                date: $0.date ?? Date(),
                title: $0.title,
                detail: $0.detail,
                importance: $0.importanceEnum.rawValue
            )
        }
    }
    
    deinit {
        self.token?.invalidate()
    }
    
    // MARK: - Input
    
    
}
