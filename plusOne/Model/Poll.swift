//
//  Poll.swift
//  plusOne
//
//  Created by mona zheng on 6/17/21.
//

import Foundation

struct Poll {
    let id: Int?
    var statement: String
    var hidden: Bool
    
    init(id:Int? = nil, statement:String) {
        // id will also be the same as index
        self.id = id
        self.statement = statement
        self.hidden = false 
    }
    
    
    
}
