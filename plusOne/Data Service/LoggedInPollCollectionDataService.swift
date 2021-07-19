//
//  LoggedInPollCollectionDataService.swift
//  plusOne
//
//  Created by mona zheng on 7/17/21.
//

import UIKit

class LoggedInPollCollectionDataService: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var pollManager: PollManager?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let pollManager = pollManager else {
            return 0
        }
  
        return pollManager.visiblePolls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let pollManager = pollManager else {fatalError()}
        
        // dequeues a cell with this identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: K.userPollCellId, for: indexPath) as! UserPollCell
        // gets the poll's data using it's index for all polls collection
        // * need to eventually change to getting visibile polls for guest and hidden polls for admin
        let pollData = pollManager.pollAtIndex(id: indexPath.row)
        print("Retieved the poll at this index:", pollData.id)
        cell.configPollCell(poll: pollData)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

    
}
