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
        if GIDSignIn.sharedInstance().currentUser != nil {
            GIDSignIn.sharedInstance().signOut()

        } else {
            print("You were never signed in....")
        }
        
        self.performSegue(withIdentifier: "Logged_In_To_Out", sender: self)
        
    }
    
}

