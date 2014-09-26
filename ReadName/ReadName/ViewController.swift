//
//  ViewController.swift
//  ReadName
//
//  Created by Student on 9/26/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

import UIKit

 class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    let cellIdentifier = "cellIdentifier"
    @IBOutlet var Uname: UILabel!
    @IBOutlet var tView: UITableView!
    @IBOutlet var addfield: UITextField!
    var textF = [String]()

    @IBAction func ADDNAME(sender: AnyObject) {
        var x = addfield.text
        textF.append(x)
        self.tView.registerClass(UITableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textF.count
    }

    
    func tableView(tableView: UIT                                                                                                                                  ableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell {
        var cell = tableView!.dequeueReusableCellWithIdentifier(self.cellIdentifier) as UITableViewCell
        
        cell.textLabel!.text = self.textF[indexPath.row]
        
        self.tView.reloadData()
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       
    }
}


 