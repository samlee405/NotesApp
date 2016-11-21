//
//  ListTableViewController.swift
//  ToDoList
//
//  Created by Sam Lee on 11/18/16.
//  Copyright © 2016 Sam Lee. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController, ListTableViewCellDelegate, AddItemViewControllerDelegate, EditItemViewControllerDelegate {
    
    var toDoArray : [ToDo] =  [
        ToDo(title: "Pick up cranberries from the store", date: "Thanksgiving Day", longDescription: "Run to safeway and get the special $3/lb cranberries"),
        ToDo(title: "Pay the bills", date: "First of December", longDescription: "Go to chase and drop off the check")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Delegate methods
    
    func createNewToDo(newItem: ToDo) {
        toDoArray.append(newItem)
        tableView.reloadData()
    }
    
    func updateCurrentToDo(index: Int) {
        switch toDoArray[index].completionStatusButton {
            case .done: toDoArray[index].completionStatusButton = .notDone
                        toDoArray[index].description = toDoArray[index].date
            case .notDone: toDoArray[index].completionStatusButton = .done
                           toDoArray[index].description = "You did it, pal!"
        }
        tableView.reloadData()
    }
    
    func updateToDoDetails(title: String, description: String, date: String, index: Int) {
        toDoArray[index].title = title
        toDoArray[index].longDescription = description
        toDoArray[index].description = date
        toDoArray[index].date = date
        tableView.reloadData()
    }

    // MARK: - tableView datasource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell

        cell.delegate = self
        cell.indexOfCell = indexPath.row
        cell.titleLabel.text = toDoArray[indexPath.row].title
        cell.descriptionLabel.text = toDoArray[indexPath.row].description
        cell.toDoButton.setTitle(toDoArray[indexPath.row].completionStatusButton.rawValue, for: .normal)

        return cell
    }
    
    // MARK: - Editing tableView cells
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            toDoArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    // MARK: - Navigation
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "editToDoItem", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItemViewControllerSegue" {
            let destination = segue.destination as! AddItemViewController
            destination.delegate = self
        }
        else if segue.identifier == "editToDoItem" {
            let destination = segue.destination as! EditItemViewController
            let index = tableView.indexPathForSelectedRow!.row
            destination.delegate = self
            destination.currentToDo = toDoArray[index]
            destination.index = index
        }
    }
    
    @IBAction func unwindToListTableViewController(segue: UIStoryboardSegue) {
    }
}
