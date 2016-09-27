//
//  ViewController.swift
//  Chapter7-1
//
//  Created by 南　京兵 on 2016/09/27.
//  Copyright © 2016年 南　京兵. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        MyObjCModule().helloWorld() // SwiftからObjective-Cのメソッド呼び出し
        MyObjCModule().printString("This is ObjC method") // Swiftから引数のあるObjective-Cメソッド呼び出し
        MyObjCModule().printString(MySwiftModule.init(name: "John").name) //継承し初期化したnameをObjCのメソッドで表示
        let swiftModule = MySwiftModule.init(name: "shone") // 初期化
        swiftModule.helloWorld() // 継承したメソッドの呼び出し
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

class MySwiftModule : MyObjCModule {
    
    let name:String
    
    init(name: String) {
        self.name = name
    }
}

