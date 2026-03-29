//
//  TrainingTableViewController.swift
//  T02_Red_Team
//
//  Created by Red Team on 10/20/18.
//  Red Team Members: Trey Holthe, Andrew Ingle, Jeff Maxwell
//  Copyright © 2018 Oklahoma State University - Mobile Development. All rights reserved.
//

import UIKit
import Firebase

class TrainingTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var searchTrainingItems = [TrainingItem]()
    var searching = false
    var items: [TrainingItem] = []
    let ref = Database.database().reference(withPath: "training")
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var selectedRow: Int = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref.observe(.value, with: { snapshot in
            var newItems: [TrainingItem] = []
            
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                    let trainingItem = TrainingItem(snapshot: snapshot) {
                    newItems.append(trainingItem)
                }
            }
            
            self.items = newItems
            self.tableView.reloadData()
        })
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == "" {
            clearSearch()
        } else {
            searchTrainingItems = items.filter({$0.title.lowercased().contains(searchText.lowercased())})
            searching = true
            self.tableView.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        clearSearch()
    }
    
    func clearSearch() {
        searching = false
        searchBar.text = ""
        self.tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchTrainingItems.count
        } else {
            return items.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Training Table Cell", for: indexPath)

        // Alternate the row color showing white or gray for odd and even rows
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.white
        }
        
        if searching {
            let trainingItem = searchTrainingItems[indexPath.row]
            cell.textLabel?.text = trainingItem.title
        } else {
            let trainingItem = items[indexPath.row]
            cell.textLabel?.text = trainingItem.title
        }

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedRow = indexPath.row
        performSegue(withIdentifier: "HowToSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let trainingView = segue.destination as! TrainingViewController
        
        if searching {
            trainingView.selectedTrainingURL = URL(string: searchTrainingItems[self.selectedRow].url)
        } else {
            trainingView.selectedTrainingURL = URL(string: items[self.selectedRow].url)
        }
        
    }

}
