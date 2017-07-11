//
//  ViewController.swift
//  falockAPP22
//
//  Created by user on 2017/7/4.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController, MPMediaPickerControllerDelegate {

    var player:AVAudioPlayer?
    var isPrepar = false
    var counter:Float = 0
    var len:Float = 100
    
    @IBAction func startPlay(_ sender: Any) {
        if isPrepar {
            player?.play()

            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block:
                {(timer) in
                    DispatchQueue.main.async {
                        self.slider.value = Float(self.player!.currentTime)
                    }
            })

        }
        
    }
    @IBAction func stopPlay(_ sender: Any) {
        if isPrepar && player!.isPlaying {
            player?.stop()
        }
        
    }
    
    @IBAction func pausePlay(_ sender: Any) {
        if isPrepar && player!.isPlaying{
            player?.pause()
        }
    }
   
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBAction func go(_ sender: Any) {
        
        progressView.progress = 0 //Float(0) - Float(1)
        var myTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: {(timer) in
            self.counter += 5
                self.showProgres()
        })
    }
    
    private func showProgres(){
        DispatchQueue.main.async {
            self.progressView.progress = self.counter / self.len
            //由於1為滿值，因此必須這樣表現
        }
    }
    
    @IBOutlet weak var slider: UISlider!
    
    @IBAction func getMediaList(_ sender: Any) {
        let picker = MPMediaPickerController(mediaTypes: .music)
        
        picker.allowsPickingMultipleItems = true
        picker.delegate = self
        show(picker, sender: self)
    }
    
    func mediaPicker(_ mediaPicker:MPMediaPickerController, didPickMediaItem mediaItemCollection: MPMediaItemCollection){
        print("OK")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = Bundle.main.url(forResource: "-_Rag_Time_On_the_Rag", withExtension:"mp3")
        do{
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try player = AVAudioPlayer(contentsOf: url!)
            if (player?.prepareToPlay())!{
                isPrepar = true
                
                slider.minimumValue = 0
                slider.maximumValue = Float(player!.duration)
                slider.value = 0
                
                
                
                // player?.play() //直接開始播放
            }else{
                isPrepar = false
            }
        }catch{
            print(error)
        }
        
        
        
//        var myProgressView = UIProgressView(progressViewStyle: .default)
//        myProgressView.tintColor = UIColor.red
//        myProgressView.trackTintColor = UIColor.purple
//        myProgressView.frame = CGRect(x: 0, y: 0, width: 100, height: 10)
//        view.addSubview(myProgressView)
    }
    
}

