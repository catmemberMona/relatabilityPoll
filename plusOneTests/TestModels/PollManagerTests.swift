//
//  PollManagerTests.swift
//  plusOneTests
//
//  Created by mona zheng on 6/17/21.
//

import XCTest
@testable import plusOne

class PollManagerTests: XCTestCase {
    // sut = system under test
    var sut: PollManager!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = PollManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: Inital Values
    func testInit_PollsToSee_ReturnsZero(){
        XCTAssertEqual(sut.totalPolls, 0)
    }
    
    // MARK: Add and query
    func testAdd_TotalPolls_ReturnsOne(){
        let testPoll = Poll(statement: "Gave birth.")
        sut.addPoll(poll: testPoll)
        
        XCTAssertEqual(sut.totalPolls, 1)
    }
    
    func testQuery_ReturnsPollByIndex(){
        let testPoll = Poll(statement: "Almost drowned in the past.")
        sut.addPoll(poll: testPoll)
        
        let pollQueried = sut.pollAtIndex(index: 0)
        XCTAssertEqual(testPoll.statement, pollQueried.statement)
    }
    
    // MARK: Synced id and index
    func testSynced_PollIdAndIndex_ReturnTrue(){
        let testPoll = Poll(id: 0, statement: "No cat, but love cats.")
        let pollId = testPoll.id

        sut.addPoll(poll: testPoll)
        let queryPollById = sut.pollAtIndex(index: pollId!)
        XCTAssertEqual(testPoll.statement, queryPollById.statement)
    }
    
    

}
