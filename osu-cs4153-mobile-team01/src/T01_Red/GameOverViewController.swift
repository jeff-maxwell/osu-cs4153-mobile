//
//  GameOverViewController.swift
//  T01_Red
//
//  Created by
//      Andrew Ingle
//      Trey Holthe
//      Jeff Maxwell
//      Reagan Meagher
//      on 9/24/18.
//  Copyright © 2018 Oklahoma State University - Mobile Development. All rights reserved.
//

import UIKit

/****************************
 * GameOverViewController
 * Game Over View Controller shows the score
 * for the last round and allows you to play again
 ***************************/
class GameOverViewController: UIViewController {

    // Final Score for the last round of the game
    var finalScore: Int = 0
    
    // Character Name for last round of the game
    var character: String = ""
    
    // UI Label to show the Final Score
    @IBOutlet weak var finalScoreLabel: UILabel!
    
    // UI Label to show the Character Name
    @IBOutlet weak var characterLabel: UILabel!
    
    /****************************
     * viewDidLoad()
     * Initial Load function for View Controller
     ***************************/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the final score to the label
        finalScoreLabel.text = String(finalScore)
        
        // Set the character name to the label
        characterLabel.text = character
    }
    
    /****************************
     * prepare()
     * Prepare a Segue to return the final score to the game for the next round
     * and set the finalScore in the ViewController
     ***************************/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // if the Segue destination is the View Controller set the finalScore
        if segue.destination is ViewController
        {
            // Get an instance of the ViewController
            let vc = segue.destination as? ViewController
            
            // Set the score variable in the ViewController
            // if the finalScore is equal to 0 then reset the score for the next round to 1000
            if (finalScore == 0) {
                vc?.score = 1000
            } else { // else set the score for the next round to the score of the last round
                vc?.score = finalScore
            }
        }
    }
}
