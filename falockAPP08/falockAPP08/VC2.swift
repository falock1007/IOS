//
//  VC2.swift
//  falockAPP08
//
//  Created by user on 2017/6/23.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class VC2: UIViewController {

    @IBOutlet weak var labelApp: UILabel!
    
    @IBAction func govc3(_ sender: Any) {
        let vc3 = storyboard?.instantiateViewController(withIdentifier: "vc3")
        show(vc3!, sender: self)
    }
    @IBAction func govc4(_ sender: Any) {
        let vc4 = storyboard?.instantiateViewController(withIdentifier: "vc4")
        show(vc4!, sender: self)
    }
    @IBOutlet weak var labelRand: UILabel!
    
    private var rand = Int(arc4random_uniform(49))
   
    override func viewDidLoad(){
        super.viewDidLoad()
        print("VC2: viewDidLoad()")
        labelRand.text = String(rand)
        let app = UIApplication.shared.delegate as! AppDelegate
        //AppDelegate.swift
        labelApp.text = String(app.rand)
    }
}
