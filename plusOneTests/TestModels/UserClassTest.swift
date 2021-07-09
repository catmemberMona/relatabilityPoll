//
//  UserClassTest.swift
//  plusOneTests
//
//  Created by mona zheng on 7/9/21.
//

import XCTest
@testable import plusOne

class UserClassTest: XCTestCase {
    
    var user = User(email: "test@1.com", tokenId: "I'm the id token")

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: Inital values
    func testInit_UserWithEmail(){
        XCTAssertNotNil(user)
        XCTAssertEqual(user.email, "test@1.com")
    }
    
    func testInit_UserWithTokenId(){
        XCTAssertNotNil(user.tokenId)
    }

}
