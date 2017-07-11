//
//  ViewController.swift
//  test2
//
//  Created by user on 2017/7/6.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var str = "   你 好 嘛  ， 跟谁 1d6俩 呢 ！  AZXCVBN"
        str = str.replacingOccurrences(of : " ", with : "")
        let lcstr = str.lowercased()
        
        print(lcstr)
        print(strlen(lcstr))
        
        
        
     
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

