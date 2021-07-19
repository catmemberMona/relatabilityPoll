//
//  SingleFeedViewController.swift
//  plusOne
//
//  Created by mona zheng on 6/11/21.
//

import UIKit
import GoogleSignIn
import FirebaseFirestore

class FeedViewController: UIViewController {

    @IBOutlet weak var feedTableView: UITableView!
    @IBOutlet var dataService: PollCollectionDataService!
    
    var pollManager = PollManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.feedTableView.dataSource = dataService
        self.feedTableView.delegate = dataService
        
        dataService.pollManager = pollManager
        
        pollManager.loadPolls(tableView: feedTableView)

        
        GIDSignIn.sharedInstance()?.presentingViewController = self
    }
    
   
    

}
