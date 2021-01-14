//
//  Task.swift
//  Task
//
//  Created by River McCaine on 1/13/21.
//

import Foundation

class Task: Codable {
    
    var name: String
    var notes: String?
    var dueDate: Date?
    var isComplete: Bool
    
    init(name: String, notes: String?, dueDate: Date?, isComplete: Bool = false) {
        self.name = name
        self.notes = notes
        self.dueDate = dueDate
        self.isComplete = isComplete
    }
}//End of class

extension Task: Equatable {
    static func == (lhs: Task, rhs: Task) -> Bool {
        lhs.name == rhs.name && lhs.notes == rhs.notes && lhs.dueDate == rhs.dueDate && lhs.isComplete == rhs.isComplete
    }
    
    
}
