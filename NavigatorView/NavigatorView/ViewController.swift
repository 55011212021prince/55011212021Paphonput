//
//  ViewController.swift
//  NavigatorView
//
//  Created by Student on 10/22/14.
//  Copyright (c) 2014 paphonput. All rights reserved.
//

import UIKit

class ViewController: UIViewController,ColorTwoViewControllerDelegate{

    @IBOutlet weak var colorlabel: UILabel!
  
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func myVCDidFinish(Controller: ColorTwoViewController, text: String) {
        colorlabel.text = "Co: " + text
        
        if text == "Green"{
            colorlabel.backgroundColor = UIColor.greenColor()
            view.backgroundColor = UIColor.greenColor()
        }else if text == "red"{
            colorlabel.backgroundColor = UIColor.redColor()
        }else if text == "blue"{
            colorlabel.backgroundColor = UIColor.blueColor()
        }
        Controller.navigationController?.popViewControllerAnimated(true)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "mySegue"{
            let vc = segue.destinationViewController as ColorTwoViewController
            vc.colorString = colorlabel.text!
            vc.delegate = self
        }
    }

}

