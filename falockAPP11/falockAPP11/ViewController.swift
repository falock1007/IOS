//
//  ViewController.swift
//  falockAPP11
//
//  Created by user on 2017/6/29.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func test2(_ sender: Any) {
        
        let url = URL(string: "http://127.0.0.1/brad2.php")
        var req = URLRequest(url: url!)
        
        req.httpBody = "account=xxx&passwd=xxx".data(using: String.Encoding.utf8)
        req.httpMethod = "POST"
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: req, completionHandler:{(data, response, error) in //data, response, error是自訂的
            if error == nil {
                let str = String(data: data!
                    , encoding: .utf8)
                print(str)
            }else{
                print(error)
            }
        })
        
        task.resume()
        
        
    }
    
    @IBAction func test1(_ sender: Any) {
        let url = URL(string:"https://www.google.com/")
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: url!, completionHandler:{(data, response,
            error) in
            if error == nil {
               let ret =  String(data: data!, encoding: String.Encoding.ascii )
               print(ret)
            }else{
                print(error)
            }
        })
        task.resume()
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

