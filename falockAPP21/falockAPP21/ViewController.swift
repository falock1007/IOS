//
//  ViewController.swift
//  falockAPP21
//
//  Created by user on 2017/7/4.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var imgView: UIImageView!
    
    @IBAction func takePic(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let imgPC = UIImagePickerController()
            imgPC.sourceType = .camera
            imgPC.delegate = self
            
            show(imgPC, sender: self)
        }else{
            print("Camera not available")
        }
        
        
    
    
    
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let img = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        imgView.image = img
        dismiss(animated: true, completion: {() in
            print("OK")
        })
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: {() in
            print("Cancel")
        })
    }
    @IBAction func playVideo1(_ sender: Any) {
        //https://www.youtube.com/watch?v=5vW_gwZqEW0
        //http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4
        
        let videoURL = URL(string:"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        let player = AVPlayer(url: videoURL!)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        view.layer.addSublayer(playerLayer)
        player.play()
    }
    
    @IBAction func playVideo2(_ sender: Any) {
        let videoURL = URL(string:"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        let player = AVPlayer(url: videoURL!)
        let playerVC = AVPlayerViewController()
        playerVC.player = player
        self.present(playerVC, animated: true)

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

