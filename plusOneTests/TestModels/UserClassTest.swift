//
//  UserClassTest.swift
//  plusOneTests
//
//  Created by mona zheng on 7/9/21.
//

import XCTest
@testable import plusOne

class UserClassTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: Inital values
    func testInit_UserWithEmail(){
        User.email = ""
        XCTAssertNotNil(User.email)
    }
    
    func testInit_UserWithTokenId(){
        User.tokenId = ""
        XCTAssertNotNil(User.tokenId)
    }
    
    func testInit_UserWithReactedToPollsArray(){
        XCTAssertNotNil(User.reacted)
    }

}
