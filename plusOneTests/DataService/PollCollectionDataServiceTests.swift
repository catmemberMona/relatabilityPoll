//
//  PollCollectionDataServiceTest.swift
//  plusOneTests
//
//  Created by mona zheng on 6/30/21.
//

import XCTest

@testable import plusOne
class PollCollectionDataServiceTests: XCTestCase {
    
    var sut: PollCollectionDataService!
    var collectionTableView: UITableView!
    var feedVC: FeedViewController!
    
    let pollOne = Poll(id: 0, statement: "Feeling down on rainy days")
    let pollTwo = Poll(id: 1, statement: "Laughing at the pain from a massage")
    let pollThree = Poll(id: 2, statement: "Spewed liquid out of my mouth")

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = PollCollectionDataService()
        sut.pollManager = PollManager()
        
        feedVC = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: K.guestFeedVCId) as! FeedViewController)
        _ = feedVC.view
        
        collectionTableView = feedVC.feedTableView
        collectionTableView.dataSource = sut
        collectionTableView.delegate = sut
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //MARK: Sections
    func testTableViewSections_Count_ReturnTwo(){
        let sections = collectionTableView.numberOfSections
        XCTAssertEqual(sections, 1)
    }

    func testTableViewSections_SectionOne_ReturnsPollsToSeeCount() {
        sut.pollManager?.addPoll(poll: pollOne)
        sut.pollManager?.addPoll(poll: pollTwo)
        
        XCTAssertEqual(collectionTableView.numberOfRows(inSection: 0), 2)
        
        sut.pollManager?.addPoll(poll: pollThree)
        collectionTableView.reloadData()
        
        XCTAssertEqual(collectionTableView.numberOfRows(inSection: 0), 3)
    }
    
    func testTableViewSections_TogglePollVisibility_ReturnsVisiblePollsCount(){
        sut.pollManager?.addPoll(poll: pollOne)
        sut.pollManager?.addPoll(poll: pollTwo)
        sut.pollManager?.addPoll(poll: pollThree)
        XCTAssertEqual(collectionTableView.numberOfRows(inSection: 0), 3)
        
        _ = sut.pollManager?.toggleVisibility(id: 0)
        collectionTableView.reloadData()
        
        XCTAssertEqual(collectionTableView.numberOfRows(inSection: 0), 2)
    }
    
    // MARK: Cells
    func testCell_RowAtIndex_ReturnsPollCell(){
        sut.pollManager?.addPoll(poll: pollOne)
        collectionTableView.reloadData()
        
        let cellQueried = collectionTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cellQueried is PollCell)
    }
    
    func testCell_ShouldDequeueCell(){
        let mock = TableViewMock()
        mock.dataSource = sut
        mock.register(PollCell.self, forCellReuseIdentifier: K.pollCellId)
        
        sut.pollManager?.addPoll(poll: pollOne)
        mock.reloadData()
        _ = mock.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(mock.cellDequeuedProperly)
    }
}

