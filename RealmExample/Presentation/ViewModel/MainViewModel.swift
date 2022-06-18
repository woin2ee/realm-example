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
    
    var todoList: Observable<[TodoItem]> {
        .init([TodoItem(title: "Title1"), TodoItem(title: "Title2"), TodoItem(title: "Title3")])
    }
    
    // MARK: - Init
    
    init(todoRepository: TodoRepository = DefaultTodoRepository()) {
        self.todoRepository = todoRepository
    }
    
    // MARK: - Input
    
    
}
