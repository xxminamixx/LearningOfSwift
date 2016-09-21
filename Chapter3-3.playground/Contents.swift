//: Playground - noun: a place where people can play

import UIKit

/*
 クラスと構造体での大きな違いはインスタンスの管理方法です。
 クラスのインスタンスを関数や変数などに格納する際は、
 参照型(reference type)として 渡され、コピーはされません。
 クラスのインスタンスは参照カウンタがインクリメントされ、
 すべての変数からの参照から外れた状態、
 すなわち参照カウンタが 0 になった時点でインスタンスはリリースされます。
 */


// クラスを使った処理例
class PersonClass {
    var name = String()
}

let person = PersonClass()
let person2 = person
person.name = "Swift"
print(person.name)
print(person2.name)


// 構造体を使った処理例
struct PersonStruct {
    var name = String()
}
var person3 = PersonStruct(name: "Swift")
let person4 = person3
person.name = "Jobs"
print(person.name)
print(person2.name)


// クラス
class FooClass { }

// クラスのインスタンス生成
let foo = FooClass()

// 構造体
struct BarStructure { }

// 構造体のインスタンス生成
let bar = BarStructure()


// 構造体
struct FooStructure {
    var bar: Int
}

var fuga = FooStructure(bar: 1)
fuga.bar = 5

// クラス
class BarClass {
    var foo: Int
    init(foo : Int) { self.foo = foo }
}

let hoge = BarClass(foo: 6)
hoge.foo = 10

// 算出型プロパティ
struct hogeStructure {
    var start: Int
    var end: Int
    var half: Int {
        get {
            return (end - start)/2 + start
}
set {
    end = newValue * 2
}
}
var multiplication: Int {
    return start * end
}
// get、set の省略例 0
}
var baz = hogeStructure(start: 10, end: 20)
print(baz.half)
baz.half = 50
print(baz.half)
print(baz.multiplication)

// 型プロパティ
// static をつけることでインスタンス生成せずともアクセス可能
struct SomeStructure {
    static var typeProperty = 1
    static var typeProperty2: String {
        return "typeProperty2"
    }
}

class SomeClass {
    static var typeProperty = 1
    static var typeProperty2: String {
        return "typeProperty2"
    }
}

SomeStructure.typeProperty = 15
SomeClass.typeProperty = 20
print(SomeStructure.typeProperty)
print(SomeStructure.typeProperty2)
print(SomeClass.typeProperty)
print(SomeClass.typeProperty2)

// 遅延格納型参照プロパティ
// lazyをつけて変数を宣言すると参照されたときに値のセットが行われる
// 少しでもインスタンス生成速度を上げたい時に有効
// クラスの場合 
class PetClass {
    lazy var name: String = "Yukichi"
}

let pet = PetClass() // この時点でpet.nameは不定
print(pet.name) // "Yukichi" ここで初めてデフォルト値がセットされる 

// 構造体の場合
struct PetStructure {
    lazy var name: String = "Yukichi"
}
var petStruct = PetStructure() // petStruct.nameは不定 
print(petStruct.name)

// lazyプロパティの注意点
class WaitClass {
    init() {
        sleep(3) // 3秒待つ 
    }

    func description()->String {
        return "PetClass description"
    }
}

class LazyClass {
    lazy var waitClass = WaitClass()
}
    let lazyClass = LazyClass()
    lazyClass.waitClass // 生成に3秒要する
    print(lazyClass.waitClass.description())
    lazyClass.waitClass
    print(lazyClass.waitClass.description()) //即座に生成

// プロパティの監視
//willSetは代入前に呼ばれ、didSetは代入後に呼ばれる
class bazClass {
    var name: String {
        willSet {
            print("willSet old name = \(name)")
            print("willSet new name = \(newValue)")
        }
        didSet {
            print("didSet old name = \(oldValue)")
        }
    }
    init() {
        name = "Yukichi"
    }
}

// クラスのインスタンスメソッド
var qux = bazClass()
qux.name = "Kamekichi"
print(qux.name)

class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func incrementBy(amount: Int, numberOfTimes: Int) {
        count += amount * numberOfTimes
    }
    func reset() {
        count = 0
    }
    func resetBy(count count: Int) {
        self.count = count
    }
}
let counter = Counter()
counter.increment()
counter.incrementBy(12, numberOfTimes: 3)
counter.reset()
counter.resetBy(count: 10)

//構造体での再現
struct CounterStructure {
    var count = 0
    mutating func increment() {
        count += 1
    }
    mutating func incrementBy(amount: Int, numberOfTimes: Int) {
        count += amount * numberOfTimes
    }
    mutating func resetBy(count count: Int) {
        self.count = count
    }
}

var counterStruct = CounterStructure()
counterStruct.increment()
counterStruct.incrementBy(20, numberOfTimes: 5)
counterStruct.resetBy(count: 100)

// 構造体インスタンスの再構成
struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy(x x: Double, y: Double) {
        self = Point(x: self.x + x, y: self.y + y)
    }
}

var point = Point()
point.moveBy(x:10.5, y:20.6)
print("x=\(point.x) y=\(point.y)")

// 型メソッド
// Objective-Cのクラスメソッドと同じ
// クラスの中のメソッド名にstaticを追加する
class AnyClass {
    static func staticSomeTypeMethod() {
        print("staticSomeTypeMethod")
    }
    class func classSomeTypeMethod() {
        print("classSomeTypeMethod")
    }
}

struct AnyStructure {
    static func staticSomeTypeMethod() {
        print("staticSomeTypeMethod")
    }
}

// 呼び出し
AnyClass.staticSomeTypeMethod()
AnyClass.classSomeTypeMethod()
AnyStructure.staticSomeTypeMethod()


// 添字
// subscriptを使って独自のアクセスが可能
struct CalcStructure {
    let baseInt: Int
    subscript(index: Int)->Int {
        return baseInt + index
    }
}

let calcStructure = CalcStructure(baseInt: 10)
print(calcStructure[5])

class CalcClass {
    var baseInt: Int
    init(baseInt: Int) {
        self.baseInt = baseInt
    }
    subscript(index: Int)->Int {
        get {
            return self.baseInt + index
        }
        set {
            baseInt += index * newValue
        }
    }
}

let calcClass = CalcClass(baseInt: 10)
calcClass[5] = 10
print(calcClass.baseInt)
print(calcClass[196])

// 継承
// Objective-Cのように多重継承をサポートしていない
// イニシャライザも特定の条件が満たされたもののみ継承される
class quuxClass
{
    
}

// PeopleClassを継承したcorgeClass
class corgeClass : quuxClass { }

// オーバーライド
// スーパークラスのdescriptionメソッドをオーバーライド
class graultClass: CustomStringConvertible {
    var baseInt: Int
    init(baseInt: Int) {
        self.baseInt = baseInt
    }
    func append(index: Int) -> Int {
        return baseInt + index
}

    var description: String {
        return "super class \(baseInt)"
    }
}

class SubCalcClass: graultClass {
    override var description: String {
        return "sub class \(baseInt)"
    }
}

// スーパークラスでメソッド・プロパティを呼ぶ 
let superClass = graultClass(baseInt: 5)
let superAppend = superClass.append(10)
let superString = superClass.description
print(superAppend)
print(superString)

// サブクラスでメソッド・プロパティを呼ぶ
let subClass = SubCalcClass(baseInt: 8)
let subAppend = subClass.append(2)
let subString = subClass.description
print(subAppend)
print(subString)


// 継承やオーバーライドを禁止するクラスにはfinalをつける
// メソッドにfinalをつけることも可能
final class FirstClass { }
// class SecondClass: FirstClass { } // エラーとなる


// イニシャライザ・デイニシャライザ
// 格納型プロパティの初期化
class SimpleClass {
    var name: String
    init() {
        name = "Yukichi"
    }
}

struct SimpleStruct {
    var name: String
    init() {
        name = "Yukichi"
    }
}

let simpleClass = SimpleClass()
print(simpleClass.name)
var simpleStruct = SimpleStruct()
print(simpleStruct.name)

// 構造体はプロパティにデフォルト値を設定していない場合
// 自動的にプロパティ名のついたパラメータのイニシャライザが生成される
struct GarplyStruct {
    var name: String
}

var garplyStruct = GarplyStruct(name: "Yukichi")
print(garplyStruct.name)

// デフォルト値設定によるイニシャライザの省略
class WaldoClass {
    var name = "Yukichi"
    var type:String?
}

struct WaldoStruct {
    var name = "Yukichi"
}

struct OptionalStruct {
    var name = "Yukichi"
    var type:String?
}

let waldoClass = WaldoClass()
print(waldoClass.name)
var waldoStruct = WaldoStruct()
print(simpleStruct.name)
var optionalStruct = OptionalStruct(name: "Jobs", type: "Human")
print(optionalStruct.name)

// クロージャーを使った初期化
class FredClass {
    let names:[String] = {
        var array:[String] = Array()
        for i in 0...3 {
            array.append("Yukichi_\(i)")
        }
        return array
    }()
}

let fred = FredClass()
for name in fred.names {
    print(name)
}

class PlughClass {
    let name: String
    let country = "Japan"
    init() {
        self.name = "Kamekichi"
    }
}

let plugh = PlughClass()
print(plugh.name)
print(plugh.country)

// 構造体へ複数のイニシャライザを定義
// 構造体では特別な記述をしなくても複数のイニシャライザを定義できる
struct MultipleInitStruct: CustomStringConvertible {
    var name = "Yukichi"
    var type = "Dog"
    init() {}
    init(name: String, type: String) {
        self.name = name
        self.type = type
    }
    init(humanName: String) {
        self.init(name: humanName, type: "Human")
    }
    var description: String {
        return "name=\(name), type=\(type)"
    }
}

var sample1 = MultipleInitStruct(humanName: "Jobs")
print(sample1.description)

// クラスで複数のイニシャライザを定義
// 必須ではないイニシャライザにはconvenienceをつける
class MultipleInitClass: CustomStringConvertible {
    var name = "Yukichi"
    var type = "Dog"
    init() {}
    init(name: String, type: String) {
        self.name = name
        self.type = type
    }
    convenience init(humanName: String) {
        self.init(name: humanName, type: "Human")
    }
    var description: String {
        return "name=\(name), type=\(type)"
    }
}

var sample2 = MultipleInitClass(humanName: "Jobs")
print(sample2.description)


// 外部変数を持つイニシャライザ
class ParameterClass {
    var code: Int
    var name: String
    init(code paramCode: Int, name paramName: String) {
        code = paramCode
        name = paramName
    }
}

// 外部引数名を省略できるが、どの変数に代入しているか分かりにくくなるため基本的に省略しない
let paramClass = ParameterClass(code: 3, name: "Yukichi")

class PosisionClass {
    var x: Double, y: Double, z: Double
    init(_ paramX: Double, _ paramY: Double, _ paramZ: Double) {
        x = paramX; y = paramY; z = paramZ
    }
}

let posision = PosisionClass(10.0, 20.0, 1.0)

class ElectricFan {
	    var maxWindLevel = 0
    var description: String {
        return "maxWindLevel = \(maxWindLevel)"
    }
}

// イニシャライザのオーバーライド
let electricFan = ElectricFan()
print("electricFan : \(electricFan.description)")

class PowerfulFan: ElectricFan {
    override init() {
        super.init()
        maxWindLevel = 5
    }
}

let powerfulFan = PowerfulFan()
print("powerfulFan : \(powerfulFan.description)")

/*
 サブクラスは通常、スーパークラスのイニシャライザを自動で継承しないが、
 下記の条件が満たされた場合、スーパークラスのイニシャライザが自動で継承される。
 ・ルール1 サブクラスのプロパティにデフォルト値の指定があり、指定イニシャライザを定義していない場合、自動的にスーパークラスの指定イニシャライザをすべて継承。
 ・ルール2 サブクラスがスーパークラスの指定イニシャライザをすべてオーバーライドで実装を提供している場合、自動的にスーパークラスのコンビニエンスイニシャライザをすべて継承。
 */


/* 
 通常イニシャライザはnilを返せないが、何らかの理由でイニシャライズに失敗した場合を想定して
 明示的にnilを返すフェイラブルイニシャライザを定義できる
 */
struct SomeStruct {
    var name:String
    init?(newName:String?) {
        guard let value = newName else {
            return nil }
        self.name = value
    }
}

// クラスのフェイラブルイニシャライザ
class XyzzyClass {
    var name = "" // 初期値を代入 
    init?(newName: String?){
        guard let value = newName else {
        return nil
    }
        self.name = value
    }
}

let xyzzy1 = XyzzyClass(newName: nil)
let xyzzy2 = XyzzyClass(newName: "Good!")


//デイニシャライザ
/*
 Objective-Cのdeallocと同様にクラス内で使われたリソースの解放を行う。
 デイニシャライザは明示的に呼び出すことはできない。
 */
class ThudClass {
    init() {}
    deinit {
        print("deinit is called")
    }
}

var sample: ThudClass? = ThudClass()
sample = nil // ここで解放

// アクセスコントロール
/*
 public:全ての場所からアクセス可能。主にクラスの公開プロパティなどで使われる。
 internal:定義しているモジュールの中のみアクセス可能。モジュール外からのアクセスはできない。
 private:定義しているファイル内のみアクセス可能。処理を明示的に隠蔽するために使われる。
 */

public class PublicClass {
    var proparty1 = 1
    func publicMethod() {}
    private func privateMethod() {}
    internal func internalMethod() {}
}
internal class InternalClass {
    var proparty1 = 1
    func publicMethod() {}
//    public func publicMethod() {} // エラー
    private func privateMethod() {}
    internal func internalMethod() {}
}
private class PrivateClass {
    var proparty1 = 1
    func publicMethod() {}
//    public func publicMethod() {}　// エラー
//    internal func internalMethod() {}　// エラー
}


// 循環参照の対策
// weakによる参照で解放される
class MyClass {
    weak var employee: EmployeeClass?
    init() {}
    deinit {
        print("PersonClass is being deinitialized")
    }
}
class EmployeeClass {
    weak var person: PersonClass?
    init() {}
    deinit {
        print("EmployeeClass is being deinitialized")
    }
}

var human: MyClass?
var employee: EmployeeClass?
human = MyClass()
employee = EmployeeClass()
human?.employee = employee
human = nil
employee = nil


// 列挙体
//enumで宣言してcaseで１行ずつ定義
enum Dog {
    case Pug
    case FrenchBulldog
    case BostonTerrier
}

enum Authority {
    case Admin, Technical, Sales, Finance
}

var category = Dog.FrenchBulldog