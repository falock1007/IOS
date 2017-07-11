//
//  ViewController.swift
//  falockAPP04
//
//  Created by user on 2017/6/20.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare")
        if segue.identifier == "sg2page2" {
            let dvc:P2ViewController = segue.destination as! P2ViewController
            dvc.arg = "falock"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

