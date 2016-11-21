//
//  ToDo.swift
//  ToDoList
//
//  Created by Sam Lee on 11/18/16.
//  Copyright © 2016 Sam Lee. All rights reserved.
//

import Foundation

class ToDo {
    var title: String
    var description: String
    var longDescription: String?
    var rawDate: Date?
    var date: String
    var completionStatusButton: completionStatus = .notDone
    
    init(title: String, date: String, longDescription: String) {
        self.title = title
        self.date = date
        self.description = date
        self.longDescription = longDescription
    }
    
    enum completionStatus: String {
        case notDone = "❗️"
        case done = "✅"
    }
}
