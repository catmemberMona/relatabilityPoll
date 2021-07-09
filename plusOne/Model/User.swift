//
//  User.swift
//  plusOne
//
//  Created by mona zheng on 7/9/21.
//

import Foundation

class User {
    var email: String!
    var tokenId: String!
    
    init(email: String, tokenId: String) {
        self.email = email
        self.tokenId = tokenId
    }
}
