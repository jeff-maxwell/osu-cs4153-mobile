//
//  LapDataStore.swift
//  MW1_Maxwell_Jeff
//
//  Created by Jeff Maxwell on 10/9/18.
//  Copyright © 2018 Oklahoma State University - Mobile Development. All rights reserved.
//

import Foundation

/*
 * This Class is used to encapsulate some of the functions needed to calculate and store lap
 * information across multile views.
 */
class LapDataStore
{
    // Private variables declared as static to be shared across multiple views
    private static var laps: [String] = []
    private static var lapSeconds: [Double] = []
    
    // Return a list of laps
    func allLaps() -> [String]
    {
        return LapDataStore.laps
    }
    
    // Add a Time string to the laps list
    func addValue(value: String)  {
        LapDataStore.laps.append(value)
    }
    
    // Add the number of seconds to the lapSeconds list
    func addSeconds(value: Double)  {
        LapDataStore.lapSeconds.append(value)
    }
    
    // Get the average time/number of seconds for all laps in the list
    func getAverage() -> Double {
        var total : Double = 0
        
        LapDataStore.lapSeconds.forEach { lap in
            total += lap
        }
        
        return total / Double(LapDataStore.lapSeconds.count)
    }
    
    // Clear/Reset the laps, lapSeconds and lapAverage
    func clearLaps() {
        LapDataStore.laps = []
        LapDataStore.lapSeconds = []
    }
}
