//
//  Poll.swift
//  plusOne
//
//  Created by mona zheng on 6/17/21.
//

import Foundation

class Poll: Equatable {
    let id: Int
    var statement: String
    var hidden: Bool
    var choices: [Choice]
    var reactions: Int {
        get {
            return self.choices.count
        }
    }
    
    init(id:Int, statement:String, choices: [Choice]) {
        // id will also be the same as index
        self.id = id
        self.statement = statement
        self.hidden = false
        self.choices = choices
    }
}
 
// Equatable
func==(lhs: Poll, rhs: Poll) -> Bool {
    if lhs.id != rhs.id {
        return false
    }
    return true
}
