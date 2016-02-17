//: ### Question3: Subclassing a class that has convenience initializers.
//: > [点击打开问题原地址](https://forums.developer.apple.com/thread/30537)
//: ### 问题描述

/*:
this is descrition
*/

class BaseClass {
    var property1 = 0
    
    init(property1: Int) {
        self.property1 = property1
    }
    
    convenience init(value1: Int, value2: Int) {
        // Super secret formula hidden in a frame work that I don't have access to.
        self.init(property1: value1 + value2)
    }
}

class SubClass: BaseClass {
    var property2: Int?
    
    init(property2: Int) {
        super.init(property1: 10)
        self.property2 = property2
    }
}

let c1 = SubClass(property2: 4)
print(c1.property2!)

// 以下代码报错
let c2 = SubClass(value1: 5, value2: 5)
print(c2.property1)

//: ### 问题解答

/*:
Swift 官方教程里面说明了，如果要继承父类的便利构造器，那么子类需要重写所有父类的指定构造器，把代码变成下面的样子就行啦：
*/


class SubClass1: BaseClass {
    var property2: Int?
    
    override init(property1: Int) {
        super.init(property1: 10)
        self.property2 = property1
    }
}

let c3 = SubClass1(property1: 4)
print(c3.property2!)

// 以下代码报错
let c4 = SubClass1(value1: 5, value2: 5)
print(c4.property1)






//: [上一个问题](@previous)      [下一个问题](@next)
