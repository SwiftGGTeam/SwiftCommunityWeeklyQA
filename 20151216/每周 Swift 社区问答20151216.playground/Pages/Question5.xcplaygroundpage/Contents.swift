//: ### Question5:Why? insert a new element into array and it always crash!
//: > [点击打开问题原地址](https://forums.developer.apple.com/thread/27803)
import Foundation

//: ### 问题描述

// 前方高能请注意：第三行代码会崩溃
let oldNums: [Int] = [1, 2, 3, 4, 5 ,6 , 7, 8, 9, 10]
var newArray = oldNums[1..<4]
//newArray.insert(99, atIndex: 0) // <-- crash here
//newArray.insert(99, atIndex: 1) // <-- work very well



//: ### 问题解答

/*:
好吧，先看下newArray 的类型以及其他一些属性。

ps：请先把第三行以及第四行注释掉，否则因为上面出错导致playground 无法执行下去
*/

print(newArray.dynamicType) //->ArraySlice<Int>
print(newArray.indices) //->1..<4

/*:
显然 newArray 并不是一个数组，而是一个SliceArray，它的 StartIndex 是从 1 开始的，也就是通过 [1..<4] 截取的下标开始的，所以插入下标为 0 的位置，就会报错。
*/

// 修改如下：
newArray.insert(99, atIndex: newArray.startIndex)

//: 倘若你还偏执地想要从0开始 那么不妨重新搞一个数组喽，要知道 Array 有个sliceArray 的构造方法。请参考以下代码

let oldNums_new: [Int] = [1, 2, 3, 4, 5 ,6 , 7, 8, 9, 10]
var sliceArray_new = oldNums_new[1..<4]
var newArray_new = Array(oldNums_new[1..<4])

print(newArray_new.dynamicType)					//array
print(newArray_new.indices)							//0..<3 数组下标为0 1 2
newArray_new.insert(99, atIndex: 0)			//在0位置插入一个元素
print(newArray_new.dynamicType)         //array
print(newArray_new.indices)             //0..<4 数组下标为0 1 2 3
newArray_new.insert(99, atIndex: 1)			//在1位置插入一个元素
print(newArray_new.dynamicType)
print(newArray_new.indices)             //0..<5 数组下标为0 1 2 3 4

//: [上一个问题](@previous)      [下一个问题](@next)
