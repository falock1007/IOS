//
//  ViewController.swift
//  falockAPP05
//
//  Created by user on 2017/6/21.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue,sender: Any?){
        print("prepare")
    }
    
    @IBAction func gotoPage3(_ sender: Any) {
        if let p3vc = storyboard?.instantiateViewController(withIdentifier: "page3vc"){
            show(p3vc, sender:self)
        }
    }
    
    @IBAction func falock(segue: UIStoryboardSegue){
        //UIStoryboardSegue是重點
        print("ok")
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

