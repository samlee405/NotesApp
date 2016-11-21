//
//  ListTableViewCell.swift
//  ToDoList
//
//  Created by Sam Lee on 11/18/16.
//  Copyright © 2016 Sam Lee. All rights reserved.
//

import UIKit

protocol ListTableViewCellDelegate {
    func updateCurrentToDo(index: Int)
}

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var toDoButton: UIButton!
    
    var indexOfCell: Int?
    var delegate: ListTableViewCellDelegate?

    @IBAction func toDoButtonPressed(_ sender: AnyObject) {
        if let index = indexOfCell {
            delegate?.updateCurrentToDo(index: index)
        }
        else {
            print("Returned nil index in cell")
        }
    }
}
