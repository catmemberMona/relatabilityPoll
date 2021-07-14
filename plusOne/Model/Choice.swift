//
//  UserChoice.swift
//  plusOne
//
//  Created by mona zheng on 7/14/21.
//

import Foundation

struct Choice {
    let pollId: Int
    var userChoice: Int
    
    init(pollId:Int, userChoice: Int) {
        self.pollId = pollId
        self.userChoice = userChoice
    }
}
