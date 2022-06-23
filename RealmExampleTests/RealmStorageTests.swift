//
//  RealmStorageTests.swift
//  RealmExampleTests
//
//  Created by Jaewon on 2022/06/23.
//

import XCTest
@testable import RealmExample

class RealmStorageTests: XCTestCase {

    let realmStorage = RealmTodoStorage()
    
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func test_create_mock() {
        let mock = TodoItem.mock()
        
        print(mock.id)
        print(mock.title)
        print(mock.detail)
        print(mock.importanceEnum.rawValue)
        
        XCTAssertEqual(mock.title, "Mock")
        XCTAssertEqual(mock.detail, "mock")
        XCTAssertEqual(mock.importanceEnum, .middle)
    }
    
    func test_save() {
        realmStorage.save(todoItem: TodoItem.mock())
    }
    
    func test_update() {
        let item = TodoItem.mock()
        item.title = "Update"
        realmStorage.update(todoItem: item)
    }
}
