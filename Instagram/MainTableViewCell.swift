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
    
    var post: PFObject! {
        didSet {
            self.photoView.file = post["media"] as? PFFile
            self.photoView.loadInBackground()
            
            self.postText.text = post["caption"] as? String
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
