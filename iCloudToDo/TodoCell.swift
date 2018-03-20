//
//  TodoCell.swift
//  iCloudToDo
//
//  Created by 전세호 on 2018. 3. 20..
//  Copyright © 2018년 picklecode. All rights reserved.
//

import UIKit

class TodoCell: UITableViewCell{
    @IBOutlet weak var todoTitle: UITextField!
    @IBOutlet weak var todoCount: UIButton!
    
    var tableViewController: TableViewController!
    var isSub = false
    var rowNum: Int!
    var isComplete = false
}
