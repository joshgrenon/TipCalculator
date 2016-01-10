//
//  BillAmountCacher.swift
//  TipCalculator
//
//  Created by Grenon on 1/9/16.
//  Copyright © 2016 Grenon. All rights reserved.
//

import UIKit

class BillAmountCacher: NSObject {

    class func saveBillAmount(billAmount: String) {
        NSUserDefaults.standardUserDefaults().setObject(billAmount, forKey: "billAmount")
        NSUserDefaults.standardUserDefaults().setObject(NSDate(), forKey: "billAmountEnteredDate")
    }
    
    class func removeBillAmount() {
        NSUserDefaults.standardUserDefaults().removeObjectForKey("billAmount")
    }
    
    class func billAmountCached() -> String {
        
        if let billAmount = NSUserDefaults.standardUserDefaults().objectForKey("billAmount") {
            return billAmount as! String
        }
        return ""
    }
    
    class func hasBeenGreaterThan10Minutes() {
        
        if let billAmountEnteredDate = NSUserDefaults.standardUserDefaults().objectForKey("billAmountEnteredDate") {
            let numberOfMinuteSinceLastLaunch = NSCalendar.currentCalendar().components(.Minute, fromDate: billAmountEnteredDate as! NSDate, toDate: NSDate(), options: []).minute
            
            if (numberOfMinuteSinceLastLaunch > 10) {
                self.removeBillAmount()
            }
        }
    }
}
