//
//  ViewController.swift
//  TipCalculator
//
//  Created by Grenon on 1/5/16.
//  Copyright © 2016 Grenon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var barSettings: UIBarButtonItem!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var segTips: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadDefaulData()
        billAmountTextField.becomeFirstResponder()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.loadDefaulData()
    }
    
    @IBAction func onEditingChanges(sender: AnyObject) {
        
        if (billAmountTextField.text == nil) {
            return;
        }
        
        let tipPercentage = Calculator().tipPercentages[segTips.selectedSegmentIndex]
        let billAmount = Double(billAmountTextField.text!)
        let tip = billAmount! * tipPercentage
        let total = billAmount! + tip;
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    
    @IBAction func tipPercentageChanged(sender: AnyObject) {
        [self .onEditingChanges(billAmountTextField)]
    }
    
    func loadDefaulData() {
        totalLabel.text = "$0.00"
        tipLabel.text = "$0.00"
        
        let defaultTip = NSUserDefaults.standardUserDefaults().objectForKey("defaultTipPercentage")
        
        if (defaultTip == nil) {
            segTips.selectedSegmentIndex = 2;
        } else {
            segTips.selectedSegmentIndex = defaultTip as! Int;
        }
    }
    
    @IBAction func showSettingsController(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("settingsViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

