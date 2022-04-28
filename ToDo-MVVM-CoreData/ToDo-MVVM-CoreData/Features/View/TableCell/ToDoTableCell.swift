//
//  ToDoTableCell.swift
//  ToDo-MVVM-CoreData
//
//  Created by Arslan Kaan AYDIN on 28.04.2022.
//

import UIKit

class ToDoTableCell: UITableViewCell {
    
    @IBOutlet private weak var taskNameLabel: UILabel!
    @IBOutlet private weak var taskDueDate: UILabel!
    @IBOutlet private weak var taskCompletedDate: UILabel!
    
    var todo: ToDo? {
        didSet {
            if let todo = todo {
                if todo.completed == false {
                    taskNameLabel.text = todo.name
                    taskDueDate.text = String(format: "Due On: %@", todo.dueOn!.toString(format: "MMM dd, yy"))
                    taskCompletedDate.text = "Yet to be completed."
                }else {
                    taskNameLabel.text = todo.name
                    taskDueDate.text = String(format: "Due On: %@", todo.dueOn!.toString(format: "MMM dd, yy"))
                    taskCompletedDate.text = String(format: "Completed On: %@", todo.completedOn!.toString(format: "MMM dd, yy"))
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
