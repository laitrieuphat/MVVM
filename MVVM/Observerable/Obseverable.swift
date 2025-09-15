//
//  Obseverable.swift
//  MVVM
//
//  Created by Minh on 15/9/25.
//

import Foundation

class Obseverable <T> {
    var value: T {
        didSet {
            listener?(value)
        }
    }
    private var listener: ((T) -> Void)?
    
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(listener: @escaping (T) -> Void) {
        self.listener = listener
        listener(value)
    }
    
}
