//
//  User.swift
//  T02_Red_Team
//
//  Created by Red Team on 11/9/18.
//  Red Team Members: Trey Holthe, Andrew Ingle, Jeff Maxwell
//  Copyright © 2018 Oklahoma State University - Mobile Development. All rights reserved.
//

import Foundation
import Firebase

/************************
 * User Class
 * Store the following from Firebase:
 *    uid (String) - Unique ID
 *    email (String) - User Email
 *    name (String) - User Full name
 *    manager (Bool) - Flag if the user is a manager
 ***********************/
class User {
    
    let uid: String
    let email: String
    let name: String
    let manager: Bool
    
    // Constructor that takes in a Firebase User
    init(authData: Firebase.User) {
        uid = authData.uid
        email = authData.email!
        name = authData.displayName!
        manager = false
    }
    
    // Constructor to take in individual values
    init(uid: String, email: String, name: String) {
        self.uid = uid
        self.email = email
        self.name = name
        self.manager = false
    }
    
    // Converts the User into a JSON type object to store in the database
    func toAnyObject() -> Any {
        return [
            "name": name,
            "manager": manager,
            "email": email,
            "name": name
        ]
    }
}
