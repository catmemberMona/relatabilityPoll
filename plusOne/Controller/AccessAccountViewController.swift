//
//  AccessAccountViewController.swift
//  plusOne
//
//  Created by mona zheng on 6/10/21.
//

import UIKit
import GoogleSignIn
import Firebase

class AccessAccountViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        GIDSignIn.sharedInstance()?.presentingViewController = self

    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
