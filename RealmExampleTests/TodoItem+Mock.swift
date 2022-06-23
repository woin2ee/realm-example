//
//  TodoItem+Mock.swift
//  RealmExampleTests
//
//  Created by Jaewon on 2022/06/23.
//

import Foundation
@testable import RealmExample

extension TodoItem {
    static func mock() -> TodoItem {
        let mock = TodoItem.init(date: Date(timeIntervalSince1970: 0), title: "Mock", detail: "mock", importance: .middle)
        mock.id = try! .init(string: "d24adfa3503effd50a82c21c")
        return mock
    }
}
