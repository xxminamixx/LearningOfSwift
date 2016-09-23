//: Playground - noun: a place where people can play

import UIKit

/*
 Optionalとは次の2つの状態を1つの変数で表現する方法です。
 ・ 値がありその値はxである
 ・ 値は存在しない
 */

//let str:String = nil // コンパイルエラー 
//let optionalStr:String? = nil // OK

/*
 Optionalでない型は変数宣言時に初期値を設定する必要があるが、
 Optional型はvar宣言時に限り初期値を設定しなくてもよい。
 */

//var optionalStr:String? // nil

// Optionalへの自動変換
// Optional型へ代入すると自動的にOptional型へ変換されて格納される
//var optionalNumber:Int? = 100
//var number:Int = 200
//optionalNumber = number

// Optional型のnilチェック
//var str = "20"
//let optionalNumber = Int(str)
//if optionalNumber != nil {
//    print("optionalNumber has value.")
//// ここでoptionalNumber の内包する値を利用したい 
//}

var str = "100"
var number:Int = 0
let optionalNumber = Int(str)

/* 
 注意点としてアンラップする際は、本当にnilが入っていないか確認する必要がある。
 nilをアンラップしようとするとエラーが発生してしまう
 Objective-Cのように無視はされない
 */

if optionalNumber != nil {
    number = optionalNumber! // アンラップ
    print("number is \(number)")
}

// Optional Binding
// nilチェックとアンラップを同時に行うことで安全性を確立する方法
if let number = Int(str) {
    print("number is \(number)")
}

// 複数のOptional Bindingを行う場合はカンマで区切る
var priceStr1 = "1000"
var priceStr2 = "500"
if let price1 = Int(priceStr1), price2 = Int(priceStr2) {
    print("total price is \(price1 + price2)")
}

// where句を用いるとアンラップした結果にたいして条件を指定できます。
if let price1 = Int(priceStr1), price2 = Int(priceStr2)
    where price1 > price2 {
    print("price1 is expensive than price2")
}

// Optionalのパターンマッチング
// case let で宣言した変数の後ろに?をつけることでOptionalの取り出しとパターンマッチングが同時に行える
var priceStr = "1000"
if case let price? = Int(priceStr) {
    print("price is \(price)")
}

// ??演算子の挙動
var a:Int?
var b:Int?
a != nil ? a : b


var hundred = "100"
var num1:Int = Int(hundred) ?? 0 //Int型の初期化が成功した場合はその値、そうでなければ0がnumに代入

var str1 = "non number"
var str2 = "100"
var num2:Int = Int(str1) ?? Int(str2) ?? 0 //str1は数字ではないのでstr2が代入される

// Implicitly Unwrapped Optional 型の宣言
// Optionalでは?を使うがImplicitly Unwrapped Optionalでは!を使う
// Optional型の変数に対して!を使うとアンラップを意味し、型に!を使うとImplicitly Unwrapped Optionalを意味する
let implictlyUnwrrapedOptionalString:String! = nil

// イニシャライザで一瞬nilになる必要がある場合
class A {
    var b:B!
    init() {
        // bプロパティが初期化されていないためBを初期化できない→Implicitly Unwrapped Optionalとする
        // selfを渡すには自身のOptional以外のプロパティが初期化されている必要がある
        self.b = B(a: self)
    }
}

class B {
    unowned let a:A
    init(a:A) {
        self.a = a
    }
}


