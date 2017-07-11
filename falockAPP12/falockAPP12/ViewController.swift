//
//  ViewController.swift
//  falockAPP12
//
//  Created by user on 2017/6/29.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var welcome: UIImageView!
    
    @IBOutlet weak var red: UIImageView!
    
    @IBOutlet weak var black: UIImageView!
    
    @IBAction func test1(_ sender: Any) {
        
        let darkEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let darkView = UIVisualEffectView(effect: darkEffect)
        darkView.frame = welcome.bounds
        welcome.addSubview(darkView)
        
        
        
    }
    @IBAction func test2(_ sender: Any) {
        UIView.animate(withDuration: 2, animations: {() in
            self.red.center.y  += -100
            self.black.center.x += 100
//            self.black.center.y += 100
        })
        UIView.animate(withDuration: 2, delay: 1, options: UIViewAnimationOptions.allowAnimatedContent, animations: {() in
            self.black.center.y += 100}, completion: nil)
    }
    
    @IBAction func test3(_ sender: Any) {
        UIView.animate(withDuration: 2, delay: 0, options: UIViewAnimationOptions.allowAnimatedContent, animations: {() in
            self.black.center.y += 20
        }, completion: {(isFinish) in
            UIView.animate(withDuration: 2, animations: {() in
                self.red.center.x += -100
            })
        })
    }
    
    @IBAction func test4(_ sender: Any) {
        UIView.animate(withDuration: 2, animations: {()in
            self.red.transform = CGAffineTransform(scaleX: 2, y: 2)
            // 原圖的幾倍
        }, completion: {(isFinish) in
            UIView.animate(withDuration: 2, animations: {()in
                self.red.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
    })
    }
    
    @IBAction func test5(_ sender: Any) {
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping:0.5,
                       initialSpringVelocity: 0.5,
                       options: .allowAnimatedContent, animations: {()in
          self.black.transform = CGAffineTransform(scaleX: 2, y: 2)
        }, completion: {(isFinish) in
            UIView.animate(withDuration: 2, animations: {()in
                self.black.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
    })
    }
    
    var ani : UIDynamicAnimator!
    @IBAction func test6(_ sender: Any) {
        print("OK")
        
        ani = UIDynamicAnimator(referenceView: self.view)
        
        let beh = UIGravityBehavior(items: [red])
        
        beh.gravityDirection = CGVector(dx: 0, dy: 1)
        
        let beh2 = UICollisionBehavior(items: [red])
        beh2.translatesReferenceBoundsIntoBoundary = true
        
        
        
        ani!.addBehavior(beh)
        ani!.addBehavior(beh2)
        
        
    }
    
    @IBAction func test7(_ sender:Any){
        ani = UIDynamicAnimator(referenceView: self.view)
        
        let beh = UIPushBehavior(items: [red], mode:UIPushBehaviorMode.continuous)
        beh.magnitude = 3.0 //1000 point/s^2
        beh.angle = 45.0 / 180.0 * CGFloat(Double.pi)
        
        let beh2 = UICollisionBehavior(items: [red])
        beh2.translatesReferenceBoundsIntoBoundary = true
        
        ani?.addBehavior(beh)
        ani!.addBehavior(beh2)
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

