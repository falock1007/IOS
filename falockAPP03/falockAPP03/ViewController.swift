//
//  ViewController.swift
//  falockAPP03
//
//  Created by user on 2017/6/20.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var textInput: UITextField!
    
    @IBOutlet weak var labelResult: UILabel!
    
    @IBOutlet weak var textHistory: UITextView!
    
    private var stringAnswer:String?
    private var counter = 0
    
    @IBAction func clickGuess(_ sender: Any) {
        counter += 1
        let stringInput = textInput.text!
//        print(stringInput)
        let stringResult = falockAPI.checkAB(answer: stringAnswer!,guess:stringInput)
        labelResult.text = stringResult
        textHistory.text.append("\(counter).\(stringInput) => \(stringResult)\n")
        textInput.text = ""
        
        if stringResult == "3A0B"{
            showWinnerDialog()
        }else if counter == 10{
            showLoserDialog()
        }
        textInput.resignFirstResponder()
    }
    
    func showWinnerDialog(){
        let alert:UIAlertController = UIAlertController(title: "遊戲結果", message: "恭喜老爺，賀喜夫人", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action: UIAlertAction) -> Void in self.initRound()})
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    func showLoserDialog(){
        let alert:UIAlertController = UIAlertController(title: "遊戲結果", message: "殘念\n答案是:\(stringAnswer!)", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action: UIAlertAction) -> Void in self.initRound()})
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    private func initRound(){
        textInput.text = ""
        labelResult.text = "顯示結果"
        textHistory.text = ""
        stringAnswer = falockAPI.createAnswer(3)
        counter = 0
        textInput.resignFirstResponder()

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        clickGuess(self)
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textInput.delegate = self
        initRound()
        //        print(stringAnswer!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

