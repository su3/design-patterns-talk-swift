//: Playground - noun: a place where people can play

//Component
protocol Person{
    func show()
}

//ConcreteComponent
class SimplePerson: Person{
    private let name: String
    
    init(name: String){
        self.name = name
    }
    
    func show(){
        print("装扮的 \(name) ")
    }
}

//Decorator
class PersonDecorator: Person{
    
    let decoratedPerson: Person
    
    required init(decorated: Person){
        self.decoratedPerson = decorated
    }
    
    func show() {
        decoratedPerson.show()
    }
}

//ConcreteDecorator

final class Tee: PersonDecorator{
    
    required init(decorated: Person) {
        super.init(decorated: decorated)
    }

    override func show() {
        print("T恤", separator: "", terminator: " ")
        super.show()
    }
}

final class BeachShorts: PersonDecorator{
    
    required init(decorated: Person) {
        super.init(decorated: decorated)
    }
    
    override func show() {
        print("沙滩裤", separator: "", terminator: " ")
        super.show()
    }
}

final class Sunglasses: PersonDecorator{
    
    required init(decorated: Person) {
        super.init(decorated: decorated)
    }
    
    override func show() {
        print("墨镜", separator: "", terminator: " ")
        super.show()
    }
}

var someone: Person = SimplePerson(name: "Tom") //即将被装饰的对象，可以有一些基础属性
someone = Tee(decorated: someone) //用 Tee 去装饰 someone
someone = BeachShorts(decorated: someone) //在上一步装饰好之后继续装饰
someone = Sunglasses(decorated: someone) //继续用 Sunglasses 去装饰前两步装饰过的对象

someone.show()
		
