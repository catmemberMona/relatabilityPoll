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
