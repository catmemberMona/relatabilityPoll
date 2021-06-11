//
//  FirstChoiceViewController.swift
//  plusOne
//
//  Created by mona zheng on 6/10/21.
//

import UIKit

class FirstChoiceViewController: UIViewController {

    @IBOutlet weak var logoLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        plusOneAnimation()
       
        
    }
    
    func plusOneAnimation(){
        logoLabel.text = ""
        let logoText = "+1"
        var charIndex = 1.0
        for char in logoText {
            Timer.scheduledTimer(withTimeInterval: 0.5 * charIndex, repeats: false) {
                (timer) in
                self.logoLabel.text?.append(char)
            }
            charIndex+=1
        }
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
