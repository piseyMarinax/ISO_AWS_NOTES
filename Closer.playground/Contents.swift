//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


let sayHello = {() -> String in return "Hello"}

//print(sayHello())

let sum:(Double,Double) -> Double
sum = { (a: Double, b: Double)
    -> Double in return (a + b)
}

let sum1: (Double,Double,Double) -> Double
sum1 = {$0 + $1 + $2}

let sum2: (Double,Double,Double) -> Double
   sum2 = { (a: Double,b: Double,c: Double) -> Double in
    return a+b+c
}

let sum3: (Double,Double,Double) -> Double
sum3 = {$0 + $1 + $2}


//print(sum(12,3))
//print(sum1(12,3,3))
//print(sum2(12,3,3))
//print(sum3(12,3,3))

let arr = [2,3,4,5,6,7,8,9,6,11]
let sortedArr = arr.sorted(by: {$0 > $1})
let filterArr = arr.filter({ $0 >= 4}).sorted(by: {$0 > $1})

func filter(array: [Int], from: Int) -> [Int]{
    return array.filter({$0 > from}).sorted(by:{$0 > $1})
//    return array.sorted(by: {$0 > $1}).filter({$0 > from})
}

let newFillter = filter(array: arr, from: 3)




//print(sortedArr)
//print(filterArr)


print(newFillter)
print(filter(array: arr, from: 3))


