//
//  ViewController.swift
//  sumone
//
//  Created by Student on 9/12/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet var Labelone: UILabel!
    @IBOutlet var labeltwo: UILabel!
    @IBOutlet var labelthree: UILabel!
    var x = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func oneBtn(sender: AnyObject) {
        x = x + 1
        Labelone.text = "\(String(x))"
        
    }

    @IBAction func twoBtn(sender: AnyObject) {
        x = x + 1
        labeltwo.text = "\(String(x))"
    }

    @IBAction func threeBtn(sender: AnyObject) {
        x = x + 1
        labelthree.text = "\(String(x))"
    }
    @IBAction func ResetAll(sender: AnyObject) {
        x = 0
        Labelone.text  = "0"
        labeltwo.text = "0"
        labelthree.text = "0"
    }
}

