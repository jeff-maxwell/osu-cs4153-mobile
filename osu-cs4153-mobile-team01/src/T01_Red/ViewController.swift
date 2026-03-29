//
//  ViewController.swift
//  T01_Red
//
//  Created by
//      Andrew Ingle
//      Trey Holthe
//      Jeff Maxwell
//      Reagan Meagher
//      on 9/10/18.
//  Copyright © 2018 Oklahoma State University - Mobile Development. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // Word Row StackView for the dynamic labels
    @IBOutlet weak var wordRow1StackView: UIStackView!
    
    // Already guessed letters Label to show what letters have been guessed
    @IBOutlet weak var AlreadyGuessedLabel: UILabel!
    // Last Guessed letter Label
    @IBOutlet weak var lastGuessTextLabel: UILabel!
    // Score Label to show current score
    @IBOutlet weak var scoreLabel: UILabel!
    // Bet Label to show the current bet
    @IBOutlet weak var betLabel: UILabel!
    
    // Bet Slider to increase or decrease the bet amount
    @IBOutlet weak var betSlider: UISlider!
    // Guess TextField (hidden) to take keyboard input on letter guesses
    @IBOutlet weak var guessTextField: UITextField!
    
    var AlreadyGuessed1 = AlreadyGuessed() // instantiates AlreadyGuessed Class
    var RandomWord1 = RandomWord() // instantiates RandomWord Class
    var score = 1000 // The players current score, starting default 1000
    var bet = 200 // The players current bet, set by betSlider
    var lettersMatched = 0; // Number of letters matched to check if all letters have been matched
    var lettersInWord = 0; // Number of letters in a word
    var word = "" // Current word randomly seleted
    
    /****************************
     * guessTextFieldEditingChanged()
     * This IBAction is called everytime a letter is guessed
     * It will add to the checked list and check for a match in the word
     ***************************/
    @IBAction func guessTextFieldEditingChanged(_ sender: UITextField) {
        //if user already guessed this letter do nothing
        if(AlreadyGuessed1.letterHasBeenGuessed(letter: sender.text!)) {
            guessTextField.text = ""
            return
        }
        
        // Add to the already guess list of letters
        AlreadyGuessed1.addTo(latestGuess: sender.text!)
        // Print out the guessed letter
        printGuessed()
        
        // Check to see if the letter guessed matches a letter in the word
        checkForMatch(guess: sender.text!)
        
        // Clear out the current guess so one one letter at a time will be guessed
        guessTextField.text = ""
    }
    
    /****************************
     * sliderAction()
     * As the slider is moved the bet is increased or decreased
     ***************************/
    @IBAction func sliderAction(_ sender: UISlider) {
        bet = Int(sender.value)
        updateBetLabel()
    }
    
    /****************************
     * viewDidLoad()
     * Initialized the View and set defaults
     ***************************/
    override func viewDidLoad() {
        super.viewDidLoad()
        guessTextField.becomeFirstResponder() //text box automatically selected on view load
        printGuessed() // Initialize the guessed letter list
        updateScoreLabel() // Initialize the Score label
        betSlider.maximumValue = Float(score) //Max bet is the current score
        betSlider.minimumValue = 25.0 //minimum bet is $25
        betSlider.value = Float(bet) //default bet is $200
        updateBetLabel()
        initializeWord()
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
            vc?.character = word
        }
    }
    
    /****************************
     * printGuessed()
     * for printing player guesses to already guessed label in main UI
     ***************************/
    func printGuessed() {
        AlreadyGuessedLabel.text = AlreadyGuessed1.alreadyGuessedString
    }
    
    /****************************
     * checkForMatch()
     * Loop through all the labels in the StackView and check for matches
     ***************************/
    func checkForMatch(guess: String) {
        lastGuessTextLabel.text = guess.uppercased()
        var numberMatched = 0 // initalize number letters matched
        for subview in wordRow1StackView.arrangedSubviews { // loop through all elements in the StackView
            if let label = subview as? UILabel { // if the element is a label then check for match
                if label.text == guess.uppercased() { // if the label and guess match then add to number matched
                    label.textColor = UIColor.black // set the text color black so the letter appears
                    numberMatched += 1 // increase number matched for the score
                    lettersMatched += 1 // increase the number of letters matched total
                }
            }
        }
        
        if(numberMatched == 0) { //no letters matched - incorrect guess
            score -= bet // subtract bet from score
        } else { //correct guess
            score += bet * numberMatched // add bet to score for each letter matched
        }
        
        // update the score label
        updateScoreLabel()
        // update the bet label
        updateBetLabel()
        
        // check to see if the game is over
        checkGameOver()
    }
    
    /****************************
     * checkGameOver()
     * check if the score is 0 or all letters have been guessed/matched
     ***************************/
    func checkGameOver() {
        // If the score is 0 (Zero)
        // or then number of letters correctly guessed matches the length of the word
        if score <= 0 || lettersMatched == lettersInWord  {
            // Perform the Seque to the GameOverViewController via the "showGameOver" segue
            self.performSegue(withIdentifier: "showGameOver", sender: nil)
        }
    }
    
    /****************************
     * initializeWord()
     * Get a random word and dynamically create a list of labels and add them to a StackView
     ***************************/
    func initializeWord() {
        
        // Get Random word
        word = RandomWord1.getRandomWord(wordBank: RandomWord1.wordBank)
        lettersInWord = word.count // Set the inital number of letters in the word
        
        //remove existing labels from the StackView
        for label in wordRow1StackView.arrangedSubviews {
            label.removeFromSuperview()
        }
        
        // Loop through all the letters in the word
        for character in word {
            let label = UILabel()
            label.text = String(character) // Add the letter to the text
            
            label.backgroundColor = UIColor.white // Set the background color white for the label
            
            // if the letter is a space subtract 1 from the letters in word count
            //    and set the background color to black hiding that space
            if label.text == " " {
                lettersInWord -= 1
                label.backgroundColor = UIColor.black
            } else { // if it is a non-space letter then set the text color white hidding the value until guessed
                label.textColor = UIColor.white
            }
            
            label.font = UIFont.systemFont(ofSize: 24) // set font-size

            label.textAlignment = .center // center the letter in the label
            label.translatesAutoresizingMaskIntoConstraints = false // turn off auto-size of label
            
            wordRow1StackView.addArrangedSubview(label) // add label to stack panel
            
            label.widthAnchor.constraint(equalToConstant: 24).isActive = true // set the label anchor
            label.layoutIfNeeded() // force the view to update immediately
        }
    }
    
    /****************************
     * updateScoreLabel()
     * Updates the score label to show the current score
     ***************************/
    func updateScoreLabel() {
        scoreLabel.text = "Score: $" + String(score)
    }
    
    /****************************
     * updateScoreLabel()
     * updates the bet label to show the current bet
     ***************************/
    func updateBetLabel() {
        if(bet > score) { // prevents betting more than current score
            bet = score
        }
        betSlider.maximumValue = Float(score) // update bet sliders max value to current score
        betLabel.text = "Bet: $" + String(bet)
    }
}
