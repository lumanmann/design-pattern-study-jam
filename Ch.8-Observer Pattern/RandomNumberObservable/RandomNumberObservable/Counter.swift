//
//  Count.swift
//  RandomNumberObservable
//
//  Created by Jack on 2019/9/29.
//  Copyright © 2019 Jack. All rights reserved.
//

import Foundation

class Counter {
    var randomCount = Observable<Int>(0)
    
    init(count: Int) {
        self.randomCount = Observable(count)
    }
    
    func generateRandomNumber(){
        let timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { [weak self] _ in
            let random = Int.random(in: 1...100)
            self?.randomCount.value = random
        }
        timer.fire()
    }
}
