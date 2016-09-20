//: Playground - noun: a place where people can play

import UIKit

// 整数区間の例
1...10
1..<10

for i in 0..<10 {print(i)}
1...10 ~= 10 // 10を含むのでtrue
1..<10 ~= 10 // 10を含まないのでfaulse


// 1...10 ~= 10.5 // ClosedIntervalとして解釈される
let r1 = 1...10
let r2 = 1.0...10.0
// r1 ~= 10.5
r2 ~= 10.5

// 配列
var nums = [10, 21, 35] // 適切に Array<Int>(整数の配列)と型推論される
nums[1] / 10 // 要素はInt(整数)なので「2」が計算される
var strs: [String] = ["あいう", "かきく"] // 要素がStringの配列の型は[String]


var array = [10, 21, 35, 11.1] // Double の配列と解釈される 
array[1] / 10

// 区間による配列の操作
var iOSFamily = ["iPod touch", "iPhone", "iPad", "iPad mini"]
iOSFamily[1...2] // ["iPhone", "iPad"]。1~2番目の要素からなる配列を取得

iOSFamily[1..<1] = ["iPod nano"]

// Set 集合
var set1:Set = ["a", "b", "c"]
var set2 = Set<String>() // 文字列の集合をコンストラクタで作成
var set3 = [11, 12, 13] as Set // 配列リテラルからの整数の集合を作成
var numbers = [1, 1, 3]
var set4 = Set(numbers) // 配列からコンストラクタで集合を作成(型推論)


// 要素の削除、追加
var s :Set = [1, 2, 3]
s.insert(-1) // -1を追加してsは集合{-1,1,2,3}に変化
s.insert(1) // 1はすでに要素なのでsは集合{-1,1,2,3}から変わらず
s.remove(3) // 3を削除してsは集合{-1,1,2}に変化
s.remove(3) // 3はもう要素ではないのでsは{-1,1,2}から変わらず
s.removeAll() // 全ての要素を削除してsは空集合{}に変化

var s1:Set = [1,2,3]
var s2:Set = [3,4,5]
s1.union(s2) //全て
s1.intersect(s2) //共通要素
s1.exclusiveOr(s2) //共通要素ではないのも
s1.subtract(s2) //s1にありs2にない要素

// 辞書型
var code:Dictionary<String, String> = ["US":"United States","JP":"Japan"]
let anyDict = [1:"hoge", -10:"bar"]

let codeValue = code["JP"]
let nilValue = code["IS"]
code["US"] = "America"
code["IS"] = "Iceland"
var kana = ["a":"あ", "b":"い", "c":"う"]
kana["a"]! + "をを"

var country = ["US":"United States","JP":"Japan", "IT":"Italy"]
country.removeValueForKey("IT")
country["JP"] = nil
country.removeAtIndex(code.indexForKey("US")!)
country.removeAll(keepCapacity: true)

// 構造体
struct MyRange: SequenceType {
    let start:Int, end:Int
    let interval:Int
    // SequenceType 定義のメソッド
    func generate() -> MyRangeGenerator {
        return MyRangeGenerator(range:self)
    }
}

struct MyRangeGenerator:GeneratorType {
    let range:MyRange
    var count = 0
    init(range:MyRange) {
        self.range = range
    }
    // GeneratorType 定義のメソッド 
    mutating func next() -> Int? {
    let e = range.start + range.interval * count++
    return e <= range.end ? e : nil
    }
}
// MyRangeの利用
for i in MyRange(start: 10, end: 20, interval:2) {
    print(i)
}


