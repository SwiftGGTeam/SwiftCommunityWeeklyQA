//: ### Question7: Swift programming style [duplicate]
//: > [点击打开问题原地址](http://stackoverflow.com/questions/34607320/swift-programming-style)


//: ### 问题描述

/*:
楼主的问题是：extension 存在的意义是啥，为什么不直接写到一个定义里面，比如：
*/
struct xxx {
}

extension xxx {
    func yyy() {}
}

//: 可以合并成以下代码：


struct xxx1 {
    func yyy() {}
}

//: ### 问题解答

/*:
此问题其实很容易解答，extension 存在的意义，是去扩展已有的类型，而不是新建了类型，而去用 extension 扩展新的逻辑。
比如，对 Int，Double 新增功能，就需要用到 extension。
跟帖中也建议楼主好好读读官方文档，理解一下extension存在的价值。
*/





//: [上一个问题](@previous)      [下一个问题](@next)
