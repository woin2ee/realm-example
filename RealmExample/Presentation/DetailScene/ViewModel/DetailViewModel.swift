//
//  DetailViewModel.swift
//  RealmExample
//
//  Created by Jaewon on 2022/06/22.
//

import Foundation

protocol DetailViewModelInput {
    func didSave(todoItem: TodoItemDTO)
    func didUpdate(todoItem: TodoItemDTO)
}

protocol DetailViewModelOutput {
    var todoItem: Observable<TodoItemDTO> { get }
}

protocol DetailViewModel: DetailViewModelInput, DetailViewModelOutput {}

final class DefaultDetailViewModel: DetailViewModel {
    
    private var todoRepository: TodoRepository
    
    // MARK: - Output
    
    var todoItem: Observable<TodoItemDTO>
    
    // MARK: - Init
    
    init(todoRepositoy: TodoRepository = DefaultTodoRepository(),
         todoItem: Observable<TodoItemDTO> = .init(.createEmpty())) {
        self.todoRepository = todoRepositoy
        self.todoItem = todoItem
    }
    
    // MARK: - Input
    
    func didSave(todoItem: TodoItemDTO) {
        todoRepository.save(todoItem: todoItem.toDomain())
    }
    
    func didUpdate(todoItem: TodoItemDTO) {
        todoRepository.update(todoItem: todoItem.toDomain())
    }
}
