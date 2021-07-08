//
//  PollCell.swift
//  plusOne
//
//  Created by mona zheng on 7/7/21.
//

import UIKit

class PollCell: UITableViewCell {
    
    
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
        self.statementText.text = poll.statement
    }
    
}
