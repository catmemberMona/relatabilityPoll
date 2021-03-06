//
//  MockExtensions.swift
//  plusOneTests
//
//  Created by mona zheng on 7/2/21.
//

import UIKit
@testable import plusOne

extension PollCollectionDataServiceTests {
    
    class TableViewMock: UITableView {
        var cellDequeuedProperly = false
        
        class func initMock(dataSource: PollCollectionDataService)-> TableViewMock {
            // make a table view frame because of error that may appear when testing section two
//            let mock = TableViewMock(frame: CGRect.init(x: 0, y: 0, width: 300, height: 500), style: .plain)
//
            let mock = TableViewMock()
            mock.dataSource = dataSource
            mock.register(PollCellMock.self, forCellReuseIdentifier: K.pollCellId)
            
            return mock
        }
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellDequeuedProperly = true
            
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
    class PollCellMock: PollCell {
        var pollData: Poll?
        
        override func configPollCell(poll: Poll){
            pollData = poll
        }
    }
}

extension PollCellTests {
    class MockCellDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
        
        
    }
}

extension UserPollCellTests {
    class MockCellDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }  
    }
}


extension PollManagerTests {
    class MockPollManager: PollManager {
        var attemptToRetrieveData = false
        override func loadPolls(tableView: UITableView) {
            attemptToRetrieveData = true
        }
    }
}
