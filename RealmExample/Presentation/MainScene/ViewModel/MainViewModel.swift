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
    var todoList: Observable<[TodoItem]> { get }
}

protocol MainViewModel: MainViewModelInput, MainViewModelOutput {}

final class DefaultMainViewModel: MainViewModel {
    
    private var todoRepository: TodoRepository
    
    // MARK: - Output
    
    var todoList: Observable<[TodoItem]> = Observable([])
    
    // MARK: - Init
    
    init(todoRepository: TodoRepository = DefaultTodoRepository()) {
        self.todoRepository = todoRepository
        initTodoList()
    }
    
    func initTodoList() {
        todoRepository.fetchAllTodoList { result in
            switch result {
            case .success(let list):
                self.todoList.value = list
            case .failure(_):
                return
            }
        }
    }
    
    // MARK: - Input
    
    
}
