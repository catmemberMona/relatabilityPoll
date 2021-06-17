//
//  PollManager.swift
//  plusOne
//
//  Created by mona zheng on 6/17/21.
//

import Foundation

class PollManager {
    var polls: [Poll] = []
    var totalPolls = 0
    
    func addPoll(poll: Poll){
        totalPolls+=1
        polls.append(poll)
    }
    
    func pollAtIndex(index: Int)-> Poll { 
        return polls[index]
    }
    
    func toggleHidden(index: Int) -> Bool {
        var poll = polls[index]
        poll.hidden = !poll.hidden
        return poll.hidden
    }
}
