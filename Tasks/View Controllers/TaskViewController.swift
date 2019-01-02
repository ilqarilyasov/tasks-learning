//
//  TaskViewController.swift
//  Tasks
//
//  Created by Ilgar Ilyasov on 11/25/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
import CoreData

class TaskViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var priorityControl: UISegmentedControl!
    
    var task: Task? {
        didSet { updateViews() }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty else { return }
        let notes = notesTextView.text
        
        if let task = task {
            // Edit an existing task
            task.notes = notes
        } else {
            // Create a new task
            @discardableResult let _ = Task(name: name, notes: notes)
        }
        
        do {
            let moc = CoreDataStack.shared.mainContext
            try moc.save()
        } catch {
            NSLog("Error saving managed object context: \(error)")
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    private func updateViews() {
        
        guard isViewLoaded else { return }
        
        title = task?.name ?? "Create Task"
        nameTextField.text = task?.name
        notesTextView.text = task?.notes
        
//        if let task = task {
//            nameTextField.text = task.name
//            notesTextView.text = task.notes
//            title = task.name
//        } else {
//            title = "Create Task"
//        }
    }
}
