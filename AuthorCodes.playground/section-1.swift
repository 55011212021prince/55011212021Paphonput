// Playground - noun: a place where people can play

var st = "prince"


class testcode{
    let x = [1,2,3,4,5,6,7,8,9]
    var n:Int
    var result:Int = 1
    init(n:Int){
            self.n = n
        }
    func searchNumber() -> Bool
    {
        for(var i = 0;i<x.count; i++){
            if(x[i]==n){return true}
            
        }
        return false
    }
    func PrintResult(str:Bool){
        if(str){
            print("Number Have in data^^")
        }
        else{
            print("Number not in data")
        }
    }
    func factorial(n:Int)->Int{
        for(var i = 0;i<n;i++){
            result += facProcess(i)
            println("\(result)")
        }
        return result
    }
    func facProcess(n:Int)->Int{
        return 1*result
    }
}

let value = testcode(n:10)
var boo=value.searchNumber()
value.PrintResult(boo)
value.factorial(10)

