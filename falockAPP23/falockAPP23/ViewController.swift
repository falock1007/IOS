//
//  ViewController.swift
//  MyApp23
//
//  Created by iii on 2017/7/5.
//  Copyright © 2017年 iii. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    @objc private func back(){
        print("back")
    }
    @objc private func setting(){
        navigationController!.pushViewController(P2VCViewController(), animated: true)
    }
    @objc private func gotoP1(){
        navigationController!.pushViewController(P1VCViewController(), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 針對 Navigation Bar 的相關設定
        title = "我是首頁"
        navigationController!.navigationBar.barTintColor = UIColor.yellow
        navigationController!.navigationBar.isTranslucent = false
        
        
        // left button
        let backButton = UIBarButtonItem(image: UIImage(named:"back") , style: .plain, target: self, action: #selector(back))
        
        navigationItem.leftBarButtonItem = backButton
        
        
        // right button
        let settingButton = UIBarButtonItem(title: "設定", style: .plain, target: self, action: #selector(setting))
        navigationItem.rightBarButtonItem = settingButton
        
        
        // 以下處理該頁的主要內容
        let p1Button = UIButton(frame: CGRect(x: 40, y: 40, width: 120, height: 80) )
        p1Button.setTitle("去 P1", for: .normal)
        p1Button.backgroundColor = UIColor.blue
        p1Button.addTarget(self, action: #selector(gotoP1), for: .touchUpInside)
        
        
        view.addSubview(p1Button)
    }
    
    
    
    
    
}
