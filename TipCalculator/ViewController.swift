//
//  ViewController.swift
//  TipCalculator
//
//  Created by Grenon on 1/5/16.
//  Copyright © 2016 Grenon. All rights reserved.
//

import UIKit

extension String {
    var length: Int { return self.characters.count }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var barSettings: UIBarButtonItem!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var segTips: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billAmountTextField.becomeFirstResponder()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.loadDefaulData()
    }
    
    @IBAction func onEditingChanges(sender: AnyObject) {
        self.calculateAndDisplayData()
    }
    
    func calculateAndDisplayData() {
        if (billAmountTextField.text?.length == 0) {
            return;
        }
        
        BillAmountCacher.saveBillAmount(billAmountTextField.text!)
        let tipPercentage = Calculator().tipPercentages[segTips.selectedSegmentIndex]
        let billAmount = Double(billAmountTextField.text!)
        let tip = billAmount! * tipPercentage
        let total = billAmount! + tip;
        
        tipLabel.text = self.formatStringAsCurrency(tip)
        totalLabel.text = self.formatStringAsCurrency(total)
    }
    
    @IBAction func tipPercentageChanged(sender: AnyObject) {
        self.calculateAndDisplayData()
    }
    
    func loadDefaulData() {
        billAmountTextField.text = BillAmountCacher.billAmountCached()
        totalLabel.text = self.formatStringAsCurrency(0)
        tipLabel.text = self.formatStringAsCurrency(0)
        
        let defaultTip = NSUserDefaults.standardUserDefaults().objectForKey("defaultTipPercentage")
        
        if (defaultTip == nil) {
            segTips.selectedSegmentIndex = 2;
        } else {
            segTips.selectedSegmentIndex = defaultTip as! Int;
        }
        self.calculateAndDisplayData()
    }
    
    @IBAction func showSettingsController(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("settingsViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func formatStringAsCurrency(value: Double) -> String {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        return formatter.stringFromNumber(value)!
    }
}

