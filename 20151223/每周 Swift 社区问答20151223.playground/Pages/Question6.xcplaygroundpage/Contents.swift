//: ### Setting a variable to an operator function [duplicate]
//: > [点击打开问题原地址](http://stackoverflow.com/questions/34386306/setting-a-variable-to-an-operator-function)
import Foundation
import UIKit


//: ### 问题描述

/*:
楼主的问题是，既然函数可以是第一公民，那么运算符也能够是第一公民，可以当成右值赋值给一个变量。代码如下：
*/
//func +(lhs: Int, rhs: Int) -> Int { return 1}
//let op = + // results in an error

//:但是，这段代码会报错，这是为什么呢？

//: ### 问题解答

/*:
在 Swift 中，函数是第一公民，运算符也是第一公民，但是在作为右键赋值时，需要加括号包住操作符，并且要求显式定义操作符变量的类型，或者做显式转换：
*/

func +(lhs: Int, rhs: Int) -> Int { return 1}
let v = (+) as (Int,Int) -> Int
let out = v(3,4)
print(out)

let op: (Int, Int) -> Int = (+)
op(3, 4)


//:在另外一篇post中，也是类似的提问：
//: > [set-a-variable-to-the-less-than-operator-as-a-function-in-swift](http://stackoverflow.com/questions/30017400/set-a-variable-to-the-less-than-operator-as-a-function-in-swift)


//: [上一个问题](@previous)      [下一个问题](@next)
