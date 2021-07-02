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
    
    let pollOne = Poll(id: 0, statement: "Feeling down on rainy days")
    let pollTwo = Poll(id: 1, statement: "Laughing at the pain from a massage")
    let pollThree = Poll(id: 2, statement: "Spewed liquid out of my mouth")

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = PollCollectionDataService()
        sut.pollManager = PollManager()
        
        collectionTableView = UITableView()
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
    
    func testTableViewSections_SectionOne_ReturnsVisiblePollsCount(){
        sut.pollManager?.addPoll(poll: pollOne)
        sut.pollManager?.addPoll(poll: pollTwo)
        sut.pollManager?.addPoll(poll: pollThree)
        XCTAssertEqual(collectionTableView.numberOfRows(inSection: 0), 3)
        
        _ = sut.pollManager?.toggleVisibility(id: 0)
        collectionTableView.reloadData()
        
        XCTAssertEqual(collectionTableView.numberOfRows(inSection: 0), 2)
    }

}
