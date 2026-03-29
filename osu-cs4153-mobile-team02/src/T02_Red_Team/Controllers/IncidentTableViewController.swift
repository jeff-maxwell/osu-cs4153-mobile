//
//  IncidentTableViewController.swift
//  T02_Red_Team
//
//  Created by Red Team on 10/20/18.
//  Red Team Members: Trey Holthe, Andrew Ingle, Jeff Maxwell
//  Copyright © 2018 Oklahoma State University - Mobile Development. All rights reserved.
//

import UIKit
import Firebase

class IncidentTableViewController: UITableViewController {
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    var selectedRow: Int = 0
    var items: [Incident] = []
    
    // Create an instance to the Firebase database and refrence the Reports Object tree
    let ref = Database.database().reference(withPath: "reports")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get an instance to the currently logged in User
        let user = Auth.auth().currentUser
        
        // Load the reports from the server
        ref.observe(.value, with: { snapshot in
            var newItems: [Incident] = []
            
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                    let incidentItem = Incident(snapshot: snapshot) {

                    // Filter the reports down to the specific user
                    if incidentItem.userId == user?.uid {
                        newItems.append(incidentItem)
                    }
                }
            }
            
            self.items = newItems
            self.tableView.reloadData()
        })
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    @IBAction func addButtonClick(_ sender: Any) {
        performSegue(withIdentifier: "IncidentSegue", sender: self)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Incident Table Cell", for: indexPath)

        let incidentItem = items[indexPath.row]
        
        // Alternate the row color showing white or gray for odd and even rows
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.white
        }
        
        // Setup the Title, Date and Image based on the row
        cell.textLabel?.text = incidentItem.title
        cell.detailTextLabel?.text = incidentItem.date
        cell.imageView?.image = UIImage(named: items[indexPath.row].type.lowercased())
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedRow = indexPath.row
        performSegue(withIdentifier: "TableRowSelectedSegue", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "TableRowSelectedSegue" {
            let reportDetailsView = segue.destination as! ReportsDetailViewController
            reportDetailsView.selectedId = items[self.selectedRow].id
        }
        
    }
}
