//
//  TableViewController.swift
//  iCloudToDo
//
//  Created by 전세호 on 2018. 3. 20..
//  Copyright © 2018년 picklecode. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController{
    let data = ["todo1", "todo2", "todo3"]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! TodoCell
        let row: Int = indexPath.row
        
        cell.todoTitle.text = data[row]
        cell.todoTitle.isEnabled = false
        return cell
    }
}
