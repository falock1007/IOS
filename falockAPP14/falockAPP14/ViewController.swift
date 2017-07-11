//
//  ViewController.swift
//  falockAPP14
//
//  Created by user on 2017/6/30.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit
import JavaScriptCore

class ViewController: UIViewController, FalockProtocol {
    @IBOutlet weak var labelname: UILabel!

    @IBOutlet weak var webView: UIWebView!
    
    @IBAction func test1(_ sender: Any) {
        let url = Bundle.main.url(forResource: "falock", withExtension: "html")
        let req = URLRequest(url: url!)
        webView.loadRequest(req)
        let jsContext = webView.value(forKeyPath:
            "documentView.webView.mainFrame.javaScriptContext") as! JSContext
        jsContext.setObject(self, forKeyedSubscript: "iii" as (NSCopying & NSObjectProtocol))
    }
    
    func m1(_ name:String){
        print("Your name is \(name)")
        labelname.text = name
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    

}

@objc protocol FalockProtocol : JSExport {
    func m1(_ name:String)
    
}
