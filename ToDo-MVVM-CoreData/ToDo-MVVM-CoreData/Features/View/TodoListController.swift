//
//  TodoListController.swift
//  ToDo-MVVM-CoreData
//
//  Created by Arslan Kaan AYDIN on 26.04.2022.
//

import UIKit

class TodoListController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var mockToDo = [ToDo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
        mockData()
    }
    
    func mockData() {
        let toDo = ToDo(context: CoreDataManager.shared.persistentContainer.viewContext)
        toDo.name = "Some name"
        toDo.dueOn = Date()
        toDo.completed = false
        toDo.id = UUID()
        for _ in 0...9 {
            mockToDo.append(toDo)
        }

    }


}

extension TodoListController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockToDo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ToDoTableCell
        cell.todo = mockToDo[indexPath.row]
        return cell
    }
    
    
}
