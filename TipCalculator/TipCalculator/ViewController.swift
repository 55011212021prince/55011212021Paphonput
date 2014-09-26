//
//  ViewController.swift
//  TipCalculator
//
//  Created by Student on 9/12/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

import UIKit

class ViewController:UIViewController,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet var totalTextField : UITextField!
    @IBOutlet var taxPctSlider : UISlider!
    @IBOutlet var taxPctLabel : UILabel!
    @IBOutlet var resultsTextView: UITextView!
    @IBOutlet var Tview: UITableView!
    let tipCalc = TipCalculatorModel(total: 33.25, taxPct: 0.06)
    var possibleTips = Dictionary<Int,(tipAmt:Double,total:Double)>()
    var sortedKeys:[Int] = []
    
    func refeshUI(){
        //1
        totalTextField.text = String(format:"%0.2f",tipCalc.total)
        //2
        taxPctSlider.value = Float(tipCalc.taxPct)*100.0
        //3
        taxPctLabel.text =  "Tax Percentage (\(Int(taxPctSlider.value))%)"
        resultsTextView.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refeshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateTapped(sender : AnyObject){
        //1
        tipCalc.total = Double((totalTextField.text as NSString).doubleValue)
        //2
        possibleTips =  tipCalc.returnPossibleTips()
        sortedKeys = sorted(Array(possibleTips.keys))
        Tview.reloadData()
       /* var result = ""
        //3
        for (tipPct,tipValue)in possibleTips{
            //4
            result += "\(tipPct)%:\(tipValue)\n"
        }
        //5
        //resultsTextView.text = result*/
    }
    
    @IBAction func taxPercentageChanged(sender : AnyObject){
        tipCalc.taxPct = Double(taxPctSlider.value) / 100.0

        refeshUI()

    }
    
    @IBAction func viewTrapped(sender: AnyObject) {
        totalTextField.resignFirstResponder()
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell (style:UITableViewStyle.Value2, reuseIdentifier: nil)
        let tipPct = sortedKeys[indexPath.row]
        let tipAmt = possibleTips[tipPct]!.tipAmt
        let total = possibleTips.[tipPct]!.total
        cell.text
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

    
    
    
}

