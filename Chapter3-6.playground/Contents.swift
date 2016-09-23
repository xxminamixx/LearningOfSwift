//: Playground - noun: a place where people can play

import UIKit

//カリー化
/*
 カリー化とは複数の引数を持つ関数を、
 一つの引数を持つ関数に変換する操作。
 */

// クロージャーによるカリー化

// f()は入力した文字を文字列として連結して返す関数
let f: (Int, Double, String) -> String = {
    (i1, d2, s3) in "\(i1), \(d2), \(s3)\n"
}

//let cur_f : (Int) -> ((Double, String) -> String) = {
//    // cur_f()はカリー化なので引数を1個のみを持つ
//    (i1: Int) -> ((Double, String) -> String) in
//    return {(d2:Double, s3:String) -> String in
//    }
//    
//    return f(i1, d2, s3)
//}
//
//cur_f(5)(3.0, "a")
//f(5, 3.0, "a")

// カリー化
/*
 引数にbをとってcを返す関数g(b)と、引数aをとって関数gを返す関数F(a)を定義すると、
 この関数Fは関数fをカリー化した関数と言いう。
 F(a)=g
 g(b)=c
 カリー化とは複数の引数を1つに減らすこと
 */
func add(x: Int) -> (Int -> Int) {
    func addToX(y :Int) -> Int {
        return x + y
    }
    return addToX
}

//// このように書くこともできる
//func add(x: Int) -> (Int -> Int) {
//    return { (y: Int) -> Int in x + y }
//}

// 呼び出し
let add7 = add(7)
add7(3)
add7(5)

// クロージャによるカリー化例の型推論による省略
let cur_cur_f: (Int) -> ((Double) -> ((String) -> String)) = {
    i1 in {d2 in {s3 in f(i1, d2, s3) }}
}


