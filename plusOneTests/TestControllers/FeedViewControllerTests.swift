//
//  FeedViewControllerTests.swift
//  plusOneTests
//
//  Created by mona zheng on 6/29/21.
//

import XCTest

@testable import plusOne
class FeedViewControllerTests: XCTestCase {
    
    var sut: FeedViewController!

    override func setUpWithError() throws {
        sut = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "Guest_Feed_View_Controller_Id") as! FeedViewController)
        _ = sut.view
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: Nil Checks
    func testFeedVC_TableViewShouldNotBeNil(){
        XCTAssertNotNil(sut.feedTableView)
    }

    // MARK: Data Source
    func testDataSource_ViewDidLoad_SetsTableViewDataSource() {
        XCTAssertNotNil(sut.feedTableView.dataSource)
        XCTAssertTrue(sut.feedTableView.dataSource is PollCollectionDataService)
    }
    
    
}
