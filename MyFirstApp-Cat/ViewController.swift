//
//  ViewController.swift
//  MyFirstApp-Cat
//
//  Created by LIN2 on 5/23/19.
//  Copyright © 2019 LIN2. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var lable: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var catSound: AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lable.isHidden = true
        button.imageView?.contentMode = .scaleAspectFit
        
        let soundFile = Bundle.main.path(forResource: "Cat", ofType: "wav")
        
        do {
            try catSound = AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundFile!))
        }
        
        catch {
            print(error)
        }
    }

   
    @IBAction func meow(_ sender: Any) {
        catSound.play()
        lable.isHidden = false
        
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(hideLabel), userInfo: nil, repeats: false)
    }
    @objc func hideLabel() {
        lable.isHidden = true
    }
}

