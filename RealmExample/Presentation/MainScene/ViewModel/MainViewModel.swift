//
//  MainViewModel.swift
//  RealmExample
//
//  Created by Jaewon on 2022/06/18.
//

import Foundation

protocol MainViewModelInput {
    
}

protocol MainViewModelOutput {
    var todoList: Observable<[TodoItemDTO]> { get }
}

protocol MainViewModel: MainViewModelInput, MainViewModelOutput {}

final class DefaultMainViewModel: MainViewModel {
    
    private var todoRepository: TodoRepository
    
    // MARK: - Output
    
    var todoList: Observable<[TodoItemDTO]> = Observable([])
    
    // MARK: - Init
    
    init(todoRepository: TodoRepository = DefaultTodoRepository()) {
        self.todoRepository = todoRepository
        initTodoList()
    }
    
    func initTodoList() {
        todoRepository.fetchAllTodoList { result in
            switch result {
            case .success(let list):
                self.todoList.value = list.map {
                    TodoItemDTO.create(date: $0.date, title: $0.title, detail: $0.detail, importance: $0.importance)
                }
            case .failure(_):
                return
            }
        }
    }
    
    // MARK: - Input
    
    
}
