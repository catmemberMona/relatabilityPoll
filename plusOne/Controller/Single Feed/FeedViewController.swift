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
    var db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.feedTableView.dataSource = dataService
        self.feedTableView.delegate = dataService
        
        dataService.pollManager = pollManager
        
        self.loadPolls()
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
    }
    
    func loadPolls(){
        db.collection(K.FStore.pollCollection).getDocuments {(querySnapshot, error) in
            if let e = error {
                print("Could not retrieve data from database with error: \(e)")
            } else {
                print("Has Snapshots")
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        print("THIS IS THE DATA:", data[K.FStore.Poll.statement] as! String)
                    }
                }
            }
        }
    }
    

}
