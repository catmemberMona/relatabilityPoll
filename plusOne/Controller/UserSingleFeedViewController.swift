//
//  ViewController.swift
//  plusOne
//
//  Created by mona zheng on 6/8/21.
//

import UIKit
import GoogleSignIn

class UserSingleFeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func didTapSignOut(_ sender: Any) {
        GIDSignIn.sharedInstance().signOut()
        self.performSegue(withIdentifier: K.toGuestViewSegue, sender: self)
    }
    
}

