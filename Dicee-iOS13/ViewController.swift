//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Constant with all the dice images
    let diceImages = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    @IBOutlet weak var dice1: UIImageView!
    @IBOutlet weak var dice2: UIImageView!


    @IBAction func rollButtonPressed(_ sender: UIButton) {
        
        // Int.random(in: 0...5) - Code to generate a random integer between 0 & 5
        // .randomElement() - Select a random element from the list of elements
        dice1.image = diceImages.randomElement()
        dice2.image = diceImages.randomElement()
        
    }
    
}

