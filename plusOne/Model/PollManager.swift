//
//  PollManager.swift
//  plusOne
//
//  Created by mona zheng on 6/17/21.
//

import Foundation

class PollManager {
    var polls: [Poll] = []
    var visiblePolls: [Poll] = []
    var hiddenPolls: [Poll] = []
    
    var totalPolls: Int { return polls.count}
    
    func addPoll(poll: Poll){
        polls.append(poll)
        visiblePolls.append(poll)
    }
    
    func pollAtIndex(id: Int)-> Poll {
        return polls[id]
    }
    
    func toggleVisibility(id: Int) -> Poll {
        let index = visiblePolls.firstIndex(where: { $0.id == id })
        var poll = visiblePolls.remove(at: index!)
    
        poll.hidden = !poll.hidden
        hiddenPolls.append(poll)
        
        return poll
    }
}
