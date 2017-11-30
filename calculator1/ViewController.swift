//
//  ViewController.swift
//  calculator1
//
//  Created by Nguyen Trong Tuong on 11/28/17.
//  Copyright © 2017 tuongpro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var numberString:String = ""
    
    @IBAction func number(_ sender: UIButton) {
        
        if numberString.count < 12 {
          numberString = numberString + String(sender.tag)
        }
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        let formattedNumber = numberFormatter.string(from: NSNumber(value: Double(numberString)!))!
        
        label.text = formattedNumber
        label.numberOfLines = 3
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor=0.4
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

