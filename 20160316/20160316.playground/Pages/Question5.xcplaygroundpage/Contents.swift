//: ### Question5: Can I create a class that subclasses from Array?
//: > [点击打开问题原地址](http://stackoverflow.com/questions/36023269/can-i-create-a-class-that-subclasses-from-array)
//: ### 问题描述

/*:
楼主想继承 Swift 中的 Array，来实现一些新的数组方法。发现会报错。但是继承 oc 中 NSArray 是可以的。这是为什么呢？
*/
import Foundation
class Test : NSArray {}

class Test : Array {}
class Test : [AnyObject] {}


//: ### 问题解答

/*:
实际情况是，Swift 不太推崇面向对象编程了。。虽然保留了类的特性，但是很多数据类型，都是定义为了结构体，也就是值类型，包括`Array`。而结构体，是不能继承的。但是OC 中的NSArray显然是一个类，那就可以继承了。
那么应该如何做到楼主想要实现的功能呢？答案是用扩展，为 Array 做一个扩展，就可以实现新的数组方法。
*/
extension Array
{
    func randomObject() -> Element { return self[ Int( arc4random_uniform( UInt32( self.count ) ) ) ] }
}

/*
扩展和协议，是面向协议编程的2个重要的基础，大家如有兴趣可以去看看去年的 WWDC 关于[面向协议编程 Session](https://www.youtube.com/watch?v=g2LwFZatfTI)，会了解到更多的关于这方面的细节。
*/




//: [上一个问题](@previous)      [下一个问题](@next)
