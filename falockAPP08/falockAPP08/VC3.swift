
//
//  VC3.swift
//  falockAPP08
//
//  Created by user on 2017/6/23.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class VC3: UIViewController {

    @IBAction func govc2(_ sender: Any) {
        let vc2 = storyboard?.instantiateViewController(withIdentifier: "vc2")
        show(vc2!, sender: self)
    }
    @IBAction func govc4(_ sender: Any) {
        let vc4 = storyboard?.instantiateViewController(withIdentifier: "vc4")
        show(vc4!, sender: self)
    }
    
    
}
