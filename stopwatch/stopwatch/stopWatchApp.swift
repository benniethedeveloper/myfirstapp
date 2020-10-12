//
//  stopWatchApp.swift
//  stopwatch
//
//  Created by Benazir Asanbaeva  on 10/8/20.
//  Copyright © 2020 Benazir Asanbaeva . All rights reserved.
//

import UIKit
class stopWatchApp: UIViewController
{
    
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    var timer = Timer?.none
    var TimerIsRunning = false
    var counter = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad ()
        
        restartButton.isEnabled = false
        playButton.isEnabled = true
        stopButton.isEnabled = false
        
        timerLabel.layer.cornerRadius = 5.0
        timerLabel.layer.masksToBounds = true
        
        restartButton.layer.cornerRadius = 4.0
        restartButton.layer.masksToBounds = true
        restartButton.isEnabled = false
        restartButton.alpha = 0.5
        
        playButton.layer.cornerRadius = playButton.bounds.width / 2.0
        playButton.layer.masksToBounds = true
        playButton.isEnabled = true
        playButton.alpha = 0.5
        
        stopButton.layer.cornerRadius = stopButton.bounds.width / 2.0
        stopButton.layer.masksToBounds = true
        stopButton.isEnabled = false
        stopButton.alpha = 0.5
        
        
        
    }
    
    @IBAction func restartDidTap(_ sender: Any) {
        timer?.invalidate()
        TimerIsRunning = false
        counter = 0.0
        timerLabel.text = "00.00.00.0"
        restartButton.isEnabled = false
        playButton.isEnabled = true
        stopButton.isEnabled = true
        
        restartButton.alpha = 0.3
        playButton.alpha = 1
        stopButton.alpha = 0.5
        
    }
    
    
    @IBAction func stopDidTap(_ sender: Any) {
        restartButton.isEnabled = true
        playButton.isEnabled = true
        stopButton.isEnabled = false
        restartButton.alpha = 1.0
        playButton.alpha = 1.0
        stopButton.alpha = 0.5
        
        
        TimerIsRunning = false
        timer?.invalidate()
        
        
        
        
    }
    
    @IBAction func playDidTap(_ sender: Any) {
        if !TimerIsRunning {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
            TimerIsRunning = true
            restartButton.isEnabled = true
            playButton.isEnabled = true
            stopButton.isEnabled = true
            
            restartButton.alpha = 1.0
            playButton.alpha = 0.5
            stopButton.alpha = 1.0
            
            
            
            
        }
    }
    
    //mark helper methods
    @objc func runTimer () {
        counter += 0.1
        //HH:MM:SS:_
        let flooredCounter = Int(floor(counter))
        let hour = flooredCounter / 3600
        
        let minute = (flooredCounter % 3600) / 60
        var minuteString = "\(minute)"
        if minute < 10 {
            minuteString = "0\(minute)"
        }
        let second = (flooredCounter % 3600) % 60
        var secondString = "\(second)"
        if second < 10 {
            secondString = "0\(second)"
        }
        let decisecond = String(format: "%.1f", counter).components(separatedBy: ".").last!
        timerLabel.text = "\(hour):\(minuteString):\(secondString).\(decisecond)"
    }
    
}


