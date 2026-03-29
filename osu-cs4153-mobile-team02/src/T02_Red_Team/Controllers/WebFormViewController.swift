//
//  WebFormViewController.swift
//  T02_Red_Team
//
//  Created by Red Team on 11/29/18.
//  Red Team Members: Trey Holthe, Andrew Ingle, Jeff Maxwell
//  Copyright © 2018 Oklahoma State University - Mobile Development. All rights reserved.
//

import UIKit
import WebKit
import Firebase

class WebFormViewController: UIViewController {

    @IBOutlet weak var webForm: WKWebView!
    var formPath: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Load the current Authenticated User
        let user = Auth.auth().currentUser
        
        // Create an URL
        let incidentUrl = URL(string: "https://osu-hotel-tracker.firebaseapp.com/" + formPath + "/" + user!.uid)

        // Create a Request for the URL
        let request = URLRequest(url: incidentUrl!)
        
        // Load the Web control
        webForm.load(request)
    }

}
