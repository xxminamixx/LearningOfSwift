//: Playground - noun: a place where people can play

import UIKit

/*
 switch 文を利用すると、Swift では柔軟な条件分 岐が可能。
 パターンマッチングや型マッチング、タプル、値束縛などを組み合わせられる。
 Swiftのswitch文では、整数型に限らずあらゆる型の値が利用できる。
 例えば、次の通り、 Double 型で switch 文を実行することが可能。
 */

let dbl = 1.5
switch dbl{
case 1.4:
    print("1.4")
case 1.5:
    print("1.5")
case 1.6:
    print("1.6")
default:
    break
}

// 範囲指定のswitch文
switch dbl {
case 0..<1:
    print("0~ 1")
case 1..<2:
    print("1 ~ 2")
case 2..<3:
    print("2 ~ 3")
default:
    break
}

// 文字列指定のswitch文
// カンマで区切ることで複数の条件を指定可能
var month = "August"
switch month {
case "April", "May", "June":
    print("1Q")
case "July", "August", "September":
    print("2Q")
case "October", "November", "December":
    print("3Q")
case "January", "February", "March":
    print("4Q")
case _:
    break
}

// 単なる文字列マッチングではなくより複雑な条件を指定する場合はwhere文を用いる
switch month {
case _ where month.hasSuffix("ary"):
    print("1月 2月")
case _ where month.hasSuffix("ber"):
    print("9月 10月 11月 12月")
default: break
}

/*
 switch 文と列挙体は特に親和性が高く、式が列挙体である場合、本来は記述すべき列挙体名をcase文では省略できる。
 また、網羅性も自動的にチェックされるため、列挙体の要素すべ てをケースに記述した場合は、default 文の省略も可能。
 */
enum Month {
    case January, February, March, April, May, June,
    July, August, September, October, November, December
}

let months = Month.December

switch months {
case .March, .April, .May:
    print("Spring")
case .June, .July, .August:
    print("Summer")
case .September, .October, .November:
    print("Autumn")
case .December, .January, .February:
    print("Winter")
}

// 関連値マッチング
enum Status {
    case Fine
    case Error(code: Int)
}
let status = Status.Error(code: 2)
switch status {
case .Fine:
    print("status is fine")
case .Error(let code) where code < 4:
    print("error")
case .Error:
    print("fatal error")
}

// 遷移先のViewControllerの型によって条件を分岐
//class ViewController: UIViewController {
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//    switch segue.destinationViewController {
//    case is AViewController:
//        let vc = segue.destinationViewController as! AViewController
//    // task for AViewController
//    case is BViewController:
//        let vc = segue.destinationViewController as! BViewController
//    // task for BViewController
//    default:
//        break
//        }
//    }
//}

// as演算子による値束縛マッチング
//class ViewController: UIViewController {
//    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
//        switch segue.destinationViewController {
//        case let vc as AViewController:
//        // task for AViewController
//        case let vc as BViewController:
//        // task for BViewController
//        default:
//            break
//        }
//    }
//}

/*
 switch のマッチングは ~= 演算子で比較されている
 */

struct Rect {
    var top: Double
    var left: Double
    var width: Double
    var height: Double
}

struct Point {
    var x: Double
    var y: Double
}
// Rect型とPoint型のパターンマッチングはできない
//let p = Point(x: 100.0, y: 100.0)
//switch p {
//case Rect(top: 0.0, left: 0.0, width: 200.0, height: 200):
//    print("in x: positive, y:positive rect")
//case Rect(top: -200.0, left: 0.0, width: 200.0, height: 200):
//    print("in x: positive, y:negative rect")
//case Rect(top: 0.0, left: -200.0, width: 200.0, height: 200):
//    print("in x: negative, y:positive rect")
//case Rect(top: -200.0, left: -200.0, width: 200.0, height: 200):
//    print("in x: negative, y:negative rect")
//default:
//    print("out of rect")
//}
// エラーとなる

