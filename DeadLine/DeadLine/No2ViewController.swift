//
//  No2ViewController.swift
//  DeadLine
//
//  Created by user on 2017/6/28.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class No2ViewController: UIViewController {

    @IBAction func deleteEvent(_ sender: Any) {
        
    }
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
        let alertController = UIAlertController(
            title: "提示訊息",
            message: "已經要刪除了嗎？",
            preferredStyle: .alert)
        
        let deleteBtn = UIAlertAction(title: "否，取消", style: .default)
        {(action) in
        self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(deleteBtn)
        show(alertController, sender: self)
    }
    
    
    
        

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
