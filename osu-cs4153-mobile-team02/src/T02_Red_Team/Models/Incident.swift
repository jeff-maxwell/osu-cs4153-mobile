//
//  TrainingItem.swift
//  T02_Red_Team
//
//  Created by Red Team on 11/12/18.
//  Red Team Members: Trey Holthe, Andrew Ingle, Jeff Maxwell
//  Copyright © 2018 Oklahoma State University - Mobile Development. All rights reserved.
//

import Foundation
import Firebase

/************************
 * Incident Class
 * Store the following from Firebase:
 *    id (String) - Firebase Unique ID
 *    title (String) - Title of the Incident
 *    userId (String) - User ID of the worker who had the incident
 *    type (String) - Type of the Incident
 ***********************/
class Incident {
    let id: String
    let title: String
    let date: String
    let userId: String
    let type: String
    
    // Constructor to take in individual values
    init(id: String, title: String, date: String, userId: String, type: String) {
        self.id = id
        self.title = title
        self.date = date
        self.userId = userId
        self.type = type
    }
    
    // Constructor taking a data snapshot from the Firebase database
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: AnyObject],
            let title = value["title"] as? String,
            let date = value["dateOfReport"] as? String,
            let userId = value["userId"] as? String,
            let type = value["type"] as? String
            else {
                return nil
        }
        
        self.id = snapshot.key
        self.title = title
        self.date = date
        self.userId = userId
        self.type = type
    }
}
