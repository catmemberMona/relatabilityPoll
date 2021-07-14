//
//  User.swift
//  plusOne
//
//  Created by mona zheng on 7/9/21.
//

import Foundation

class User {
    static var email: String!
    static var tokenId: String!
    static var reacted: [Choice] = []
    
    static func savePollIdAndUserChoiceInfo(choiceInfo: Choice){
        User.reacted.append(choiceInfo)
        
        // save/update info to database
    }
    
}
