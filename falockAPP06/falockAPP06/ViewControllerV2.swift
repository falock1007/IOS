//
//  ViewControllerV2.swift
//  falockAPP06
//
//  Created by user on 2017/6/21.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class ViewControllerV2: UIViewController {

    @IBOutlet weak var myswitch: UISwitch!
    @IBOutlet weak var mystepper: UIStepper!
    @IBOutlet weak var mybtn: UIButton!
    
    private var isOn:Bool?
    
    @IBAction func clickSwitch(_ sender: Any) {
        print(myswitch.isOn)
    }
    @IBAction func clickStepper(_ sender: Any) {
        print(mystepper.value)
//        print("stepper")
    }
    @IBAction func clickButton(_ sender: Any) {
        mybtn.isSelected = !mybtn.isSelected
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    private func initView(){

        mystepper.maximumValue = 10
        mystepper.minimumValue = 0
        mystepper.value = 5
        mystepper.stepValue = 0.5
    
        mybtn.setImage(UIImage(named:"switch-on-icon"), for:UIControlState.normal)
        
        mybtn.setImage(UIImage(named:"switch-off-icon"), for: UIControlState.selected)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
