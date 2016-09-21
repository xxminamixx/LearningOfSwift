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