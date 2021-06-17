//
//  PollStructTest.swift
//  plusOneTests
//
//  Created by mona zheng on 6/17/21.
//

import XCTest

@testable import plusOne
class PollStructTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit_PollWithStatement(){
        let testPoll = Poll(statement: "Farted at least once on the subway.")
        
        XCTAssertNotNil(testPoll)
        XCTAssertEqual(testPoll.statement, "Farted at least once on the subway.")
    }
    
    func testInit_SetPollWithStatementAndID(){
        let testPoll = Poll(id: 1, statement: "Ate a whole pizza pie in a day.")
        
        XCTAssertNotNil(testPoll)
        XCTAssertEqual(testPoll.id, 1)
    }

}
