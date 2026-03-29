//
//  LoginViewController.swift
//  T02_Red_Team
//
//  Created by Red Team on 11/6/18.
//  Red Team Members: Trey Holthe, Andrew Ingle, Jeff Maxwell
//  Copyright © 2018 Oklahoma State University - Mobile Development. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var loginFeedback: UILabel!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loading.isHidden = true  //initial state of loading animation is hidden
        self.loginFeedback.text = ""  //initial feedback is empty
    }
    
    @IBAction func login(_ sender: Any) {
        self.loginFeedback.text = ""
        self.loading.isHidden = false;
        
        //show loading animation
        loading.startAnimating()
        
        // Call the Authentication in Firebase passing the Username and Password
        Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (user, error) in
                self.loading.stopAnimating()
                self.loading.isHidden = true
            
            // If the User is found Segue to the Home ViewController
            if user != nil {
                let vc = self.parent as! ViewController
                vc.authSegue()
            } else {
                // If Username or Password is invalid show an error
                self.loginFeedback.text = "Invalid username or password"
                print(error.debugDescription)
            }
            
        }
    }

}
