//
//  ViewController.swift
//  DiceApp
//
//  Created by Kamilla Kerimbayeva on 18.10.2025.
//

import UIKit
let diceImages: [UIImage] = [
    #imageLiteral(resourceName: "DiceOne"),
    #imageLiteral(resourceName: "DiceTwo"),
    #imageLiteral(resourceName: "DiceThree"),#imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")
]


class ViewController: UIViewController {
    @IBOutlet weak var leftDice: UIImageView!
    
    @IBOutlet weak var rightDice: UIImageView!
    
    @IBAction func rollButton(_ sender: Any) {
        rollDice()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            rollDice()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func rollDice(){
        leftDice.image = diceImages.randomElement()
        rightDice.image = diceImages.randomElement()
    }
    
    


}

