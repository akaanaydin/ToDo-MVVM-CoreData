//
//  AddNewTaskController.swift
//  ToDo-MVVM-CoreData
//
//  Created by Arslan Kaan AYDIN on 29.04.2022.
//

import UIKit

class AddNewTaskController: UITableViewController {
    
    @IBOutlet weak var taskName: UITextField!
    @IBOutlet weak var taskDueOn: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskDueOn.minimumDate = Date()
        tableView.tableFooterView = UIView()
    }
    
    @IBAction func saveNewTask(_ sender: UIBarButtonItem) {
        let vm = AddNewTaskViewModel(name: taskName.text ?? "No Task", dueDate: taskDueOn.date)
        vm.saveTask { _ in
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }

}
