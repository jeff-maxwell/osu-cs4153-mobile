//
//  ViewController.swift
//  Course Explorer
//
//  Created by Jeff Maxwell on 10/13/18.
//  Copyright © 2018 Oklahoma State University - Mobile Development. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // Define the Current TextField in the UI
    @IBOutlet weak var courseNumTextField: UITextField!
    @IBOutlet weak var courseTitleTextField: UITextField!
    @IBOutlet weak var courseAbbrTextField: UITextField!
    
    // Set a Number Field Tag Constant
    let NumFieldTag: Int = 2
    
    // Local Variables for each TextField
    var courseTitle: String = ""
    var courseNum: Int16 = 0
    var deptAbbr: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the delegate for the TextFields
        courseNumTextField.delegate = self
        courseAbbrTextField.delegate = self
        courseTitleTextField.delegate = self
    }
    
    /*
     * saveButton validates the input and calls Save Segue in TableViewController
     */
    @IBAction func saveButton(_ sender: Any) {
        
        // If the TextFields are blank show an Alert Message
        if (courseTitleTextField.text == ""
            || courseAbbrTextField.text == ""
            || courseNumTextField.text == "") {
        
            // Call the Alert
            showAlert()
            
        } else {
            // Call the unwind Segue to go back to the TableViewController
            self.performSegue(withIdentifier: "unwindSegueFromSave", sender: self)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // Checks the Number Field Tag and if it doesn't match returns else it is the Course Number Text Field
        if (textField.tag != NumFieldTag) {
            return true
        }
        
        // Create a list of allowed charaters
        let allowedCharacters = "0123456789"
        
        // Create a Character Set of allowed characters
        let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
        
        // Create a Character Set of all String characters
        let typedCharacterSet = CharacterSet(charactersIn: string)
        
        // Return only if the allowed characters is one of the typed characters
        return allowedCharacterSet.isSuperset(of: typedCharacterSet)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Initialize the Text Fields
        courseTitle = courseTitleTextField.text ?? "Bad Title"
        deptAbbr = courseAbbrTextField.text ?? "Bad Abbr"
        courseNum = Int16(courseNumTextField.text ?? "-1")!
    }
    
    func showAlert() {
        // Create an Alert Controller
        let alertController = UIAlertController(title: "Alert", message: "All Fields need to be populated or press the Back Button.", preferredStyle: .alert)
        
        // Create an OK Alert Action Button
        let action = UIAlertAction(title: "Ok", style: .default) {
            (action:UIAlertAction) in
            print("OK Pressed");
        }
        
        // Add the button to the Alert Controller
        alertController.addAction(action)
        
        // Show the Alert
        self.present(alertController, animated: true, completion: nil)
    }
}
