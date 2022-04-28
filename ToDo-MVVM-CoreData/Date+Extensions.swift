//
//  Date+Extensions.swift
//  ToDo-MVVM-CoreData
//
//  Created by Arslan Kaan AYDIN on 28.04.2022.
//

import Foundation

extension Date {
    
    func toString(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
}
