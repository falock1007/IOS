//
//  ViewController.swift
//  StopWatch
//
//  Created by user on 2017/6/27.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var hsLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnStartOrStop: UIButton!
    @IBOutlet weak var btnLapOrReset: UIButton!
    private var isStart = false
    private var laps:Array<String> = []
    private var timer:Timer?
    private var counter = 0

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return laps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = laps[indexPath.row]
        return cell!
    }
    
    
    @IBAction func changeStartOrStop(_ sender: Any) {
        isStart = !isStart
        if isStart {
            // Running
            btnStartOrStop.setTitle("Stop", for: UIControlState.normal)
            btnLapOrReset.setTitle("Lap", for: UIControlState.normal)
            doStart()
        }else{
            btnStartOrStop.setTitle("Start", for: UIControlState.normal)
            btnLapOrReset.setTitle("Reset", for: UIControlState.normal)
            doStop()
        }
    }
    @IBAction func doLapOrReset(_ sender: Any) {
        if isStart {
            // Running ==> Lap
            
            doLap()
        }else{
            //stop ==> Reset
            doReset()
        }
    }
    
    private func doStart(){
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: {(timer) in
                self.counter += 1
                self.showCounter()
            })
        
    }
    private func showCounter(){
        let
        hs = counter % 100
        hsLabel.text = String(format: "%02d", hs)
        let ts = counter / 100
        secondLabel.text = String(format: "%02d", ts % 60)
        let tm = ts / 60
        minuteLabel.text = String(format: "%02d", tm % 60)
        let thr = tm / 60
        hourLabel.text = String(thr % 9999)
        }
    
    private func doStop(){
        timer?.invalidate()
        timer = nil
    }
    private func doLap(){
        let lapString = hourLabel.text! + ":" + minuteLabel.text! + ":" + secondLabel.text! + ":" + hsLabel.text!
        laps += [lapString]
        tableView.reloadData()
    }
    private func doReset(){
        counter = 0
        laps.removeAll()
        showCounter()
        tableView.reloadData()
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

