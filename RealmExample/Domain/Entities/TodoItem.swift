//
//  TodoItem.swift
//  RealmExample
//
//  Created by Jaewon on 2022/06/18.
//

import Foundation
import RealmSwift

final class TodoItem: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var date: Date?
    @Persisted var title: String
    @Persisted var detail: String
    @Persisted private var importance: String
    
    var importanceEnum: Importance {
        get { return Importance(rawValue: importance) ?? .none }
        set { importance = newValue.rawValue }
    }
    
    convenience init(id: String, date: Date? = nil, title: String = "", detail: String = "", importance: Importance = .none) {
        self.init()
        
        do {
            self.id = try .init(string: id)
        } catch {
            self.id = .generate()
        }
        self.date = date
        self.title = title
        self.detail = detail
        self.importanceEnum = importance
    }
}

enum Importance: String {
    case high = "높음"
    case middle = "중간"
    case low = "낮음"
    case none = "없음"
}
