//: ### Question4: Tuple vs Struct in Swift
//: > [点击打开问题原地址](http://stackoverflow.com/questions/35153873/tuple-vs-struct-in-swift)
//: ### 问题描述

/*:
楼主的问题：结构体也可以定义多个属性，而且看起来更加间接，为啥还有元组(Tuples)这样的东西存在？
*/




//: ### 问题解答

/*:
跟帖中提到了2点，来试图解释 Tuples 的作用，仅供参考：

* 第一点：要实现一个结构体的对象的"="操作符，那我们需要去显式的实现它，比如以下的例子：

*/



struct Foo {
    var a : Int = 1
    var b : Double = 2.0
    var c : String = "3"
}

var a = Foo()
var b = Foo()
func == (lhs: Foo, rhs: Foo) -> Bool {
    return lhs.a == rhs.a && lhs.b == rhs.b && lhs.c == rhs.c
}

a == b

/*
而在即将到来的 Swift 2.2 中，有一个关于元组的提议，已经被实现了，请参见[Tuple comparison operators](https://github.com/apple/swift-evolution/blob/master/proposals/0015-tuple-comparison-operators.md), 带来的变化是：
    如果元组的中的元素个数<=6，那么编译器会帮你解决元组比较的问题，前提是元素中的满足Equatable协议，如果满足Comparable协议，甚至是支持 <, <=, >=, > 等比较操作符。见以下例子：
*/

/* 以下代码将在 Swift 2.2 中实现，不用自己实现 */
@warn_unused_result
public func == <A: Equatable, B: Equatable, C: Equatable>(lhs: (A,B,C), rhs: (A,B,C)) -> Bool {
    return lhs.0 == rhs.0 && lhs.1 == rhs.1 && lhs.2 == rhs.2
}
/* 更多的比较 ...           */

var aa = (1, 2.0, "3")
var bb = (1, 2.0, "3")

aa == bb // true
aa.0 = 2
aa == bb // false


/*:

* 第二点：Tuples的访问可以更加灵活，可以使用 `.0`,`.1`这样的访问方式，也可以使用标签。而结构体只能访问定义的属性。

*/







//: [上一个问题](@previous)      [下一个问题](@next)
