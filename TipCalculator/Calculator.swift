//
//  Calculator.swift
//  TipCalculator
//
//  Created by Grenon on 1/8/16.
//  Copyright © 2016 Grenon. All rights reserved.
//

import UIKit

public class Calculator: NSObject {
    
    var tipPercentages: [Double]
    
    override init() {
        self.tipPercentages = [0.1, 0.15, 0.20]
    }

}
