//
//  ViewController.swift
//  T02_Red_Team
//
//  Created by Red Team on 10/20/18.
//  Red Team Members: Trey Holthe, Andrew Ingle, Jeff Maxwell
//  Copyright © 2018 Oklahoma State University - Mobile Development. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginContainer: UIView!
    @IBOutlet weak var signupContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Default the Login Container on and the Signup Off
        loginContainer.alpha = 1
        signupContainer.alpha = 0
    }
    
    func authSegue() {
        self.performSegue(withIdentifier: "successfulLoginSegue", sender: nil)
    }

    @IBAction func loginButtonTap(_ sender: Any) {
        // Trun Login Container On and the Signup Off
        loginContainer.alpha = 1
        signupContainer.alpha = 0
    }
    @IBAction func signupButtonTap(_ sender: Any) {
        // Trun Login Container Off and the Signup On
        loginContainer.alpha = 0
        signupContainer.alpha = 1
    }
}

