//: ### Question2: Swift 2 Array Contains object?
//: > [点击打开问题原地址](http://stackoverflow.com/questions/35443308/swift-2-array-contains-object)
//: ### 问题描述

/*:
当数组的元素类型是自定义的类时，使用contains方法会报错：
*/

var array = ["A", "B", "C"]

array.contains("A") // 正确

class Dog {
    var age = 1
}

var dogs = [Dog(), Dog(), Dog()]
var sparky = Dog()
//dogs.contains(sparky) //报错

let result = dogs.contains({ $0 === sparky })

//: ### 问题解答

/*:
数组的contains方法需要用到`==`操作符，所以需要自定义的类实现`Equatable`协议即可：
*/


class Dog: Equatable {
    
    var age = 1
    
}

func == (lhs: Dog, rhs: Dog) -> Bool {
    return lhs.age == rhs.age
}


/*
继续看看深度的解释：
Array 中 contains 有 2 个定义：

* func contains(_ element: Self.Generator.Element) -> Bool
Generator.Element 存在 `Generator.Element : Equatable`的约束，要求元素实现`Equatable`协议。Dog没有实现此协议的话，那么就不能匹配这个方法。

* func contains(@noescape _ predicate: (Self.Generator.Element) throws -> Bool) rethrows -> Bool

此方法定义了一个闭包来实现比较，在 Dog 没有实现`Equatable`协议的前提下，我们可以这样对Dog进行比较：


*/

let result = dogs.contains({ $0 === sparky })


/*
这样做只有比较2个对象的引用是否一样，而不是比较对象的值是否相等。所以不满足需求。

所以，最终的方案，还是实现`Equatable`协议吧。


*/






//: [上一个问题](@previous)      [下一个问题](@next)
