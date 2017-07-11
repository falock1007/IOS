//
//  ViewController.swift
//  falockAPP18
//
//  Created by user on 2017/7/3.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let fmgr = FileManager.default
    let docDir = NSHomeDirectory() + "/Documents"
    var ai:UIActivityIndicatorView?
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var webView: UIWebView!
    
    @IBAction func test1(_ sender: Any) {
        let url = URL(string:"https://img.moegirl.org/common/thumb/1/13/Kyouko_Kirigiri.jpg/250px-Kyouko_Kirigiri.jpg")
        let req = URLRequest(url: url!)
        let session = URLSession(configuration: .default) // 圖片盡量背景處理，不要前景
        let task = session.dataTask(with: req, completionHandler:
        {(data, resp, error) in
            if error == nil {
                print("download OK")
                self.saveFile(data: data!)
                self.showImage(data:data!)
            }else{
                print("download fail")
            }
        })
        task.resume()
    }
    
    private func saveFile(data:Data){
        let imgFile = docDir + "/kyoko.jpg"
        let url = URL(fileURLWithPath: imgFile)
        do{
            try data.write(to: url)
            print("save OK")
        }catch{
            print(error)
        }
    }
    
    private func showImage(data : Data){
//        let img = UIImage(data: data)
//        DispatchQueue.main.async {
//            self.imgView.image = img
//        }
        let imgFile = docDir + "/kyoko.jpg"
        if fmgr.fileExists(atPath: imgFile){
            let img = UIImage(contentsOfFile: imgFile)
            DispatchQueue.main.async {
                self.imgView.image = img
            }
        }
    }
    
    @IBOutlet weak var imgView2: UIImageView!
    @IBAction func test2(_ sender: Any) {
        let url = URL(string:"https://i1.kknews.cc/large/f010004665070453a56")
        let req = URLRequest(url: url!)
        let session = URLSession(configuration: .default) // 圖片盡量背景處理，不要前景
        let task = session.dataTask(with: req, completionHandler:
        {(data, resp, error) in
            if error == nil {
                print("download OK")
                self.saveFile2(data: data!)
                self.showImage2(data:data!)
            }else{
                print("download fail")
            }
        })
        task.resume()
    }
    
    private func saveFile2(data:Data){
        let imgFile = docDir + "/kyoko2.jpg"
        let url = URL(fileURLWithPath: imgFile)
        do{
            try data.write(to: url)
            print("save2 OK")
        }catch{
            print(error)
        }
    }
    
    private func showImage2(data : Data){
        let img = UIImage(data: data)
        DispatchQueue.main.async {
            self.imgView2.image = img
        }
        
    }



    
    @IBAction func test3(_ sender: Any) {
        ai = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        ai?.frame = CGRect(x: 200, y: 200, width: 100, height: 100)
        ai?.startAnimating()
        view.addSubview(ai!)
        
        let url = URL(string: "http://pdfmyurl.com/?url=http://www.iii.org.tw")
        let req = URLRequest(url: url!)

        webView.loadRequest(req)
        
        let session = URLSession(configuration: .default);
        let task = session.downloadTask(with: req, completionHandler:
            {(url, resp, error) in
                if error == nil {
                    print("download ok")
                    DispatchQueue.main.async {
                        self.ai?.removeFromSuperview()
                    }
                    self.savePDF(url : url!)
                }
                
        })
        task.resume()
    }
    
    private func savePDF(url:URL){
        
        let newpdf = docDir + "/iii.pdf"
        let target = URL(fileURLWithPath: newpdf)
        do{
            try fmgr.copyItem(at: url, to: target)
            print("save pdf ok")
        }catch{
            
        }
    }
    
    @IBAction func test4(_ sender: Any) {
        
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(docDir)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

