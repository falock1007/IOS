//
//  ViewController.swift
//  falockAPP20
//
//  Created by user on 2017/7/4.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    var ref:DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
   
        ref = Database.database().reference()
        ref.observeSingleEvent(of: DataEventType.value, with: {(snapshot) in
            let postDict = snapshot.value as? [String : AnyObject] ?? [:]
            //...
            print(postDict["value"]!)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

