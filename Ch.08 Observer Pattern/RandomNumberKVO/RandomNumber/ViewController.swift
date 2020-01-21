//
//  ViewController.swift
//  RandomNumber
//
//  Created by Jack on 2019/9/29.
//  Copyright © 2019 Jack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    
    let kvoCount = KVOCount(count: 0)
    var kvoObserver: NSKeyValueObservation?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        kvoObserver =  kvoCount.observe(\.randomCount, options: [.initial, .new]) { (kvoCount, change) in
            DispatchQueue.main.async {
                self.countLabel.text = "\(kvoCount.randomCount)"
            }
        }
    }
    
    @IBAction func generateRandomNumber(_ sender: UIButton) {
        kvoCount.generateRandomCount()
    }
    
    deinit {
        kvoObserver = nil
    }
}

