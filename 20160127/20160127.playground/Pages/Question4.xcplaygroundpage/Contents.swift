//: ### Question4: Literals in Swift generics
//: > [点击打开问题原地址](http://stackoverflow.com/questions/34975125/literals-in-swift-generics)
//: ### 问题描述

/*:
楼主定义了一个泛型函数，但是报错了：
*/

func sign<T> (value:T) -> T {
    if value < 0.0 { // error: Binary operator '<' cannot be applied to operands of type 'T' and 'Double'
        return -1.0
    }
    if value > 0.0 {
        return 1.0
    }
    return 0.0
}

//: ### 问题解答

/*:
此问题对于看过 Swift 官方文档的同学来讲，简直是小菜一碟，这个问题感觉可以作为一个面试题，如果回答不出来，就不要在 Swift 程序界混了吧：
*/

import UIKit

protocol MyFloats : Comparable {
    init(_ value: Double)
}

extension Double : MyFloats { }
extension Float : MyFloats { }
extension CGFloat : MyFloats { }

func sign<T: MyFloats> (value:T) -> T {
    if value < T(0.0) {
        return T(-1.0)
    }
    if value > T(0.0) {
        return T(1.0)
    }
    return T(0.0)
}








//: [上一个问题](@previous)      [下一个问题](@next)
