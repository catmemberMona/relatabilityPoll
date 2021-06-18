//
//  PollStructTest.swift
//  plusOneTests
//
//  Created by mona zheng on 6/17/21.
//

import XCTest

@testable import plusOne
class PollStructTest: XCTestCase {
    let examplePoll = Poll(id: 0, statement: "Farted at least once on the subway.")
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: test inital Values present
    func testInit_PollWithStatement(){
        let testPoll = examplePoll
        
        XCTAssertNotNil(testPoll)
        XCTAssertEqual(testPoll.statement, "Farted at least once on the subway.")
    }
    
    func testInit_PollWithId(){
        let testPoll = examplePoll
        XCTAssertEqual(testPoll.id, 0)
    }
    
    func testInit_PollWithHidden(){
        let testPoll = examplePoll
        XCTAssertNotNil(testPoll.hidden)
        XCTAssertEqual(testPoll.hidden, false)
    }
    
    
}
