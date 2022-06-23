//
//  TodoItemDTO.swift
//  RealmExample
//
//  Created by Jaewon on 2022/06/19.
//

import Foundation

struct TodoItemDTO {
    var id: String?
    var date: Date
    var formattedDate: String {
        dateFormatter.string(from: self.date)
    }
    var title: String
    var detail: String
    var importance: String
}

extension TodoItemDTO {
    func toDomain() -> TodoItem {
        return .init(
            id: self.id ?? "",
            date: date,
            title: self.title,
            detail: self.detail,
            importance: Importance.init(rawValue: self.importance) ?? .none
        )
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yy/MM/dd"
    return formatter
}()
