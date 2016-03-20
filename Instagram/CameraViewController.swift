//
//  CameraViewController.swift
//  Instagram
//
//  Created by QingTian Chen on 3/16/16.
//  Copyright © 2016 QingTian Chen. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let vc = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vc.delegate = self
        vc.allowsEditing = true
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let actionSheet: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        
        // add take Picture
        let takePicture: UIAlertAction = UIAlertAction(title: "Take a Photo", style: .Default) { action -> Void in
            self.vc.sourceType = UIImagePickerControllerSourceType.Camera;
            self.presentViewController(self.vc, animated: true, completion: nil);
        }
        actionSheet.addAction(takePicture)
        
        // add Choose Existing
        let fromLibrary: UIAlertAction = UIAlertAction(title: "Choose Existing", style: .Default) { action -> Void in
            self.vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary;
            self.presentViewController(self.vc, animated: true, completion: nil)
        }
        actionSheet.addAction(fromLibrary)
        
        // add Cancel
        let cancelButton: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel)
            { action -> Void in
                self.dismissViewControllerAnimated(true, completion: nil)
        }
        actionSheet.addAction(cancelButton)
        
        self.presentViewController(actionSheet, animated: true, completion: nil);
    
    }
    
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            // Get the image captured by the UIImagePickerController
            //let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
            // Do something with the images (based on your use case)
            // Dismiss UIImagePickerController to go back to your original view controller
            dismissViewControllerAnimated(true, completion: nil)
            let storyboard = UIStoryboard(name:"Main", bundle: NSBundle.mainBundle())
            let newPostNav = storyboard.instantiateViewControllerWithIdentifier("NewPostNavigationController") as! UINavigationController
            let newPostVC = newPostNav.topViewController as! NewPostViewController
            newPostVC.newImg = editedImage
            presentViewController(newPostNav, animated: true, completion: nil)
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
