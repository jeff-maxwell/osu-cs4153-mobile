//
//  ViewController.swift
//  W06_Maxwell_Jeff
//
//  Created by Jeff Maxwell on 9/26/18.
//  Copyright © 2018 Oklahoma State University - Mobile Development. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Create local value pointing to the Calculator Class
    var calc = Calculator()
    
    // IBOutlet bound to the Total Label on Screen
    @IBOutlet weak var total: UILabel!
    
    // viewDidLoad Load Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func clickNumberButton(_ sender: UIButton) {
        // Call add() function of Calculator to increase total and add to history
        calc.add(number: Int(sender.tag))
        
        // Set Total label from Calculator
        setAndDisplayResults()
    }
    
    @IBAction func undoButton(_ sender: UIButton) {
        // Call undo() function of Calculator to subtract and remove last history entry
        calc.undo()
        
        // Set Total label from Calculator
        setAndDisplayResults()
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        // Call clear() function of Calculator to reset total and history
        calc.clear()
        
        // Set Total label from Calculator
        setAndDisplayResults()
    }
    
    // Local function to set the total from Calculator to Label
    //     and print out some debug statements for Grading
    func setAndDisplayResults() {
        // Set Total Label to the Calulator total value
        total.text = String(calc.total)
        
        // Print out in Debug window current history array
        print(calc.history)
    }


}

