//
//  ViewController.swift
//  falockAPP16
//
//  Created by user on 2017/6/30.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let fmgr = FileManager.default
    let home = NSHomeDirectory()
    var appdata:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let home = NSHomeDirectory()
        print(home)
        
        appdata = home + "/Documents/mydata"

        
//        let docPath = home + "/Documents"
//        let newdir = docPath + "/dir1"
//        let copydir = docPath + "/dir2"

        if !fmgr.fileExists(atPath: appdata!){
            do{
                try fmgr.createDirectory(atPath: appdata!, withIntermediateDirectories: true, attributes: nil)
                print("create Dir")
            }catch{
                
            }
        }else{
            print("Dir OK")
        }
        
        
//        do{
//        try fmgr.createDirectory(atPath: newdir, withIntermediateDirectories: true, attributes: nil)
//        try fmgr.copyItem(atPath: newdir, toPath: copydir)
//        try fmgr.removeItem(atPath: copydir)
//            
//            print("OK")
//            
//            
//        }catch{
//            print(error)
//        }

//        let urls = fmgr.urls(for: .userDirectory, in: .userDomainMask)
//        for i in 0..<urls.count {
//            print(urls[i].absoluteString)
//        }
    }
}

