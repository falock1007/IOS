//
//  ViewController.swift
//  falockAPP02
//
//  Created by user on 2017/6/20.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imageCup: UIImageView!
    private let cups:[UIImage] = [
        UIImage(named:"S01")!, UIImage(named:"S02")!,
        UIImage(named:"S03")!, UIImage(named:"S04")!]
    
    @IBAction func pressBtn(_ sender: Any) {
        imageCup.animationImages = cups
        imageCup.animationDuration = 0.2 //輪播秒數
        imageCup.animationRepeatCount = 1 //輪播次數
        imageCup.startAnimating()
    }
    
    @IBAction func upBtn(_ sender: Any) {
        let rand = Int(arc4random_uniform(4))
        imageCup.image = cups[rand]
    }
    
    
    
    
    
    
    
    
//    @IBAction func click(_ sender: Any) {
//        let rand = Int(arc4random_uniform(4))
//        imageCup.image = cups[rand]
////        imageCup.image = UIImage(named:"S02")
//        
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

