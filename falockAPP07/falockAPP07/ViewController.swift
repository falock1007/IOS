//
//  ViewController.swift
//  falockAPP07
//
//  Created by user on 2017/6/21.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var btnOK:UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnOK = UIButton(type:UIButtonType.system)
        btnOK?.frame = CGRect(x: 100, y: 100, width: 32, height: 20)
        
        btnOK?.setTitle("OK", for: UIControlState.normal)
        btnOK?.backgroundColor = UIColor(colorLiteralRed: 1, green: 1, blue: 0, alpha: 1)
        view.addSubview(btnOK!)
        btnOK?.addTarget(self, action: #selector(clickBtnUP), for: UIControlEvents.touchUpInside)
        btnOK?.addTarget(self, action: #selector(clickBtnDOWN), for: UIControlEvents.touchDown)
        //寫猜數字遊戲 計算機
        
        switch traitCollection.userInterfaceIdiom {
        case .pad:
            print("pad")
        case.phone:
            print("phone")
        default:
            break
        }
    }
    
    @objc private func clickBtnUP(sender: UIButton){
        print("click UP")
        
    }
    @objc private func clickBtnDOWN(sender: UIButton){
        print("click DOWN")
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        switch UIDevice.current.orientation {
        case.faceUp:
            print("faceUp")
        case.faceDown:
            print("faceDown")
        case.landscapeLeft:
            print("Home ->")
        case.landscapeRight:
            print("Home ->")
        case.portrait:
            print("normal")
        case.portraitUpsideDown:
            print("normal 顛倒")
        default:
            break
        }
        print("size -> w = \(size.width), h = \(size.height)")
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

