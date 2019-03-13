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
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    
    var favorited:Bool = false
    var retweeted:Bool = false
    var tweetId:Int = -1
    
    func setFavorite(isFavorited:Bool) {
        favorited = isFavorited
        if favorited {
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }
        else {
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    @IBAction func favoriteTweet(_ sender: Any) {
        if favorited {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(isFavorited: false)
            }, failure: { (error) in
                print("set favorite error")
            })
        }
        else {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(isFavorited: true)
            }, failure: { (error) in
                print("set favorite error")
            })
        }
    }
    
    func setRetweet(isRetweeted:Bool) {
        retweeted = isRetweeted
        if retweeted {
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
        }
        else {
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
        }
    }
    
    
    @IBAction func retweet(_ sender: Any) {
        if retweeted {
            TwitterAPICaller.client?.unretweetTweet(tweetId: tweetId, success: {
                self.setRetweet(isRetweeted: false)
            }, failure: { (error) in
                print("error unretweeting \(error)")
            })
        }
        else {
            TwitterAPICaller.client?.retweetTweet(tweetId: tweetId, success: {
                self.setRetweet(isRetweeted: true)
            }, failure: { (error) in
                print("error retweeting \(error)")
            })
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
