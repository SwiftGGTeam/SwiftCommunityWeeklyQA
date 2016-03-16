//: ### Question1: Hiding Hashable in Swift
//: > [点击打开问题原地址](http://stackoverflow.com/questions/35953203/hiding-hashable-in-swift)
//: ### 问题描述

/*:
楼主的问题是，能不能定义一个字典，类型是：`[Hashable: Any]`，其中`Hashable`是一个协议。显然是不行的，楼主尝试了一下采用折中的办法，定义了一个结构体，遵从协议`Hashable`, 内部包含了`Any`类型的值。
*/

struct Hash: Hashable {
    private let value: Any
    private let equals: Hash -> Bool
    
    init<H: Hashable>(_ h: H) {
        self.value = h
        self.hashValue = h.hashValue
        self.equals = { ($0.value as! H) == h }
    }
    
    let hashValue: Int
}

func ==(lhs: Hash, rhs: Hash) -> Bool {
    return lhs.equals(rhs)
}

//
//: ### 问题解答

/*:
Swift 中不支持使用协议来作为字典的key，所以以下代码会报错：
*/


struct HashyStruct : Equatable, Hashable {
    let smallNumber: UInt16
    var hashValue: Int {
        return Int(smallNumber)
    }
}
func ==(lhs: HashyStruct, rhs: HashyStruct) -> Bool {
    return lhs.smallNumber == rhs.smallNumber
}


class HashyClass : Equatable, Hashable {
    let number: UInt64
    init(number: UInt64) {
        self.number = number
    }
    var hashValue: Int {
        return Int(number)
    }
}
func ==(lhs: HashyClass, rhs: HashyClass) -> Bool {
    return lhs.number == rhs.number
}


let anyHashable: [Hashable:Any] = [HashyStruct(smallNumber: 5) : "struct", HashyClass(number: 0x12345678):"class"]

/*:
从另外一个角度想，即使 Swift 支持这样的语法，那么就会出现一个问题，如果判断2个key是否一致？因为一致的情况下，赋值新值就会产生覆盖行为。这样就要进行向下转型成具体的结构体或者类进行比较。显然是不合理的。

*/


//: [上一个问题](@previous)      [下一个问题](@next)
