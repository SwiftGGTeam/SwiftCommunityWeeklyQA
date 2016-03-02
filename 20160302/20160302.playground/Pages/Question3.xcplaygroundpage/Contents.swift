//: ### Question3: Swift Define Array with more than one Integer Range one liner
//: > [点击打开问题原地址](http://stackoverflow.com/questions/35717863/swift-define-array-with-more-than-one-integer-range-one-liner)
//: ### 问题描述

/*:
可以用以下代码定义一个数组，然后插入一个元素到头部：

*/

var array: [Int] = Array(1...24)
array.insert(9999, atIndex: 0)


/*
楼主的问题是，能否把这2句代码写成一句代码，类似以下这样的代码。。虽然是错的，想法倒是挺好的：
*/

//var array: [Int] = Array(9999...9999,1...24)



//: ### 问题解答

/*:
楼下提供了以下几种方式任君选择：
*/


let arr = [1...5, 11...15].reduce([]) { $0.0 + Array($0.1) }

arr

var arr1 = Array([1...5, 11...15].flatten())
arr1

let arr2 = Array(10 ... 14) + Array(1 ... 24)

arr2

let arr3 = [10 ... 14, 1 ... 4].flatMap { $0 }

arr3

//: [上一个问题](@previous)      [下一个问题](@next)
