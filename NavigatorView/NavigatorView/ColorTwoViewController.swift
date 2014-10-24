//
//  ColorTwoViewController.swift
//  NavigatorView
//
//  Created by Student on 10/22/14.
//  Copyright (c) 2014 paphonput. All rights reserved.
//

import UIKit

protocol ColorTwoViewControllerDelegate{
    func myVCDidFinish(Controller:ColorTwoViewController,text:String)
}

class ColorTwoViewController: UIViewController {

    var delegate:ColorTwoViewControllerDelegate? = nil
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    var colorString = ""
 
    @IBAction func save_bt(sender: UIBarButtonItem) {
        if(delegate != nil){
            delegate?.myVCDidFinish(self, text: colorLabel!.text!)
        }
    }
    
    @IBAction func colorSelectionButton(sender: UIButton) {
        colorLabel.text = sender.titleLabel!.text!
        if colorLabel.text == "Green"{
            view.backgroundColor = UIColor.greenColor()
            colorLabel.backgroundColor = UIColor.greenColor()
            colorLabel.textColor = UIColor.whiteColor()
        }else if colorLabel.text == "Red"{
            view.backgroundColor = UIColor.redColor()
            colorLabel.backgroundColor = UIColor.redColor()
            colorLabel.textColor = UIColor.whiteColor()
        }else if colorLabel.text == "Blue"{
            view.backgroundColor = UIColor.blueColor()
            colorLabel.backgroundColor = UIColor.blueColor()
            colorLabel.textColor = UIColor.whiteColor()
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        colorLabel.text = colorString
        
    }

    
}
