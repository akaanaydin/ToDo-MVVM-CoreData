//
//  CoreDataManager.swift
//  ToDo-MVVM-CoreData
//
//  Created by Arslan Kaan AYDIN on 28.04.2022.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    private init() {}
    
    func saveToDo(name: String, dueOn: Date, completion: @escaping (Bool) -> Void) {
        let todo = ToDo(context: persistentContainer.viewContext)
        todo.name = name
        todo.dueOn = dueOn
        todo.id = UUID()
        completion(true)
    }
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ToDo_MVVM_CoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
