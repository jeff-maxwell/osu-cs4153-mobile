//
//  FormItem.swift
//  T02_Red_Team
//
//  Created by Red Team on 12/1/18.
//  Red Team Members: Trey Holthe, Andrew Ingle, Jeff Maxwell
//  Copyright © 2018 Oklahoma State University - Mobile Development. All rights reserved.
//

import Foundation
import Firebase

/************************
 * FormItem Class
 * Store the following from Firebase:
 *    id (String) - Firebase Unique ID
 *    title (String) - Title of the Type of Incident
 *    url (String) - URL path of the type of Incident
 ***********************/
class FormItem {
    let id: String
    let title: String
    let url: String
    
    // Constructor to take in individual values
    init(title: String, url: String) {
        self.id = "1"
        self.title = title
        self.url = url
    }
    
    // Constructor taking a data snapshot from the Firebase database
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: AnyObject],
            let title = value["title"] as? String,
            let url = value["url"] as? String
            else {
                return nil
        }
        
        self.id = snapshot.key
        self.title = title
        self.url = url
    }
}
