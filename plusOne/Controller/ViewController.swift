//
//  ViewController.swift
//  plusOne
//
//  Created by mona zheng on 6/8/21.
//

import UIKit
import GoogleSignIn

class UserSingleFeedView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func didTapSignOut(_ sender: Any) {
        GIDSignIn.sharedInstance().signOut()
        dismiss(animated: true, completion: nil)
        
    }
    
}

