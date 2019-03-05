//
//  TweetCellTableView.swift
//  Twitter
//
//  Created by Daniel Xiong on 3/5/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetCellTableView: UITableViewCell {

    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
