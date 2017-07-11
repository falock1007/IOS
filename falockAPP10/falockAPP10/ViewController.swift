//
//  ViewController.swift
//  MyApp10
//
//  Created by iii on 2017/6/27.
//  Copyright © 2017年 iii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textPasswd: UITextField!
    @IBOutlet weak var textAccount: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    
    @IBAction func getImage(_ sender: Any) {
        
        DispatchQueue.global().async {
            self.fetchImage()
        }
    }
    
    @IBAction func testGet(_ sender: Any) {
        do {
            let account = textAccount.text
            let passwd = textPasswd.text
            let urlString = "http://10.2.1.119/brad.php?account=\(account!)&passwd=\(passwd!)"
            let url = URL(string: urlString)
            let source = try String(contentsOf: url!,
                                    encoding: String.Encoding.ascii)
            if source == "OK"{
                print("Add OK")
            }
        }catch {
            print("OKOKO")
            // 處理 try 的錯誤
            print(error)
        }
    }
    private func fetchImage(){
        do {
            let url = URL(string: "https://img.moegirl.org/common/thumb/5/5a/Chara_img06.jpg/250px-Chara_img06.jpg")
            if url != nil  {
                let data = try Data(contentsOf: url!)
                let img = UIImage(data: data)
                DispatchQueue.main.async {
                    self.imgView.image = img
                }
            }else {
                let img = UIImage(named: "user")
                DispatchQueue.main.async {
                    self.imgView.image = img
                }
            }
        }catch{
            let img = UIImage(named: "user")
            DispatchQueue.main.async {
                self.imgView.image = img
            }
        }
    }
    

    @IBAction func getJSON(_ sender: Any) {
        do{
            let url = URL(string: "http://data.coa.gov.tw/Service/OpenData/ODwsv/ODwsvTravelFood.aspx")
            let data = try Data(contentsOf: url!)
            //            let source = try String(contentsOf: url!, encoding: String.Encoding.utf8)
            //            print(source)
            parseJSON( json: data)
            
        }catch{
            print("OKOK")
            print(error)
        }
        
    }
    
    private func parseJSON(json: Data){
        do{
            if let jsonObj = try? JSONSerialization.jsonObject(with: json, options: .allowFragments){
                
                let allObj = jsonObj as! [[String: AnyObject]]
                print(allObj.count)
                for r in allObj {
                    print(r["Address"] as! String)
                }
            }
            
        }catch{
            print(error)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            let url = URL(string: "https://www.google.com/")
            
            let ss = try String(contentsOf: url!, encoding: String.Encoding.ascii)
            //let source = try String(contentsOf: url!,encoding: String.Encoding.ascii)
            
            //print(source)
            
        }catch {
            print("OKOKO")
            // 處理 try 的錯誤
            print(error)
        }
        
        
    }
    
}

