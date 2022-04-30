//
//  TodoListController.swift
//  ToDo-MVVM-CoreData
//
//  Created by Arslan Kaan AYDIN on 26.04.2022.
//

import UIKit

class TodoListController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
//    var mockToDo = [ToDo]()
    let vm = TodoListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
//        mockData()
    }
    
//    func mockData() {
//        let toDo = ToDo(context: CoreDataManager.shared.persistentContainer.viewContext)
//        toDo.name = "Some name"
//        toDo.dueOn = Date()
//        toDo.completed = false
//        toDo.id = UUID()
//        for _ in 0...9 {
//            mockToDo.append(toDo)
//        }
//
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        vm.refreshData()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }

}

extension TodoListController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ToDoTableCell
        
        cell.todo = vm.todoAtIndex(indexPath.row)
//        cell.todo = mockToDo[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = vm.todoAtIndex(indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
        if todo.completedTask == false {
            let alertController = UIAlertController(title: "Completed?", message: "Mark this task as completed?", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "YES", style: .default, handler: { (_) in
                self.vm.completeTaskAtIndex(indexPath.row) { (_) in
                    tableView.reloadData()
                }
            }))
            alertController.addAction(UIAlertAction(title: "NO", style: .destructive, handler: nil))
            present(alertController, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            vm.deleteTask(indexPath.row) { (_) in
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
    }
    
    
}
