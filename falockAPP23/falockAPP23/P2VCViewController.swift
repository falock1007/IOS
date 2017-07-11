//
//  P2VCViewController.swift
//  MyApp23
//
//  Created by iii on 2017/7/5.
//  Copyright © 2017年 iii. All rights reserved.
//
import UIKit

class P2VCViewController: UIViewController {
    
    
    @objc func goHome(){
        navigationController!.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "設定頁"
        navigationController?.navigationBar.barTintColor = UIColor.white
        
        let homeButton = UIButton(frame: CGRect(x: 40, y: 40, width: 120, height: 80) )
        homeButton.setTitle("Back", for: .normal)
        homeButton.backgroundColor = UIColor.blue
        homeButton.addTarget(self, action: #selector(goHome), for: .touchUpInside)
        
        
        view.addSubview(homeButton)
        
        
        
        
        
    }
    
}
