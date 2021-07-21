//
//  UserPollCell.swift
//  plusOne
//
//  Created by mona zheng on 7/17/21.
//

import UIKit

class UserPollCell: UITableViewCell {

    var poll: Poll!
    
    @IBOutlet weak var statementText: UILabel!
    @IBOutlet weak var notRelateBtn: UIButton!
    @IBOutlet weak var relateBtn: UIButton!
    @IBOutlet weak var notRelatePercentageText: UILabel!
    @IBOutlet weak var relatePercentageText: UILabel!
    @IBOutlet weak var numOfUserReactedText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func notRelate(_ sender: Any) {
        incrementNumOfUsersReacted()
        // disable button
        // if other button was previously disabled, reable it
        
        // add to reactedPolls/History
    }
    
    @IBAction func relate(_ sender: Any) {
        incrementNumOfUsersReacted()
        // diable button
        // if other button was previously disabled, reable it
        
        // add to reactedPolls/History
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
