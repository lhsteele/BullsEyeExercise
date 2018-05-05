//
//  ViewController.swift
//  BullsEyeExercise
//
//  Created by Lisa Steele on 5/4/18.
//  Copyright © 2018 lisahsteele. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 1
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        //One way to calculate the difference between slider value and target value
//        var difference: Int
//        if currentValue > targetValue {
//            difference = currentValue - targetValue
//        } else if currentValue < targetValue {
//            difference = targetValue - currentValue
//        } else {
//            difference = 0
//        }
        //Second way to calculate the difference
//        var difference = currentValue - targetValue
//        if difference < 0 {
//            difference = difference * -1
//        }
        //Most concise and direct way
        let difference = abs(currentValue - targetValue)
        
        let points = 100 - difference
        //below is the same as score = score + points
        score += points
        
        round += 1
        
        //The \n tells xcode to insert a special "new line" character at this point, which will
        //break up the text into two lines so the message is easier to read.
        let message = "The value of the slider is: \(currentValue)" + "\nThe target value is: \(targetValue)" + "\nThe difference is: \(difference)" + "\nYou scored \(points) points"
        
        let alert = UIAlertController(title: "Hello World", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
}

