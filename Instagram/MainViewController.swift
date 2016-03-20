//
//  MainViewController.swift
//  Instagram
//
//  Created by QingTian Chen on 3/14/16.
//  Copyright © 2016 QingTian Chen. All rights reserved.
//

import UIKit
import Parse

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var posts: [PFObject]?
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadMoreData()
        refreshControl.addTarget(self, action: "refreshControlAction:", forControlEvents: UIControlEvents.ValueChanged)
        tableView.insertSubview(refreshControl, atIndex: 0)
        
        //self.automaticallyAdjustsScrollViewInsets = false
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 600
}
    
    override func viewDidAppear(animated: Bool) {
        //super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}

extension MainViewController: UITableViewDelegate,UITableViewDataSource {
    /*
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        self.tableView.rowHeight = UITableViewAutomaticDimension
        print(self.tableView.rowHeight)
        return 100.0
    }
    */
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        if (self.posts?.count != nil) {
            count = (self.posts?.count)!
        } else {
            count = 0
        }
        return count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MainViewCell", forIndexPath: indexPath) as! MainTableViewCell
        cell.post = posts![indexPath.row]
        return cell
    }
}

// MARK: - Refresh Control
extension MainViewController {
    func refreshControlAction(refreshControl: UIRefreshControl) {
        loadMoreData()
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    func loadMoreData() {
        Post.userTimeline({ (response:[PFObject]) -> () in
            self.posts = response
            self.tableView.reloadData()
            }) { (error: NSError) -> () in
            print(error.localizedDescription)
        }
    }
}


