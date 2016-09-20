//: Playground - noun: a place where people can play

import UIKit

/*
 func 関数名(外部引数名1 局所引数名1:引数型1, 外部引数名2 局所引数名2: 引数型2) -> 戻り値型 
 { 
    処理の塊
    必要に応じて return 文で戻り値を返却
 }
 */

func enclose(stringArray array: Array<String>,headString head: String, tailString tail: String) -> Array<String>
{
    var newArray = array
    newArray.insert(head, atIndex: 0)
    newArray.append(tail)
    return newArray
}

// 関数の呼び出し
var array = enclose(stringArray: ["あ", "い", "う"], headString: "『", tailString: "』")

// 引数にvarをつけた関数定義
func enclose(var stringArray array: Array<String>,
                             headString head: String, tailString tail: String) -> Array<String> {
    array.insert(head, atIndex: 0) // arrayは変数として宣言 array.append(tail)
    return array
}
var array0 = ["あ", "い", "う"]
var array1 = enclose(stringArray: array0, headString: "『", tailString: "』") // 呼び出し方も実行結果も同じ

// デフォルト引数値を持つ関数定義
func enclose(var stringArray array: Array<String>,
headString head: String = "『",
tailString tail: String = "』") -> Array<String>
{
    array.insert(head, atIndex: 0)
    array.append(tail)
    return array
}

// 局所引数名が自動的に外部引数名となる関数定義
func joinString(str0 str0: String = "[", str1: String = "]") -> String {
    return str0 + str1
}
joinString() // "[]"
joinString(str0: "{") // "{]"
joinString(str1: "}") // "[}"
joinString(str0: "{", str1: "}") // "{}"



func joinString(by: String = ".", strings: String...) -> String { // joinString() 内でのstrings の型は実際には[String]
    var resultStr = ""
    for str in strings {
        resultStr += str + by
    }
    return resultStr
}


// 戻り値
var str = joinString(".", strings: "a", "b", "c")
func print(str: String, count: Int) {
    for _ in 0..<count {
        print(str)
    }
}

func parseCommand(command: String) -> (code:Int, comment:String) {
    if command == "A" {
        return (0, "Aコマンドを受信しました") } else {
        return (400, "コマンドを解釈できません: " + command) }
}
let result0 = parseCommand("A")
result0.code
result0.comment
let result1 = parseCommand("B")

result1.code // 400
result1.comment



func increment(inout value:Int) {
    value = value + 1
}
var b = 10
increment(&b) // 参照渡しであることを & をつけて明示

// ネスト関数　関数の中に関数を宣言
func calculatedString(count: Int) -> String { // 外側の関数
    var paren = ("", "") // 変数parenをタプルとして宣言
    // 数値を2乗してその前後をparenで括った文字列を返すネスト関数 
    func calc(i2: Int) -> String {
    return paren.0 + String(i2 * i2) + paren.1
    // calc()外側で宣言されているparenを使用
    }

    var result = ""
    paren = ("[", "]")
    result += calc(count - 1)
    paren = ("{", "}")
    result += calc(count)
    return result
}

// 呼び出し　ネスト関数をスコープ外から呼ぶことはできない
calculatedString(10)



