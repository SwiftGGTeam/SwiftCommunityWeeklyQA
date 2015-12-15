//: ### Question8:Numbers in swift
//: > [点击打开问题原地址](https://forums.developer.apple.com/thread/28056)
import Foundation

//: ### 问题描述
// 提问者吐槽，以下代码会出现编译错误
var x: Int = 2
var y: Double = 2.0
var z: Double = y / x	// <- Error

// 然后又表示，下面代码也是错的，让人难以接受这是 Swift 干的事情：

var k: Double
k = Double(x)	// 这货没问题啊....
k = Double(x.value)
k = (Double) x
k = (Double) x.value
//: ### 问题解答

//: OOPer 大神在回帖中写到，其实k = Double(x) 是可以执行的， Swift 是强调强类型的语言，不过也提供了不同类型的转换方式。对不同类型进行运算, Swift 是不允许的。以下代码是可以运行的：

var _x: Int = 2
var _y: Double = 2.0
var _z: Double = _y / Double(_x)	// 这样就不会报错了

// 如果你不喜欢强转的话 那么不妨这么干 有点技巧性

protocol DoubleBOWEMOJI {
	var Double: Swift.Double {get}
}
extension Int: DoubleBOWEMOJI {
	var Double: Swift.Double {return Swift.Double(self)}
}

var _zz = y / x.Double


//: [上一个问题](@previous)

//: > Congratulations! 你已经完成本周任务！
