//
//  Observable.swift
//  RealmExample
//
//  Created by Jaewon on 2022/06/18.
//

import Foundation

class Observable<T> {
    private var listener: ((T) -> Void)?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (T) -> Void) {
        listener = closure
        closure(value)
    }
}
