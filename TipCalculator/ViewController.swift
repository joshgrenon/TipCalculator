//
//  ViewController.swift
//  TipCalculator
//
//  Created by Grenon on 1/5/16.
//  Copyright © 2016 Grenon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupDefaultValues()
        billAmountTextField.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onEditingChanges(sender: AnyObject) {
        print("things changes")
        let billAmount = Double(billAmountTextField.text!)
        let tip = billAmount! * 0.2
        let total = billAmount! + tip;
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    func setupDefaultValues() {
        totalLabel.text = "$0.00"
        tipLabel.text = "$0.00"
    }
}

