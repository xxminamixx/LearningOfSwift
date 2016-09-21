//: Playground - noun: a place where people can play

import UIKit

// guardを使って関数に入ってきた値がnilのとき即return
let string:String? = nil

func showMessage (string:String?) {
    guard string != nil else {
        return
    }
    print(string);
}

// if letでのキャスト
let array = [100, 200, "300"]

for item in array {
    if let i = item as? Int {
        var a = i + 10
    }
}

//区間・配列・辞書型
var fruit = ["apple", "orange", "peach", "grape"]
var halfArray = fruit[0...(fruit.count/2)]

// 関数
func helloWorld(to:String, isMorning:Bool) -> String {
    let greeting = isMorning ? "おはよう" : "こんばんは"
    return greeting + to
}

print(helloWorld("花子", isMorning: true))

// 参照渡し inout
func incriment(inout value:Int){
     value = value + 1
}

var num:Int = 10
incriment(&num)

// ネスト関数
func addHonorific (name:String) -> String {
   
    func genderDecision (name:String) -> Bool{
        if (name == "Make") {
            return true;
        } else {
            return false;
        }
    }
    
    if (genderDecision(name)) {
        return "Mr." + name;
    } else {
        return  "Ms." + name;
    }
}

addHonorific("Katie")
