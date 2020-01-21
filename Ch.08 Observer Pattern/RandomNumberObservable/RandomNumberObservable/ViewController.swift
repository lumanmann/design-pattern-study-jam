//
//  ViewController.swift
//  RandomNumberObservable
//
//  Created by Jack on 2019/9/29.
//  Copyright © 2019 Jack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    
    var counter = Counter(count: 0)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        counter.randomCount.bind { [weak self] (randomNumber) in
            self?.countLabel.text = "\(randomNumber)"
        }
    }
    
    @IBAction func generateRandomNumber(_ sender: UIButton) {
        counter.generateRandomNumber()
    }
    
    deinit {
       counter.randomCount.listener = nil
    }
}

