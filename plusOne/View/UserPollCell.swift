//
//  UserPollCell.swift
//  plusOne
//
//  Created by mona zheng on 7/17/21.
//

import UIKit

class UserPollCell: UITableViewCell {

    var poll: Poll!
    var newUserChoice: UserChoice!
    var choice: Choice? {
        get {
            // assigns the Choice when found in User's choice history
            return User.reacted.first(where: {$0.pollId == poll.id})
        }
        
        set(newChoice) {
            // removes the old one
            let hasChoice = User.reacted.firstIndex(where: {$0.pollId == poll.id})
            if let hasChoice = hasChoice {
                User.reacted.remove(at: hasChoice)
            }
            
            // creates and assigns the new Choice
            User.savePollIdAndUserChoiceInfo(choiceInfo: newChoice!)
        }
    }
    
    @IBOutlet weak var statementText: UILabel!
    @IBOutlet weak var notRelateBtn: UIButton!
    @IBOutlet weak var relateBtn: UIButton!
    @IBOutlet weak var notRelatePercentageText: UILabel!
    @IBOutlet weak var relatePercentageText: UILabel!
    @IBOutlet weak var numOfUserReactedText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        // get choice option from user choice for this poll
        // set the bool value if user previously reacted
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func notRelate(_ sender: UIButton) {
        self.newUserChoice = UserChoice.notRelatable
        disableEnableChoice(button: sender)
        incrementNumOfUsersReacted()
        print("BUTTON IN NOT RELAte", sender)
        // disable button
        // if other button was previously disabled, reable it
        
        // add to reactedPolls/History
    }
    
    @IBAction func relate(_ sender: UIButton) {
        self.newUserChoice = UserChoice.relatable
        disableEnableChoice(button: sender)
        incrementNumOfUsersReacted()
        // disable button
        // if other button was previously disabled, reable it
        
        // add to reactedPolls/History
    }
    
    func disableEnableChoice(button: UIButton){
        // disable the button
        button.isEnabled = false

        // enable the other choice button when the user changes their choice
        if self.choice != nil {
            switch newUserChoice {
            case .notRelatable:
                relateBtn.isEnabled = true
            default:
                notRelateBtn.isEnabled = true
            }
        }
        
        // add new/changed choice
        self.choice = Choice(pollId: poll.id, userChoice: newUserChoice.rawValue)
    }
    
    func incrementNumOfUsersReacted(){
        poll.reactions += 1
        self.numOfUserReactedText.text = "\(poll.reactions) Users Reacted"
    }
    
    func configPollCell(poll: Poll){
        print("Config is called to attach statement")
        self.poll = poll
        self.statementText.text = poll.statement
        self.numOfUserReactedText.text = "\(poll.reactions) Users Reacted"
    
        
 
    }

}
