//
//  ViewController.swift
//  falockAPP13
//
//  Created by user on 2017/6/30.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit
import JavaScriptCore

class ViewController: UIViewController, Falockprotocol {

    @IBOutlet weak var webView: UIWebView!
    
    @IBAction func test1(_ sender: Any) {
        
        let url = URL(string:"http://www.iii.org.tw")
        let req = URLRequest(url: url!)
    
        webView.loadRequest(req)
        
    }
    @IBAction func test2(_ sender: Any) {
        let url = URL(string:"http://localhost/brad3.html")
        let req = URLRequest(url: url!)
        
        webView.loadRequest(req)

    }
    @IBAction func test3(_ sender: Any) {
        print("OK")
        webView.stringByEvaluatingJavaScript(from: "document.body.style.zoom = 4;")
//        let strCont = "<font size='7' color='blue'>Hello,World</font>"
//        webView.loadHTMLString((strCont), baseURL: nil)
    }
    @IBAction func test4(_ sender: Any) {
        webView.stringByEvaluatingJavaScript(from: "document.body.style.zoom = 4")

        let url = Bundle.main.url(forResource: "brad3", withExtension: "html")
        let req = URLRequest(url: url!)
        webView.loadRequest(req)
        
        let jsContext = webView.value(forKeyPath:
            "documentView.webView.mainFrame.javaScriptContext") as! JSContext
        jsContext.setObject(self, forKeyedSubscript: "falock" as (NSCopying & NSObjectProtocol)!)
    }
    
    @IBAction func test5(_ sender: Any) {
        webView.stringByEvaluatingJavaScript(from: "document.body.style.zoom = 4")
        // 由 swift 觸發 jabascript
//        webView.stringByEvaluatingJavaScript(from: "alert('Hello, Falock')")
        
        //方法1:
//        let rand = Int(arc4random_uniform(49)) + 1
//        let doJS = "document.getElementById('here').innerHTML = '\(rand)'"
//        webView.stringByEvaluatingJavaScript(from: doJS)

        //方法2:
        webView.stringByEvaluatingJavaScript(from: "test03()")
    }
    
    @IBAction func test6(_ sender: Any) {
        let url = Bundle.main.url(forResource: "map", withExtension: "html")
        let req = URLRequest(url: url!)
        webView.loadRequest(req)
    }
    @IBAction func test7(_ sender: Any) {
        let lat = 35.702243
        let lng = 139.774212
        let newpos = "moveToKD(\(lat),\(lng))"
        webView.stringByEvaluatingJavaScript(from: newpos)
    }
    
    func test10(){
        print("test10")
    }
    func test10(value: String){
        print("test10:\(value)")
    }
    func test20(){
        print("test20")
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    
    
    }
}

@objc protocol Falockprotocol : JSExport{
    func test10()
    func test10(value: String)
    func test20()
}
