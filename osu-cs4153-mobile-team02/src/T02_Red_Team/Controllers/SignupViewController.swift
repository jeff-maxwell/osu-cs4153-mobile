//
//  SignupViewController.swift
//  T02_Red_Team
//
//  Created by Red Team on 11/7/18.
//  Red Team Members: Trey Holthe, Andrew Ingle, Jeff Maxwell
//  Copyright © 2018 Oklahoma State University - Mobile Development. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class SignupViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var passwordConfirmText: UITextField!
    @IBOutlet weak var signupErrorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        signupErrorLabel.text = ""
    }
    
    @IBAction func signup(_ sender: Any) {
        // Check that the fields are not empty
        if emailText.text == "" || nameText.text == "" || passwordText.text == "" || passwordConfirmText.text == "" {
            signupErrorLabel.text = "One or more fields were left empty!"
        } else if passwordText.text != passwordConfirmText.text {
            signupErrorLabel.text = "Passwords must match"
        } else {
            
            // Create the User in Firebase and create a user object the database
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (user, error) in
                
                let user = Auth.auth().currentUser
                if let user = user {
                    let changeRequest = user.createProfileChangeRequest()
                    
                    // Add the Full name to the display name in the User of Firebase
                    changeRequest.displayName = self.nameText.text
                    changeRequest.commitChanges { error in
                        if error != nil {
                            print(error!)
                        } else {
                            // Create a User in the Firebase database
                            let user = User(uid: user.uid, email: user.email!, name: user.displayName!)
                            let ref = Database.database().reference(withPath: "users")
                            let userItemRef = ref.child(user.uid)
                            userItemRef.setValue(user.toAnyObject())
                        }
                    }
                }
                
                let vc = self.parent as! ViewController
                vc.authSegue()
            }
        }
    }
    
}
