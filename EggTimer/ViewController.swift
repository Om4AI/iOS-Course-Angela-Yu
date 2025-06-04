//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Code by Om on 04/06/2025.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    // Class members
    @IBOutlet weak var titleLabel: UILabel!
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    var countdownTimer = Timer()
    @IBOutlet weak var progressBar: UIProgressView!
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
//        Set total time
        let hardness = sender.currentTitle!
        totalTime = 60 * eggTimes[hardness]!
        
//        Reset timer, seconds passed and progressBar
        countdownTimer.invalidate()
        secondsPassed = 0
        progressBar.progress = 0.0
        titleLabel.text = hardness
        
        startTimer()
    }
    
//    Countdown timer functions
    func startTimer(){
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime(){
//        Shows the remaining time in MM:SS format
        timerLabel.text = "\(timeFormatted(totalTime - secondsPassed))"
        
//        Conditions for updating time and progress
        if (secondsPassed < totalTime){
            let percentageProgress = Float(secondsPassed)/Float(totalTime)
            progressBar.progress = Float(percentageProgress)
            secondsPassed += 1
        }
        else if (secondsPassed == totalTime){
            countdownTimer.invalidate()
            titleLabel.text = "Done!"
            progressBar.progress = 1.0
            playSound(soundName: "alarm_sound")
        }
    }
    
    func timeFormatted(_ totalSeconds: Int) -> String{
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func playSound(soundName: String){
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
 
