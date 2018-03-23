//
//  TableViewController.swift
//  iCloudToDo
//
//  Created by 전세호 on 2018. 3. 20..
//  Copyright © 2018년 picklecode. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController{
    let data: NSMutableArray = []
    var isSub = false;
    var rowNum: Int!
    
    class todoRecord{
        var title: String!
        var isComplete: Bool!
        
        init(title: String, isComplete: Bool!){
            self.title = title;
            self.isComplete = isComplete;
        }
    }
    
    override func viewDidLoad(){
        data.add([todoRecord(title: "title1", isComplete: false), [] as NSMutableArray])
        data.add([todoRecord(title: "title2", isComplete: false), [] as NSMutableArray])
        data.add([todoRecord(title: "title3", isComplete: false), [] as NSMutableArray])
        
        ((data[0] as! NSArray)[1] as! NSMutableArray).add(todoRecord(title: "sub - title1", isComplete: false))
        ((data[1] as! NSArray)[1] as! NSMutableArray).add(todoRecord(title: "sub - title2", isComplete: false))
        ((data[2] as! NSArray)[1] as! NSMutableArray).add(todoRecord(title: "sub - title3", isComplete: false))
        
        if isSub{
            navigationItem.title = ((data[rowNum] as! NSArray)[0] as! todoRecord).title
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSub{
            return ((data[rowNum] as! NSArray)[1] as! NSMutableArray).count
        }
        else{
            return data.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! TodoCell
        let row: Int = indexPath.row
        
        //TODO
        var record = todoRecord(title: "", isComplete: false)
        
        if isSub{
            record = ((data[rowNum] as! NSArray)[1] as! NSMutableArray)[row] as! todoRecord
            cell.isSub = true
            cell.rowNum = rowNum
        }
        else{
            record = (data[row] as! NSArray)[0] as! todoRecord
            cell.todoCount.setTitle("\(((data[row] as! NSArray)[1] as! NSMutableArray).count)", for: UIControlState.normal)
        }
        
        cell.isComplete = record.isComplete
        cell.tableViewController = self
        cell.todoTitle.text = record.title
        
        if cell.isComplete == true{
            cell.todoTitle.textColor = UIColor.gray
        }
        else{
            cell.todoTitle.textColor = UIColor.black
        }

        cell.todoTitle.isEnabled = false
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let tableViewController = segue.destination as? TableViewController{
            if let indexPath = tableView.indexPathForSelectedRow{
                tableViewController.isSub = true
                tableViewController.rowNum = indexPath.row
            }
        }
    }
}
