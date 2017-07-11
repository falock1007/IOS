//
//  P1VCViewController.swift
//  MyApp23
//
//  Created by iii on 2017/7/5.
//  Copyright © 2017年 iii. All rights reserved.
//
import UIKit

class P1VCViewController: UIViewController {
    
    @objc private func setting(){
        navigationController!.pushViewController(P2VCViewController(), animated: true)
    }
    @objc func back() {
        navigationController!.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.lightGray
        
        // navigation bar
        title = "我是P1"
        navigationController!.navigationBar.barTintColor = UIColor.green
        navigationController!.navigationBar.isTranslucent = false
        
        // right button
        let settingButton = UIBarButtonItem(title: "設定", style: .plain, target: self, action: #selector(setting))
        navigationItem.rightBarButtonItem = settingButton
        
        // left button
        let backButton = UIBarButtonItem(image: UIImage(named:"Back_24px_1177132_easyicon.net") , style: .plain, target: self, action: #selector(back))
        
        navigationItem.leftBarButtonItem = backButton
        
    }
    
    
}
