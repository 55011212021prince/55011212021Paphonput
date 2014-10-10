//
//  ViewController.swift
//  Exam1_55011212021
//
//  Created by Student on 10/10/14.
//  Copyright (c) 2014 paphonput. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet var textFieldVolume: UITextField!
    @IBOutlet var textFieldPrice: UITextField!
    @IBOutlet var textFieldName: UITextField!
    @IBOutlet var textFieldTotal: UITextField!
    @IBOutlet var mtableView: UITableView!
    var profit : [Double] = []
    var dataSource:NSMutableArray = NSMutableArray()
    var change:[Double] = [0.3,0.5,0.10]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Total_button(sender: AnyObject) {
        
        var volume:NSString = textFieldVolume.text
        var x = volume.doubleValue
        var price:NSString = textFieldPrice.text
        var y = price.doubleValue
        var mul = x * y
        var total:NSString = "\(Int(mul))"
        
        
        textFieldTotal.text = "\(total)Baht"
        
        
        
    }

    @IBAction func Profit_button(sender: AnyObject) {
        var volume:NSString = textFieldVolume.text
        var x = volume.doubleValue
        var price:NSString = textFieldPrice.text
        var y = price.doubleValue
      
        
        for i in change{
            var mul = Double(x*y/100.0*i)
            profit.append(mul)
        }
        
         mtableView.reloadData()
        
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var kCellIdentifier:NSString = "cellIdentifier"
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifier) as UITableViewCell
        cell.textLabel?.text = "ราคาหุ้นขึ้น \(change): กำไร \(dataSource[indexPath.row]) บาท"
       
        return cell
        
        
    }
    
}

