//: Playground - noun: a place where people can play

import UIKit

// プロトコル
//複数採用する場合は,で区切る
protocol AlphaProtocol {
    func printStr()
}

protocol BetaProtocol {
    
}

class C: AlphaProtocol {
    func printStr() {
        print("I'm class")
    }
}

struct S:AlphaProtocol, BetaProtocol {
    func printStr() {
        print("I'm struct")
    }
}

enum E:AlphaProtocol {
    func printStr() {
        print("I'm enum")
    }
}

// イニシャライザの宣言と実装
protocol InitializeProtocol
{
    init(str:String)
}

class F:InitializeProtocol {
    required init(str:String) {
        // implementation
    }
}

// プロパティの定義
protocol GammaProtocol {
    var printString:String {get set}
    func printStr()
}

// 型メソッドの定義
protocol ClassFuncProtocol {
    static func myType() -> String
}

// 型メソッドの実装
class G:ClassFuncProtocol {
    class func myType() -> String {
        return "Class"
    }
}
struct H:ClassFuncProtocol {
    static func myType() -> String {
        return "Struct"
    }
}

enum I:ClassFuncProtocol {
    static func myType() -> String {
        return "Enum"
    }
}

// 自分自身を変更するメソッドを持つプロトコル
protocol InclementProtocol {
    var i:Int {get}
    mutating func increment()
}

class J:InclementProtocol {
    var i = 0
    func increment() {
        i += 1
    }
}

struct K:InclementProtocol {
    var i = 0
    mutating func increment() {
        i += 1
    }
}

// プロトコルの指定
protocol SomeProtocol {}
protocol Some2Protocol {}
class SomeProtocolImpl: SomeProtocol, Some2Protocol {}
var a:SomeProtocol = SomeProtocolImpl()
var collection:[SomeProtocol] = []
func someMethod(val:SomeProtocol) {}
var c:protocol<SomeProtocol, Some2Protocol> = SomeProtocolImpl()

// 実装任意メソッド @objcをつける 対象となるメソッドにはoptionalを付加する
@objc protocol OptionProtocol {
    optional func optionMethod()
}

class M:OptionProtocol {
    // optionMethod()を実装しなくてもエラーにならない
}


/*
 エクステンション
 Objective-Cのカテゴリを拡張したようなもの
 列挙型や構造体の追加もできる
 ・ インスタンスメソッドと型メソッドの追加 ・ プロトコルの継承
 ・ 算出型プロパティの追加
 ・ イニシャライザの追加
 ・ 添字の追加
 ・ ネストタイプの追加と利用
 */

// メソッドを追加
extension InclementProtocol {
    func addedMethod() {
    }
}

// 算出型の実装
struct Rect {
    var x:Double, y:Double, width:Double, height:Double
}

extension Rect {
    var top:Double {
        get {
            return y
        }
        set {
            y = newValue }
    }
    var bottom:Double {
        get {
            return y + height
        }
        set {
            y = newValue - height
        }
    }
}

extension Rect {
    static var zeroRect:Rect {
        get {
            return Rect(x: 0, y: 0, width: 0, height: 0)
        }
    }
}

var rect = Rect.zeroRect
rect.height = 100
print(rect.bottom)
rect.bottom = 200
print(rect.top)

public protocol CustomStringConvertible {
//    public var description: String { get }
    var description: String { get }
}

class A: CustomStringConvertible {
    var description = "I'm A."
}
print(A())

// クラスAにメソッド追加
extension A
{
    func p(){
        print(self)
    }
}

A().p()

// 構造体での実装
struct B: CustomStringConvertible {
    var description = "I'm B."
}
print(B())

extension B {
    func p() {
        print(self)
    }
}

B().p()
