//: Playground - noun: a place where people can play

import UIKit

// BoolTypeの実装
protocol BooleanType {
    var boolValue: Bool { get }
}

class MyClass:BooleanType {
    var i:Int = 0
    var boolValue:Bool {
        get {
            return i != 0
        }
    }
}

// switch文
var num = 4
switch num {
case 1, 2, 3:
    print("low")
case 4, 5, 6:
    print("middle")
case 7, 8, 9:
    print("high")
default:
    print("other")
}

// fallthrough文の利用 breakせず次のcaseに移動
switch num {
case 0:
    print("zero")
    fallthrough
case 1, 2, 3:
    print("low")
case 4, 5, 6: 0
print("middle")
case 7, 8, 9:
    print("high")
default:
    break
}

// 範囲指定のswitch文
switch num {
case 0..<4:
    print("low")
case 4..<7:
    print("middle")
case 7..<10:
    print("high")
default:
    print("other")
}

// タプルの利用
let data = ("女性", 25)
switch data {
    case (_, 0..<20):
        print(" 未成年層 ")
    case ("女性", 20..<50):
            print("F1・F2 層 ")
    case ("女性", _):
        print("F3 層 ")
    case ("男性", 20..<50):
        print("M1・M2 層 ")
    case ("男性", _):
        print("M3 層 ")
    default: break
}

// 値束縛
let men = ("男性", 30)
switch men {
    // ageに年齢に当たる変数を代入しこのスコープで利用
case ("男性", let age):
    print("\(age) 歳の男性 ")
case let (gender, age):
    print("\(gender) の方 ")
}

// where文の利用
// ~以上のような条件はcaseではなくwhereで指定
let oldMen = ("男性", 55)
switch oldMen {
case ("男性", let age) where age > 50 :
    print("M3 層 ") default:break
}

var success = true
guard success else {
    print("failed")
    fatalError("failed") // noreturn属性でコンパイルを通す
}

// for-in ループ
let planets = ["Mercury", "Venus", "Earth", "Mars"]
for planet in planets {
    print(planet)
}

for planet in Set(planets) {
    print(planet)
}

for (index, planet) in planets.enumerate() {
    print("\(index+1): \(planet)")
}

// ワイルドカードの利用
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, _) in numberOfLegs {
    print("\(animalName)")
}

// 1~10までのループ
/*:
 Objective-C では
 ````
 for (int i = 1: i <= 10; i++) {
    NSLog(@"%@", i);
 }
 ````
 */
for i in 1...10 {
    print("\(i)")
}

// 範囲の逆順ループ
for i in (1...10).reverse() {
    print("\(i)")
}

// 複雑な条件指定
for x in 1.0.stride(through: 10.0, by: 0.5) {
    print("\(x)")
}

// breakによるループ中断
let planets = ["Mercury", "Venus", "Earth", "Mars"]
for (index, planet) in planets.enumerate() {
    print("\(index+1): \(planet)")
    if index == 2 {
        break; }
}

