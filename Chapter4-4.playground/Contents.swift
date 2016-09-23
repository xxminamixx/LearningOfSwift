//: Playground - noun: a place where people can play

import UIKit

// Optional Chaining
/**
 - Implicitly Unwrapped OptionalまたはOptionalの変数に?はOptional Chaining
 - 変数に!はアンラップ
 - 型に!はImplicitly Unwrapped Optional
 - 型に?はOptional
*/

class Teacher {
    var classroom:Classroom?
}

class Classroom {
    var numberOfStudents = 30
}

// nilチェックせずにアンラップ
let teacher = Teacher()
//let studentsCount = teacher.classroom!.numberOfStudents // Abort
//print(" 先生は \(studentsCount) 人のクラスを担任している。")

// Optional Bindingでプロパティの値を取り出す
if let classroom = teacher.classroom {
    let studentsCount = classroom.numberOfStudents
    print(" 先生は \(studentsCount) 人のクラスを担任している。")
    } else {
    print(" 先生は担任していない。")
}

// Optional Chainingで取り出す
// Int?型となりnilが代入される
let studentsCount = teacher.classroom?.numberOfStudents

// Optional Chainingの結果をOptional Binding
if let studentsCount = teacher.classroom?.numberOfStudents {
    print(" 先生は \(studentsCount) 人のクラスを担任している。")
} else {
    print(" 先生は担任していない。")
}

// Optional Chainingに値がある場合
teacher.classroom = Classroom()
if let studentsCount = teacher.classroom?.numberOfStudents {
    print(" 先生は \(studentsCount) 人のクラスを担任している。")
} else {
    print(" 先生は担任していない。")
}

// Optional Chainingを用いた代入方法
var someInt:Int? = 10
someInt? = 20
var nilInt:Int? = nil
nilInt? = 20

//代入時はOptionail型ではなく元の型
//teacher.classroom?.numberOfStudents = someInt // エラー

// 無視されるのは代入処理のみ
var i:Int? = nil
var j:Int  = 0
i? = j++
print(j)

// Swiftでのvoid型の定義は空のタプルで定義されているため返り値はある
typealias Void = ()

/*
 Optional Chaining の途中で nil が入ると、nil の時点で処理が中断され、
 戻り値が nil となる特性がある。正常に実行された場合の Void 型のメソッドは、
 空タプルを戻り値とし て持つため、処理の中断を nil チェックで確認できる。
 */
extension Classroom {
    func printCount() -> Void {
        print("生徒数: \(numberOfStudents)") }
}

// nilチェックによる型チェックがvoid型の場合
if teacher.classroom?.printCount() != nil {
    print("printCount() を実行 ")
} else {
    print("printCount() を無視 ")
}

//if ([self.delegate respondsToSelector:@selector(optionalMethodForMe:)]) {
//    [self.delegate optionalMethodForMe:self];
//}


/*
 Optional 型は nil に関する問題を解決する 1 つの方法。
 Swift では通常の型には nil が代入できず、またnilに対して処理を行うと、
 Objective-C とは異なりアボートする。そのためnilを安全に処理することが求められる。
 Swift で nil を扱うために「?」と「!」を駆使する。
 「?」と「!」にはそれぞれ異なる役目 が与えられており、
 また型と変数のどちらに付与するかで異なった意味を持つ。
 */
