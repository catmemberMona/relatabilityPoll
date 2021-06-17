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

    func testInit_PollsToSee_ReturnsZero(){
        XCTAssertEqual(sut.totalPolls, 0)
    }

}
