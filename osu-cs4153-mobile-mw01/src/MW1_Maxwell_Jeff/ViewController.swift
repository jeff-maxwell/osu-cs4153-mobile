//
//  ViewController.swift
//  MW1_Maxwell_Jeff
//
//  Created by Jeff Maxwell on 10/9/18.
//  Copyright © 2018 Oklahoma State University - Mobile Development. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Timer variable for application
    weak var timer: Timer?
    
    // Total Time Variables
    var startTime: Double = 0
    var time: Double = 0
    var elapsed: Double = 0
    
    // Lap Time Variables
    var lapStartTime: Double = 0
    var lapTime: Double = 0
    var lapElapsed: Double = 0
    var lapCounter: Int = 0
    
    // Boolean to track if time has been started or not
    var isStarted: Bool = false
    
    // Instance of the LapDataStore Class
    var lapDataStore = LapDataStore()
    
    // Instance of the Helper Class
    var helper = Helper()
    
    // Tap and Double Tab Gesture objects for Stop Watch Button
    @IBOutlet var stopWatchDoubleTapRecognizer: UITapGestureRecognizer!
    @IBOutlet var stopWatchTapRecognizer: UITapGestureRecognizer!
    
    // Button Objects
    @IBOutlet weak var logoButton: UIButton!
    @IBOutlet weak var newLapButton: UIButton!
    @IBOutlet weak var stopWatchButton: UIButton!
    
    // Label Objects
    @IBOutlet weak var lapCounterLabel: UILabel!
    @IBOutlet weak var totalTimeLabel: UILabel!
    @IBOutlet weak var lapTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initally hide the New Lap Button
        newLapButton.alpha = 0
        
        // Only allow the Tap on the Stop Watch Button if Double Tap fails
        stopWatchTapRecognizer.require(toFail: stopWatchDoubleTapRecognizer)
    }

    /*
     * Handler for when the Stop Watch Button is tapped
     * It will start or stop the watch based on the current state
     */
    @IBAction func stopWatchTapHandler(_ sender: UITapGestureRecognizer) {
        
        // get the time reference since last call
        let referenceDate = Date().timeIntervalSinceReferenceDate
        
        // If the stop watch is running stop it else start it.
        if isStarted == true {
            // Change the Stop Watch Button image to the start image
            let image = UIImage(named: "start")
            stopWatchButton.setImage(image, for: UIControl.State.normal)
            
            // Set the elapsed time for the total and lap
            elapsed = referenceDate - startTime
            lapElapsed = referenceDate - lapStartTime
            
            // Stop the Timer
            timer?.invalidate()
            
            // Hide the New Lap Button
            newLapButton.alpha = 0
            
            // Stop the Stop Watch
            isStarted = false;
            
        } else {
            
            // Show the New Lap Button
            newLapButton.alpha = 1
            
            // If the lap is 0 (First Start) set it to 1
            if lapCounter == 0 {
                lapCounter = 1
                lapCounterLabel.text = String(lapCounter)
            }
            
            // Change the Stop Watch Button image to the stop image
            let image = UIImage(named: "stop")
            stopWatchButton.setImage(image, for: UIControl.State.normal)
            
            // Set the elapsed time for the total and lap
            startTime = referenceDate - elapsed
            lapStartTime = referenceDate - lapElapsed
            
            // Setup the Timer on a schedule with a 0.01 (millisecond) timer
            // Call the updateCounter Methods on each iteration
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
            
            // Start the Stop Watch
            isStarted = true;
        }
    }
    
    // On Double Tap Reset the Application to all the defaults
    @IBAction func stopWatchDoubleTapHandler(_ sender: UITapGestureRecognizer) {
        // Hide the New Lap Button
        newLapButton.alpha = 0
        
        // Reset the Overall Time values
        startTime = 0
        time = 0
        elapsed = 0
        
        // Reset the Lap Time Values
        lapStartTime = 0
        lapTime = 0
        lapElapsed = 0
        
        // Reset Lap Count
        lapCounter = 0
        
        // Set the Boolean for the Timers being Started
        isStarted = false
        
        // Reset the Labels to the default values
        totalTimeLabel.text = "0:00:00.0"
        lapTimeLabel.text = "0:00:00.0"
        lapCounterLabel.text = String(lapCounter)
        
        // Clear out any laps that have been stored
        lapDataStore.clearLaps()
    }
    
    // When the New Lap Button is Clicked increase the counter and store to the lap list
    @IBAction func newLapButtonClick(_ sender: UIButton) {
        // get the time reference since last call
        let referenceDate = Date().timeIntervalSinceReferenceDate
        
        // Increase the Lap Counter and update the label
        lapCounter += 1
        lapCounterLabel.text = String(lapCounter)
        
        // Add to the Lap Data Store lap seconds list
        lapDataStore.addSeconds(value: lapTime)
        
        // Add to the Lap Data Store the last lap
        lapDataStore.addValue(value: lapTimeLabel.text!)
        
        // Reset the Lap Time
        lapTime = 0
        lapStartTime = referenceDate - lapElapsed
        lapElapsed = 0
    }
    
    /*
     * Update the labels based on the timer schedule
     * Had to add the @objc at the front of the method because of the way the timer was setup
     * with a #selector
     */
    @objc func updateCounter() {
        // get the time reference since last call
        let referenceDate = Date().timeIntervalSinceReferenceDate
        
        // Calculate total time since timer and lapTime started in seconds
        time = referenceDate - startTime
        lapTime = referenceDate - lapStartTime
        
        // Update the Total Time and Lap Time labels based on the current time
        totalTimeLabel.text = helper.calcuateTimeString(timeVal: time)
        lapTimeLabel.text = helper.calcuateTimeString(timeVal: lapTime)
    }
}
