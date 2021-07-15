//
//  Constants.swift
//  plusOne
//
//  Created by mona zheng on 6/14/21.
//

import Foundation

struct K {
    static let toGuestViewSegue = "Logged_In_To_Out"
    static let userFeedVCId = "User_Feed_View"
    static let guestFeedVCId = "Guest_Feed_View_Controller_Id"
    static let firstDecisionVC = "First_Decision"
    static let pollCellId = "Poll_Cell_Id"
    
    struct User {
        static let email = "email"
        static let reacted = "reacted"
    }
    
    struct FStore {
        static let pollCollection = "polls"
        static let usersCollection = "users"
        
        struct Poll {
            static let id = "id"
            static let statement = "statement"
            static let reactions = "reactions"
        }
        

    }
}
