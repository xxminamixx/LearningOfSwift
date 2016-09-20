//: Playground - noun: a place where people can play

import UIKit

// エラーを投げる
func sample(text: String) throws { //(1) if text.isEmpty {
    throw NSError(domain: "error", code: -1, userInfo: nil) //(2) }
    print(text)
}

enum ConvertError: ErrorType {
    case Empty
    case NotNumber(code: Int)
}

// 定義したエラータイプのエラーを投げる
func convert(text: String) throws -> Int {
    if text.isEmpty {
        throw ConvertError.Empty
    }
    guard let number = Int(text) else {
        //(1) 
        //(2)引数付きのエラー
        //(3)
        throw ConvertError.NotNumber(code: -1) //(4) 
    }
        return number
}

// NSErrorを投げる
func rethrowsSample(closure:(text: String) throws -> String) rethrows -> String { try closure(text: "") // エラーを発生させる
    return "no error"
}
func sample(text: String) throws -> String {
    if text.isEmpty {
        throw NSError(domain: "error", code: -1, userInfo: nil)
    }
    return text
}

enum ConvertErrors: ErrorType {
    case Empty
    case NotNumber(code: Int) // 引数付きのエラー
}

func converts(text: String) throws -> Int {
    if text.isEmpty {
        throw ConvertError.Empty
    }
    guard let number = Int(text) else {
        throw ConvertError.NotNumber(code: -1)
    }
        return number
    }
    do {
    let number = try convert("a")
    }
    catch ConvertError.Empty {
    print("Empty")
    }
    catch ConvertError.NotNumber(let code) {
    print("NotNumber code=\(code)")
}

/*
     defer の特徴は、宣言されている順番ではなく、
     後ろから遡って処理されることです。
     また、 エラーによってメソッドから抜ける場合は、
     その後に記述されている defer は当然処理されないので、
     処理途中であった場合でも遡って後片付けが可能です。
 */
func sample() {
    defer {
        print("defer 1")
    }
    defer {
        print("defer 2")
    }
    do {
        //　処理
    }
    catch {
        print("error")
    }
    defer {
        print("defer 3")
    }
}



