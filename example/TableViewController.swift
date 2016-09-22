//
//  TableViewController.swift
//  example
//
//  Created by Giang Le Ngoc on 9/21/16.
//  Copyright © 2016 Giang Le Ngoc. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let dataSource:[String] = ["1212","1212122"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let CellIdentifier = "CellIdentifier"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier)
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: CellIdentifier)
        }
        
        cell?.textLabel?.text = dataSource[indexPath.row]
        
        return cell!
    }

}
