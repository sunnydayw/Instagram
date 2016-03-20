//
//  ProfileViewController.swift
//  Instagram
//
//  Created by QingTian Chen on 3/16/16.
//  Copyright © 2016 QingTian Chen. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onLogout(sender: AnyObject) {
        PFUser.logOut()
        let storyboard = UIStoryboard(name:"Main", bundle: NSBundle.mainBundle())
        let TabBarNav = storyboard.instantiateViewControllerWithIdentifier("TabBarController") as! TabBarViewController
        presentViewController(TabBarNav, animated: true, completion: nil)

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
