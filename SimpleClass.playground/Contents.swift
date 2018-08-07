//: Playground - noun: a place where people can play

import UIKit

class Car{
    
    // Properties
    var type:String?
    var model:String?
    var price:Double?
    var milesDrive:Int?
    var owner:String?
    
    // method
    func getPrice()->Double{
        let newPrice = price! - (Double(milesDrive!) * 10)
        return newPrice
    }
    
    func getOwner()->String{
        return owner!
    }
    
}

let car1 = Car()
car1.type = "BMW"
car1.model = "2018"
car1.price = 9999.00
car1.milesDrive = 100


