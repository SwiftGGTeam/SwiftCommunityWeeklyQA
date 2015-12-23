//: ### Question5:Generic Random Function in Swift
//: > [点击打开问题原地址](http://stackoverflow.com/questions/34387250/generic-random-function-in-swift)
import Foundation

import Foundation
import UIKit


//: ### 问题描述

//: 问题很简单，如何实现随机数生成的泛型表达，支持 Int， Float，Double 和 CGFloat？


//: ### 问题解答

//: 首先，可以分部对这几种类型做扩展，来生成随机数：


public extension Int {
    /// SwiftRandom extension
    public static func random(lower: Int = 0, _ upper: Int = 100) -> Int {
        return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
    }
}

public extension Double {
    /// SwiftRandom extension
    public static func random(lower: Double = 0, _ upper: Double = 100) -> Double {
        return (Double(arc4random()) / 0xFFFFFFFF) * (upper - lower) + lower
    }
}

public extension Float {
    /// SwiftRandom extension
    public static func random(lower: Float = 0, _ upper: Float = 100) -> Float {
        return (Float(arc4random()) / 0xFFFFFFFF) * (upper - lower) + lower
    }
}

public extension CGFloat {
    /// SwiftRandom extension
    public static func random(lower: CGFloat = 0, _ upper: CGFloat = 1) -> CGFloat {
        return CGFloat(Float(arc4random()) / Float(UINT32_MAX)) * (upper - lower) + lower
    }
}

Int.random()


//: 也可以使用扩展协议来实现，不过 Int 和 Float，Double，CGFloat的协议不太一样：


protocol FloatingPointArithmeticType: FloatingPointType {
    func /(lhs: Self, rhs: Self) -> Self
    // etc
}

extension Double: FloatingPointArithmeticType { }
extension Float: FloatingPointArithmeticType { }
extension CGFloat: FloatingPointArithmeticType { }

extension FloatingPointArithmeticType {
    static func rand() -> Self {
        let num = Self(arc4random())
        let denom = Self(UInt32.max)
        // this line won’t compile:
        return num / denom
    }
}

// so these now work
let d = Double.rand()  // etc




public extension Int {
    /// SwiftRandom extension
    public static func rand(lower: Int = 0, _ upper: Int = 100) -> Int {
        return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
    }
}

Int.rand(-100, 200)



//: [上一个问题](@previous)      [下一个问题](@next)
