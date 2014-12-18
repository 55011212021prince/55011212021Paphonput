//
//  ViewController.swift
//  Exam1_55011212021
//
//  Created by student on 12/18/14.
//  Copyright (c) 2014 student. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDataSource {

    var items = [NSManagedObject]()
    @IBOutlet weak var tableView: UITableView!
    //var items = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "หุ้นของฉัน"
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let manageContext = appDelegate.managedObjectContext!
        let fetchRequest = NSFetchRequest(entityName: "Stocks")
        var error :NSError?
        let fetchedResult = manageContext.executeFetchRequest(fetchRequest, error: &error) as [NSManagedObject]?
        if let results = fetchedResult{
            items = results
        }else{
            println("Couldn't save \(error),\(error?.userInfo)")
        }
        
    }
    
    func saveName(name:String){
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let manageContext = appDelegate.managedObjectContext!
        let entity = NSEntityDescription.entityForName("Stocks", inManagedObjectContext: manageContext)
        let item  = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: manageContext)
        item.setValue(name, forKey: "name" )
        var error: NSError?
        if !manageContext.save(&error){
            println("Couldn't save \(error),\(error?.userInfo)")
        }
        items.append(item)
    }
    func savePrice(price:Float){
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let manageContext = appDelegate.managedObjectContext!
        let entity = NSEntityDescription.entityForName("Stocks", inManagedObjectContext: manageContext)
        let item  = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: manageContext)
      
        item.setValue(price, forKey: "price")
        var error: NSError?
        if !manageContext.save(&error){
            println("Couldn't save \(error),\(error?.userInfo)")
        }
        items.append(item)
    }
    func saveAmount(amount:Float){
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let manageContext = appDelegate.managedObjectContext!
        let entity = NSEntityDescription.entityForName("Stocks", inManagedObjectContext: manageContext)
        let item  = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: manageContext)
       
        item.setValue(amount, forKey: "amount")
            var error: NSError?
        if !manageContext.save(&error){
            println("Couldn't save \(error),\(error?.userInfo)")
        }
        items.append(item)
    }
    
    
    @IBAction func additem(sender: AnyObject) {
        /////////////////////////////////////////////
        var alert = UIAlertController(title: "หุ้น", message: "เก็บ name , amount ,price ตามลำดับ", preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "เพิ่ม", style: .Default){
            (action:UIAlertAction!) -> Void in
            let textField = alert.textFields![0] as UITextField
            let textField1 = alert.textFields![1] as UITextField
            let textField2 = alert.textFields![2] as UITextField
            var amount = (textField1.text as NSString).floatValue
            var price = (textField2.text as NSString).floatValue
            self.saveName(textField.text)
            self.saveAmount(amount)
            self.savePrice(price)
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "ยกเลิก", style: .Default){
            (action:UIAlertAction!) -> Void in
        }
        
        alert.addTextFieldWithConfigurationHandler{
            (textField:UITextField!) -> Void in
        }
        alert.addTextFieldWithConfigurationHandler{
            (textField1:UITextField!) -> Void in
        }
        alert.addTextFieldWithConfigurationHandler{
            (textField2:UITextField!) -> Void in
        }
    
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        presentViewController(alert, animated: true, completion: nil)
        /////////////////////////////////////////////
        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")  as UITableViewCell
        let item = items[indexPath.row]
        var namefetch = item.valueForKey("name") as String?
        var amountfetch: AnyObject? = item.valueForKeyPath("amount")
        var pricefetch: AnyObject? = item.valueForKeyPath("price")
        cell.textLabel!.text="\(namefetch):Amount \(amountfetch) and price \(pricefetch)"
        //var amountfetch: AnyObject? = item.valueForKey("amount")
        //var pricefetch = item.valueForKey("price")
        /*cell.detailTextLabel!.text = "Amount : \(amountfetch) and Price : \(pricefetch)" as NSString*/
        return cell
    }


}

