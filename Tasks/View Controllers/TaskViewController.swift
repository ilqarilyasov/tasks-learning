//
//  TaskViewController.swift
//  Tasks
//
//  Created by Ilgar Ilyasov on 11/25/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var notesTextView: UILabel!
    
    var task: Task?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        
    }
    
    private func updateViews() {
        
    }
}
