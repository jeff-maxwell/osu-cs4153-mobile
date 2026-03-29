//
//  TableViewController.swift
//  Course Explorer
//
//  Created by Jeff Maxwell on 10/13/18.
//  Copyright © 2018 Oklahoma State University - Mobile Development. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    // Local variables
    var dataSource: [NSManagedObject] = []
    var appDelegate: AppDelegate?
    var context: NSManagedObjectContext?
    var entity: NSEntityDescription?
    var duplicate = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Initialize Application Delegate
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        // Setup view Data context
        context = appDelegate?.persistentContainer.viewContext
        
        // Create Course Entity
        entity = NSEntityDescription.entity(forEntityName: "Course", in: context!)
    }

    /*
     * unwindFromSave is an unwind Segue from the ViewController
     * It check for a duplicate record and shows an alert or saves the data
     */
    @IBAction func unwindFromSave(segue: UIStoryboardSegue) {
        // Set an instance to the ViewController
        guard let source = segue.source as? ViewController else {
            print("Cannot get unwind segue source")
            return
        }
        
        // Call is Duplicate to see if a record already exists
        let currentCourse = isDuplicate(source: source)
        
        if duplicate == true {
            // Show alert if duplicate record
            showAlert(course: currentCourse)
        } else {
            // Save the data
            saveData(source: source)
        }
    
        // Reset duplicate flag to FALSE
        duplicate = false
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "My Cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = dataSource[indexPath[1]].value(forKey: "deptAbbr") as! String +
            String(dataSource[indexPath[1]].value(forKey: "courseNum") as! Int16)
        
        cell.detailTextLabel?.text = dataSource[indexPath[1]].value(forKey: "title") as? String

        return cell
    }
    
    /*
     * unwindFromSave is an unwind Segue from the ViewController
     * It check for a duplicate record and shows an alert or saves the data
     */
    override func viewWillAppear(_ animated: Bool) {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Course")
        
        do {
            // Fetch all the records from the table
            dataSource = try context?.fetch(fetchRequest) ?? []
        } catch let error as NSError {
            print("Cannot load data: \(error)")
        }
    }
    
    /*
     * unwindFromSave is an unwind Segue from the ViewController
     * It check for a duplicate record and shows an alert or saves the data
     */
    func isDuplicate(source: ViewController) -> String {
        var _course = ""
        
        // Loop the the dataSource records
        for data in dataSource {
            // Load Variables with data from dataSource
            let deptAbbr = data.value(forKey: "deptAbbr") as! String
            let courseNum = data.value(forKey: "courseNum") as! Int16
            
            // If the Department Abbreviation and Course Number already exist flag as a duplicate
            if deptAbbr == source.deptAbbr && courseNum == source.courseNum {
                // If the record exists set the duplicate flag
                duplicate = true
                
                // Set the course name as the Department Abbreviation and Course Number
                _course = deptAbbr + String(courseNum)
            }
        }
        return _course
    }
    
    /*
     * saveData based on the data entered in the ViewController
     */
    func saveData(source: ViewController) {
        if let entity = self.entity {
            let course = NSManagedObject(entity: entity, insertInto: context)
            
            // Set the fields for the table from ViewController
            course.setValue(source.courseTitle, forKey: "title")
            course.setValue(source.deptAbbr, forKey: "deptAbbr")
            course.setValue(source.courseNum, forKey: "courseNum")
            
            do {
                // Try to save data and append a new Course record
                try context?.save()
                dataSource.append(course)
                
                // Reload the Table View
                self.tableView.reloadData()
                
            } catch let error as NSError {
                print("Cannot save data \(error)")
            }
        }
    }
    
    /*
     * showAlert shows the current course that already exists
     */
    func showAlert(course: String) {
        // Create an Alert Controller
        let alertController = UIAlertController(title: "Alert", message: "Record matching " + course + " Already exists", preferredStyle: .alert)
        
        // Create an OK Alert Action Button
        let action = UIAlertAction(title: "Ok", style: .default) {
            (action:UIAlertAction) in
            print("OK Pressed")
        }
        
        // Add the button to the Alert Controller
        alertController.addAction(action)
        
        // Show the Alert
        self.present(alertController, animated: true, completion: nil)
    }
}
