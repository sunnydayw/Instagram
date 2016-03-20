//
//  User.swift
//  Instagram
//
//  Created by QingTian Chen on 3/16/16.
//  Copyright © 2016 QingTian Chen. All rights reserved.
//

import UIKit
import Parse

public class User: PFUser {
    class func postAccountImage(image: UIImage?, withCompletion completion: PFBooleanResultBlock?) {
        // Create Parse object PFObject
        let post = PFObject(className: "_User")
        // Add relevant fields to the object
        post["profilePicture"] = getPFFileFromImage(image) // PFFile column type
        post.saveInBackgroundWithBlock(completion)
    }
    
    /**
     Method to convert UIImage to PFFile
     
     - parameter image: Image that the user wants to upload to parse
     
     - returns: PFFile for the the data in the image
     */
    class func getPFFileFromImage(image: UIImage?) -> PFFile? {
        // check if image is not nil
        if let image = image {
            // get image data and check if that is not nil
            if let imageData = UIImagePNGRepresentation(image) {
                return PFFile(name: "image.png", data: imageData)
            }
        }
        return nil
    }
}