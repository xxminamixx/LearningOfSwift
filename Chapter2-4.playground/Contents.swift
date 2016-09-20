//: Playground - noun: a place where people can play

import UIKit
import Foundation

// 文字列の結合
let hello = "Hello"
let swift = "Swift"
let helloSwift = hello + " " + swift
print(helloSwift)
var enjoy = "Difficult"
enjoy += swift
print(enjoy)

// 文字列中の変数利用
let add1 = 2
let add2 = 4
let sum = add1 + add2;
let message = "\(add1) + \(add2) = \(sum)"
print(message)

//var swift:String = "Swift"
//let heart:Character = "♥"
//swift += heart // エラー swift.append(heart)
//print(swift)

// 文字列の比較
let hoge = "hoge"
let fuga = "fuga"
let bar = "hoge"
let check1 = hoge
let check2 = hoge
let check3 = fuga

// 文字列が同一は判定
let check4 = hoge == fuga
let check5 = hoge == bar
let check6 = fuga == "fuga"

//　文字の大小を判定　基本的には辞書順
let isBigHoge = hoge > fuga

// 空の変数判定　nilは空ではないためisEnptyで判定するとエラーが発生する
let messages = "String"
let emptyCheck = messages.isEmpty
let title = ""
let emptyCheck2 = title.isEmpty
let contents = "Hello"
let emptyCheck3 = contents.isEmpty

let aisatsu = "こんにちは! "
let count = aisatsu.characters.count

// 文字列の先頭 ・末尾の比較
let prefixHo = hoge.hasPrefix("ho")
let prefixFu = hoge.hasPrefix("fu")
let suffixGe = hoge.hasSuffix("ge")
let suffixGa = hoge.hasSuffix("ga")
// true
// false
// true
// false

let upper = hoge.uppercaseString // "HOGE" 
let lower = hoge.lowercaseString // "hoge"

// インデックスを移動して文字型を取得
let name = "Yukichi! ♥ "
// 最初の文字
name[name.startIndex] // "Y"
// 最初の文字からインデックスを1つ進めた文字 
name[name.startIndex.successor()] //"u" 
// 最後の文字
name[name.endIndex.predecessor()] //"♥" 
// 最初の文字から5 番目の文字 
name[name.startIndex.advancedBy(5)] //"h"

// ループでインデックス内の文字を出力
for index in name.characters.indices {
    print(name[index])
}