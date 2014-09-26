//
//  TipCalculatorModel.swift
//  TipCalculator
//
//  Created by Student on 9/12/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

import Foundation

// Playground - noun: a place where people can play



class TipCalculatorModel{
    var total: Double
    var taxPct: Double
    var subtotal: Double{
        get {
        return total / (taxPct + 1)
        }
    }
    init(total:Double, taxPct:Double){
        self.total = total
        self.taxPct = taxPct
    }
    func calTipWithTipPct(tipPct:Double) -> (tipAmt:Double,total:Double){
        var tipAmt = subtotal * tipPct
        var finalTotal = total + tipAmt
        return (tipAmt,finalTotal)
    }
    func returnPossibleTips() -> [Int: (tipAmt:Double,total:Double)]{
        let possibleTipsInferred=[0.15,0.18,0.20]
        var numOfItem = possibleTipsInferred.count
        
        var retval = Dictionary<Int, (tipAmt:Double,total:Double)>()
        for possibleTip in possibleTipsInferred {
            let intPct = Int(possibleTip*100)
            
            retval[intPct] = calTipWithTipPct(possibleTip)
        }
        return retval
    }
    
}

