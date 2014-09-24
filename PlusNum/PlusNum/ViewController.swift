//
//  ViewController.swift
//  PlusNum
//
//  Created by Student on 9/24/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var LabelOne: UILabel!
    
    @IBOutlet weak var LabelTwo: UILabel!
    
    @IBOutlet weak var LabelThree: UILabel!
    var one=0
    var two=0
    var three=0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Butt3(sender: AnyObject) {
        three += 1
        LabelThree.text = "\(three)"
    }

    @IBAction func Butt2(sender: AnyObject) {
        two += 1
        LabelTwo.text = "\(two)"
    }
   
    @IBAction func Butt1(sender: AnyObject) {
        one += 1
        LabelOne.text = "\(one)"
        
    }
    
    
    @IBAction func Reset_All(sender: AnyObject) {
        one = 0
        two = 0
        three = 0
        LabelOne.text = "\(one)"
        LabelTwo.text = "\(two)"
        LabelThree.text = "\(three)"
    }
}

