//
//  ViewController.swift
//  plusOne
//
//  Created by mona zheng on 6/8/21.
//

import UIKit
import GoogleSignIn

class UserSingleFeedViewController: UIViewController {

    @IBOutlet weak var filter: UISegmentedControl!
    @IBOutlet weak var userFeedTableView: UITableView!
    @IBOutlet var dataService: LoggedInPollCollectionDataService!
    
    
    var pollManager = PollManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.userFeedTableView.dataSource = dataService
        self.userFeedTableView.delegate = dataService
        
        dataService.pollManager = pollManager
        
        print("USER SIGNED IN AND THIS IS USER FEED")
        
        self.pollManager.loadPolls(tableView: userFeedTableView)
        
    }

    @IBAction func didTapSignOut(_ sender: Any) {
        GIDSignIn.sharedInstance().signOut()
        self.performSegue(withIdentifier: K.toGuestViewSegue, sender: self)
    }
    
}

