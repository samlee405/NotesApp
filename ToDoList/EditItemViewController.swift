//
//  EditItemViewController.swift
//  ToDoList
//
//  Created by Sam Lee on 11/21/16.
//  Copyright © 2016 Sam Lee. All rights reserved.
//

import UIKit

protocol EditItemViewControllerDelegate {
    func updateToDoDetails(title: String, description: String, date: String, index: Int)
}

class EditItemViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var currentToDo: ToDo?
    var index: Int?
    var delegate: EditItemViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTextField.layer.cornerRadius = 5
        
        titleTextField.text = currentToDo!.title
        descriptionTextField.text = currentToDo!.longDescription
        datePicker.date = currentToDo!.rawDate ?? Date()
    }

    @IBAction func saveButtonPressed(_ sender: AnyObject) {
        let datePickerValue = getDate(datePicker: datePicker)
        let dateString = "Deadline: \(datePickerValue)"
        delegate?.updateToDoDetails(title: titleTextField.text!, description: descriptionTextField.text!, date: dateString, index: index!)
        
        performSegue(withIdentifier: "unwindToListTableViewController", sender: self)
    }

    func getDate(datePicker: UIDatePicker) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        
        return dateFormatter.string(from: datePicker.date)
    }
}
