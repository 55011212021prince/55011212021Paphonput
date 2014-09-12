//
//  ViewController.swift
//  TipCalculator
//
//  Created by Student on 9/12/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

import UIKit

class ViewController:UIViewController {
    @IBOutlet var totalTextField : UITextField!
    @IBOutlet var taxPctSlider : UISlider!
    @IBOutlet var taxPctLabel : UILabel!
    @IBOutlet var resultsTextView: UITextView!
    let tipCalc = TipCalculatorModel(total: 33.25, taxPct: 0.6)
    
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
        let possibleTips =  tipCalc.returnPossibleTips()
        var result = ""
        //3
        for (tipPct,tipValue)in possibleTips{
            //4
            result += "\(tipPct)%:\(tipValue)\n"
        }
        //5
        resultsTextView.text = result
    }
    
    @IBAction func taxPercentageChanged(sender : AnyObject){
        tipCalc.taxPct = Double(taxPctSlider.value) / 100.0
        
        
      
        refeshUI()

    }
    
    @IBAction func viewTrapped(sender: AnyObject) {
        totalTextField.resignFirstResponder()
    }

}
