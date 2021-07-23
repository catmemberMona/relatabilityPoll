//
//  UserSingleFeedViewControllerTest.swift
//  plusOneTests
//
//  Created by mona zheng on 7/17/21.
//

import XCTest
@testable import plusOne

class UserSingleFeedViewControllerTest: XCTestCase {
    
    var sut: UserSingleFeedViewController!

    override func setUpWithError() throws {
        sut = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: K.userFeedVCId) as! UserSingleFeedViewController)
        _ = sut.view
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: Nil Checks
    func testFeedVC_TableViewShouldNotBeNil(){
        XCTAssertNotNil(sut.userFeedTableView)
    }

    // Table View DataSource and Delegates ----------------------------
    // MARK: Data Source
    func testDataSource_ViewDidLoad_SetsTableViewDataSource() {
        XCTAssertNotNil(sut.userFeedTableView.dataSource)
        XCTAssertTrue(sut.userFeedTableView.dataSource is LoggedInPollCollectionDataService)
    }
    
    // MARK: Delegate
    func testDelegate_ViewDidLoad_SetsTableViewDelegate() {
        XCTAssertNotNil(sut.userFeedTableView.delegate)
        XCTAssertTrue(sut.userFeedTableView.delegate is LoggedInPollCollectionDataService)
    }
    
    // MARK: Data Service Assumptions
    func testDataService_ViewDidLoad_SingleDataServiceObject() {
        XCTAssertEqual(sut.userFeedTableView.dataSource as! LoggedInPollCollectionDataService, sut.userFeedTableView.delegate as! LoggedInPollCollectionDataService)
    }



}
