//
//  SignupViewController.swift
//  Instagram
//
//  Created by QingTian Chen on 3/14/16.
//  Copyright © 2016 QingTian Chen. All rights reserved.
//

import UIKit
import Parse

class SignupViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.view.userInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: Selector("onTap:"))
        self.view.addGestureRecognizer(tapGesture)
    }

    
    @IBAction func onCreateAccount(sender: AnyObject) {
        let newUser = PFUser()
        newUser.username = usernameField.text
        newUser.password = passwordField.text
        newUser.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if success {
                print("user create")
            } else {
                print(error?.localizedDescription)
            }
        }
    }

    @IBAction func onSignIn(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
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
