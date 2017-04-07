//: Playground - noun: a place where people can play

protocol Cloneable{
    func clone() -> Any
}

class Resume: Cloneable{
    var name: String
    var sex: String?
    var age: String?
    
    var work: WorkExperience?
    
    
    init(name: String) {
        self.name = name
        self.work = WorkExperience()
    }
    
    func setPersonalInfo(sex: String, age: String){
        self.sex = sex
        self.age = age
    }
    
    func setWorkExperience(workDate: String, company: String){
        self.work?.workDate = workDate
        self.work?.company = company
    }
    
    func display(){
        guard let sex = sex, let age = age else {
            return
        }
        
        print("\(self.name) \(sex) \(age)")
        
        guard let workDate = work?.workDate, let company = work?.company else {
            return
        }
        
        print("\(workDate) \(company)")
    }
    
    func clone() -> Any{
        let obj = Resume(name: self.name)
        obj.sex = self.sex
        obj.age = self.age
        obj.work = self.work
        return obj
    }
}

struct WorkExperience{
    var workDate: String?
    var company: String?
}

let a = Resume(name: "Tom")
a.setPersonalInfo(sex: "male", age: "29")
a.setWorkExperience(workDate: "1998-2000", company: "XX Co.")

let b = a.clone() as! Resume
b.setWorkExperience(workDate: "1998-2006", company: "YY Co.")

a.display()
b.display()
