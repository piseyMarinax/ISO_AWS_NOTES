//: Playground - noun: a place where people can play

import UIKit

protocol Fullname{
    var fullName: String {get}
    func setName(name: String)
}

class Person: Fullname{
    var status :String = ""
    var name :String = ""
    
    init(status:String,name:String) {
        self.status = status
        self.name = name
    }
    
    var fullName: String{
        return "\(status) \(name)"
    }
    
    func setName(name: String) {
        self.name = name
    }
}

//let person = Person(status: "Mr", name: "kaka")
//print(person.fullName)
//person.setName(name: "gg")
//print(person.fullName)

protocol fly{
    mutating func getName() -> String
}

struct Bird: fly{
    mutating func getName() -> String {
        name = "chic"
        return name;
    }
    
    var name: String = ""
}

//var b = Bird()
//print(b.getName())

protocol A{
    func a()
}

protocol B{
    func b()
}

protocol C{
    
}

extension B {
    func dd(){
//         ""
    }
}

//extension C{
////    func a()
////    func c()
//func d()
//}

//class MyClass: C{
//    func a() {
//        print("a")
//    }
//
//    func b() {
//        print("b")
//    }
//
//    func c() {
//        print("C")
//    }
//}

//var myClass = MyClass();
//myClass.a()
//myClass.b()
//myClass.c()




