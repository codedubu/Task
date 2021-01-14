//
//  TaskController.swift
//  Task
//
//  Created by River McCaine on 1/13/21.
//

import Foundation

class TaskController {
    // MARK: - Shared Instance
    static let shared = TaskController()
    
    // MARK: - Source of Truth
    var tasks: [Task] = []
    
    // MARK: - CRUD
    //Create
    func createTaskWithName(newName: String, newNotes: String?, newDueDate: Date?) {
        let newTask = Task(name: newName, notes: newNotes, dueDate: newDueDate)
        tasks.append(newTask)
        saveToPersistenceStore()
    }
    
    func update(task: Task, name: String, notes: String?, dueDate: Date?) {
        task.name = name
        task.notes = notes
        task.dueDate = dueDate
        saveToPersistenceStore()
    }
    
    func toggleIsComplete(task: Task) {
        if task.isComplete {
            task.isComplete = false
        } else {
            task.isComplete = true
        }
//        task.isComplete = !task.isComplete
        saveToPersistenceStore()
    }
    
    func delete(taskToDelete: Task) {
        guard let index = tasks.firstIndex(of: taskToDelete) else { return }
        tasks.remove(at: index)
        saveToPersistenceStore()
    }
    
    
    // MARK: - Persistence
    
    // fileURL
    func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = urls[0].appendingPathComponent("Task.json")
        return fileURL
    }
    
    // save
    func saveToPersistenceStore() {
        do {
            let data = try JSONEncoder().encode(tasks)
            try data.write(to: fileURL())
        } catch {
            print(error)
            print(error.localizedDescription)
        }
    }
    
    // load
    func loadFromPersistenceStore() {
        do {
            let data = try Data(contentsOf: fileURL())
            let foundTasks = try JSONDecoder().decode([Task].self, from: data)
            tasks = foundTasks
        } catch {
            print(error)
            print(error.localizedDescription)
        }
    }
    
    
    
    
}
