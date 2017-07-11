
//
//  ViewController.swift
//  MyApp17
//
//  Created by iii on 2017/7/3.
//  Copyright © 2017年 iii. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    let fmgr = FileManager.default
    let docDir = NSHomeDirectory() + "/Documents"
    
    @IBAction func test1(_ sender: Any) {
        let dir1 = docDir + "/dir1"
        let dir2 = docDir + "/dir2"
        
        do{
            if fmgr.fileExists(atPath: dir2) {
                try fmgr.removeItem(atPath: dir2)
            }
            try fmgr.copyItem(atPath: dir1, toPath: dir2)
            
        }catch{
            print(error)
        }
        
    }
    
    @IBAction func test2(_ sender: Any) {
        
        let dir2 = docDir + "/dir1/dir2"
        let dir13 = docDir + "/dir1/dir3"
        
        do{
            try fmgr.moveItem(atPath: dir2, toPath: dir13)
        }catch {
            print(error)
        }
    }
    
    @IBAction func test3(_ sender: Any) {
        let file1 = docDir + "/dir1/file1"
        let file2 = docDir + "/file2"
        do{
            try fmgr.moveItem(atPath: file1, toPath: file2)
        }catch{
            print(error)
        }
        
        
    }
    
    @IBAction func test4(_ sender: Any) {
        do {
            let bradFile = "brad.txt"
            let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent(bradFile)
            
            if let outputStream = OutputStream(url: fileURL, append: false) {
                outputStream.open()
                let rand = Int(arc4random_uniform(49))+1
                let text = "some text: \(rand)\n"
                let bytesWritten = outputStream.write(text)
                if bytesWritten < 0 { print("write failure") }
                outputStream.close()
            } else {
                print("Unable to open file")
            }
        }catch{
            print(error)
        }
    }
    
    
    @IBAction func test5(_ sender: Any) {
        
        let file2 = docDir + "/brad02.txt"
        let rand = Int(arc4random_uniform(49))+1
        let cont = "1234556\n7654321\n\(rand)\n"
        do{
            try cont.write(toFile: file2, atomically: false, encoding: .utf8)
        }catch{
            print(error)
        }
        
        
    }
    
    @IBAction func test6(_ sender: Any) {
        let file2 = docDir + "/brad03.txt"
        let cont = textView.text
        do{
            try cont!.write(toFile: file2, atomically: false, encoding: .utf8)
        }catch{
            print(error)
        }

    }
    @IBAction func clear(_ sender: Any){
        textView.text = ""
    }
    
    @IBAction func openFile(_ sender: Any) {
        let file2 = docDir + "/brad03.txt"
        do{
        let cont = try String(contentsOfFile: file2, encoding: .utf8);
        textView.text = cont
        }catch{
            print(error)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(docDir)
        
        let dir1 = docDir + "/dir1"
        if !fmgr.fileExists(atPath: dir1){
            do {
                try fmgr.createDirectory(atPath: dir1, withIntermediateDirectories: true, attributes: nil)
            }catch{
                print(error)
            }
        }
        
        //        let newfile = docDir + "/brad.txt"
        //        if !fmgr.fileExists(atPath: newfile) {
        //            let cont = "Hello, Brad\nabcdefg\n1234567\n7654321"
        //            let contData = cont.data(using: .utf8)
        //            if fmgr.createFile(atPath: newfile, contents: contData, attributes: nil) {
        //                print("OK")
        //            }else{
        //                print("XX")
        //            }
        //        }
        clear(self)
        
        
        
        
    }
    
    
}

extension OutputStream {
    
    /// Write `String` to `OutputStream`
    ///
    /// - parameter string:                The `String` to write.
    /// - parameter encoding:              The `String.Encoding` to use when writing the string. This will default to `.utf8`.
    /// - parameter allowLossyConversion:  Whether to permit lossy conversion when writing the string. Defaults to `false`.
    ///
    /// - returns:                         Return total number of bytes written upon success. Return `-1` upon failure.
    
    func write(_ string: String, encoding: String.Encoding = .utf8, allowLossyConversion: Bool = false) -> Int {
        
        if let data = string.data(using: encoding, allowLossyConversion: allowLossyConversion) {
            return data.withUnsafeBytes { (bytes: UnsafePointer<UInt8>) -> Int in
                var pointer = bytes
                var bytesRemaining = data.count
                var totalBytesWritten = 0
                
                while bytesRemaining > 0 {
                    let bytesWritten = self.write(pointer, maxLength: bytesRemaining)
                    if bytesWritten < 0 {
                        return -1
                    }
                    
                    bytesRemaining -= bytesWritten
                    pointer += bytesWritten
                    totalBytesWritten += bytesWritten
                }
                
                return totalBytesWritten
            }
        }
        
        return -1
    }
    
}
