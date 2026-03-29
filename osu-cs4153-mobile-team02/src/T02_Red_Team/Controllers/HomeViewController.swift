//
//  HomeViewController.swift
//  T02_Red_Team
//
//  Created by Red Team on 11/8/18.
//  Red Team Members: Trey Holthe, Andrew Ingle, Jeff Maxwell
//  Copyright © 2018 Oklahoma State University - Mobile Development. All rights reserved.
//

import UIKit
import WebKit
import Firebase
import FirebaseDatabase

// https://icons8.com/ios - Tab Bar icons

class HomeViewController: UIViewController {

    @IBOutlet weak var userLabel: UILabel! // User Full name
    @IBOutlet weak var newsWebView: WKWebView! //to display news section from link below
    
    // News URL
    var newsUrl = URL(string: "https://osu-hotel-tracker.firebaseapp.com/news.html")

    override func viewDidLoad() {
        super.viewDidLoad()

        // Get an instance to the currently logged in User
        let user = Auth.auth().currentUser
        
        // Set the User name on the Home Page
        self.userLabel.text = user?.displayName
        
        // Create a URL Request
        let request = URLRequest(url: newsUrl!)
        
        // Load the web site into the web view
        newsWebView.load(request)
        
    }
}
