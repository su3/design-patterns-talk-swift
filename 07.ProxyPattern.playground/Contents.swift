//: Playground - noun: a place where people can play


//Subject
protocol SendGift {
    func sendDolls()
    func sendFlowers()
    func sendChocolate()
}

//RealSubject
class Pursuit: SendGift{
    
    let mm: SchoolGirl
    
    init(mm: SchoolGirl) {
        self.mm = mm
    }
    
    func sendDolls() {
        print("Send dolls to \(mm.name)")
    }
    
    func sendFlowers() {
        print("Send flowers to \(mm.name)")
    }
    
    func sendChocolate() {
        print("Send chocolate to \(mm.name)")
    }
}

//Proxy
class Proxy: SendGift{
    var persuit: Pursuit
    
    init(mm: SchoolGirl) {
        self.persuit = Pursuit(mm:mm)
    }
    
    func sendDolls() {
        persuit.sendDolls()
    }
    
    func sendFlowers() {
        persuit.sendFlowers()
    }
    
    func sendChocolate() {
        persuit.sendChocolate()
    }
}

class SchoolGirl{
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

//usage

let jane = SchoolGirl(name: "Jane")
let proxy = Proxy(mm: jane)

proxy.sendDolls()
proxy.sendFlowers()
proxy.sendChocolate()
