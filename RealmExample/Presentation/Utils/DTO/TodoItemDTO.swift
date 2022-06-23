//
//  TodoItemDTO.swift
//  RealmExample
//
//  Created by Jaewon on 2022/06/19.
//

import Foundation

struct TodoItemDTO {
    var id: String?
    var date: String
    var title: String
    var detail: String
    var importance: String
    
    private init(id: String?, date: String, title: String, detail: String, importance: String) {
        self.id = id
        self.date = date
        self.title = title
        self.detail = detail
        self.importance = importance
    }
    
    // MARK: - Generator
    
    static func create(id: String?, date: Date?, title: String, detail: String, importance: Importance) -> TodoItemDTO {
        var formattedDate = "날짜 없음"
        if let date = date {
            formattedDate = dateFormatter.string(from: date)
        }
        
        return TodoItemDTO(
            id: id,
            date: formattedDate,
            title: title,
            detail: detail,
            importance: importance.rawValue
        )
    }
    
    static func createEmpty() -> TodoItemDTO {
        return create(id: nil, date: Date(), title: "", detail: "", importance: .none)
    }
    
    // MARK: - Convert
    
    func toDomain() -> TodoItem {
        return .init(
            id: self.id ?? "",
            date: dateFormatter.date(from: self.date),
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
