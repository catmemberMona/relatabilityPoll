//
//  ViewController.swift
//  plusOne
//
//  Created by mona zheng on 6/8/21.
//

import UIKit
import GoogleSignIn
import Firebase

class UserSingleFeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func didTapSignOut(_ sender: Any) {
        let firebaseAuth = Auth.auth()
     do {
       try firebaseAuth.signOut()
     } catch let signOutError as NSError {
       print("Error signing out: %@", signOutError)
     }
        GIDSignIn.sharedInstance().signOut()
        self.performSegue(withIdentifier: K.toGuestViewSegue, sender: self)
    }
    
}

