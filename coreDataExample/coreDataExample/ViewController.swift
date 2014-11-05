//
//  ViewController.swift
//  coreDataExample
//
//  Created by Student on 11/5/14.
//  Copyright (c) 2014 paphonput. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDataSource{
    var items = [NSManagedObject]()
    @IBOutlet weak var tableView: UITableView!
    //var items = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\"ShoppingList\""
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
        let fetchRequest = NSFetchRequest(entityName: "Item")
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
            let entity = NSEntityDescription.entityForName("Item", inManagedObjectContext: manageContext)
            let item  = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: manageContext)
        item.setValue(name, forKey: "name" )
        var error: NSError?
        if !manageContext.save(&error){
            println("Couldn't save \(error),\(error?.userInfo)")
        }
        items.append(item)
    }
    
    
    
    @IBAction func additem(sender: AnyObject) {
        var alert = UIAlertController(title: "New item", message: "Add a new item", preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .Default){
            (action:UIAlertAction!) -> Void in
            let textField = alert.textFields![0] as UITextField
            self.saveName(textField.text)
            self.tableView.reloadData()
        
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default){
            (action:UIAlertAction!) -> Void in
        }
        
        alert.addTextFieldWithConfigurationHandler{
            (textField:UITextField!) -> Void in
        }
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        presentViewController(alert, animated: true, completion: nil)
        
    
    
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")  as UITableViewCell
        let item = items[indexPath.row]
        cell.textLabel.text=item.valueForKey("name") as String?
        
        return cell
    }
    
    
}
