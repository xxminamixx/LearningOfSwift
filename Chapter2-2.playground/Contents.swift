//: Playground - noun: a place where people can play

import UIKit

// タプルによる複数同時代入
var length:Int , angle:Double
(length, angle) = (100, 3.14)

// 暗黙の型変換がない例
var b = 1
var e = 0.1
// var f = b + e

//オーバーフローの例
var f = 1 << 62 // 4611686018427387904
var g = e + e // オーバーフローにより実行時にエラー発生

"あ" + "いう" // "あいう" 
[1] + [2,3] // [1,2,3]

// ポインタを比較する演算子
var h: NSString = "あいう", i = h, j: NSString = "あいう"
h == i // true(同じ文字列)
h == j // true(同じ文字列)
h === i // true(同じオブジェクトへの参照)
h === j // false(異なるオブジェクトへの参照)

// 型チェック演算子
var str:NSString = "a" // NSString型として文字列strを宣言
str is NSMutableString // true(strは実際にはNSMutableString)

//　型キャスト
var array:[Any] = [CGSize(width: 100, height: 100), "a", 1]
for item in array { // arrayの各要素itemに対しての処理
    if item is CGSize { // もし、itemの型がCGSizeであれば
        let size = item as! CGSize // CGSize型にキャストしたものをsizeとする
        var radius = max(size.width, size.height) // CGSizeのwidth、heightを利用
    }
}

// if let 構文
for item in array {
    if let i = item as? Int {
        var a = i + 10
        // aを使った処理をここで実行する }
}

//    func * (left: String, right: Int) -> String {
//        var str = ""
//        for _ in 0..<right {
//            str += left
//        }
//        return str
//    }
//    let str = "ab" * 5  // "ababababab"




infix operator ± {associativity right precedence 100}
func ± (left: UInt, right: UInt) -> UInt {
    if left > right {
        return left - right
    } else {
        return 0
    }
}
// 減算の結果が正であればそれを返す // 減算の結果が負であれば0を返す







