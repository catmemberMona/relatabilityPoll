//
//  SingleFeedViewController.swift
//  plusOne
//
//  Created by mona zheng on 6/11/21.
//

import UIKit
import GoogleSignIn

class FeedViewController: UIViewController {

    @IBOutlet weak var feedTableView: UITableView!
    @IBOutlet var dataService: PollCollectionDataService!
    
    var pollManager = PollManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.feedTableView.dataSource = dataService
        self.feedTableView.delegate = dataService
        
        dataService.pollManager = pollManager
        
        // DUMMY POLLS
        let pollOne = Poll(id: 0, statement: "Feeling down on rainy days")
        let pollTwo = Poll(id: 1, statement: "Laughing at the pain from a massage")
        let pollThree = Poll(id: 2, statement: "Spewed liquid out of my mouth")
        dataService.pollManager?.addPoll(poll: pollOne)
        dataService.pollManager?.addPoll(poll: pollTwo)
        dataService.pollManager?.addPoll(poll: pollThree)
        feedTableView.reloadData()
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
    }
    

}
