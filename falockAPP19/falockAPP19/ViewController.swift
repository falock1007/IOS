//
//  ViewController.swift
//  falockAPP19
//
//  Created by user on 2017/7/3.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let gamedataFile = NSHomeDirectory() + "/Documents/gamedata.plist"
    let appMain = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var inputName: UITextField!
    
    @IBAction func saveName(_ sender: Any) {
        if let gdata = NSMutableDictionary(contentsOfFile: gamedataFile){
            gdata["name"] = inputName.text
            gdata["test"] = "Hello, test"

            gdata.write(toFile: gamedataFile, atomically: true)
            
        }
    }
    
    @IBAction func queryDB(_ sender: Any) {
        let sql = "SELECT * FROM cust" //WHere id = 1會只顯示第一個
        var point:OpaquePointer? = nil
        if sqlite3_prepare(appMain.db, sql, -1, &point, nil) == SQLITE_OK{
//            print("OK")
        }
        while sqlite3_step(point) == SQLITE_ROW {
            let cname = sqlite3_column_text(point, 1)
            print(String(cString: cname!))
        }
    }
    
    @IBAction func insertData(_ sender: Any) {
        let sql = "INSERT INTO cust (cname) VALUES ('Peter')"
        var point:OpaquePointer? = nil
        
        if sqlite3_prepare_v2(appMain.db, sql, -1, &point, nil) == SQLITE_OK {
            if sqlite3_step(point) == SQLITE_DONE {//point不需加上＆
                print("Insert OK")
            }else{
                print("Insert Fail")
            }
        }
    }
    
    @IBAction func deleteData(_ sender: Any) {
        let sql = "DELETE FROM cust WHERE id = 3 "
        var point:OpaquePointer? = nil
        
        if sqlite3_prepare_v2(appMain.db, sql, -1, &point, nil) == SQLITE_OK {
            if sqlite3_step(point) == SQLITE_DONE {//point不需加上＆
                print("Delete OK")
            }else{
                print("Delete Fail")
            }
        }
    }
    
    @IBAction func updateData(_ sender: Any) {
        let sql = "UPDATE cust SET cname = 'qwert' WHERE id = 3"
        var point:OpaquePointer? = nil
        
        if sqlite3_prepare_v2(appMain.db, sql, -1, &point, nil) == SQLITE_OK {
            if sqlite3_step(point) == SQLITE_DONE {//point不需加上＆
                print("UPDATE OK")
            }else{
                print("UPDATE Fail")
            }
        }

    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if let gdata = NSMutableDictionary(contentsOfFile: gamedataFile){
            if let name = gdata["name"]{
                print(name)
            }
            if let test = gdata["test"]{
                print(test)
            }
            
            
//        print(gdata["name"] ?? "nobody")
//        print(gdata["stage"] ?? 0)
//        print(gdata["sound"] ?? true)
        }
    }

    

}

