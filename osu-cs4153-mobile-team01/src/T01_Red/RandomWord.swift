//
//  RandomWord.swift
//  T01_Red
//
//  Created by
//      Andrew Ingle
//      Trey Holthe
//      Jeff Maxwell
//      Reagan Meagher
//      on 9/19/18.
//  Copyright © 2018 Oklahoma State University - Mobile Development. All rights reserved.
//

import Foundation

/****************************
 * RandomWord Class
 * Store the list of words and return a random word
 ***************************/
public class RandomWord {
    
    public var wordBank = [
    "Admiral Gial Ackbar",
    "Padme Amidala",
    "Wedge Antilles",
    "BB 8",
    "Jar Jar Binks",
    "Bossk",
    "C 3PO",
    "Lando Calrissian",
    "Chewbacca",
    "Poe Dameron",
    "Count Dooku",
    "Galen Erso",
    "Jyn Erso",
    "Boba Fett",
    "Jango Fett",
    "Finn",
    "Bib Fortuna",
    "Saw Gerrera",
    "Greedo",
    "General Grievous",
    "Nute Gunray",
    "Armitage Hux",
    "Amilyn Holdo",
    "Jabba the Hutt",
    "Kanan Jarrus",
    "Qui Gon Jinn",
    "Maz Kanata",
    "Obi Wan Kenobi",
    "Owen Lars",
    "Darth Maul",
    "Mon Mothma",
    "Leia Organa",
    "Sheev Palpatine",
    "Darth Sidious",
    "Captain Phasma",
    "Darth Plagueis",
    "Kylo Ren",
    "Rey",
    "Sebulba",
    "Anakin Skywalker",
    "Darth Vader",
    "Luke Skywalker",
    "Snoke",
    "Han Solo",
    "Ahsoka Tano",
    "Moff Tarkin",
    "Admiral Thrown",
    "Asajj Ventress",
    "Mace Windu",
    "Yoda",
    "R2 D2"
    ]
    
    /****************************
     * getRandomWord()
     * param - wordBank - String Array of Words
     * returns - a randomly selected word
     ***************************/
    func getRandomWord(wordBank:[String]) -> String {
        // Random number index from 0 to the current link of the String array passed in
        let randomInt = Int.random(in: 0..<wordBank.count)
        
        // Current word in the list based on the random index
        let currentWord = wordBank[randomInt]
        
        // Return random word seleted upper case
        return currentWord.uppercased()
    }
}
