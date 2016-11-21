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

    @IBOutlet weak var toDoTextField: UITextField!
    @IBOutlet weak var toDoDescription: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var datePickerValue: String?
    var delegate: AddItemViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoDescription.layer.cornerRadius = 5
    }

    @IBAction func saveButtonPressed(_ sender: AnyObject) {
        datePickerValue = getDate(datePicker: datePicker)
        let dateString = "Deadline: \(datePickerValue!)"
        let newToDo = ToDo(title: toDoTextField.text!, date: dateString, longDescription: toDoDescription.text!)
        newToDo.rawDate = datePicker.date
        delegate?.createNewToDo(newItem: newToDo)
        
        performSegue(withIdentifier: "unwindToListTableViewController", sender: self)
    }
    
    func getDate(datePicker: UIDatePicker) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        
        return dateFormatter.string(from: datePicker.date)
    }
}
