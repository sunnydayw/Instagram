//
//  TabBarViewController.swift
//  Instagram
//
//  Created by QingTian Chen on 3/16/16.
//  Copyright © 2016 QingTian Chen. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
        if(User.currentUser() == nil) {
            self.performSegueWithIdentifier("loginSegue", sender: self);
        }
    }

    override func viewWillAppear(animated: Bool) {
        
           /*
        let item1 = MainViewController()
        let icon1 = UITabBarItem(title: "Home", image: UIImage(named: "icon-home"), selectedImage: UIImage(named: "icon-home"))
        item1.tabBarItem = icon1
        
        let item2 = CameraViewController()
        let icon2 = UITabBarItem(title: "Camera", image: UIImage(named: "icon-camera"), selectedImage: UIImage(named: "icon-camera"))
        item2.tabBarItem = icon2
        
        let item3 = ProfileViewController()
        let icon3 = UITabBarItem(title: "Profile", image: UIImage(named: "icon-profile"), selectedImage: UIImage(named: "icon-profile"))
        item3.tabBarItem = icon3
        
        let controllers = [item1,item2,item3]  //array of the root view controllers displayed by the tab bar interface
        self.viewControllers = controllers
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // create view controllers from storyboard
        // Make sure you set Storyboard ID for both the viewcontrollers in
        // Interface Builder -> Identitiy Inspector -> Storyboard ID
        let MainNavController = storyboard.instantiateViewControllerWithIdentifier("MainNavController")
        let CameraNavController = storyboard.instantiateViewControllerWithIdentifier("CameraNavController")
        let ProfileNavController = storyboard.instantiateViewControllerWithIdentifier("ProfileNavController")
        
        // Style
        MainNavController.tabBarItem.image = UIImage(named: "icon-home")
        CameraNavController.tabBarItem.image = UIImage(named: "icon-camera")
        ProfileNavController.tabBarItem.image = UIImage(named: "icon-profile")
        */
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
