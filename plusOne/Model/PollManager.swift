//
//  PollManager.swift
//  plusOne
//
//  Created by mona zheng on 6/17/21.
//

import UIKit
import FirebaseFirestore

class PollManager {
    var polls: [Poll] = []
    var visiblePolls: [Poll] = []
    var hiddenPolls: [Poll] = []
    
    var totalPolls: Int { return polls.count}
    
    var db = Firestore.firestore()
    
    func addPoll(poll: Poll){
        polls.append(poll)
        visiblePolls.append(poll)
    }
    
    func pollAtIndex(id: Int)-> Poll {
        // need to eventually change to getting visibile polls, hidden polls etc
        return polls[id]
    }
    
    func toggleVisibility(id: Int) -> Poll? {
        if let index = visiblePolls.firstIndex(where: { $0.id == id }) {
        var poll = visiblePolls.remove(at: index)
            print("This is the poll that is returned:", poll)
            poll.hidden = !poll.hidden
            hiddenPolls.append(poll)
            return poll
        }
        return nil
    }
    
    func loadPolls(tableView: UITableView) {
        db.collection(K.FStore.pollCollection).getDocuments {(querySnapshot, error) in
            if let e = error {
                print("Could not retrieve data from database with error: \(e)")
            } else {
                print("Has Snapshots")
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let statement = data[K.FStore.Poll.statement] as? String, let id = data[K.FStore.Poll.id] as? Int, let reactions = data[K.FStore.Poll.reactions] as? Int {
                            self.addPoll(poll: Poll(id: id, statement: statement, reactions: reactions))
                            print("THE VISIBLE POLLS:", self.visiblePolls)
                            tableView.reloadData()
                        }
                        
                    }
                }
            }
        }
    }
}
