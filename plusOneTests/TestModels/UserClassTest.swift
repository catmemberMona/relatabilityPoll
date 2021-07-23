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
    
    // MARK: Properties Present
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
    
    // MARK: Sets/add Values
    func testValue_SetEmail(){
        User.email = "test@1.com"
        XCTAssertEqual(User.email, "test@1.com")
    }
    
    func testValue_SetTokenId(){
        User.tokenId = "some token id"
        XCTAssertEqual(User.tokenId, "some token id")
    }
    
    func testArray_AppendReactedToPollsArrayWithDictionary_ReturnCountOne(){
        let pollChoiceInfo = Choice(pollId: 0, userChoice: UserChoice.relatable.rawValue)
        User.savePollIdAndUserChoiceInfo(choiceInfo: pollChoiceInfo)
        XCTAssertEqual(User.reacted.count, 1)
    }
    
}
