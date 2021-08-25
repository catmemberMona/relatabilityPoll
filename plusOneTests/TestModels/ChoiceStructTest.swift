//
//  ChoiceStructTest.swift
//  plusOneTests
//
//  Created by mona zheng on 7/16/21.
//

import XCTest
@testable import plusOne

class ChoiceStructTest: XCTestCase {
    
    var choiceOne: Choice!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        choiceOne = Choice(pollId: 0, userChoice: 1)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: Properties Present
    func testInit_ChoiceWithPollId(){
        XCTAssertNotNil(choiceOne.pollId)
        XCTAssertEqual(choiceOne.pollId, 0)
    }
    
    func testInit_ChoiceWithUser(){
        XCTAssertNotNil(choiceOne.user)
//        XCTAssertNotNil(choiceOne.user.email)
    }
    
    func testInit_ChoiceWithUserChoice(){
        XCTAssertNotNil(choiceOne.userChoice)
        XCTAssertEqual(choiceOne.userChoice, 1)
    }
    
    func testInit_ChoiceWithDateChosen(){
        XCTAssertNotNil(choiceOne.chosenOn)
    }
   

}
