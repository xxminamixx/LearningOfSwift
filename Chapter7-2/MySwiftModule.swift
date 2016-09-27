//
//  MySwiftModule.swift
//  Chapter7-2
//
//  Created by 南　京兵 on 2016/09/27.
//  Copyright © 2016年 南　京兵. All rights reserved.
//

import Foundation

class MySwiftClass : NSObject { // NSObjectを継承
    var message = "" // 文字列型のプロパティを宣言
    // メソッド定義ここから
    func messageRepeatBy(count : Int) -> String { // 引数countに繰り返し回数を指定
        var r = ""
        for _ in 1...count {
            r += message
            print(r)
        }
        return r
    }
}