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
    var calString:String = ""
    var tempNumber:String = ""
    var acIsPressed:Int = 10
    var divideIsPressed:Int = 13
    var multiplyIsPressed:Int = 14
    var subtractIsPressed:Int = 15
    var plusIsPressed:Int = 16
    var equalIsPressed:Int = 17
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if numberString.count < 12 {
          numberString = numberString + String(sender.tag)
        }
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        let formattedNumber = numberFormatter.string(from: NSNumber(value: Double(numberString)!))!
        
        
        
        if (label.text?.range(of: "÷") != nil ||
            label.text?.range(of: "×") != nil ||
            label.text?.range(of: "-") != nil ||
            label.text?.range(of: "+") != nil ) {
            if tempNumber == "" {
                calString = label.text! + formattedNumber
                tempNumber = label.text!
            } else {
                calString = tempNumber + formattedNumber
            }
        } else {
          calString = formattedNumber
        }
        
        label.text = calString
        label.numberOfLines = 3
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor=0.4
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if sender.tag == acIsPressed {
            numberString = ""
            label.text = "0"
        }
        
        if sender.tag == divideIsPressed {
            label.text = label.text! + " ÷ "
            numberString = ""
            tempNumber = ""
        }
        
        if sender.tag == multiplyIsPressed {
            label.text = label.text! + " × "
            numberString = ""
            tempNumber = ""
        }
        
        if sender.tag == subtractIsPressed {
            label.text = label.text! + " - "
            numberString = ""
            tempNumber = ""
        }
        
        if sender.tag == plusIsPressed {
            label.text = label.text! + " + "
            numberString = ""
            tempNumber = ""
        }
        
        if sender.tag == equalIsPressed {
            var result:Double = 0
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = NumberFormatter.Style.decimal
            
            label.text = label.text!.replacingOccurrences(of: ",",with: "") // remove "," from calculation
            label.text = label.text!.replacingOccurrences(of: "÷",with: "/") // change "÷" to "/" from calculation
            label.text = label.text!.replacingOccurrences(of: "×",with: "*") // change "÷" to "*" from calculation
            label.text = label.text!.replacingOccurrences(of: "-",with: "-") // change "-" to "-" from calculation
            
            let operation = NSExpression(format: label.text! )
            result = (operation.expressionValue(with: nil, context: nil) as? Double)!
            
            
            let finalResult:String = numberFormatter.string(from: NSNumber(value: result))!
            label.text = String(finalResult)
            numberString = "" // reset after calculation
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label.text = "0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

