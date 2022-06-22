//
//  DetailViewModel.swift
//  RealmExample
//
//  Created by Jaewon on 2022/06/22.
//

import Foundation

protocol DetailViewModelOutput {
    var todoItem: Observable<TodoItemDTO> { get }
}

protocol DetailViewModel: DetailViewModelOutput {}

final class DefaultDetailViewModel: DetailViewModel {
    
    var todoItem: Observable<TodoItemDTO>
    
    init(todoItem: Observable<TodoItemDTO> = .init(.createEmpty())) {
        self.todoItem = todoItem
    }
}
