//
//  Poll.swift
//  plusOne
//
//  Created by mona zheng on 6/17/21.
//

import Foundation

struct Poll: Equatable {
    let id: Int
    var statement: String
    var hidden: Bool
    var reactions: Int
    
    init(id:Int, statement:String) {
        // id will also be the same as index
        self.id = id
        self.statement = statement
        self.hidden = false
        self.reactions = 0
    }
}
 
// Equatable
func==(lhs: Poll, rhs: Poll) -> Bool {
    if lhs.id != rhs.id {
        return false
    }
    return true
}
