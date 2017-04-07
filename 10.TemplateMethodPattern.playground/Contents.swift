//: Playground - noun: a place where people can play

protocol TestPaper{
    func answer1() -> String
    func answer2() -> String
    func answer3() -> String
}

extension TestPaper{
    func testQuestion1() {
        print("Question 1")
        print("Answer: \(answer1())")
    }
    
    func testQuestion2() {
        print("Question 2")
        print("Answer: \(answer2())")
    }
    
    func testQuestion3() {
        print("Question 3")
        print("Answer: \(answer3())")
    }
}

class TestPaperA: TestPaper{
    func answer1() -> String {
        return "b"
    }
    
    func answer2() -> String {
        return "c"
    }
    
    func answer3() -> String {
        return "a"
    }
}

class TestPaperB: TestPaper{
    func answer1() -> String {
        return "c"
    }
    
    func answer2() -> String {
        return "a"
    }
    
    func answer3() -> String {
        return "a"
    }
}

print("Test Paper A:")
let a = TestPaperA()
a.testQuestion1()
a.testQuestion2()
a.testQuestion3()
print("\nTest Paper B:")
let b = TestPaperB()
b.testQuestion1()
b.testQuestion2()
b.testQuestion3()
