//: Playground - noun: a place where people can play

//Factory

protocol Factory{
    func createOperation() -> Operation
}

class AddFactory: Factory{
    func createOperation() -> Operation {
        return OperationAdd()
    }
}

class SubFactory: Factory{
    func createOperation() -> Operation {
        return OperationSub()
    }
}

class MulFactory: Factory{
    func createOperation() -> Operation {
        return OperationMul()
    }
}

class DivFactory: Factory{
    func createOperation() -> Operation {
        return OperationDiv()
    }
}

//Operation

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
            print("the divisor can't be 0")
            return 0
        }
        var result: Double = 0
        result = numberA / numberB
        return result
    }
}


//Usage

let operFactory = AddFactory()
let oper = operFactory.createOperation()
oper.numberA = 1
oper.numberB = 2
oper.GetResult()
