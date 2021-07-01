//
//  PollCollectionDataService.swift
//  plusOne
//
//  Created by mona zheng on 6/29/21.
//

import UIKit

class PollCollectionDataService: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var pollManager: PollManager?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let pollManager = pollManager else {
            return 0
        }
        
        return pollManager.visiblePolls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

    
}
