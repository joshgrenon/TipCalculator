//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Grenon on 1/8/16.
//  Copyright © 2016 Grenon. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tipPercentages: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.styleUI()
        self.loadDefaulData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tipPercentagesChanged(sender: AnyObject) {
        let tipPercentageSelectedIndex = tipPercentages.selectedSegmentIndex
        NSUserDefaults.standardUserDefaults().setObject(tipPercentageSelectedIndex, forKey: "defaultTipPercentage")
    }
    
    func loadDefaulData()
    {
        let defaultTip = NSUserDefaults.standardUserDefaults().objectForKey("defaultTipPercentage")
        
        if (defaultTip == nil) {
            tipPercentages.selectedSegmentIndex = 2;
        } else {
            tipPercentages.selectedSegmentIndex = defaultTip as! Int;
        }
    }
    
    func styleUI() {
        self.view.tintColor = Stylesheet.baseColor()
        self.navigationController?.navigationBar.tintColor = Stylesheet.baseColor()
    }
}
