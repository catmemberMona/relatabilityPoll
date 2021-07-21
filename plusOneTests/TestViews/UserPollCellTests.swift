//
//  UserPollCellTests.swift
//  plusOneTests
//
//  Created by mona zheng on 7/19/21.
//

import XCTest
@testable import plusOne

class UserPollCellTests: XCTestCase {
    var tableView: UITableView!
    var dataService: MockCellDataSource!
    var cell: UserPollCell!

    override func setUpWithError() throws {
        // sets the view controller
        let userFeedVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: K.userFeedVCId) as! UserSingleFeedViewController
        _ = userFeedVC.view
        
        // sets up table view and datasource
        tableView = userFeedVC.userFeedTableView
        dataService = MockCellDataSource()
        tableView.dataSource = dataService
        
        // set a cell
        cell = (tableView.dequeueReusableCell(withIdentifier: K.userPollCellId, for: IndexPath(row: 0, section: 0)) as! UserPollCell)
        cell.configPollCell(poll: Poll(id: 0, statement: "Eating is enjoyable"))
        
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCell_Config_ShouldSetStatementLabelToPollData(){
        XCTAssertEqual(cell.statementText?.text, "Eating is enjoyable")
    }
    
    func testCell_Config_ShouldSetReactionLableToPollData(){
        XCTAssertEqual(cell.numOfUserReactedText?.text, "0 Users Reacted")
    }
    
    func testCell_Config_ShouldIncrementWhenUserReactsIsCalled_ReturnOne(){
        cell.incrementNumOfUsersReacted()
        XCTAssertEqual(cell.numOfUserReactedText?.text, "1 Users Reacted")
    }
    




}
