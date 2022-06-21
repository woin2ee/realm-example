//
//  TodoItemDTO.swift
//  RealmExample
//
//  Created by Jaewon on 2022/06/19.
//

import Foundation

struct TodoItemDTO {
    var date: String
    var title: String
    var detail: String
    var importance: String
    
    private init(date: String, title: String, detail: String, importance: String) {
        self.date = date
        self.title = title
        self.detail = detail
        self.importance = importance
    }
    
    static func create(date: Date?, title: String, detail: String, importance: Importance) -> TodoItemDTO {
        var formattedDate = "날짜 없음"
        if let date = date {
            formattedDate = dateFormatter.string(from: date)
        }
        
        return TodoItemDTO(date: formattedDate, title: title, detail: detail, importance: importance.rawValue)
    }
    
    static func createEmpty() -> TodoItemDTO {
        return create(date: Date(), title: "", detail: "", importance: .none)
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yy/MM/dd"
    return formatter
}()
