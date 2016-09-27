//: Playground - noun: a place where people can play

import UIKit



/*
 Objective-Cでは初期値としてnilを代入してしまいがちだが、
 Swiftではnilは例外が発生してしまうため極力代入しない。
 そのため、初期値として
 文字列では""
 配列では[]
 辞書では[:]
 を使って型に合った空値を入れます。
 */

let str1 = "100"

//イニシャライズが失敗することがあるためOptional Intのインスタンスが返る
let number1 = Int(str1)

let str2 = "abc"
let number2 = Int(str2)


// これらは同義
let i:Int?
let j:Optional<Int>


// nilを代入
//let str:String = nil // コンパイルエラー 
let optionalStr:String? = nil // OK

// varに限り初期値を設定しないとnilがはいる
var defaults:Int?

let str3 = "100"

// numberにnilではない値が入った時 真
// Optional Binding
if let number = Int(str3) {
    print("number is \(number)")
}

// 束縛値を用いたOptional Binding
if let price1 = Int(str1), price2 = Int(str3)
    where price1 > price2 {
    print("price1 is expensive than price2")
}

// 真 ?? 偽
var number:Int = Int(str1) ?? 0

/*
 カリー化とは、複数の引数を持つ関数を 1 つの引数を持つ関数に変換する操作
 */


// 引数を2つ取り大きい方の値を返すメソッド
func max(x:Int, y:Int) -> Int {
    return x > y ? x : y
}

// 上記をカリー化すると
func _max(x:Int) -> (Int -> Int) {
    func maxValue(y:Int) -> Int {
        return x > y ? x : y
    }
    return maxValue
}

let max1 = max(10,20)

// カリー化した関数の呼び出し
let max2 = _max(10)(20)

// カリー化のメリット
// 同じアルゴリズムで引数だけ変えたいものを複数作成できること

let greater100 = _max(100) // 100と比較する関数を作成
greater100(200)
greater100(1000)

let greater200 = _max(200) // 200と比較する関数を作成
greater200(300)
greater200(10)

//クロージャー
var simpleClosuer:() -> () = {
    print("クロージャーを呼びました")
}

simpleClosuer()

//String引数付クロージャ
var paramClosure: (String) -> String
//クロージャの実装
paramClosure = {
    p -> String in
    return "こんにちは。" + p + "さん"
}
print(paramClosure(""))


// 引数を2つ取り大きい方の値を返すクロージャ
var practiceClosure = {(x:Int, y:Int) -> Int in
    return x > y ? x:y
}

practiceClosure(10,20)
