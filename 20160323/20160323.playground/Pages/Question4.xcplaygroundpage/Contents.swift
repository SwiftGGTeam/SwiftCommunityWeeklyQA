//: ### Question5: Defer block is not executed
//: > [点击打开问题原地址](http://stackoverflow.com/questions/36169415/defer-block-is-not-executed)
//: ### 问题描述

/*:
 以下代码中，defer 里面的打印信息不会输出。作者比较疑惑。2个例子都是这样的。
*/
func A() {
    print ("Hello")
   
    guard 1 == 2 else {
        return
    }
    defer {
        print ("World")
    }
}

A()

import Foundation

enum MyError: ErrorType {
    case TriggerDefer
}

func throwsMyError() throws {
    let myzero = Int(arc4random_uniform(1))
    
    guard myzero > 1 else {
        throw MyError.TriggerDefer
    }
}

func A1() throws {
    try throwsMyError()
    
    defer {
        print ("Hello World")
    }
}

try A1()

//: ### 问题解答

/*:
问题出在 defer 出现的位置，上例中，guard 代码段里面的 return 已经执行了。后面的 defer 语句不会执行。正确的答案见以下代码, 就可以在控制台输出中看到 Hello World 了
*/

func A3() {
    print ("Hello")
    defer {
        print ("World")
    }
    guard 1 == 2 else {
        return
    }
}

/*:
 记住：defer 语句写到函数开头就好了。
 */
A3()





//: [上一个问题](@previous)      [下一个问题](@next)
