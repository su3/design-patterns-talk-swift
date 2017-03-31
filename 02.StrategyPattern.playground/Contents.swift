//: Playground - noun: a place where people can play

import UIKit

//现金收费协议
protocol CashSuper{
    func acceptCash(money: Double) -> Double
}

// MARK: 运算类
//正常收费
final class CashNormal: CashSuper{
    func acceptCash(money: Double) -> Double {
        return money
    }
}

//打折收费
final class CashRebate: CashSuper{
    private var moneyRebate: Double = 1

    init(moneyRebate: Double) {
        self.moneyRebate = moneyRebate
    }
    
    func acceptCash(money: Double) -> Double {
        return money * moneyRebate
    }
}

//返利收费
final class CashReturn: CashSuper{
    private var moneyCondition: Double = 0.0
    private var moneyReturn: Double = 0.0
    
    init(moneyCondition: Double, moneyReturn: Double){
        self.moneyCondition = moneyCondition
        self.moneyReturn = moneyReturn
    }
    
    func acceptCash(money: Double) -> Double {
        var result = money
        if (money >= moneyCondition) {
            result = money - floor(money / moneyCondition) * moneyReturn
        }
        return result
    }
}

// MARK:
//策略模式结合简单工厂
final class CashContext{
    private var cs: CashSuper?
    
    init(type: String){
        switch type {
        case "正常收费":
            self.cs = CashNormal()
        case "满300返100":
            self.cs = CashReturn(moneyCondition: 300,moneyReturn: 100)
        case "打8折":
            self.cs = CashRebate(moneyRebate: 0.8)
        default:
            break
        }
    }
    
    func GetResult(money: Double) -> Double{
        guard let cs = cs else {
            return money
        }
        return cs.acceptCash(money: money)
    }
}

//测试
let result1 = CashContext(type:"正常收费").GetResult(money: 580)
let result2 = CashContext(type:"满300返100").GetResult(money: 580)
let result3 = CashContext(type:"打8折").GetResult(money: 580)
print("总价：580，正常收费 = \(result1)； 满300返100 = \(result2)；打8折 = \(result3)")





