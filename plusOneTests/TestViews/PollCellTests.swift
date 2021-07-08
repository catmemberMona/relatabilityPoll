//
//  PollCellTests.swift
//  plusOneTests
//
//  Created by mona zheng on 7/2/21.
//

import XCTest
@testable import plusOne

class PollCellTests: XCTestCase {
    
    var tableView: UITableView!
    var mockDataSource: MockCellDataSource!
    var cell: PollCell!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let feedVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: K.guestFeedVCId) as! FeedViewController
        _ = feedVC.view
        
        tableView = feedVC.feedTableView
        mockDataSource = MockCellDataSource()
        tableView.dataSource = mockDataSource
        
        cell = (tableView.dequeueReusableCell(withIdentifier: K.pollCellId, for: IndexPath(row: 0, section: 0)) as! PollCell)
        cell.configPollCell(poll: Poll(id: 0, statement: "Eating is enjoyable"))
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCell_Config_ShouldSetStatementLabelToPollData(){
        XCTAssertEqual(cell.statementText?.text, "Eating is enjoyable")
    }
    
    func testCell_Config_ShouldSetReactionLableToPollData(){
        XCTAssertEqual(cell.reactionsText?.text, "0 Users Reacted")
    }
}
