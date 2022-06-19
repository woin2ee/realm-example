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
    
    static func create(date: Date?, title: String, detail: String, importance: String) -> TodoItemDTO {
        var formattedDate = "날짜 없음"
        if let date = date {
            formattedDate = dateFormatter.string(from: date)
        }
        
        return TodoItemDTO(date: formattedDate, title: title, detail: detail, importance: importance)
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yy/MM/dd"
    return formatter
}()
