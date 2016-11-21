//
//  AddItemViewController.swift
//  ToDoList
//
//  Created by Sam Lee on 11/18/16.
//  Copyright © 2016 Sam Lee. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate {
    func createNewToDo(newItem: ToDo)
}

class AddItemViewController: UIViewController {

    @IBOutlet weak var toDoTitle: UITextField!
    @IBOutlet weak var toDoDescription: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var delegate: AddItemViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoDescription.layer.cornerRadius = 5
    }

    @IBAction func saveButtonPressed(_ sender: AnyObject) {
        if toDoTitle.text! != "" {
            let datePickerValue = getDate(datePicker: datePicker)
            let dateString = "Deadline: \(datePickerValue)"
            let newToDo = ToDo(title: toDoTitle.text!, date: dateString, longDescription: toDoDescription.text!)
            newToDo.rawDate = datePicker.date
            delegate?.createNewToDo(newItem: newToDo)
            
            performSegue(withIdentifier: "unwindToListTableViewController", sender: self)
        }
        else {
            print("Please enter a title")
        }
    }
    
    func getDate(datePicker: UIDatePicker) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        
        return dateFormatter.string(from: datePicker.date)
    }
}
