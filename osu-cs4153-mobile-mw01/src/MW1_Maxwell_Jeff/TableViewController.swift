//
//  TableViewController.swift
//  MW1_Maxwell_Jeff
//
//  Created by Jeff Maxwell on 10/9/18.
//  Copyright © 2018 Oklahoma State University - Mobile Development. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var tableDataSource: [String] = []
    var lapDataStore = LapDataStore()
    var helper = Helper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let averageValue = lapDataStore.getAverage()

        let average = UIBarButtonItem(title: helper.calcuateTimeString(timeVal: averageValue), style: .plain, target: self, action: nil)
        let flex = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        self.toolbarItems = [flex, average, flex]
        
        tableDataSource = lapDataStore.allLaps()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDataSource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Table Cell", for: indexPath)
            
            cell.textLabel?.text = tableDataSource[indexPath[1]]
            
            return cell
    }
}
