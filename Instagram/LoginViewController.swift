//
//  LoginViewController.swift
//  Instagram
//
//  Created by QingTian Chen on 3/14/16.
//  Copyright © 2016 QingTian Chen. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.view.userInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: Selector("onTap:"))
        self.view.addGestureRecognizer(tapGesture)
    }

    @IBAction func onSignIn(sender: AnyObject) {
        let username = usernameField.text ?? ""
        let password = passwordField.text ?? ""
        
        PFUser.logInWithUsernameInBackground(username, password: password) { (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        }
    }

    @IBAction func onSignUp(sender: AnyObject) {
        performSegueWithIdentifier("signupSegue", sender: nil)
    }
    
    func onTap(sender: AnyObject) {
        view.endEditing(true)
        if usernameField.text == "" {
            usernameField.text = "Username"
        }
        
        if passwordField.text == "" {
            passwordField.text = "Password"
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

