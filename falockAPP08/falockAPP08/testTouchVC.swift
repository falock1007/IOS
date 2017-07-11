//
//  testTouchVC.swift
//  falockAPP08
//
//  Created by user on 2017/6/26.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class testTouchVC: UIViewController {

    @IBOutlet weak var myView: TestTouchView!
    var a = 312
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myView.backgroundColor = UIColor(colorLiteralRed: 1, green: 1, blue: 0, alpha: 1)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapTest(_:)))
        tapGesture.numberOfTapsRequired = 2
        tapGesture.numberOfTouchesRequired = 2
        myView.addGestureRecognizer(tapGesture)
     
//        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchTest(_:)))
//        myView.addGestureRecognizer(pinchGesture)
        
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotationTest(_:)))
        myView.addGestureRecognizer(rotationGesture)
        
        
        //Swipe有速度的滑動 Pan類似drag的拖曳 LongPress Edgepan從邊緣滑出
        let swipeRGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeTest(_:)))
        swipeRGesture.direction = UISwipeGestureRecognizerDirection.right
        swipeRGesture.numberOfTouchesRequired = 1
        myView.addGestureRecognizer(swipeRGesture)
        
        let swipeLGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeTest(_:)))
        swipeLGesture.direction = UISwipeGestureRecognizerDirection.left
        swipeLGesture.numberOfTouchesRequired = 1
        myView.addGestureRecognizer(swipeLGesture)
        
       
        
        

    }
    
    @objc func tapTest(_ sender : UITapGestureRecognizer){
        print("two finger touch")
        
        print("point number = \(sender.numberOfTouches)")
        
        let point0 = sender.location(ofTouch: 0, in: sender.view)
        print("0. \(point0.x) x \(point0.y)")
        let point1 = sender.location(ofTouch: 1, in: sender.view)
        print("1. \(point1.x) x \(point1.y)")
    }
    
//    @objc func pinchTest(_ sender : UIPinchGestureRecognizer){
//        if sender.state == UIGestureRecognizerState.changed {
//            print(sender.scale) // 1 為 base number
//        }
//    }

    @objc func rotationTest(_ sender : UIRotationGestureRecognizer){
//        print (sender.rotation)
        let rad = sender.rotation
        let deg = Float(rad) * Float(180) / Float(M_PI)
        if deg > 0 {
            print("順時鐘:\(deg)")
        }else{
            print("逆時鐘:\(deg)")
        }
        
    }
    
    @objc func swipeTest(_ sender : UISwipeGestureRecognizer){
        switch sender.direction {
//        case UISPanGestureRecognizerDirection.up:
//            print("up")
//        case UIPanGestureRecognizerDirection.down:
//            print("down")
        case UISwipeGestureRecognizerDirection.left:
            print("left")
        case UISwipeGestureRecognizerDirection.right:
            print("right")
        default:
            break
        }
    }
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("vc touch")
//    }

}


