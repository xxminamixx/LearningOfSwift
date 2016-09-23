//: Playground - noun: a place where people can play

import UIKit


// ジェネリック
/*
 class IntPair {
    let val1:Int
    let val2:Int
    init(val1:Int, val2:Int) {
        self.val1 = val1
        self.val2 = val2
    }
 }
 型の分だけ同じ動作をするクラスを作成しなければならない
 */

//クラス名の後に<仮型>とすることでクラス内で<>の中に記述した仮型を使用できる
class Pair<T> {
    let val1:T
    let val2:T
    init(val1:T, val2:T) {
        self.val1 = val1
        self.val2 = val2
    }
}

let intPair1 = Pair(val1:10, val2:20) // Int型を代入
let doublePair = Pair(val1:0.5, val2:10.0) // Double型を代入

// ジェネリック関数
// 関数名の後に仮型<>を指定する
func myFunction<T>(param:T) -> T {
    return param
}

let a = 10

print(myFunction(a))

let str = "hello"
print(myFunction(str))

let intPair2 = Pair(val1: 10, val2: 15)
print(intPair2.val1) // 戻り値はInt 型
print(intPair2.val2) // 戻り値はInt 型
let val1 = 10, val2 = 1.0
// イニシャライザの中で同じT型に指定されているため片方にIntを入れた時点で型が固定される
// let invalidPair = Pair(val1: val1, val2: val2) // コンパイルエラ-

//型指定のないイニシャライザの呼び出し
class AGenericClass1<T> {
}

class AGenericClass2<T,U,V> {
}

let obj1 = AGenericClass1<Int>()
let obj2 = AGenericClass2<Int, Double, Int>()

// extentionする際も仮型が利用できます。
//extension Pair {
//    func tuple()->(T, T) {
//        return (val1, val2)
//    }
//}

// 比較演算子<と>が比較対象にConparableプロトコルの実装を要求しているためComparableなしではコンパイルエラーとなる
class PairConpare<T:Comparable> {
    let val1:T
    let val2:T
    
    var minValue:T {
        get{
            return (val1 < val2) ? val1 : val2
        }
    }
    
    var maxValue:T {
        get{
            return (val1 > val2) ? val1 : val2
        }
    }
    
    init(val1:T, val2:T) {
        self.val1 = val1
        self.val2 = val2
    }
}

// プロトコルでのネジェリック
// プロトコルではジェネリックは宣言できない
// だが、エイリアスを使うことでプロトコル内で一時的な型を宣言できる
protocol Queue {
    typealias ItemType
    mutating func append(item:ItemType)
    var count:Int {get}
    mutating func shift() -> ItemType
}

// プロトコルの実装
struct IntQueue: Queue {
    var items:[Int] = [Int]()
    mutating func append(item: Int) {
        items.append(item)
    }
    var count:Int {
        return items.count
    }
    mutating func shift() -> Int {
        return items.removeAtIndex(0)
    }
}

// 関連型とwhere文を用いた型制約
// Q1とQ2を宣言し、Q2はQ1のItmeTypeと一致しなければならない
func appendQueue<Q1:Queue, Q2:Queue where Q1.ItemType == Q2.ItemType>
    (inout queue:Q1, inout append:Q2) {
    let length = append.count
    for _ in 0..<length {
        queue.append(append.shift())
    }
}
