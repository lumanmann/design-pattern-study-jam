//
//  Count.swift
//  RandomNumber
//
//  Created by Jack on 2019/9/29.
//  Copyright © 2019 Jack. All rights reserved.
//

import Foundation

@objcMembers class KVOCount: NSObject {
    dynamic var randomCount: Int = 0

    init(count: Int) {
        self.randomCount = count
    }

    func generateRandomCount(){
        let timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
            let randomCount = Int.random(in: 1...100)
            self.randomCount = randomCount
        }
        timer.fire()
    }
}
