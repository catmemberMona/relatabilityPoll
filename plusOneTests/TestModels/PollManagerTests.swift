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
    var mockPollManager: MockPollManager!
    
    var testPolls = [Poll(id: 0, statement: "Gave birth.", choices: []), Poll(id: 1, statement: "Almost drowned in the past.", choices: []), Poll(id: 3, statement: "No cat, but love cats.", choices: [])]

    var testPoll: Poll!
    var testPoll2: Poll!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = PollManager()
        mockPollManager = MockPollManager()
        testPoll = testPolls[0]
        testPoll2 = testPolls[1]
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: Inital Values
    func testInit_TotalPolls_ReturnsZero(){
        XCTAssertEqual(sut.totalPolls, 0)
    }
    
    func testInit_VisiblePolls_ReturnsZero(){
        XCTAssertEqual(sut.visiblePolls.count, 0)
    }
    
    func testInit_HiddenPolls_ReturnsZero(){
        XCTAssertEqual(sut.hiddenPolls.count, 0)
    }
    
    // MARK: Add and query all polls
    func testAdd_TotalPolls_ReturnsOne(){
        sut.addPoll(poll: testPolls[0])
        
        XCTAssertEqual(sut.totalPolls, 1)
    }
    
    func testQuery_ReturnsPollByIndex(){
        sut.addPoll(poll: testPoll)
        
        let pollQueried = sut.pollAtIndex(id: 0)
        XCTAssertEqual(testPoll.statement, pollQueried.statement)
    }
    
//    // MARK: Synced id and index
//    func testSynced_PollIdAndIndex_ReturnTrue(){
//        let pollId = testPoll.id
//
//        sut.addPoll(poll: testPoll)
//        let queryPollById = sut.pollAtIndex(id: pollId)
//        XCTAssertEqual(testPoll.statement, queryPollById.statement)
//    }
    
    // MARK: New poll is visible
    func testAdd_VisiblePolls_ReturnOne(){
        sut.addPoll(poll: testPoll)
        let poll = sut.visiblePolls[0]
        
        XCTAssertEqual(testPoll.statement, poll.statement)
    }
    
    // MARK: Toggle visibility of poll
    func testToggle_PollIsHidden_ReturnTrue(){
        sut.addPoll(poll: testPoll)
        let poll = sut.toggleVisibility(id: 0)
        
        XCTAssertEqual(poll!.hidden, true)
    }
    
    func testToggle_PollExists_ReturnNil(){
        sut.addPoll(poll: testPoll)
        sut.addPoll(poll: testPoll2)
        let poll = sut.toggleVisibility(id: 3)
        
        XCTAssertNil(poll)
    }
    
    // MARK: Equatable
    func testEquable_ReturnFalse(){
        XCTAssertNotEqual(testPoll, testPoll2)
    }
    
    // MARK: Remove hidden poll from feed
    func testVisibleFeed_HasPoll_ReturnFalse(){
        sut.addPoll(poll: testPoll)
        _ = sut.toggleVisibility(id: 0)
        let hasPoll = sut.visiblePolls.contains(testPoll)
        let hidden = sut.hiddenPolls.contains(testPoll)
        
        XCTAssertFalse(hasPoll)
        XCTAssertTrue(hidden)
    }
    
    func testHiddenPolls_HasPoll_ReturnsTrue(){
        sut.addPoll(poll: testPoll)
        _ = sut.toggleVisibility(id: 0)
        let hidden = sut.hiddenPolls.contains(testPoll)
        
        XCTAssertTrue(hidden)
    }
    
//    func testReactions_AddPollWithReactionParameter_ReturnsTen(){
//        sut.addPoll(poll: Poll(id: 0, statement: "Gave birth.", choices: []))
//        XCTAssertEqual(sut.polls[0].reactions, 10)
//    }
    
    func testData_AttemptRetrieval_ReturnsTrue(){
        mockPollManager.loadPolls(tableView: UITableView())
        XCTAssertTrue(mockPollManager.attemptToRetrieveData)
        
    }
    
    func testReactedPolls_AddPollWhenUserReacts_ReturnsOne(){
        sut.addPoll(poll: testPoll)
        sut.userReactedToPollStatement(id: testPoll.id)
        XCTAssertEqual(sut.reactedPolls.count, 1)
    }
    
    func testVisiblePolls_ShouldNotChangeWhenUserReacts(){
        sut.addPoll(poll: testPoll)
        let beforeReactionCount = sut.visiblePolls.count
        sut.userReactedToPollStatement(id: testPoll.id)
        let afterReactionCount = sut.visiblePolls.count
        
        XCTAssertEqual(beforeReactionCount, afterReactionCount)
    }
}
