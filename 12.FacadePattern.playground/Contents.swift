//: Playground - noun: a place where people can play

class SubsystemOne{
    func methodOne() {
        print("method 1 of system 1")
    }
}

class SubsystemTwo{
    func methodTwo() {
        print("method 2 of system 2")
    }
}

class SubsystemThree{
    func methodThree() {
        print("method 3 of system 3")
    }
}

class SubsystemFour{
    func methodFour() {
        print("method 4 of system 4")
    }
}

class Facade{
    let one: SubsystemOne
    let two: SubsystemTwo
    let three: SubsystemThree
    let four: SubsystemFour
    
    init() {
        self.one = SubsystemOne()
        self.two = SubsystemTwo()
        self.three = SubsystemThree()
        self.four = SubsystemFour()
    }
    
    final func methodA() {
        print("Method Group A ----")
        one.methodOne()
        two.methodTwo()
        four.methodFour()
    }
    
    final func methodB() {
        print("Method Group B ----")
        two.methodTwo()
        three.methodThree()
    }
}

let facade = Facade()
facade.methodA()
facade.methodB()
