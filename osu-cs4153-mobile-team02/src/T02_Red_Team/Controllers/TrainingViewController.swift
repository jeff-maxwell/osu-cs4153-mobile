//
//  TrainingViewController.swift
//  T02_Red_Team
//
//  Created by Red Team on 11/11/18.
//  Red Team Members: Trey Holthe, Andrew Ingle, Jeff Maxwell
//  Copyright © 2018 Oklahoma State University - Mobile Development. All rights reserved.
//

import UIKit
import WebKit

class TrainingViewController: UIViewController {

    @IBOutlet weak var TrainingWebView: WKWebView! // for display of training content
   
    var selectedTrainingURL = URL(string: "") // will be populated by server content
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Create a Request for the URL
        let request = URLRequest(url: selectedTrainingURL!)
        
        // Load the Web control
        TrainingWebView.load(request)
    }
    
}
