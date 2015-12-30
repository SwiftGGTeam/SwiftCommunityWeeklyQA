//: ### What's the difference between [String!] and [String]!
//: > [点击打开问题原地址](http://stackoverflow.com/questions/34485421/whats-the-difference-between-string-and-string-swift)
import Foundation

//: ### 问题描述

/*:
楼主是新手，新手最多的几个问题之一就是对 Optional 的理解。楼主的问题是：
[String!] and [String]! 的区别是什么？

*/

//: ### 问题解答

/*: 
[String!] 是一个包含隐式解包 Optional String 的数组，数组的值可以为 nil。

[String]! 是一个隐式解包 Optional 的数组，数组类型是 String，可以直接对这个数组赋值为nil，但是因为数组元素类型是 String，所以数组元素不能为nil

*/

let list0: [String!] = ["Hello", nil, "world", nil]

let list1: [String]! = nil
let list2: [String]! = ["Hello", "world"]

//: [上一个问题](@previous)      [下一个问题](@next)
