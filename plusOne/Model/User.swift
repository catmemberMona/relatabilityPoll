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
    
    init(email: String, tokenId: String) {
        User.email = email
        User.tokenId = tokenId
    }
}
