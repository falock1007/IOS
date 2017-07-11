//
//  TestTouchView.swift
//  falockAPP08
//
//  Created by user on 2017/6/26.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class TestTouchView: UIView {
    
    var isInitStat = false
    private var ttvc:testTouchVC?
    
    private func initState(){
        isInitStat = true
        
//        let vc = findSuperVC(whichView: self)
//        ttvc = vc as! testTouchVC
//        print(ttvc!.a) 底下的ＯＫ會跑個幾次，就程式來說可以再優化
        
        //比較好的方式
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        ttvc = storyboard.instantiateViewController(withIdentifier: "touchvc") as! testTouchVC
        print(ttvc!.a)
    }
    
    // find Super Container
    private func findSuperVC( whichView: UIView) -> UIViewController? {
        var responder:UIResponder = whichView
        while responder != nil {
            print("OK")
            if let vc = responder as? UIViewController {
                return vc
            }
            responder = responder.next!
        }
        return nil
    }
    
//    override func draw(_ rect: CGRect){
//        if !isInitStat { initState()}
//    }
//    override func touchesBegan(_ touches:Set<UITouch>, with event: UIEvent?){
//        
//        print("myView: touch")
//        ttvc?.touchesBegan(touches, with: event)
//    }
}
