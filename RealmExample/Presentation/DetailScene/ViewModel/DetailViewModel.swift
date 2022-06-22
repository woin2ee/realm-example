//
//  DetailViewModel.swift
//  RealmExample
//
//  Created by Jaewon on 2022/06/22.
//

import Foundation

protocol DetailViewModelInput {
    func didSave(todoItem: TodoItemDTO)
}

protocol DetailViewModelOutput {
    var todoItem: Observable<TodoItemDTO> { get }
}

protocol DetailViewModel: DetailViewModelInput, DetailViewModelOutput {}

final class DefaultDetailViewModel: DetailViewModel {
    
    private var todoRepository: TodoRepository
    
    var todoItem: Observable<TodoItemDTO>
    
    init(todoRepositoy: TodoRepository = DefaultTodoRepository(),
         todoItem: Observable<TodoItemDTO> = .init(.createEmpty())) {
        self.todoRepository = todoRepositoy
        self.todoItem = todoItem
    }
    
    func didSave(todoItem: TodoItemDTO) {
        print(todoItem.toDomain())
        todoRepository.save(todoItem: todoItem.toDomain())
    }
}
