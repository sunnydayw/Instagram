//
//  NewPostViewController.swift
//  Instagram
//
//  Created by QingTian Chen on 3/17/16.
//  Copyright © 2016 QingTian Chen. All rights reserved.
//

import UIKit

class NewPostViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var newPostImg: UIImageView!
    @IBOutlet weak var newPostTextView: UITextView!
    var newImg: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newPostImg.image = newImg
        newPostImg.layer.cornerRadius = 6
        newPostTextView.delegate = self
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        if(newPostTextView.text == "Write a caption...") {
            newPostTextView.text = "";
            newPostTextView.textColor = UIColor.blackColor();
        }
        newPostTextView.becomeFirstResponder();
    }
    
    func textViewDidEndEditing(newPostTextView: UITextView) {
        if(newPostTextView.text == "") {
            newPostTextView.text = "Write a caption...";
            newPostTextView.textColor = UIColor(white: 2/3, alpha: 1);
        }
        newPostTextView.resignFirstResponder();
    }
    
    @IBAction func onTap(sender: AnyObject) {
        newPostTextView.endEditing(true)
    }
    
    @IBAction func onCancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onShare(sender: AnyObject) {
        // make Post
        var caption = newPostTextView.text
        if caption == "Write a caption..." {
            caption = "User Post Nice Picture"
        }
        Post.postUserImage(newImg, withCaption: caption) { (success: Bool, error: NSError?) -> Void in
            if success == true {
                self.dismissViewControllerAnimated(true, completion: nil)
                //reload
            } else {
                print(error?.localizedDescription)
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
