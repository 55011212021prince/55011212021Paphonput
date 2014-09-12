// Playground - noun: a place where people can play



class TipCalculatorModel{
    let total: Double
    let taxPct: Double
    let subtotal: Double
    
    init(total:Double, taxPct:Double){
        self.total = total
        self.taxPct = taxPct
        subtotal = total / (taxPct + 1)
    }
    func calTipWithTipPct(tipPct:Double) -> Double{
        return subtotal * tipPct
    }
    func returnPossibleTips() -> [Int: Double]{
        let possibleTipsInferred=[0.15,0.18,0.20]
        var numOfItem = possibleTipsInferred.count
        
        var retval = [Int: Double]()
        for possibleTip in possibleTipsInferred {
            let intPct = Int(possibleTip*100)
            
            retval[intPct] = calTipWithTipPct(possibleTip)
        }
        return retval
    }
    
}
let tipCalc = TipCalculatorModel(total: 33.25, taxPct: 0.06)
var dict = tipCalc.returnPossibleTips()


