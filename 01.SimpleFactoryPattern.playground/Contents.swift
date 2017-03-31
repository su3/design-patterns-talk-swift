//: Playground - noun: a place where people can play

class Operation{
    private var _numberA: Double = 0
    private var _numberB: Double = 0
    
    var numberA: Double{
        get{
            return _numberA
        }
        set{
            _numberA = newValue
        }
    }
    
    var numberB: Double{
        get{
            return _numberB
        }
        set{
            _numberB = newValue
        }
    }
    
    func GetResult() -> Double{
        let result: Double = 0
        return result
    }
}

final class OperationAdd: Operation{
    override func GetResult() -> Double {
        var result: Double = 0
        result = numberA + numberB
        return result
    }
}

final class OperationSub: Operation{
    override func GetResult() -> Double {
        var result: Double = 0
        result = numberA - numberB
        return result
    }
}

final class OperationMul: Operation{
    override func GetResult() -> Double {
        var result: Double = 0
        result = numberA * numberB
        return result
    }
}

final class OperationDiv: Operation{
    override func GetResult() -> Double {
        guard numberB != 0 else {
            print("除数不能为 0")
            return 0
        }
        var result: Double = 0
        result = numberA / numberB
        return result
    }
}

final class OperationFactory{
    class func createOperate(operate: String) -> Operation?{
        var oper: Operation?
        
        switch operate {
        case "+":
            oper = OperationAdd()
        case "-":
            oper = OperationSub()
        case "*":
            oper = OperationMul()
        case "/":
            oper = OperationDiv()
        default: break
        }
        return oper
    }
}

let op = OperationFactory.createOperate(operate: "+")
op?.numberA = 1
op?.numberB = 2
op?.GetResult()
