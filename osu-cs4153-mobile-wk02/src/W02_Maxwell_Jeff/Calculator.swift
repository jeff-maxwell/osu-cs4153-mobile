//
//  Calculator.swift
//  W02_Maxwell_Jeff
//
//  Created by Jeff Maxwell on 8/29/18.
//  Copyright © 2018 Oklahoma State University - Mobile Development. All rights reserved.
//

import Foundation

/*******************************************************
 * Calculator Class
 *
 * Properties:
 *    total (Int)     - Running total for the Calculator
 *    history ([Int]) - Number array of numbers in the
 *                      order they were added
 ******************************************************/
public class Calculator {
    
    /************************************************
     * Public Properties
     ***********************************************/
    var total: Int
    var history: [Int] = []
    
    /************************************************
     * init() - Initialization function (Constructor)
     ***********************************************/
    init() {
        // Initialize total to 0
        total = 0
        
        // Initialize history array to an empty array
        history = []
    }
    
    /************************************************
     * add(number) - Takes in a number (Int) and adds
     *               to the running total and history
     *               number array
     ***********************************************/
    func add(number: Int) {
        // Add number passed in to the running total
        total += number
        
        // Add the number to the end of the history array
        history.append(number)
    }
    
    /************************************************
     * undo() - subtract the last value in history
     *          array from running total
     ***********************************************/
    func undo() {
        // Check to see if there are values in the
        //     history array to remove
        if (history.count > 0) {
            // Subtract the last number in the history
            //      array from running total
            total -= Int(history[history.count - 1])
            
            // Remove the last number from the array
            history.removeLast()
        }
    }
    
    /************************************************
     * clear() - resets total to 0 and clears the
     *           history array
     ***********************************************/
    func clear() {
        // Initialize total to 0
        total = 0
        
        // Initialize history array to an empty array
        history = []
    }
}
