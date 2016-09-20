//: Playground - noun: a place where people can play

import UIKit

// 関数の型
func f1(i1:Int, i2:Int) -> Int {return i1 * i2}
var test_f1: (Int, Int) -> Int = f1
func f2(i1:Int) -> Void {}
let test_f2: Int -> Void = f2

var f1: Int -> Int // クロージャ用の変数 f1 を宣言 
repeat { // 変数スコープを作る
    var captured = 10 // f1 の中で使う変数 captured を定義
    f1 = {
        (i1: Int) -> Int in
        return captured++ * i1 // captured を f1 内でインクリメントする
    }
} while false

// 変数スコープを抜けたので変数captured は消滅
f1(5) // 50。(10 × 5) captured はf1 にキャプチャされているのでf1 から参照可能
f1(6) // 66。(11 × 6) captured は f1 によりインクリメントされている


// クロージャーの定義とその実行例
let calculatedString = {(count: Int) -> String in // クロージャの書式で関数を定義 
    var paren = ("", "")
let calc = {(i2: Int) -> String in
    return paren.0 + String(i2 * i2) + paren.1
    // 内側の関数もクロージャの書式で定義
}
    
var result = ""
paren = ("[", "]")
result += calc(count - 1)
paren = ("{", "}")
result += calc(count)
return result
}
calculatedString(10)
// "[81]"(count == 10 で呼び出している場合)
// "[81]{100}"(count == 10で呼び出している場合)
// 実行結果はネスト関数でもクロージャでも同じ

let ff_int = {(i:Int, f:(Int -> Int)) -> Int in
    return f(i)
}

let sq_int = {(i:Int) -> Int in
    return i * i
}

ff_int(5, sq_int)

// クロージャーを別の関数に直接記述
ff_int(5, {(i:Int) -> Int in return i * i})  // 25

// クロージャー型における関数型の省略例
let r = ff_int(5, {i in return i * i}) // Int -> Int 型であると型推論される 
let sq_int2: Int -> Int = {i in return i * i} // 変数宣言で型が明示されている

// クロージャーにおけるreturnの省略例
let t = ff_int(5, {i in i * i})
let sq_int3: Int -> Int = {i in i * i}

// クロージャーにおける局所引数の省略例
ff_int(5, {$0 * $0})
let sq_int4: Int -> Int = {$0 * $0}

func my_message(condition : Bool, // 第1引数は真偽値 
    @autoclosure message: () -> String)
    // 第2引数には@autoclosure を指定。クロージャは文字列を返す 
    -> String {
    if condition
    {
        return message()
    } else {
    return "NO"
    // もし第1引数の結果が真ならば 
    // messageの実行結果を返す
    // それ以外は「NO」を返す
    }
}


// my_string は何かしら文字列を返す重い処理 
func my_string() -> String {
    var str = "a"
    for _ in 1...10 {
        str += str
    }
    return str
}

var a = 0
my_message(a == 0, message: my_string()) // my_string() の実行結果(a == 0 なので) a= 1
my_message(a == 0, message: my_string()) // "NO"(a == 0ではないので)

// Swiftによる値キャプチャ
let calculatedString_ = {(count: Int) -> String in
    var paren = ("", "")
    var calc: Int -> String
    do {
        let paren_ = paren
        calc = {(i2: Int) -> String in
            // クロージャ calc() の宣言のみ行い
            // 新たな変数スコープを作る
            // キャプチャすべき内容をローカル変数に確保
            return paren_.0 + String(i2 * i2) + paren_.1
            // ローカル変数をクロージャにキャプチャさせる
        }
    }
    var result = ""
    paren = ("[", "]")
    result += calc(count - 1)
    paren = ("{", "}")
    result += calc(count)
    return result
}

