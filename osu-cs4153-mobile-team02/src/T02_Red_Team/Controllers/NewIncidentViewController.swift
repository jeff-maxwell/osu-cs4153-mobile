//
//  NewIncidentViewController.swift
//  T02_Red_Team
//
//  Created by Red Team on 11/12/18.
//  Red Team Members: Trey Holthe, Andrew Ingle, Jeff Maxwell
//  Copyright © 2018 Oklahoma State University - Mobile Development. All rights reserved.
//

import UIKit
import Firebase

class NewIncidentViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var formItems: [FormItem] = []
    var formPath: String = ""
    
    // Create an instance to the Firebase database and refrence the Forms Object tree
    let refTypes = Database.database().reference(withPath: "forms")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get the list of Form and show in a list of Buttons
        refTypes.observe(.value, with: { snapshot in
            var newItems: [FormItem] = []
            
            // Loop through the results returned from Firebase and create a list of Form Objects
            for child in snapshot.children {
                let snapshot = child as? DataSnapshot
                let newItem = FormItem(snapshot: snapshot!)
                newItems.append(newItem!)
            }
            
            self.formItems = newItems
            
            var count = 0
            var py = 0
            
            // Loop through the Forms List and create a list of Stacked Buttons
            for _ in 1...self.formItems.count {
                let Button = UIButton()
                let title: String = self.formItems[count].title
                Button.tag = count
                Button.frame = CGRect(x: 10, y: py + 10, width: 200, height: 50)
                Button.backgroundColor = UIColor.black
                Button.setTitle(title, for: .normal)
                Button.addTarget(self, action: #selector(self.scrollButtonAction), for: .touchUpInside)
                self.scrollView.addSubview(Button)
                
                count += 1
                py += 60
            }
        })
        
    }
    
    @IBAction func scrollButtonAction(sender: UIButton){
        formPath = self.formItems[sender.tag].url
        
        self.performSegue(withIdentifier: "WebFormSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? WebFormViewController {
            vc.formPath = formPath
        }
    }
}
