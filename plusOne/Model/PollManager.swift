//
//  PollManager.swift
//  plusOne
//
//  Created by mona zheng on 6/17/21.
//

import Foundation

class PollManager {
    private var polls: [Poll] = []
    var totalPolls = 0
    
    func addPoll(poll: Poll){
        totalPolls+=1
        polls.append(poll)
    }
    
    func pollAtIndex(index: Int)-> Poll { 
        return polls[index]
    }
}
