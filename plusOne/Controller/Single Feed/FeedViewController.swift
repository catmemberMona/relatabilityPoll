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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.feedTableView.dataSource = dataService
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
    }
    

}
