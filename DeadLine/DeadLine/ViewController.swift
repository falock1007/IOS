//
//  ViewController.swift
//  DeadLine
//
//  Created by user on 2017/6/28.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var listYear = [String]()
    var listMonth = [String]()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return listYear.count
        }else{
            return listMonth.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return listYear[row]
        }else{
            return listMonth[row]
        }
    
    }
    
    

    @IBAction func cancel(segue: UIStoryboardSegue){
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取当前时间
        let now = Date()
        
        // 创建一个日期格式器
        let dformatter = DateFormatter()
//        dformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
//        print(dformatter.string(from: now))
        dformatter.dateFormat = "yyyy"
        let nowyear = Int(dformatter.string(from: now))
//        print("当前日期时间：\(dformatter.string(from: now))")
        dformatter.dateFormat = "MM"
        let nowmonth = Int(dformatter.string(from: now))
        print(nowmonth!)

        
        //当前时间的时间戳
        let timeInterval:TimeInterval = now.timeIntervalSince1970
        let timeStamp = Int(timeInterval)
//        print("当前时间的时间戳：\(timeStamp)")
        
        
        
        
        for a in 0..<10 {
            listYear.append("\(String(nowyear!+a))年")
        }
        for b in 1...12{
                listMonth.append("\(b)月")
        }
        
            
        
            
            
            
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

