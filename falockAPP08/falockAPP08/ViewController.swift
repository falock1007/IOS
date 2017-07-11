//
//  ViewController.swift
//  falockAPP08
//
//  Created by user on 2017/6/22.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func backHere(segue: UIStoryboardSegue){
        
    }
    
    private let mydata = ["猜數字V1","猜數字V2","切換場景","自訂UIView(X)",
                          "簽名板","自訂cell的tableView","練習touch事件","Item8",
                          "Item9","Item10","Item11","Item12",
                          "Item13","Item14","Item15","Item16",]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mydata.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = mydata[indexPath.row]
        return cell!
    }
    
    //觸發選項 ==> indexPath.row
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        gotoVC(whereVC: indexPath.row)
    }
    
    private func gotoVC(whereVC:Int){
        switch (whereVC){
        case 5:
            if let vc = storyboard?.instantiateViewController(withIdentifier: "customcellvc"){
                //記得設storyboard
                show(vc, sender:self)
            }
            break
        
        case 2:
            if let vc2 = storyboard?.instantiateViewController(withIdentifier: "vc2"){
                show(vc2, sender: self)
            }
            break
        case 4:
            if let vc4 = storyboard?.instantiateViewController(withIdentifier: "paintervc"){
                show(vc4, sender: self)
            }
            break
        case 6:
            if let vc6 = storyboard?.instantiateViewController(withIdentifier: "touchvc"){
                show(vc6, sender: self)
            }

            break
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}

