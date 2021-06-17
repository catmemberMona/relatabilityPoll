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
    
    init(id:Int? = nil, statement:String) {
        // id will also be the same as index
        self.id = PollManager.totalPolls
        self.statement = statement
    }
    
    
    
}
