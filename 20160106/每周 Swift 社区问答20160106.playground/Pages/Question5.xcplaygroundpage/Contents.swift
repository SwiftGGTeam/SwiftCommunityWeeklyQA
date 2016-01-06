//: ### count numbers in array and order them by count in swift
//: > [点击打开问题原地址](http://stackoverflow.com/questions/34614782/count-numbers-in-array-and-order-them-by-count-in-swift)


//: ### 问题描述

/*
楼主提了一个算法问题：
1、已知一个数组，按照单个元素在数组中出现的次数作为重新排序的依据，个数多的排在前面
2、相同个数时候，元素值大的排前面

例如：
[1, 2, 2, 3, 5, 5]
经过计算得到的结果是：

[5, 5, 2, 2, 3, 1]
*/

//: ### 问题解答

/*
问题解答思路也比较简单，首先是要计算每个元素在数组中出现的次数，然后再做排序。
跟帖提供了 2 中解法，都是这样的思路。不过实现方式略有不同：

解法1：
扩展 SequenceType，因为数组的遍历是基于 SequenceType 协议的，所以自然会拥有扩展的方法 frequencies，用来计算元素在数组出现的次数。然后通过 sort 方法输出比较的结果。注意结果数组元素是元组形式。如果想变成与输入相同的结构，要做一下遍历输出。
*/


extension SequenceType where Generator.Element : Hashable {
    func frequencies() -> [Generator.Element:Int] {
        var results : [Generator.Element:Int] = [:]
        for element in self {
            results[element] = (results[element] ?? 0) + 1
        }
        return results
    }
}

let alpha = [2,8,2,6,1,8,2,6,6]
let beta = [6,6,6,2,2,2,8,8,1]

let sorted = alpha.frequencies().sort {
    if $0.1 > $1.1 { // if the frequency is higher, return true
        return true
    } else if $0.1 == $1.1 { // if the frequency is equal
        return $0.0 > $1.0 // return value is higher
    } else {
        return false // else return false
    }
}

sorted



/*:
解答2：
定义一个字典数组，专门来存储每个元素在数组出现的次数，然后用 sort 方法来输出结果：
*/
var arr1 = [2,8,2,6,1,8,2,6,6]
var arr2 = [6,6,6,2,2,2,8,8,1]

var counting = [Int: Int]()

// fill counting dictionary
for num in arr1 {
    if counting[num] != nil {
        counting[num]!++
    } else {
        counting[num] = 1
    }
}

// [6: 3, 2: 3, 8: 2, 1: 1]
print(counting)

func order(i1: Int, i2: Int) -> Bool {
    let count1 = counting[i1]
    let count2 = counting[i2]
    
    // if counting is the same: compare which number is greater
    if count1 == count2 {
        return i1 > i2
    } else {
        return count1 > count2
    }
}

// [6, 6, 6, 2, 2, 2, 8, 8, 1]
print(arr1.sort(order))
print(arr2)



//: [上一个问题](@previous)      [下一个问题](@next)
