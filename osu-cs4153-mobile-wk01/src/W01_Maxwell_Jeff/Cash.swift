//
//  Cash.swift
//  W01_Maxwell_Jeff
//
//  Created by Jeff Maxwell on 8/26/18.
//  Copyright © 2018 Oklahoma State University - Mobile Development. All rights reserved.
//

import Foundation

/*
 Cash Class
 
 Description:
 This application takes in a number (amount of money) on initialization
 and returns a computed value (Integer Array) of values representing the
 different bills and coins needed to make that amount
 
 Returns a 0 or 1 in the Integer array for each of the following:
    $50,  $20,  $10,  $5,  $1,  $0.25,  $0.10,  $0.05,  $0.01

 Example:
 47.23 return [0, 2, 0, 1, 2, 0, 2, 0, 3]
 
 Properties:
 - amount (Double) to store the ammount of cash
 - moneyBreakdown Computed Property (Integer Array) that returns the Array of
    cash
*/
public class Cash {
    // public property to store the amount of cash
    public var amount: Double
    
    /*
     init(amount: Double)
     
     public initializer (Constructor) that takes in a number (Double) and
     assigns it to the public property amount
     */
    public init(amount: Double) {
        self.amount = amount
    }
    
    /*
     moneyBreakdown
     
     Returns an Integer Array of bill/coin amounts
     NOTE: Set the return to [Int]? to make is Optional so nil could be returned
        if the amount is less than 0
     */
    public var moneyBreakdown: [Int]? {
        get {
            // Return nil if amount less than 0
            if (self.amount < 0) {
                return nil
            } else {
                return breakdown()
            }
        }
    }
    
    /*
     breakdown()
     
     Loop through each position in the array and determine if a bill exits
     */
    func breakdown() -> [Int] {
        // Create variable bills (Interger Array) with all values initialized to 0
        var bills: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        // Create variable denominations (Double Array) to hold the bill amounts to check
        // NOTE: Multiplied amounts by 100 to fix rounding issues.
        var denominations: [Double] = [5000, 2000, 1000, 500, 100, 25, 10, 5, 1]
        
        // Create workingValue to use to recalculate and track the value as we go through the loop
        // Initial set workingValue to amount times 100
        // NOTE: Multiplied workingValue by 100 to fix rounding issues
        var workingValue = amount * 100
        
        // Loop through the bill array 0-8 (9 elements)
        for index in 0...8 {
            // Set the current bill[index] to the workingValue divided by the current denomination
            // Example: if the working amount is 5222 ($52.22) and it is the first loop (index=0)
            //          Then the result would be (5222 / 5000) = 1 showing you need 1 - $50 bill
            // NOTE: Casting the value into an Int to get the whole number
            bills[index] = Int(workingValue / denominations[index])
            
            // If the bill[index] greater than 0 meaning it had a value for that bill assign the remainder
            // to workingValue for the next pass through the loop
            // Example: For the next loop we need the remainder value
            //          (5222 / 5000) = 222 for the next loop
            if (bills[index] > 0) {
                workingValue = workingValue.truncatingRemainder(dividingBy: denominations[index])
            }
        }
        
        // return the resulting array after all the calculations are done
        return bills
    }
}
