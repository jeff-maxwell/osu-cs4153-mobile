//
//  AlreadyGuessed.swift
//  T01_Red
//
//  Created by
//      Andrew Ingle
//      Trey Holthe
//      Jeff Maxwell
//      Reagan Meagher
//      on 9/12/18.
//  Copyright © 2018 Oklahoma State University - Mobile Development. All rights reserved.
//

import UIKit

public class AlreadyGuessed{
    
    public var alreadyGuessedString = String()
    
    public func addTo(latestGuess: String) {
        alreadyGuessedString.append(latestGuess.uppercased() + " ")
    }
    
    //resets array, needs to be hooked in to word complete or game over
    public func clearAlreadyGuessedArray() {
        alreadyGuessedString.removeAll()
    }
    
   public init(){
    self.alreadyGuessedString = ""
   }
    
    public func letterHasBeenGuessed(letter: String) -> Bool {
        print("Already guessed: " + alreadyGuessedString)
        print("Letter: " + letter)
        return alreadyGuessedString.range(of: letter.uppercased()) != nil //returns true if the string HAS already been guessed
    }
 
}
