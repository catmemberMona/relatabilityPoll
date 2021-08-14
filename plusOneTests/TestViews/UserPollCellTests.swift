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
    var sut: UserPollCell!
    
    let poll = Poll(id: 0, statement: "Eating is enjoyable", choices: [])
    
    override func setUpWithError() throws {
        // sets the view controller
        let userFeedVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: K.userFeedVCId) as! UserSingleFeedViewController
        _ = userFeedVC.view
        
        // sets up table view and datasource
        tableView = userFeedVC.userFeedTableView
        dataService = MockCellDataSource()
        tableView.dataSource = dataService
        
        // reset User reacted array because it's a static property
        User.reacted = []
        
        // set a cell
        sut = (tableView.dequeueReusableCell(withIdentifier: K.userPollCellId, for: IndexPath(row: 0, section: 0)) as! UserPollCell)
        sut.configPollCell(poll: poll)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: init cell
    func testCell_Config_ShouldSetStatementLabelToPollData(){
        XCTAssertEqual(sut.statementText?.text, "Eating is enjoyable")
    }
    
    func testCell_Config_ShouldSetReactionLableToPollData(){
        XCTAssertEqual(sut.numOfUserReactedText?.text, "0 Users Reacted")
    }
    
    func testCell_ChoicePropertyShouldReturnNil(){
        XCTAssertNil(sut.choice)
    }
    
    // MARK: User reacts
    // MARK: Increment Total
    func testCell_ShouldIncrementWhenUserReactsIsCalled_ReturnOne(){
        sut.incrementNumOfUsersReacted()
        XCTAssertEqual(sut.numOfUserReactedText?.text, "1 Users Reacted")
    }
    
    // MARK: Choice Buttons
    func testCellButtons_ShouldDisableChoiceButton(){
        sut.newUserChoice = UserChoice.notRelatable
        sut.choice = Choice(pollId: sut.poll.id, userChoice: sut.newUserChoice.rawValue)
        
        let notRelatebutton = UIButton()
        sut.disableEnableChoice(button: notRelatebutton)
        
        XCTAssertFalse(notRelatebutton.isEnabled)
    }
    
    func testCell_ShouldAddNewChoice(){
        sut.newUserChoice = UserChoice.notRelatable
        sut.choice = Choice(pollId: sut.poll.id, userChoice: sut.newUserChoice.rawValue)
        XCTAssertEqual(sut.choice?.pollId, 0)
        XCTAssertEqual(sut.choice?.userChoice, 0)
        
        sut.newUserChoice = .relatable
        sut.choice = Choice(pollId: sut.poll.id, userChoice: sut.newUserChoice.rawValue)
        XCTAssertEqual(sut.choice?.userChoice, 1)
    }
    
    
    // test for when user presses the buttons on the poll cell and should only increment once
    func testCell_IncrementTotalNumberOfUsersReactedOnlyOnceForPoll(){
        sut.notRelate(UIButton())
        XCTAssertEqual(sut.numOfUserReactedText?.text, "1 Users Reacted")
        
        sut.relate(UIButton())
        XCTAssertEqual(sut.numOfUserReactedText?.text, "1 Users Reacted")
    }
    



}
