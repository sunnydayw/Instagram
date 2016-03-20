//
//  MainTableViewCell.swift
//  Instagram
//
//  Created by QingTian Chen on 3/19/16.
//  Copyright © 2016 QingTian Chen. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var photoView: PFImageView!
    @IBOutlet weak var postText: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var accountImg: PFImageView!
    @IBOutlet weak var accountNameLabel: UILabel!
    
    var post: PFObject! {
        didSet {
            self.photoView.file = post["media"] as? PFFile
            self.photoView.loadInBackground()
            
            self.accountImg.file = post["media"] as? PFFile
            self.accountImg.loadInBackground()
            
            let user = post["author"] as? PFUser
            self.accountNameLabel.text = user?.username
            accountNameLabel.sizeToFit()
            self.postText.text = post["caption"] as? String
            postText.sizeToFit()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.accountImg.layer.cornerRadius = 15
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
