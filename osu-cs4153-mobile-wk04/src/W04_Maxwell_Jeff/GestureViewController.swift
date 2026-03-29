//
//  GestureViewController.swift
//  W04_Maxwell_Jeff
//
//  Created by Jeff Maxwell on 9/12/18.
//  Copyright © 2018 Oklahoma State University - Mobile Development. All rights reserved.
//

import UIKit

class GestureViewController: UIViewController {
    
    /****************************
     ****************************
     * Local Variables
     ****************************
     ***************************/
    // Total seconds for the timer.
    var secondsRemaining = 60
    
    // Score for game
    var score = 0
    
    // Selected gesture
    var gesture = 0

    /****************************
     ****************************
     * Outlets
     ****************************
     ***************************/
    // Count down label for Timer
    @IBOutlet weak var countDownLabel: UILabel!
    
    // Score Label
    @IBOutlet weak var scoreLabel: UILabel!
    
    // Image for Tap Icon
    @IBOutlet weak var tapImageView: UIImageView!
    
    // Image for Swipe Left Icon
    @IBOutlet weak var swipeLeftImageView: UIImageView!
    
    // Image for Swipe Right Icon
    @IBOutlet weak var swipeRightImageView: UIImageView!
    
    // Image for Pinch Icon
    @IBOutlet weak var pinchImageView: UIImageView!
    
    // Random Gesture Label (Tap, Pinch, Swipe Right, Swipe Left)
    @IBOutlet weak var gestureAction: UILabel!
    
    /****************************
     ****************************
     * Actions
     ****************************
     ***************************/
    
    /****************************
     * Swipe Handler to capture Left and Right Swipes
     * Only reacts to Swipe Left or Right gestures
     ***************************/
    @IBAction func swipeHandler(_ sender: UISwipeGestureRecognizer) {
        
        // Switch/Case to compare gestures
        switch sender.direction {
        // Right Swipe
        case UISwipeGestureRecognizer.Direction.right:
            // If the random (gesture) selected matches Right Gesture the add to the score
            if gesture == 1 {
                addToScore()
            }
            break
        // Left Swipe
        case UISwipeGestureRecognizer.Direction.left:
            // If the random (gesture) selected matches Left Gesture the add to the score
            if gesture == 2 {
                addToScore()
            }
            break
        default:
            break
        }
    }

    /****************************
     * Tap Handler to capture Tap actions
     * Only reacts to Tap gestures
     ***************************/
    @IBAction func tapHandler(_ sender: UITapGestureRecognizer) {
        // If the random (gesture) selected matches Tap Gesture the add to the score
        if (gesture == 3) {
            addToScore()
        }
    }
    
    /****************************
     * Pinch Handler to capture Pinch actions
     * Only reacts to Pinch gestures
     ***************************/
    @IBAction func pinchHandler(_ sender: UIPinchGestureRecognizer) {
        // If the random (gesture) selected matches Pinch Gesture the add to the score
        if gesture == 4 {
            addToScore()
        }
    }
    
    /****************************
     ****************************
     * Local Functions
     ****************************
     ***************************/
    
    /****************************
     * hideIcons()
     * Set the .alpha value to 0 for all Icons hiding them
     ***************************/
    func hideIcons() {
        swipeLeftImageView.alpha = 0
        swipeRightImageView.alpha = 0
        tapImageView.alpha = 0
        pinchImageView.alpha = 0
    }
    
    /****************************
     * resetRound()
     * Hides the Icons and picks a new random number starting a new round
     ***************************/
    func resetRound() {
        hideIcons()
        pickRandomGesture()
    }
    
    /****************************
     * pickRandomGesture()
     * Randomly picks a number between 1-4
     * and sets that to the (gesture) variable
     * 1 = Swipe Right
     * 2 = Swipe Left
     * 3 = Tap
     * 4 = Pinch
     ***************************/
    func pickRandomGesture() {
        
        // Randomly generate a number between 1-4
        // Assign that number to (gesture)
        gesture = Int.random(in: 1...4)
        
        // Switch/Case to compare (gesture) value
        switch gesture {
            // Swipe Right
            case 1:
                swipeRightImageView.alpha = 1
                gestureAction.text = "Swipe Right"
                break
            // Swipe Left
            case 2:
                swipeLeftImageView.alpha = 1
                gestureAction.text = "Swipe Left"
                break
            // Tap
            case 3:
                tapImageView.alpha = 1
                gestureAction.text = "Tap"
                break
            // Pinch
            case 4:
                pinchImageView.alpha = 1
                gestureAction.text = "Pinch"
                break
            default:
                break
        }
        
    }
    
    /****************************
     * Tap Handler to capture Tap actions
     * Only reacts to Tap gestures
     ***************************/
    func addToScore() {
        // Add one to the current Score
        score += 1
        
        // Assign the current Score to the Score Label
        scoreLabel.text = String(score)
        
        // Reset Icons and pick next random Gesture
        resetRound()
    }
    
    /****************************
     * Tap Handler to capture Tap actions
     * Only reacts to Tap gestures
     ***************************/
    func startTimer() {
        // Create a timer object with a block (closure) that gets
        // executed on a time interval of once per second, and which
        // repeats until told to stop.
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer: Timer) -> Void in
            // Decrement the seconds that remain.
            self.secondsRemaining -= 1
            
            if self.secondsRemaining == 0 {
                // When we reach 0 seconds, invalidate the timer,
                // which will stop further calls to the closure.
                timer.invalidate()
                // At 0 seconds, also change the color of the
                // label text.
                self.countDownLabel.textColor = UIColor.red
                
                self.performSegue(withIdentifier: "showGameOver", sender: nil)
            }
            
            // Display the current remaining seconds in the label.
            self.countDownLabel.text = String(self.secondsRemaining)
        })
    }
    
    /****************************
     ****************************
     * Method Overrides
     ****************************
     ***************************/

    /****************************
     * viewDidLoad()
     * Initialize the application and start the game
     ***************************/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Start countdown timer
        startTimer()
        
        // Initially Hide all the Icons
        hideIcons()
        
        // Pick a Random Gesture and start the game
        pickRandomGesture()
    }
    
    /****************************
     * prepare()
     * Prepare a Segue when the game is over
     * and set the finalScore in the GameOverViewController
     ***************************/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // if the Segue destination is the GameOverView Controller set the finalScore
        if segue.destination is GameOverViewController
        {
            // Get an instance of the GameOverViewController
            let vc = segue.destination as? GameOverViewController
            
            // Set the finalScore variable in the GameOverViewController
            vc?.finalScore = score
        }
    }
}
