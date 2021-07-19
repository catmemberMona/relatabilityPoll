//
//  UserPollCell.swift
//  plusOne
//
//  Created by mona zheng on 7/17/21.
//

import UIKit

class UserPollCell: UITableViewCell {

    
    @IBOutlet weak var statementText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configPollCell(poll: Poll){
        print("Config is called to attach statement")
        self.statementText.text = poll.statement
 
    }

}
