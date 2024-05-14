//
//  Todo.swift
//  ToDo
//
//  Created by agmma on 2024/01/03.
//

import Foundation
import SwiftData

@Model
class Todo: Identifiable {
    @Attribute(.unique) var id: UUID = UUID()
    var title: String
    var isCompleted: Bool
    var detail: String
    var orderIndex: Int
    var nowDate: Date
    
    
    init(title: String, orderIndex: Int) {
        self.title = title
        self.isCompleted = false
        self.detail = ""
        self.orderIndex = orderIndex
        self.nowDate = Date.now
    }
}
