//
//  Observable.swift
//  RandomNumberObservable
//
//  Created by Jack on 2019/9/29.
//  Copyright © 2019 Jack. All rights reserved.
//

import Foundation

class Observable<T> {
    typealias Listener = (T) -> ()
    var listener: Listener?
    
    func bind(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
}
