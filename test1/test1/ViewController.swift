//
//  ViewController.swift
//  test1
//
//  Created by user on 2017/6/28.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var fullSize :CGSize!
    var myUIView :UIView!
    var anotherUIView :UIView!
    
    fullSize = UIScreen.mainScreen().bounds.size
    
    // 觸發拖曳手勢後 執行的動作
    func pan(recognizer:UIPanGestureRecognizer) {
        // 設置 UIView 新的位置
        let point = recognizer.location(in: self.view)
        anotherUIView.center = point
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // 一個可供移動的 UIView
        anotherUIView = UIView(frame: CGRect(
            x: fullSize.width * 0.5 , y: fullSize.height * 0.5,
            width: 100, height: 100))
        anotherUIView.backgroundColor = UIColor.orange
        self.view.addSubview(anotherUIView)
        
//        // 拖曳手勢
//        let pan = UIPanGestureRecognizer(
//            target:self,
//            action:#selector(ViewController.pan(_:)))
//        
//        // 最少可以用幾指拖曳
//        pan.minimumNumberOfTouches = 1
//        
//        // 最多可以用幾指拖曳
//        pan.maximumNumberOfTouches = 1
//        
//        // 為這個可移動的 UIView 加上監聽手勢
//        anotherUIView.addGestureRecognizer(pan)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }


}

