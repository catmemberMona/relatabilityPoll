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
        self.id = id
        self.statement = statement
    }
    
    
    
}
