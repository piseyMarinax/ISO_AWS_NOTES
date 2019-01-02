//: Playground - noun: a place where people can play

import UIKit


let url = Bundle.main.url(forResource: "data", withExtension: "json")
let data = try Data(contentsOf: url!)
//
let objJson = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)

// let dict = objJson as? [String:Any]
//let message = dict!["message"]
//    print(message!)



