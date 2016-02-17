//: ### Question3: Arrays of Int arrays. Storing duplicates in order only
//: > [点击打开问题原地址](http://stackoverflow.com/questions/35328405/arrays-of-int-arrays-storing-duplicates-in-order-only)
//: ### 问题描述

/*:
楼主问题是：给定一个数组，输出一个二维数组，连续相同的数组组成子数组。
比如：
输入：[7, 7, 3, 2, 2, 2, 1, 7, 5, 5]
输出：[[7, 7], [3], [2, 2, 2], [1], [7], [5, 5]]
楼主给出了常规的实现（不过跑不起来，要改一下实现），见以下代码：
*/

let mainArray = [7, 7, 3, 2, 2, 2, 1, 7, 5, 5]
var oldNum = mainArray[0]
var array = [[Int]]()
for var i = 0; i < mainArray.count; i++ {
    var columnArray = Array<Int>()
    for var j in 0...9 {
        if oldNum == mainArray[j]{
            columnArray.append(mainArray[j])
        }
        else {
            array.append(columnArray)
            //j += 1
            break;
        }
                oldNum = mainArray[j];
        j += 1
    }
   
}
array //输出错误的结果

//正确的常规做法应该是：

array = [[Int]]()
var columnArray = Array<Int>()
for var i = 0; i < mainArray.count; i++ {
    if oldNum == mainArray[i]{
        columnArray.append(oldNum)
    } else {
        array.append(columnArray)
        columnArray = Array<Int>()
        oldNum = mainArray[i]
        i--
    }
}
array.append(columnArray) // 补齐最后的部分


//: ### 问题解答

/*:
来看看如何用函数式编程来解决这个问题吧：
*/
let result = mainArray.reduce([[Int]]()) { (var result, num) -> [[Int]] in
    if var lastSequence = result.last where lastSequence.first == num {
        result[result.count-1].append(num)
    } else {
        result.append([num])
    }
    return result
}

result








//: [上一个问题](@previous)      [下一个问题](@next)
