//
//  timerViewController.swift
//  stopwatch
//
//  Created by Benazir Asanbaeva  on 10/8/20.
//  Copyright © 2020 Benazir Asanbaeva . All rights reserved.
//

import UIKit
class timerViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    
    var seconds = 30
    var OurTimer = Timer ()
    var TimerDisplayed = 0
     var TimerIsRunning = false

    
    override func viewDidLoad () {
        super.viewDidLoad ()
        OurTimer = Timer.scheduledTimer(timeInterval: 1, target:self, selector: #selector(counter), userInfo: nil, repeats: true)
    }
    

    @IBAction func slider(_ sender: UISlider) {
        
        seconds = Int(sender.value)
        label.text = String(seconds)
    }
    
    @IBAction func stopButton(_ sender: UIButton) {
        OurTimer.invalidate()
        seconds = 30
        slider.setValue(30, animated: true)
        label.text = "30"
    }
    
    
    
    @IBAction func playButton(_ sender: UIButton) {
    }
    @objc func counter () {
        seconds -= 1
        label.text = String(seconds)
        if (seconds==0){
            OurTimer.invalidate ()
        }
    }

    @IBAction func restartButton(_ sender: UIButton) {
        
        TimerDisplayed += 0
        label.text = String(TimerDisplayed)
        if (seconds == 0){
            OurTimer.invalidate()
        }
    }
    
}




