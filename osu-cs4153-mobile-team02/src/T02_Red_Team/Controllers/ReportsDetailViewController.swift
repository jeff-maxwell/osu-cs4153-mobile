//
//  ReportsDetailViewController.swift
//  T02_Red_Team
//
//  Created by Red Team on 12/2/18.
//  Red Team Members: Trey Holthe, Andrew Ingle, Jeff Maxwell
//  Copyright © 2018 Oklahoma State University - Mobile Development. All rights reserved.
//

import UIKit
import WebKit

class ReportsDetailViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var selectedId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create an URL
        let url = URL(string: "https://osu-hotel-tracker.firebaseapp.com/reports/" + selectedId)
        
        // Create a Request for the URL
        let request = URLRequest(url: url!)
        
        // Load the Web control
        webView.load(request)
    }

}
