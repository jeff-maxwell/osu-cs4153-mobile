//
//  Helper.swift
//  MW1_Maxwell_Jeff
//
//  Created by Jeff Maxwell on 10/11/18.
//  Copyright © 2018 Oklahoma State University - Mobile Development. All rights reserved.
//

import Foundation

class Helper {
    /*
     * Helper function to calculate the format the time for the
     * Total and Lap Time labels
     */
    func calcuateTimeString(timeVal: Double) -> String {
        var timeValue = timeVal
        
        // Calculate minutes
        let minutes = UInt8(timeValue / 60.0)
        timeValue -= (TimeInterval(minutes) * 60)
        
        // Calculate seconds
        let seconds = UInt8(timeValue)
        timeValue -= TimeInterval(seconds)
        
        // Calculate milliseconds
        let milliseconds = UInt8(timeValue * 100)
        
        // Format time vars with leading zero
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        let strMilliseconds = String(format: "%02d", milliseconds)
        
        // Add time vars to relevant labels
        return strMinutes + ":" + strSeconds + ":" + strMilliseconds
    }
}
