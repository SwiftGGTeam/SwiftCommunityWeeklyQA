//: ### Question1: Can we expect that one day Swift Compiler will be written in Swift? [on hold]
//: > [点击打开问题原地址](http://stackoverflow.com/questions/34660732/can-we-expect-that-one-day-swift-compiler-will-be-written-in-swift)
//: ### 问题描述

/*:
国外的程序员比较较真，如果逻辑上说得通的表达，就要问清楚是不是这么回事，楼主的问题是：
官网上有一句话写的是，Swift 出现的目的是为了取代那些基于C语言的系列语言（C，C++，OC）。
而 Swift 编译器是使用 C++ 开发出来的，那么是不是意味着，有一天 Swift 编译器可以用 Swift 来重新实现一遍？
*/



//: ### 问题解答

/*:

在[swift-evolution](https://github.com/apple/swift-evolution/blob/master/commonly_proposed.md)刚好有一个proposal 提到了这一点，被否了。原因是 LLVM 也是基于 C++ 实现的，除非重写 LLVM，然后用 Swift 把 C++ 的 API 重新实现一遍。做这个还不如做一些优先级高的事情。
*/










//: [上一个问题](@previous)      [下一个问题](@next)
