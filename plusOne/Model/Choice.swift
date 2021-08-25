//
//  UserChoice.swift
//  plusOne
//
//  Created by mona zheng on 7/14/21.
//

import Foundation

struct Choice {
    let pollId: Int
    let user: User
    var userChoice: Int
    let chosenOn: Date!
    
    init(pollId:Int, userChoice: Int) {
        self.pollId = pollId
        self.userChoice = userChoice
        self.chosenOn = Date()
        
        self.user = User() // make a user Account manager and assign it using it's property
    }
}
